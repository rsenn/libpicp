#include "fixedmath.h"

/* 32x32 -> 64-bit product, held as (hi,lo), using only 16x16->32
 * partial products - portable to compilers with no 64-bit integer
 * type. */
static void
mul_u32_wide(uint32_t a, uint32_t b, uint32_t *hi, uint32_t *lo) {
  uint32_t a_lo, a_hi, b_lo, b_hi;
  uint32_t t0, t1, t2, t3;
  uint32_t mid, mid_carry, lo32, lo_carry;

  a_lo = a & 0xFFFFuL;
  a_hi = a >> 16;
  b_lo = b & 0xFFFFuL;
  b_hi = b >> 16;
  t0 = a_lo * b_lo;
  t1 = a_lo * b_hi;
  t2 = a_hi * b_lo;
  t3 = a_hi * b_hi;
  mid = t1 + t2;
  mid_carry = (mid < t1) ? 1uL : 0uL; /* mid overflowed 32 bits */
  lo32 = t0 + (mid << 16);
  lo_carry = (lo32 < t0) ? 1uL : 0uL;
  *hi = t3 + (mid >> 16) + (mid_carry << 16) + lo_carry;
  *lo = lo32;
}

/* floor((hi:lo) / c), where hi:lo is a 64-bit value split into two
 * 32-bit words. Undefined (returns garbage) if the true quotient
 * doesn't fit in 32 bits, i.e. requires hi < c. Plain 64-step
 * restoring long division, one bit of the dividend at a time - the
 * running remainder is always < c <= 2^31-1, so "rem = (rem<<1)|bit"
 * never needs more than 32 bits. */
static uint32_t
div_wide_u32(uint32_t hi, uint32_t lo, uint32_t c, uint8_t *fault) {
  uint32_t rem, quot, bitval;
  int8_t i;

  if (fault)
    *fault = 0;
  if (c == 0 || c >= 0x80000000uL || hi >= c) {
    if (fault)
      *fault = 1;
    return 0;
  }
  rem = 0;
  quot = 0;
  for (i = 63; i >= 0; i--) {
    bitval = (i >= 32) ? ((hi >> (i - 32)) & 1uL) : ((lo >> i) & 1uL);
    rem = (rem << 1) | bitval;
    quot <<= 1;
    if (rem >= c) {
      rem -= c;
      quot |= 1uL;
    }
  }
  return quot;
}

uint32_t
muldiv_u32(uint32_t a, uint32_t b, uint32_t c, uint8_t *fault) {
  uint32_t hi, lo;
  mul_u32_wide(a, b, &hi, &lo);
  return div_wide_u32(hi, lo, c, fault);
}

void
fixed_div_u32(uint32_t num, uint32_t den, qval_t *r) {
  uint32_t whole, rem, t, result, bitval;
  uint8_t whole_bits, fb, i;

  r->m = 0;
  r->fb = 0;
  r->fault = 0;
  if (den == 0 || den >= 0x80000000uL) {
    r->fault = 1;
    return;
  }
  whole = num / den;
  rem = num % den;
  whole_bits = 0;
  t = whole;
  while (t) {
    whole_bits++;
    t >>= 1;
  }
  if (whole_bits >= 31) {
    r->fault = 1;
    return;
  }
  fb = (uint8_t)(31 - whole_bits);
  result = whole << fb;
  for (i = 0; i < fb; i++) {
    rem <<= 1;
    bitval = 0;
    if (rem >= den) {
      rem -= den;
      bitval = 1;
    }
    result |= bitval << (fb - 1 - i);
  }
  r->m = result;
  r->fb = fb;
}

uint32_t
fixed_align_to(const qval_t *v, uint8_t target_fb) {
  uint8_t shift = (uint8_t)(v->fb - target_fb);
  return shift ? (v->m >> shift) : v->m;
}
