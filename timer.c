#include "timer.h"
#include "device.h"

/*
#ifdef PIC18F2550
# define PIC18 1
#endif
# ifdef __18f14k50
#define PIC18 1
#endif
#ifdef __18f25k50
# define PIC18 1
#endif
#ifdef __18f2550
# define PIC18 1
#  ifndef MCC18
#   ifndef __SDCC
extern volatile unsigned char T0CON @0xFD5;
#endif
#endif
*/

#ifdef USE_TIMER0

void
timer0_init(uint8_t ps_mode) {
  uint8_t prescaler = ps_mode & PRESCALE_MASK;

  /*#ifdef TIMER0_VALUE
    TIMER0_VALUE = 0;
  #else
    TIMER0_VALUE_L = 0;
    TIMER0_VALUE_H = 0;
  #endif*/

#ifdef __18f16q41
  T0CON0 = 0;
  T0CON1 = 0;
#elif defined(PIC16)
  OPTION_REG &= 0b11000000;
#elif !defined(PIC12)
  T0CON = 0;
#endif

#ifdef __18f16q41
  T0CON0 |= 0x80 | ((ps_mode & TIMER0_FLAGS_8BIT) == 0 ? 0x10 : 0x00);
  T0CON1 |= prescaler | (0b010 << 5);
#else

#if defined(PIC18)
  T0CON |= (!!(ps_mode & TIMER0_FLAGS_8BIT)) ? 0x40 : 0x00;
#elif defined(PIC16)
  /* PIC16 has no 16-bit mode */
#endif

  // If a prescaler is to be assigned to the Timer0 module
#if !defined(PIC18) //&& !defined(PIC12)

  T0CS = (ps_mode & TIMER0_FLAGS_EXTCLK) ? 1 : 0;
  T0SE = (ps_mode & EDGE_HIGH_LOW) ? 1 : 0;

  if(prescaler > 0) {
    /*OPTION_REGbits.*/ PSA = 0;
    /*OPTION_REGbits.*/ OPTION_REGbits.PS = prescaler - 1;
  } else {
    PSA = 1;
  }
#elif defined(PIC12)
  OPTION_REGbits.PS = (prescaler - 1) & 0b111;
#else

  // 0: Internal instruction cycle clock (CLKO) or 1: Transition on T0CKI pin
  T0CON |= (!!(ps_mode & TIMER0_FLAGS_EXTCLK)) ? 0x20u : 0x00u;

  // T0CKI pin: Increment on 1->0 or on 0->1 transition
  T0CON |= (!!(ps_mode & EDGE_HIGH_LOW)) ? 0x10u : 0x00u;

  // If a prescaler is to be assigned to the Timer0 module
  T0CON &= (!!prescaler) ? ~0x08 : ~0x00;

  T0CON &= ~0b111;

  if(prescaler > 0) {
    PSA = 0;

#if !defined(__18f2550) && !defined(__18f252) && !defined(__18f2455) && !defined(__18f25k50) &&                        \
    !defined(__18f25k22) && !defined(__18f14k50)
    PS = (prescaler - 1) & 0b111;
#endif
  } else {
    PSA = 1;
  }
  //#endif
#endif

#if defined(PIC16) || defined(PIC12) /* PIC16 has no TMR0ON */
#else
  T0CON |= 0x80;
#endif

  /* INTCON &= ~0x40;  TMR0IF = 0;*/
  TMR0IE = (ps_mode & TIMER0_FLAGS_INTR) ? 1 : 0;
#endif
}

/* Read Timer 0:
 *
 * TMR0 in high byte
 * prescaler in low byte
 */
unsigned short
timer0_read_ps(void) {
  uint8_t prev = TMR0;
  uint16_t count = 0;

#ifndef __18f16q41
  /*T0CON |= 0x20; */ T0CS = 1;

  do {
    /* self-clocking */
    T0SE = 1;

    NOP();
    NOP();

    T0SE = 0;

    NOP();
    NOP();

    ++count;

    // count until TMR0 incremented
  } while(prev == TMR0 && count <= 255);
#endif
  count = ((prev << 8) + (256 - count));
  return count;
}

#endif // USE_TIMER0

/* ----------------------- Timer 1 ----------------------- */
#ifdef USE_TIMER1

void
timer1_init(uint8_t ps_mode) {
  T1OSCEN = 0;
  TMR1ON = 0;
  TMR1IE = 0;

  // T1CON &= ~0b00111110;

  T1CONbits.T1CKPS = (ps_mode & PRESCALE_MASK);

  TMR1CS = !!(ps_mode & TIMER1_FLAGS_EXTCLK); // Internal clock source

#if defined(__12f1840) || defined(__16f628a)
  nT1SYNC = (ps_mode & TIMER1_FLAGS_SYNC);
#else
  T1SYNC = !(ps_mode & TIMER1_FLAGS_SYNC);
#endif

  /*  TMR1H = 0;
    TMR1L = 0;  */
  T1OSCEN = 1;
  TMR1ON = 1;
  TMR1IF = 0;

  if(ps_mode & TIMER1_FLAGS_INTR)
    TMR1IE = 1;
}

#endif // USE_TIMER1

/* ----------------------- Timer 2 ----------------------- */
#ifdef USE_TIMER2

void
timer2_init(uint8_t ps_mode) {
  uint8_t ps = ps_mode & PRESCALE_MASK;
  uint8_t postscaler = TIMER2_POSTSCALER;

  // Set timer 2 postscaler
  T2CON &= ~0b01111111;

  T2CON |= (postscaler & 0b1111) << 3;
  T2CON |= (ps & 0b11); // Set timer 2 prescaler to 1:1.

  TIMER2_VALUE = 0;

  T2CON |= 0b100; // TMR2ON = 1; // Enable timer 2.

  // TMR2IF = 0;
  PIR1 &= ~0b10;
  PIE1 = (!!(ps_mode & TIMER2_FLAGS_INTR)) << 1;
}
#endif // USE_TIMER2
