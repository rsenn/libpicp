#include "device.h"
#include "softpwm.h"
#include "timer.h"
#include "typedef.h"

#ifdef USE_SOFTPWM

#define SOFTPWM_EVAL(x) x
#define SOFTPWM_TIMER_SETUP timer1_init

uint8_t volatile softpwm_counter;
uint8_t volatile softpwm_values[SOFTPWM_CHANNELS];

/**
 * ISR for SOFTPWM receive
 *
 * @return received character or 0 if it's not SOFTPWM interrupt
 */
// void
// softpwm_isr(void) SOFTPWM_ISR()
//
//    void softpwm_enable(void) {
//  // SOFTPWM_INTERRUPT_FLAG = 0;
//  SOFTPWM_INTERRUPT_ENABLE = 1;
//}

void
softpwm_disable(void) {
  SOFTPWM_INTERRUPT_ENABLE = 0;
}

void
softpwm_enable(void) {
  SOFTPWM_INTERRUPT_ENABLE = 1;
}

uint8_t softpwm_dummy;

void
softpwm_init(void) {
  uint8_t i;

  for(i = 0; i < SOFTPWM_CHANNELS; i++) softpwm_values[i] = 0;

  SOFTPWM_TRIS = ~(SOFTPWM_MASK);
  SOFTPWM_PORT = ~(SOFTPWM_MASK);

  SOFTPWM_TRIS2 = ~(SOFTPWM_MASK2);
  SOFTPWM_PORT2 = ~(SOFTPWM_MASK2);

  SOFTPWM_TRIS3 = ~(SOFTPWM_MASK3);
  SOFTPWM_PORT3 = ~(SOFTPWM_MASK3);

  softpwm_counter = 0;

  SOFTPWM_TIMER_SETUP(PRESCALE_1_1);

  softpwm_enable();
}

void
softpwm_set(uint8_t ch, uint8_t duty) {
  // assert(ch < SOFTPWM_CHANNELS);
  softpwm_values[ch] = duty;
}

#endif // USE_SOFTPWM
