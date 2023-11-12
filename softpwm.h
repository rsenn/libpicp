#ifndef PICLIB_SOFTPWM_H
#define PICLIB_SOFTPWM_H 1

#include "timer.h"

#ifndef SOFTPWM_TIMER
#define SOFTPWM_TIMER 1
#endif

#ifndef SOFTPWM_RANGE
#define SOFTPWM_RANGE 100
#endif

#ifndef SOFTPWM_CHANNELS
#define SOFTPWM_CHANNELS 24
#endif

#if defined(__12f1840)
#define SOFTPWM_PORT LATA
#define SOFTPWM_TRIS TRISA
//#define SOFTPWM_MASK 0b11111111

#define SOFTPWM_TIMER_VALUE TMR0
#define SOFTPWM_INTERRUPT_FLAG /*INTCONbits.*/ TMR0IF
#define SOFTPWM_INTERRUPT_ENABLE /*INTCONbits.*/ TMR0IE

#else

#if defined(PIC18)
#define SOFTPWM_PORT LATB
#define SOFTPWM_PORT2 LATC
#define SOFTPWM_PORT3 LATA
#else
#define SOFTPWM_PORT PORTB
#define SOFTPWM_PORT2 PORTC
#define SOFTPWM_PORT3 PORTA
#endif

#define SOFTPWM_TRIS TRISB
#define SOFTPWM_MASK 0b11111111

#define SOFTPWM_TRIS2 TRISC
#define SOFTPWM_MASK2 0b11000111

#define SOFTPWM_TRIS3 TRISA
#define SOFTPWM_MASK3 0b11101111

#ifndef SOFTPWM_PORT

#if NO_PORTC
#if NO_PORTB
#if NO_PORTA
#define SOFTPWM_PORT GP
#define SOFTPWM_TRIS TRISGP
#else
#define SOFTPWM_PORT PORTA
#define SOFTPWM_TRIS TRISA
#endif
#else
#define SOFTPWM_PORT PORTB
#define SOFTPWM_TRIS TRISB
#endif
#else
#define SOFTPWM_PORT PORTC
#define SOFTPWM_TRIS TRISC
#endif

#endif

#ifndef SOFTPWM_CHANNELS
#define SOFTPWM_CHANNELS 24
#endif
#ifndef SOFTPWM_PIN_FIRST
#define SOFTPWM_PIN_FIRST 0
#endif

#endif

#ifndef SOFTPWM_PORT2
#define SOFTPWM_PORT2 softpwm_dummy
#endif
#ifndef SOFTPWM_PORT3
#define SOFTPWM_PORT3 softpwm_dummy
#endif

#ifndef SOFTPWM_TRIS2
#define SOFTPWM_TRIS2 softpwm_dummy
#endif
#ifndef SOFTPWM_TRIS3
#define SOFTPWM_TRIS3 softpwm_dummy
#endif

#ifndef SOFTPWM_MASK
#define SOFTPWM_MASK (SOFTPWM_CHANNELS >= 8 ? 0xff : SOFTPWM_CHANNELS > 0 ? ((1 << (SOFTPWM_CHANNELS)) - 1) : 0)
#endif
#ifndef SOFTPWM_MASK2
#define SOFTPWM_MASK2 (SOFTPWM_CHANNELS >= 16 ? 0xff : SOFTPWM_CHANNELS > 8 ? ((1 << (SOFTPWM_CHANNELS - 8)) - 1) : 0)
#endif
#ifndef SOFTPWM_MASK3
#define SOFTPWM_MASK3 (SOFTPWM_CHANNELS >= 24 ? 0xff : SOFTPWM_CHANNELS > 16 ? ((1 << (SOFTPWM_CHANNELS - 16)) - 1) : 0)
#endif

extern uint8_t softpwm_dummy;
extern volatile uint8_t softpwm_counter;
extern volatile uint8_t softpwm_values[SOFTPWM_CHANNELS];

#ifndef SOFTPWM_TIMER_VALUE
#define SOFTPWM_TIMER_VALUE TMR1
#endif

#ifndef SOFTPWM_INTERRUPT_FLAG
#define SOFTPWM_INTERRUPT_FLAG TMR1IF
#endif

#ifndef SOFTPWM_INTERRUPT_ENABLE
#define SOFTPWM_INTERRUPT_ENABLE TMR1IE
#endif

#define SOFTPWM_PIN(n, port) (port) = (softpwm_counter > 0 && softpwm_counter > softpwm_values[n])
#define SOFTPWM_REG8(values)                                                                                           \
  ((softpwm_counter >= (values)[0] ? 0 : 0b00000001) | (softpwm_counter >= (values)[1] ? 0 : 0b00000010) |             \
   (softpwm_counter >= (values)[2] ? 0 : 0b00000100) | (softpwm_counter >= (values)[3] ? 0 : 0b00001000) |             \
   (softpwm_counter >= (values)[4] ? 0 : 0b00010000) | (softpwm_counter >= (values)[5] ? 0 : 0b00100000) |             \
   (softpwm_counter >= (values)[6] ? 0 : 0b01000000) | (softpwm_counter >= (values)[7] ? 0 : 0b10000000))

#define SOFTPWM_ISR3()                                                                                                 \
  do {                                                                                                                 \
    if(SOFTPWM_INTERRUPT_FLAG) {                                                                                       \
      SOFTPWM_PORT = SOFTPWM_REG8(softpwm_values);                                                                     \
      SOFTPWM_PORT2 = SOFTPWM_REG8(softpwm_values + 16);                                                               \
      SOFTPWM_PORT3 = SOFTPWM_REG8(softpwm_values + 8);                                                                \
      SOFTPWM_TIMER_VALUE = -128;                                                                                      \
      SOFTPWM_INTERRUPT_FLAG = 0;                                                                                      \
      softpwm_counter++;                                                                                               \
    }                                                                                                                  \
  } while(0);

#define SOFTPWM_ISR2()                                                                                                 \
  do {                                                                                                                 \
    if(SOFTPWM_INTERRUPT_FLAG) {                                                                                       \
      SOFTPWM_PORT = SOFTPWM_REG8(softpwm_values);                                                                     \
      SOFTPWM_PORT2 = SOFTPWM_REG8(softpwm_values + 16);                                                               \
      SOFTPWM_TIMER_VALUE = -128;                                                                                      \
      SOFTPWM_INTERRUPT_FLAG = 0;                                                                                      \
      softpwm_counter++;                                                                                               \
    }                                                                                                                  \
  } while(0);

#define SOFTPWM_ISR1()                                                                                                 \
  do {                                                                                                                 \
    if(SOFTPWM_INTERRUPT_FLAG) {                                                                                       \
      SOFTPWM_PORT = SOFTPWM_REG8(softpwm_values);                                                                     \
      SOFTPWM_TIMER_VALUE = -128;                                                                                      \
      SOFTPWM_INTERRUPT_FLAG = 0;                                                                                      \
      softpwm_counter++;                                                                                               \
    }                                                                                                                  \
  } while(0);

/**
 * Initialize SoftPWM module
 */
void softpwm_init(void);

/**
 * ISR for SoftPWM. Called from each interrupt
 *
 * @return 1 if there was SoftPWM receive interrupt, 0 otherwise
 */
void softpwm_isr(void);

/**
 * Enable SoftPWM (used for power managed mode)
 */
void softpwm_enable(void);

/**
 * Disable SoftPWM (used for power managed mode)
 */
void softpwm_disable(void);

/**
 * Set SoftPWM duty-cycle
 */
void softpwm_set(uint8_t ch, uint8_t duty);

#endif /* PICLIB_SOFTPWM_H */
