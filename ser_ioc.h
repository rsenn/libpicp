#ifndef PICLIB_SER_IOC_H
#define PICLIB_SER_IOC_H 1

#include "typedef.h"
#include "device.h"
#include "oscillator.h"
#include "timer.h"

/* SDCC's pic16 chip headers only expose these via INTCONbits -- XC8
   already provides flat names natively, hence the guard (same fallback
   convention lib/device.h already uses for GIE/PEIE/etc). IOCB itself
   (the enable register) is a plain SFR under both toolchains already. */
#ifndef IOCIF
#define IOCIF INTCONbits.IOCIF
#endif
#ifndef IOCIE
#define IOCIE INTCONbits.IOCIE
#endif

/* Interrupt-driven half-soft serial RX sharing one port's
   Interrupt-On-Change group. See lib/TODO.md for the design/hardware
   survey this implements ("pure elapsed-time inference" variant).

   Pin candidates are fixed at RB4-RB7 -- the IOC group common to every
   chip in this project's target lineup (PIC16F876A/18F252/18F2550/
   18F25K50; the 25K50 alone could go wider, RA0-RA5 on a hypothetical
   PIC12F1840 backend would use the same mechanism -- neither is
   implemented here, see lib/TODO.md). Which of those 4 pins are
   actually active channels -- and their channel numbering -- is set by
   SER_IOC_MASK: bit n of the mask corresponds to RB(4+n). Channels are
   numbered densely in ascending bit order among the SET bits only, e.g.
   SER_IOC_MASK = 0b1010 gives exactly 2 channels: channel 0 = RB5
   (bit1, the lowest set bit), channel 1 = RB7 (bit3) -- RB4/RB6 are left
   as plain GPIO in that configuration. */
#ifndef SER_IOC_MASK
#define SER_IOC_MASK 0b0001
#endif

/* number of enabled channels, computed from SER_IOC_MASK at preprocess
   time (bit population count over 4 bits -- unrolled, the preprocessor
   has no popcount) */
#define SER_IOC_POPCOUNT4(m) (((m)&1) + (((m) >> 1) & 1) + (((m) >> 2) & 1) + (((m) >> 3) & 1))
#define SER_IOC_CHANNELS SER_IOC_POPCOUNT4(SER_IOC_MASK)

/* baud rate this module decodes at, and how many ticks (of whatever
   clock SER_IOC_TICKS() reads) make up one bit period. Override
   SER_IOC_TICKS_PER_BIT directly if the tick source isn't OSC_4-rate. */
#ifndef SER_IOC_BAUD
#define SER_IOC_BAUD 31250 // MIDI
#endif
#ifndef SER_IOC_TICKS_PER_BIT
#define SER_IOC_TICKS_PER_BIT (OSC_4 / SER_IOC_BAUD)
#endif

/* The shared tick source. ser_ioc doesn't own or configure a timer
   itself (see lib/TODO.md's timer-ownership note) -- it only needs read
   access to a wide, monotonically increasing tick count, safe across
   TMRx wraparound. Defaults to Timer0's extended counter (this header's
   TIMER0_TICKS32(), from timer.h) since that's what src/miditest.c
   already runs; override SER_IOC_TICKS() for a different timer -- the
   calling project is still the one that owns/configures/services
   whichever timer actually backs it (e.g. calling TIMER0_EXTEND() from
   its own INTERRUPT_FN(), same as always). */
#ifndef SER_IOC_TICKS
#define SER_IOC_TICKS() TIMER0_TICKS32()
#endif

/* received-byte state, one array slot per enabled channel (see
   SER_IOC_MASK / SER_IOC_CHANNELS above) */
extern volatile uint8_t ser_ioc_byte[SER_IOC_CHANNELS];

/* bit i set => channel i has a byte in ser_ioc_byte[i] the caller hasn't
   read yet. Read it directly (plain volatile global, no function-call
   overhead), then clear it with ser_ioc_clear_ready() -- a raw
   '&= ~(1<<i)' from the main loop is NOT interrupt-safe, since the ISR
   can concurrently set a *different* bit in the same byte mid
   read-modify-write. */
extern volatile uint8_t ser_ioc_ready;

/* Per-channel framing-error / overrun flags. These live packed as
   single-bit fields inside each channel's private state (not exposed as
   a bitset like ser_ioc_ready) -- read/cleared via the accessors below.
   Sticky until explicitly cleared. */
uint8_t ser_ioc_get_framing_error(uint8_t channel);
uint8_t ser_ioc_get_overrun(uint8_t channel);

/* GIE-guarded clears, same rationale as ser_ioc_clear_ready() -- only
   call from ordinary main-loop context. */
void ser_ioc_clear_framing_error(uint8_t channel);
void ser_ioc_clear_overrun(uint8_t channel);

/* One-time setup: configures TRISB/IOCB for the enabled pins, enables
   the IOC interrupt, and resets all per-channel state. Does NOT touch
   whichever timer backs SER_IOC_TICKS() -- that's still the caller's own
   responsibility (init it, enable its interrupt, and call its *_EXTEND()
   from the project's own ISR) before or after calling this. */
void ser_ioc_init(void);

/* Call from the main loop after reading ser_ioc_byte[channel] -- clears
   ser_ioc_ready's bit for that channel with GIE briefly disabled, so a
   concurrent ISR write to a *different* bit in the same byte can't be
   clobbered by the read-modify-write. Only call this from ordinary
   main-loop context (not from inside another already-interrupts-disabled
   section) -- it doesn't save/restore the prior GIE state, it just turns
   interrupts back on unconditionally afterward, matching every other
   critical-section use already in this codebase. */
void ser_ioc_clear_ready(uint8_t channel);

/* the actual servicing routine -- interrupt-safe (bounded work: reads
   PORTB once, diffs against the last snapshot, and processes at most
   SER_IOC_CHANNELS changed bits), called by the ser_ioc_int() macro
   below. Not normally called directly. */
void ser_ioc_service(void);

/* Call from inside the project's own interrupt handler (see
   lib/interrupt.h's INTERRUPT_FN()) to service the shared IOC interrupt:
   INTERRUPT_FN() {
     ser_ioc_int();
     // ...other peripherals...
   } */
#define ser_ioc_int()                                                                                                 \
  do {                                                                                                                \
    if(IOCIF) {                                                                                                      \
      ser_ioc_service();                                                                                             \
    }                                                                                                                 \
  } while(0)

#endif
