#include "format.h"
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
  char buf[8 * sizeof(long)]; // Assumes 8-bit chars.
  uint8_t di;
  int8_t i = 0;
  char padchar = ' ';

  if(pad < 0) {
    pad = -pad;
    padchar = '0';
  }

  /*  if(n == 0) {
      lcd_putch('0');
      return;
    }*/

  do {
    /*    if(i == pointpos)
          buf[i++] = '.';
    */
    di = n % base;
    buf[i++] = (di < 10 ? (uint8_t)'0' + di : (uint8_t)'A' + di - 10);

    n /= base;
  } while(n > 0);

  while(pad-- > i) buffer_putch(padchar);

  for(unsigned j = 0; j < i; j++)
    (*fn)(buf[j]);
    // buffer_putch((buf[i - 1] < 10 ?(char)'0' + buf[i - 1] : (char)'A' + buf[i - 1] - 10));
}

// -------------------------------------------------------------------------
void
format_xint32(putch_t fn, /*putchar_fn* putchar,*/ uint32_t x) {
  fn('0');
  fn('x');
  format_number(fn, (uint16_t)(x >> 16), 16, -4);
  format_number(fn, (uint16_t)(x & 0xffff), 16, -4);
}

void
format_float(putch_t fn,  float num) {
  short m = (int)log10f(num);
  char digit;
  //  float tolerance = .0001;

  while(num > 0 + FLT_EPSILON) {
    float weight = pow(10.0l, m);
    digit = (char)floorf(num / weight);
    num -= (digit * weight);
    fn('0' + digit);
    if(m == 0)
      fn('.');
    m--;
  }
}

// -------------------------------------------------------------------------
#ifndef SDCC
void
format_double(putch_t fn, double num) {
  short m = (short)log10f(num);
  short digit;
  //  double tolerance = .0001;

  while(num > 0 + DBL_EPSILON) {
    double weight = pow(10.0l, m);
    digit = (short)floorf(num / weight);
    num -= (digit * weight);
    fn((char)('0' + digit));
    if(m == 0)
      fn('.');
    m--;
  }
}
#endif
