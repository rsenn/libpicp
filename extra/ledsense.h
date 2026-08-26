#ifndef PICLIB_LEDSENSE_H
#define PICLIB_LEDSENSE_H

#include "typedef.h"

/* LEDSENSE_USE_CTMU: define before including this header to sense via the
 * chip's CTMU (constant-current charge/measure) instead of driving the
 * sense pin directly from a GPIO. Only supported on chips with a CTMU
 * peripheral (18F25K50/45K50/26J50/46J50/26J53/46J53/27J53/47J53). */

void ledsense_init(void);
void ledsense_emit(BOOL on);
void ledsense_charge(void);
uint16_t ledsense_read(void);
void ledsense_loop(void);

#endif
