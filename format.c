#define MATH_LIB_ALIASES 1
#include "format.h"
#include "device.h"
#include "buffer.h"
#include <math.h>
#include <float.h>

#ifndef DBL_EPSILON
#define DBL_EPSILON FLT_EPSILON
#endif

static void
format_putchar(char c) {
  return;
}

// putchar_fn* putchar_ptr = format_putchar;

// -------------------------------------------------------------------------
void
format_number(putch_t fn, uint16_t n, uint8_t base, int8_t pad /*, int8_t pointpos*/) {
  char buf[16]; // enough for 16 binary digits
  uint8_t di;
  int8_t i = 0;
  char padchar = ' ';

  if(pad < 0) {
    pad = -pad;
    padchar = '0';
  }

  /* digits are generated least significant first */
  do {
    di = n % base;
    buf[i++] = (di < 10 ? (uint8_t)'0' + di : (uint8_t)'A' + di - 10);

    n /= base;
  } while(n > 0);

  while(pad-- > i) (*fn)(padchar);

  /* ...and printed most significant first */
  while(i > 0) (*fn)(buf[--i]);
}

// -------------------------------------------------------------------------
void
format_xint32(putch_t fn, /*putchar_fn* putchar,*/ uint32_t x) {
  fn('0');
  fn('x');
  format_number(fn, (uint16_t)(x >> 16), 16, -4);
  format_number(fn, (uint16_t)(x & 0xffff), 16, -4);
}

#ifndef USE_FIXED
/*
 * Print a float as <integer part>[.<up to 4 decimals>] using only integer
 * conversions and one multiply per decimal - no log10/pow/floor, so none of
 * those libm routines (several hundred words each) get linked in.
 */
void
format_float(putch_t fn, float num) {
  uint32_t ip;
  uint8_t i, n = 0, frac[4];
  char digits[10];

  if(num < 0) {
    fn('-');
    num = -num;
  }
  ip = (uint32_t)num;
  num -= (float)ip;

  i = 0;
  do {
    digits[i++] = '0' + (uint8_t)(ip % 10);
    ip /= 10;
  } while(ip > 0 && i < sizeof(digits));
  while(i > 0) fn(digits[--i]);

  for(i = 0; i < 4; i++) {
    num *= 10;
    frac[i] = (uint8_t)num;
    num -= frac[i];
    if(frac[i])
      n = i + 1;
  }
  if(n) {
    fn('.');
    for(i = 0; i < n; i++) fn('0' + frac[i]);
  }
}
#endif /* !USE_FIXED */

// -------------------------------------------------------------------------
#if !defined(__SDCC) && !defined(USE_FIXED)
void
format_double(putch_t fn, double num) {
  short m = (short)log10(num);
  short digit;
  //  double tolerance = .0001;

  while(num > 0 + DBL_EPSILON) {
    double weight = pow(10.0l, m);
    digit = (short)floor(num / weight);
    num -= (digit * weight);
    fn((char)('0' + digit));
    if(m == 0)
      fn('.');
    m--;
  }
}
#endif
