#include "ser_ioc.h"
#include "interrupt.h"

#define SER_IOC_PHASE_IDLE 0
#define SER_IOC_PHASE_RECEIVING 1

typedef struct {
  uint32_t last_ticks;      // SER_IOC_TICKS() at the last recorded edge
  uint8_t accumulator;      // shifted in LSB-first
  unsigned phase : 1;        // 0 = idle, 1 = receiving
  unsigned prev_level : 1;   // level active from last_ticks until the next observed edge
  unsigned framing_error : 1; // sticky until ser_ioc_clear_framing_error()
  unsigned overrun : 1;       // sticky until ser_ioc_clear_overrun()
  unsigned bit_count : 4;    // 0 = mid start bit, 1-8 = data bits D0-D7 pending, 9 = stop bit pending, 10 = done
} ser_ioc_state_t;

volatile uint8_t ser_ioc_byte[SER_IOC_CHANNELS];
volatile uint8_t ser_ioc_ready = 0;

static ser_ioc_state_t ser_ioc_state[SER_IOC_CHANNELS];
static uint8_t ser_ioc_pin_to_channel[4]; // index 0-3 == RB4-RB7; 0xff == not a channel
static uint8_t ser_ioc_last_portb;

void
ser_ioc_init(void) {
  uint8_t pin, ch;

  TRISB |= (SER_IOC_MASK << 4);
  IOCB = (SER_IOC_MASK << 4);

  ch = 0;
  for(pin = 0; pin < 4; pin++) {
    if(SER_IOC_MASK & (1 << pin)) {
      ser_ioc_pin_to_channel[pin] = ch;
      ser_ioc_state[ch].phase = SER_IOC_PHASE_IDLE;
      ser_ioc_state[ch].bit_count = 0;
      ser_ioc_state[ch].accumulator = 0;
      ser_ioc_state[ch].prev_level = 1; // assume idle-high at startup
      ser_ioc_state[ch].framing_error = 0;
      ser_ioc_state[ch].overrun = 0;
      ser_ioc_state[ch].last_ticks = SER_IOC_TICKS();
      ch++;
    } else {
      ser_ioc_pin_to_channel[pin] = 0xff;
    }
  }

  ser_ioc_last_portb = PORTB;
  ser_ioc_ready = 0;

  IOCIF = 0;
  IOCIE = 1;
}

void
ser_ioc_clear_ready(uint8_t channel) {
  INTERRUPT_DISABLE();
  ser_ioc_ready &= ~(1 << channel);
  INTERRUPT_ENABLE();
}

uint8_t
ser_ioc_get_framing_error(uint8_t channel) {
  return ser_ioc_state[channel].framing_error;
}

uint8_t
ser_ioc_get_overrun(uint8_t channel) {
  return ser_ioc_state[channel].overrun;
}

void
ser_ioc_clear_framing_error(uint8_t channel) {
  INTERRUPT_DISABLE();
  ser_ioc_state[channel].framing_error = 0;
  INTERRUPT_ENABLE();
}

void
ser_ioc_clear_overrun(uint8_t channel) {
  INTERRUPT_DISABLE();
  ser_ioc_state[channel].overrun = 0;
  INTERRUPT_ENABLE();
}

void
ser_ioc_service(void) {
  uint8_t current = PORTB;
  uint8_t changed = (current ^ ser_ioc_last_portb) & (SER_IOC_MASK << 4);
  uint32_t now = SER_IOC_TICKS();
  uint8_t pin;

  ser_ioc_last_portb = current;
  IOCIF = 0;

  if(!changed)
    return;

  for(pin = 0; pin < 4; pin++) {
    uint8_t pinmask = (uint8_t)(1 << (pin + 4));
    uint8_t ch, new_level;
    ser_ioc_state_t* s;
    uint32_t elapsed;
    uint16_t n;

    if(!(changed & pinmask))
      continue;

    ch = ser_ioc_pin_to_channel[pin];
    new_level = !!(current & pinmask);
    s = &ser_ioc_state[ch];

    elapsed = now - s->last_ticks;
    n = (uint16_t)((elapsed + (SER_IOC_TICKS_PER_BIT / 2)) / SER_IOC_TICKS_PER_BIT);

    if(s->phase == SER_IOC_PHASE_IDLE) {
      if(s->prev_level == 1 && new_level == 0) {
        // falling edge from idle -- start bit begins now, its own
        // duration gets measured on the *next* edge
        s->phase = SER_IOC_PHASE_RECEIVING;
        s->bit_count = 0;
        s->accumulator = 0;
      }
      // else: noise (a rising edge while idle) -- ignore
    } else {
      while(n && s->bit_count < 10) {
        n--;
        if(s->bit_count == 0) {
          s->bit_count = 1; // consumed the start bit itself
        } else if(s->bit_count <= 8) {
          s->accumulator = (uint8_t)((s->accumulator >> 1) | (s->prev_level ? 0x80 : 0));
          s->bit_count++;
        } else { // bit_count == 9: stop bit
          if(!s->prev_level)
            s->framing_error = 1;
          if(ser_ioc_ready & (1 << ch))
            s->overrun = 1;
          ser_ioc_byte[ch] = s->accumulator;
          ser_ioc_ready |= (1 << ch);
          s->bit_count = 10;
        }
      }
      if(s->bit_count >= 10)
        s->phase = SER_IOC_PHASE_IDLE;
    }

    s->prev_level = new_level;
    s->last_ticks = now;
  }
}
