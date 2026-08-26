#include "ledsense.h"
#include "adc.h"
#include "const.h"
#include "device.h"
#include "typedef.h"

#ifdef LEDSENSE_USE_CTMU
#include "delay.h"
#endif

//-----------------------------------------------------------------------------
// pin/channel assignment -- override any of these from the build (e.g. a
// project's *_DEFS in build/vars.mk) to rewire without editing this file
#ifndef LS_A_PIN
#define LS_A_PIN RA1
#endif
#ifndef LS_A_TRIS
#define LS_A_TRIS TRISA1
#endif
#ifndef LS_K_PIN
#define LS_K_PIN RA0
#endif
#ifndef LS_K_TRIS
#define LS_K_TRIS TRISA0
#endif
#ifndef LEDSENSE_ADC_CHANNEL
#define LEDSENSE_ADC_CHANNEL 0
#endif

#ifdef LEDSENSE_USE_CTMU
#if !(defined(__18f25k50) || defined(__18f45k50) || defined(__18f26j50) || defined(__18f46j50) ||                      \
      defined(__18f26j53) || defined(__18f46j53) || defined(__18f27j53) || defined(__18f47j53))
#warning "LEDSENSE_USE_CTMU requested on a chip without a CTMU peripheral - falling back to direct I/O"
#undef LEDSENSE_USE_CTMU
#endif
#endif

#define LEDSENSE_CTMU_EDGE_US 125

// -------------------------------------------------------------------------
void
ledsense_emit(BOOL on) {
  LS_A_TRIS = LS_K_TRIS = OUTPUT;

  LS_A_PIN = on;
  LS_K_PIN = LOW;
}

#ifndef LEDSENSE_USE_CTMU

// -------------------------------------------------------------------------
void
ledsense_init() {}

// -------------------------------------------------------------------------
void
ledsense_charge() {
  LS_A_TRIS = LS_K_TRIS = OUTPUT;

  LS_A_PIN = LOW;
  LS_K_PIN = HIGH;
}

// -------------------------------------------------------------------------
uint16_t
ledsense_read() {
  LS_K_TRIS = INPUT;

  return adc_read(LEDSENSE_ADC_CHANNEL);
}

#else /* LEDSENSE_USE_CTMU */

// -------------------------------------------------------------------------
void
ledsense_init() {
  CTMUCONH = 0x00;       // disable CTMU while configuring
  CTMUCONL = 0b10010000; // enable CTMU, enable edge delay generation
  CTMUICON = 0x01;       // nominal current output = base current level

  adc_init();
}

// -------------------------------------------------------------------------
void
ledsense_charge() {
  LS_A_TRIS = LS_K_TRIS = OUTPUT;
  LS_A_PIN = LOW;

  // drain any charge left on the sense node
  CTMUCONHbits.IDISSEN = 1;
  delay_us(LEDSENSE_CTMU_EDGE_US);
  CTMUCONHbits.IDISSEN = 0;

  // charge the sense node from the CTMU constant-current source
  LS_K_TRIS = INPUT;
  CTMUCONLbits.EDG1STAT = 1;
  delay_us(LEDSENSE_CTMU_EDGE_US);
  CTMUCONLbits.EDG1STAT = 0;
}

// -------------------------------------------------------------------------
uint16_t
ledsense_read() {
  LS_K_TRIS = INPUT;

  return adc_read(LEDSENSE_ADC_CHANNEL);
}

#endif /* LEDSENSE_USE_CTMU */

extern volatile BOOL control;

// -------------------------------------------------------------------------
void
ledsense_loop() {}
