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

#define ADVAL_V(val10bit) ((val10bit) * ((VREF_PLUS) - (VREF_MINUS)) / ADVAL_MAX + (VREF_MINUS))

#define ADCS_FOSC_2 0b000u
#define ADCS_FOSC_8 0b001u
#define ADCS_FOSC_32 0b010u
#define ADCS_FRC 0b011u
#define ADCS_FOSC_4 0b100u
#define ADCS_FOSC_16 0b101u
#define ADCS_FOSC_64 0b110u
#define ADCS_FRC2 0b111u
#define ADCS_ADCON0_MASK 0b11000000u
#define ADCS_ADCON0_SHIFT 6
#define ADCS_ADCON1_MASK 0b01000000u
#define ADCS_ADCON1_SHIFT 4

#define PCFG_ADCON1_MASK 0b1111u
#define PCFG_ADCON1_SHIFT 0

/* Initialize ADC clock and port configuration. */
void adc_init(uint8_t, uint8_t);

/* Enable ADC, start conversion and return data. Then disable ADC */
uint16_t adc_read(char ch);

/* Disable ADC for sleep */
void adc_disable(void);

/**
 * ISR for ADC
 */
char adc_isr(void);

#endif /* PICLIB_ADC_H */
