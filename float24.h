#ifndef PICLIB_FLOAT24_H
#define PICLIB_FLOAT24_H 1

#include "typedef.h"

/*
 * A byte-accurate C model of Microchip AN575's PIC16 24-bit floating
 * point library (FP24.A16, F.J.Testa 1996) - same mantissa/exponent
 * layout, same normalize/multiply/divide/subtract algorithms, worked
 * out one byte at a time exactly like the assembly's RLF/RRF/ADDWFC/
 * SUBWFB register chains (never widened to a native 32/64-bit type).
 * See TODO.md for why this exists (a from-scratch reimplementation for
 * an accuracy/code-size comparison against a pure uint32_t fixed-point
 * approach - see fixedmath.h).
 *
 * Register/format contract, mirroring AEXP/AARGB0..2/SIGN in the ASM:
 * a 24-bit mantissa (3 bytes, MSB-first) normalized so the top bit of
 * m[0] is always 1 for a nonzero value (m in [0x800000,0xFFFFFF]
 * represents the fractional part of [1.0,2.0)), a separate sign byte
 * (0x00 or 0x80), and an 8-bit exponent biased by 127 (exp==0 is the
 * sentinel for the value zero, same as AN575's "AEXP==0" checks).
 *
 * Every operation takes its operand(s)/result by pointer, never by C
 * struct value or struct return - this matters, not just stylistically:
 * AN575 itself never "returns a struct" either (AARG/BARG/the result
 * are fixed locations the whole library reads and writes in place),
 * and porting it as struct-by-value made SDCC's pic16 backend crash
 * outright on a 5-byte struct flowing through a multi-call chain.
 */
typedef struct {
  uint8_t sign; /* 0x00 or 0x80 */
  uint8_t exp;  /* biased by 127; 0 means the value zero */
  uint8_t m[3]; /* m[0]=MSB .. m[2]=LSB; top bit of m[0] is the implicit-1 */
} f24_t;

void f24_from_u16(uint16_t v, f24_t *r);
void f24_mul(const f24_t *a, const f24_t *b, f24_t *r);
void f24_div(const f24_t *a, const f24_t *b, f24_t *r);
void f24_sub(const f24_t *a, const f24_t *b, f24_t *r);

/* value * 100, rounded toward zero, for a 2-decimal-place display
 * reading (mirrors the existing double path's "Cin = Cin * 100" /
 * "(uint16_t)Cin" convention). 0xFFFFFFFF on overflow. */
uint32_t f24_to_u32_x100(const f24_t *a);

#endif /* !defined(PICLIB_FLOAT24_H) */
