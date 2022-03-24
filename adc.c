#include "adc.h"
#include "delay.h"
#include "device.h"

#ifdef USE_ADCONVERTER

// -------------------------------------------------------------------------
void
adc_init(uint8_t clock_sel, uint8_t port_cfg) {
  /* Enable ADC, port config DDDDADAA, Fosc/32 clock */

#ifdef __18f25k50
  // Configure AN2 as an analog channel
  /*ANSELAbits.*/ ANSA0 = 1;
  /*ANSELAbits.*/ ANSA1 = 1;
  /*ANSELAbits.*/ ANSA2 = 1;
  TRISA2 = 1;
  // ADCON2
  /*ADCON2bits.*/ ADFM = 1;
  /*ADCON2bits.*/ ACQT = 1;
  /*ADCON2bits.*/ ADCS = 2;
  // ADCON1
  /*ADCON1bits.*/ PVCFG = 0;
  /*ADCON1bits.*/ NVCFG = 0;
  // ADCON0
  /*ADCON0bits.*/ CHS = 0;
  ///*ADCON0bits.*/ADON = 1;
  // Results format 1= Right justified
  // Acquition time 7 = 20TAD 2 = 4TAD 1=2TAD
  // Clock conversion bits 6= FOSC/64 2=FOSC/32
  // Vref+ = AVdd
  // Vref- = AVss
  // Select ADC channel
  // Turn on ADC
  //#elif defined(__18f252)

#else
  ADCON0 &= ~0b111111001;
  ADCON0 |= (0b10 << 6) | (0 << 3);

  ADCON1 &= ~0b11001111;
  ADCON1 |=
      (((port_cfg << PCFG_ADCON1_SHIFT) & PCFG_ADCON1_MASK)) | ((clock_sel << ADCS_ADCON1_SHIFT) & ADCS_ADCON1_MASK);

  ///* ADCON0bits.*/ADCS = 0b10;
  ///*ADCON1bits.*/PCFG = 0b1110;
  ///*ADCON1bits.*/ ADCS2 = 0;
  ///*ADCON0bits.*/ CHS = 0;
#endif

  TRISA |= 0b1011;

  ADIE = 0;
  ADFM = 1; // right justified
}

// -------------------------------------------------------------------------
uint16_t
adc_read(uint8_t ch) {

  uint8_t i;
  ADCON0bits.CHS = ch & 0b111;

  ADON = 1;
  /*
    for(i = 0; i < 100; i++) {
    }*/
  //  _delay(100);
  __delay_us(100);

  if(ADIE)
    ADIF = 0;

  GO_DONE = 1;

  if(!ADIE) {
    uint16_t result;

    while(GO_DONE)
      ;

    result = (ADRESH << 8) | ADRESL;

    ADON = 0;

    return result;
  }
  return 0;
}

// -------------------------------------------------------------------------
// uint8_t
// adc_isr(void) {
//  if(/*PIR1bits.*/ADIF) {
//    /*PIR1bits.*/ADIF = 0;
//    if(ADRES < 45u) {
//      /* Threshold reached */
//      return 1;
//    }
//    adc_start();
//  }
//  return 0;
//}

// -------------------------------------------------------------------------
void
adc_disable(void) {
  /*ADCON0bits.*/ ADON = 0;
  /*PIE1bits.*/ ADIE = 0;
}

#endif // USE_ADCONVERTER
