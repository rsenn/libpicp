#ifndef PICLIB_FIXEDMATH_H
#define PICLIB_FIXEDMATH_H 1

#include "typedef.h"

/*
 * Portable uint32_t-only fixed-point helpers - no 64-bit type required
 * (SDCC has no `long long` at all on pic14/pic16: "error 206: invalid
 * combination of short/long"). See TODO.md for how these are used to
 * port src/measure.c's Thomson-derived formula to fixed point.
 */

/* floor(a*b/c), exact for any 32-bit a,b,c whose true result fits in 32
 * bits. Implemented via a 16x16->32 partial-product widening multiply
 * (a*b held as an explicit hi:lo 32+32 bit pair) followed by a 64-step
 * restoring long division - never needs a native 64-bit type. Sets
 * *fault (if non-NULL) and returns 0 if c==0, c>=2^31, or the true
 * quotient wouldn't fit in 32 bits. */
uint32_t muldiv_u32(uint32_t a, uint32_t b, uint32_t c, uint8_t *fault);

/* An adaptively-scaled Q(fb) fixed-point value: real_value = m / 2^fb.
 * fb varies per result (see fixed_div_u32) - align two of these to a
 * common fb (with align_to) before combining them arithmetically. */
typedef struct {
  uint32_t m;
  uint8_t fb;
  uint8_t fault;
} qval_t;

/* num/den as a qval_t, using every spare bit of a uint32_t for
 * fraction after leaving just enough integer headroom for the whole
 * part - so a small quotient (the common case for this project's
 * (F1/Fx)^2-1 terms) gets far more relative precision than a fixed
 * Q16.16 budget would give it. Sets r->fault on den==0, den>=2^31, or
 * a whole part needing >=31 bits. */
void fixed_div_u32(uint32_t num, uint32_t den, qval_t *r);

/* Rescale v down to a smaller fractional-bit count (v->fb must be >=
 * target_fb - only ever call with target_fb = min of the values being
 * combined). */
uint32_t fixed_align_to(const qval_t *v, uint8_t target_fb);

#endif /* !defined(PICLIB_FIXEDMATH_H) */
