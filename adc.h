#ifndef PICLIB_ADC_H
#define PICLIB_ADC_H

#include "typedef.h"

#define GET_ADRES() (((uint16_t)ADRESH << 8) | ADRESL)

#ifndef VREF_PLUS
#define VREF_PLUS 3.3
#endif
#ifndef VREF_MINUS
#define VREF_MINUS 0.000
#endif

#define ADVAL_MIN 0x0000
#define ADVAL_MAX 0x03ff

#define ADVAL_V(val10bit) ((float)(val10bit) * ((VREF_PLUS) - (VREF_MINUS)) / ADVAL_MAX + (VREF_MINUS))

/* Initialize ADC clock and port configuration. */
void adc_init(void);

/* Enable ADC, start conversion and return data. Then disable ADC */
uint16_t adc_read(char ch);

/* Disable ADC for sleep */
void adc_disable(void);

/**
 * ISR for ADC
 */
char adc_isr(void);

#endif /* PICLIB_ADC_H */
