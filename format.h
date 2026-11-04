#ifndef PICLIB_FORMAT_H
#define PICLIB_FORMAT_H 1

#include "typedef.h"
typedef void(*putch_t)(char);

void format_number(putch_t fn, uint16_t n, uint8_t base, int8_t pad);
void format_xint32(putch_t fn, uint32_t x);
#if !defined(__SDCC) && !defined(USE_FIXED)
void format_double(putch_t fn, double num);
#endif
#ifndef USE_FIXED
void format_float(putch_t fn, float num);
#endif

#endif // defined PICLIB_FORMAT_H
