#include "float24.h"

/* ---- byte-serial mantissa helpers (mirror the ASM's per-byte ops) ---- */

static uint8_t
m_shl1(uint8_t m[3]) {
  uint8_t carry, c;
  int8_t i;
  carry = 0;
  for (i = 2; i >= 0; i--) {
    c = m[i] >> 7;
    m[i] = (uint8_t)((m[i] << 1) | carry);
    carry = c;
  }
  return carry;
}

static uint8_t
m_shr1(uint8_t m[3]) {
  uint8_t carry, c, i;
  carry = 0;
  for (i = 0; i < 3; i++) {
    c = m[i] & 1;
    m[i] = (uint8_t)((m[i] >> 1) | (carry << 7));
    carry = c;
  }
  return carry;
}

static uint8_t
m_add(uint8_t m[3], const uint8_t n[3]) {
  uint8_t carry;
  uint16_t s;
  int8_t i;
  carry = 0;
  for (i = 2; i >= 0; i--) {
    s = (uint16_t)m[i] + n[i] + carry;
    m[i] = (uint8_t)s;
    carry = (uint8_t)(s >> 8);
  }
  return carry;
}

static uint8_t
m_sub(uint8_t m[3], const uint8_t n[3]) {
  uint8_t borrow;
  int16_t d;
  int8_t i;
  borrow = 0;
  for (i = 2; i >= 0; i--) {
    d = (int16_t)m[i] - n[i] - borrow;
    m[i] = (uint8_t)d;
    borrow = (d < 0) ? 1 : 0;
  }
  return borrow;
}

static int
m_is_zero(const uint8_t m[3]) {
  return m[0] == 0 && m[1] == 0 && m[2] == 0;
}

static int
m_ge(const uint8_t a[3], const uint8_t b[3]) {
  uint8_t i;
  for (i = 0; i < 3; i++)
    if (a[i] != b[i])
      return a[i] > b[i];
  return 1;
}

static void
f24_copy(const f24_t *src, f24_t *dst) {
  dst->sign = src->sign;
  dst->exp = src->exp;
  dst->m[0] = src->m[0];
  dst->m[1] = src->m[1];
  dst->m[2] = src->m[2];
}

/* Shift mantissa left until bit7 of m[0] is 1, adjusting exp down by
 * one per shift - mirrors NORM2424's loop. A zero mantissa collapses
 * the whole float to exp=0 (the library's "value is zero" sentinel). */
static void
normalize(f24_t *v) {
  if (m_is_zero(v->m)) {
    v->exp = 0;
    v->sign = 0;
    return;
  }
  while ((v->m[0] & 0x80u) == 0) {
    m_shl1(v->m);
    if (v->exp == 0)
      break; /* underflow floor */
    v->exp--;
  }
}

void
f24_from_u16(uint16_t v, f24_t *r) {
  r->sign = 0;
  r->exp = 0;
  r->m[0] = 0;
  r->m[1] = 0;
  r->m[2] = 0;
  if (v == 0)
    return;
  r->m[0] = (uint8_t)(v >> 8);
  r->m[1] = (uint8_t)v;
  r->m[2] = 0;
  r->exp = 127 + 15;
  normalize(r);
}

/* Shift-and-add multiply on a 48-bit-wide (hi[3]:lo[3]) accumulator,
 * one bit of `a` at a time (MSB first, classic Horner shift-add),
 * entirely with 8-bit ops - same complexity class as the ASM's
 * MLOOP24, just using two explicit 3-byte halves instead of the ASM's
 * register-reuse trick. Two normalized [2^23,2^24) mantissas multiply
 * to a value in [2^46,2^48), which never overflows this 48-bit
 * accumulator. */
static void
acc_shl1(uint8_t hi[3], uint8_t lo[3]) {
  uint8_t carry = m_shl1(lo);
  m_shl1(hi);
  hi[2] |= carry;
}

static void
acc_add_lo(uint8_t hi[3], uint8_t lo[3], const uint8_t b[3]) {
  uint8_t carry;
  int8_t i;
  carry = m_add(lo, b);
  if (carry) {
    for (i = 2; i >= 0; i--) {
      if (++hi[i] != 0)
        break;
    }
  }
}

void
f24_mul(const f24_t *a, const f24_t *b, f24_t *r) {
  uint8_t hi[3], lo[3], byte_i, bit_i;
  int8_t bitpos;
  int16_t e;

  r->sign = 0;
  r->exp = 0;
  r->m[0] = 0;
  r->m[1] = 0;
  r->m[2] = 0;
  if (a->exp == 0 || b->exp == 0)
    return;
  hi[0] = hi[1] = hi[2] = 0;
  lo[0] = lo[1] = lo[2] = 0;
  for (bitpos = 23; bitpos >= 0; bitpos--) {
    acc_shl1(hi, lo);
    byte_i = (uint8_t)(2 - bitpos / 8);
    bit_i = (uint8_t)(bitpos % 8);
    if ((a->m[byte_i] >> bit_i) & 1u)
      acc_add_lo(hi, lo, b->m);
  }
  r->sign = (uint8_t)(a->sign ^ b->sign);
  e = (int16_t)a->exp + b->exp - 126;
  if (e < 0)
    e = 0;
  if (e > 255)
    e = 255;
  r->exp = (uint8_t)e;
  r->m[0] = hi[0];
  r->m[1] = hi[1];
  r->m[2] = hi[2];
  normalize(r);
}

void
f24_div(const f24_t *a, const f24_t *b, f24_t *r) {
  uint8_t rem[3], den[3], quot[3], pre_shift, bitpos, co;
  int16_t e;

  r->sign = 0;
  r->exp = 0;
  r->m[0] = 0;
  r->m[1] = 0;
  r->m[2] = 0;
  if (b->exp == 0 || a->exp == 0)
    return;
  rem[0] = a->m[0];
  rem[1] = a->m[1];
  rem[2] = a->m[2];
  den[0] = b->m[0];
  den[1] = b->m[1];
  den[2] = b->m[2];
  quot[0] = quot[1] = quot[2] = 0;
  /* Pre-align so rem < den, mirroring FPD24's AGEB24/ALTB24 check -
   * both mantissas are normalized into [2^23,2^24), so a plain 24-bit
   * restoring divide only produces a valid (non-overflowing) 24-bit
   * quotient when the dividend already starts out smaller than the
   * divisor; halving it first (and recording that as +1 on the
   * result exponent) is exactly how the assembly keeps this in range
   * too. */
  pre_shift = 0;
  if (m_ge(rem, den)) {
    m_shr1(rem);
    pre_shift = 1;
  }
  for (bitpos = 0; bitpos < 24; bitpos++) {
    co = m_shl1(rem);
    if (co || m_ge(rem, den)) {
      m_sub(rem, den);
      m_shl1(quot);
      quot[2] |= 1u;
    } else {
      m_shl1(quot);
    }
  }
  r->sign = (uint8_t)(a->sign ^ b->sign);
  e = (int16_t)a->exp - b->exp + 126 + pre_shift;
  if (e < 0)
    e = 0;
  if (e > 255)
    e = 255;
  r->exp = (uint8_t)e;
  r->m[0] = quot[0];
  r->m[1] = quot[1];
  r->m[2] = quot[2];
  normalize(r);
}

void
f24_sub(const f24_t *a_in, const f24_t *b_in, f24_t *r) {
  f24_t a, b, big, small;
  uint8_t shift, sm[3], res[3], co, i;

  f24_copy(a_in, &a);
  f24_copy(b_in, &b);
  b.sign ^= 0x80u;
  if (a.exp == 0) {
    f24_copy(&b, r);
    return;
  }
  if (b.exp == 0) {
    f24_copy(&a, r);
    return;
  }
  f24_copy(&a, &big);
  f24_copy(&b, &small);
  if (b.exp > a.exp || (b.exp == a.exp && m_ge(b.m, a.m))) {
    f24_copy(&b, &big);
    f24_copy(&a, &small);
  }
  shift = (uint8_t)(big.exp - small.exp);
  sm[0] = small.m[0];
  sm[1] = small.m[1];
  sm[2] = small.m[2];
  for (i = 0; i < shift && i < 24; i++)
    m_shr1(sm);
  if (shift >= 24) {
    sm[0] = sm[1] = sm[2] = 0;
  }
  res[0] = big.m[0];
  res[1] = big.m[1];
  res[2] = big.m[2];
  if (big.sign == small.sign) {
    co = m_add(res, sm);
    r->sign = big.sign;
    r->exp = big.exp;
    r->m[0] = res[0];
    r->m[1] = res[1];
    r->m[2] = res[2];
    if (co) {
      m_shr1(r->m);
      r->m[0] |= 0x80u;
      if (r->exp < 255)
        r->exp++;
    }
    normalize(r);
  } else {
    m_sub(res, sm);
    r->sign = big.sign;
    r->exp = big.exp;
    r->m[0] = res[0];
    r->m[1] = res[1];
    r->m[2] = res[2];
    normalize(r);
  }
}

uint32_t
f24_to_u32_x100(const f24_t *a) {
  uint32_t mant, scaled;
  int16_t shift;

  if (a->exp == 0)
    return 0;
  mant = ((uint32_t)a->m[0] << 16) | ((uint32_t)a->m[1] << 8) | a->m[2];
  shift = (int16_t)a->exp - 127 - 23;
  scaled = mant * 100u;
  if (shift >= 0) {
    if (shift > 8)
      return 0xFFFFFFFFuL;
    return scaled << shift;
  } else {
    shift = (int16_t)(-shift);
    if (shift > 31)
      return 0;
    return scaled >> shift;
  }
}
