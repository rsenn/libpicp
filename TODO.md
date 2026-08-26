# TODO: `lib/ser_ccp.[ch]` and `lib/ser_ioc.[ch]` — interrupt-driven half-soft serial RX

Status: **planning, not yet implemented**. Two new, fully generic `libpicp`
modules (used by `src/miditest.c` eventually, but not specific to it — no
project-specific pin/timer defaults baked in, everything overridable at
build time the same way `lib/extra/ledsense.c`/`lib/lcd5110.h` now are).

Goal: receive an async serial byte stream (e.g. a 2nd/3rd/... MIDI input)
on a GPIO pin with no hardware UART, entirely interrupt-driven — no busy
waiting like `lib/softser.c` does today.

Two independent hardware techniques, two independent module pairs, usable
alone or together:

- **`ser_ccp`**: one RX channel per CCP unit, edge timestamped in hardware
  by the CCP peripheral's Capture mode (lowest jitter).
- **`ser_ioc`**: N RX channels sharing one port's Interrupt-On-Change
  group — one shared ISR entry diffs the port against its last-known
  state and dispatches to whichever channel(s) actually changed.

Both reconstruct bytes the same conceptual way: catch an edge (hardware
timestamp for `ser_ccp`, ISR-read free-running timer for `ser_ioc`),
measure elapsed time since the previous edge, divide by the bit period to
get how many bit-times elapsed, and shift in that many repeats of the
*previous* bit level (this is what makes runs of identical bits, with no
edge at all, reconstructable — a plain "sample on a fixed timer tick"
design can't do that without ever seeing the line, `ser_ioc` in
particular depends on it since it has no periodic tick, only edges).

## Hardware survey (grounded — pulled from the actual datasheets in
`/mnt/data/Dokumente/Microchip/`, not memory)

| Chip | CCP capture pins (`ser_ccp`) | IOC pins (`ser_ioc`) | IOC flag granularity |
|---|---|---|---|
| PIC12F1840 | RA2 **or** RA5 (1 unit, CCP1, mux via `APFCON.CCP1SEL`) | RA0–RA5 (all 6 GPIO pins) | **per-pin**: independent `IOCAPx`/`IOCANx` enables and `IOCAFx` flags |
| PIC16F876A | RC2 (CCP1, fixed) **and** RC1 (CCP2, fixed) — 2 units, no alt-mux | RB4–RB7 | **grouped**: single `RBIF`, cleared by reading PORTB |
| PIC18F252 | RC2 (CCP1, fixed) **and** RC1/RB3 (CCP2, alt-mux via a config bit) — 2 units | RB4–RB7 | grouped: single `RBIF`/`IOCIF`, cleared by reading PORTB |
| PIC18F2550 | RC2 (CCP1, fixed) **and** RC1/RB3 (CCP2, alt-mux via `CCP2MX`) — 2 units | RB4–RB7 (named KBI0–3) | grouped: single `IOCIF`, cleared by reading PORTB |
| PIC18F25K50 | RC2 (CCP1, fixed) **and** RC1/RB3 (CCP2, alt-mux via `CCP2MX`) — 2 units | RB4–RB7, RC0–RC2, RC6–RC7 | grouped: **one single shared `IOCIF`** across *both* PORTB and PORTC IOC pins combined, cleared by reading PORTB *and* PORTC |

Corrects an earlier assumption in this planning conversation: the
18F25K50 does **not** have per-pin IOC flags like the 12F1840 — it's the
same "diff the port yourself" style as the three older chips. So the
port-diffing logic in `ser_ioc` is not a compromise for old hardware, it's
the one technique that's actually portable across every chip in this list
except the 12F1840 (which could still use it, just doesn't strictly need
to).

On the 4 "F"-series chips, `ser_ccp`'s 2 channels and `ser_ioc`'s 4 (or,
25K50-specific, up to 9) channels never physically collide — CCP1/CCP2's
pins are disjoint from every chip's baseline RB4–RB7 IOC group regardless
of `CCP2MX`. Running both modules together is additive, not a tradeoff.

**Decided: `ser_ioc` v1 targets RB4–RB7 only**, on every chip that has
that group (876A/252/2550/25K50) — the portable baseline, not the
25K50's wider option. Noted for later: the 25K50 alone could go up to 9
IOC pins (RB4–RB7 + RC0–RC2 + RC6–RC7, all sharing its one `IOCIF`), and
the 12F1840 has IOC on all 6 of its GPIO pins (RA0–RA5) instead of a
`RBx` group at all — if `ser_ioc` ever grows a 12F1840 backend or a
25K50-specific wide mode, both are already accounted for in the survey
table above, just not implemented in v1.

## Shared conventions (matching this repo's established `libpicp` style)

- `PICLIB_SER_CCP_H` / `PICLIB_SER_IOC_H` include guards, chip-conditional
  pin tables, cross-compiler handling per `lib/typedef.h`.
- Interrupt servicing is a **macro**, not a function call, matching
  `lib/extra/midi.h`'s `midi_int()`:
  ```c
  INTERRUPT_FN() {
    ser_ccp_int();   // and/or
    ser_ioc_int();
    // ...other peripherals...
  }
  ```
  Each macro expands to tight, interrupt-safe code only — reads the
  relevant hardware flag/capture register, updates per-channel state, and
  gets out. No queue, no `getch()`-style pull API (unlike `lib/uart.c`/
  `lib/extra/midi.c`, which do use `lib/queue.[ch]` — deliberately
  different here per your direction). See **Open Questions** below for
  exactly how a completed byte gets surfaced to the caller.
- **Every pin and every timer is overridable at build time** via
  `#ifndef`-guarded macros (the same pattern just applied to
  `lib/extra/ledsense.c`'s `LS_A_PIN` and `lib/lcd5110.h`'s `LCD_*`
  macros) — never a `#define` a caller's `.c` file could set, since these
  modules are compiled as their own translation units; the override has
  to come from that program's own `*_DEFS` in `build/vars.mk`.
- Bit-timing math must not assume a 16-bit timer — `TMR0`/`TMR2` are
  8-bit on every chip in this list, `TMR1`/`TMR3` are 16-bit where
  present. See **Open Questions**.
- **Timer ownership differs between the two modules** (this was wrong in
  an earlier round of this planning conversation — corrected here):
  - `ser_ccp` **must own and configure Timer1 or Timer3** — CCP Capture
    mode is hardware-locked to one of those two 16-bit timers via
    `CCPTMRS`, it physically latches that timer's count into `CCPRxH:L`
    at the edge. It cannot capture against `TMR0`/`TMR2` at all; "any
    TMR0–TMR3" doesn't apply to this module. Timer3 itself doesn't exist
    on every chip in this list, though — confirmed against the
    datasheets: present on PIC18F252/2550/25K50, **absent on PIC12F1840
    and PIC16F876A**, where `ser_ccp` only has Timer1 available.
  - `ser_ioc` **owns no timer at all** — it only ever needs read access
    to a wide (24/32-bit), monotonically increasing tick count, which is
    exactly what a Bresenham-style overflow accumulator already
    maintains (see `src/miditest.c`'s own `decisec_bres`/`decisec_count`
    driven off `TIMER0_INTERRUPT_FLAG`). So `ser_ioc` should accept an
    **externally supplied tick source** — a macro/function the calling
    project provides — rather than configuring its own timer. This lets
    a project reuse whatever periodic timer it already has running (e.g.
    `miditest.c`'s existing TMR0 decisecond timer) for free, no new timer
    resource needed.

## Module: `lib/ser_ccp.[ch]`

- Channel-indexed API, symmetric with `ser_ioc` (`SER_CCP_CHANNELS` is 1
  on the 12F1840, 2 elsewhere; `ser_ccp_getbyte(i)` etc., not separate
  `ser_ccp1_*`/`ser_ccp2_*` symbol sets — decided, see Open Questions).
- One state machine instance per CCP unit in use. Per channel: current
  phase (idle / mid-byte / stop-bit),
  bit counter, byte accumulator, last capture timestamp.
- `ser_ccp_int()` macro: on the capture interrupt firing, read `CCPRxH:L`
  (the hardware-latched edge time), compute elapsed ticks since the last
  edge, reconstruct however many bit-times passed, shift them into the
  channel's byte accumulator, and reconfigure the capture edge polarity
  for the next expected transition (capture mode only triggers on one
  edge direction at a time — has to be flipped after each capture to
  catch the next one, since we need every transition, not just rising or
  only falling).
- Chip-conditional pin/CCP-unit tables mirroring the survey above, with
  `#ifndef`-guarded override macros for which physical pin (default vs.
  alt-mux where applicable) and which timer feeds each CCP unit's capture
  clock.

## Module: `lib/ser_ioc.[ch]`

- One shared ISR entry point (`ser_ioc_int()`) services however many
  channels are configured within one IOC group.
- Diff technique: keep a static "last known port state" snapshot; on
  `IOCIF`, read the current port value, XOR against the snapshot to get a
  changed-bits mask, store the new snapshot, then iterate the changed
  bits and feed each one's channel state machine the new level + a read
  of the externally supplied tick source (see the timer-ownership note
  above — one shared tick count for all channels in the group, `ser_ioc`
  doesn't own or configure this timer itself).
- Per-channel state: same shape as `ser_ccp` (phase, bit counter, byte
  accumulator, last-edge timestamp) minus the CCP-specific edge-polarity
  flip (IOC fires on any edge already).
- **Decided: pin candidates fixed at RB4–RB7** (4 bits), configurable via
  a compile-time bitmask, `SER_IOC_MASK` — `#ifndef`-guarded default
  `0b0001` in `ser_ioc.h`, overridable the same way as every other pin/
  timer macro in these modules. Bit *n* of the mask corresponds to
  RB(4+n) (bit0=RB4, bit1=RB5, bit2=RB6, bit3=RB7); max value `0b1111`.
  **Channel numbering is dense, not slot-per-pin**: channels are assigned
  in ascending bit order to whichever bits are actually set, so e.g.
  `SER_IOC_MASK = 0b1010` enables exactly 2 channels — channel 0 = RB5
  (bit1, the lowest set bit), channel 1 = RB7 (bit3) — RB4/RB6 don't
  exist as channels at all in that configuration, they're just left as
  plain GPIO. `ser_ioc_int()`'s port-diff step needs a bit-position →
  channel-index lookup (built from `SER_IOC_MASK` once, e.g. a small
  constant table) to route a changed physical bit to the right channel's
  state machine.
  Same mechanism, wider window, if a 12F1840 backend is ever added:
  `SER_IOC_MASK` there would run over RA0–RA5 (bit0=RA0 ... bit5=RA5, max
  `0b111111`) instead of RB4–RB7 — the bit-to-channel numbering rule is
  identical, only the pin base and mask width change per chip.

### `ser_ioc` variant under consideration: IOC-start + periodic-sample hybrid

An alternative to the pure elapsed-time-inference design above, closer in
spirit to `ser_ccp`/AN555 (Microchip AN555, "Software Implementation of
Asynchronous Serial I/O" — checked against the actual PDF, not memory:
it detects a start bit via a Timer0-external-clock-mode trick specific to
one hardware pin (`T0CKI`), then blind-samples the rest of the byte at
fixed baud-rate ticks, same technique `lib/softser.c` already uses
mid-byte). Not yet decided which `ser_ioc` variant to actually implement
— recorded here as a real option with its own tradeoffs, not a strict
upgrade:

- IOC fires on a channel's start-bit edge → that channel's own `IOCBx`
  enable bit is masked off so its own mid-byte transitions stop
  re-triggering the shared `IOCIF` → a periodic baud-rate timer tick
  blind-samples the pin for the remaining 9 bits (8 data + stop),
  shifting in whatever level is read each tick → on completion, that
  channel's `IOCBx` bit is re-enabled to catch the next start bit.
- **Gains over the pure elapsed-time design**: much simpler per-channel
  state — no elapsed-time-since-last-edge division, no reconstructing
  runs of identical bits from silence, no timer-wraparound-safe
  subtraction. Just "sample now, shift it in."
- **Costs**:
  - Needs a **shared periodic sampling timer**, firing once per bit-time
    for every currently-armed channel, continuously, for the duration of
    each byte — the pure elapsed-time design only interrupts on actual
    transitions, so it's cheaper both at idle and on data with long
    same-bit runs (a run of eight `1`s costs it nothing extra; this
    hybrid still burns a periodic tick for every one of them).
  - Extra bookkeeping: masking/unmasking a channel's own `IOCBx` bit
    around each byte, with a real race to get right — an unrelated
    channel's genuine start bit landing exactly while `IOCB` is
    mid-write for a different channel.
  - The periodic sampling timer needs to be gated off when no channel is
    mid-byte (else it burns cycles at full idle too) — an "N channels
    currently armed" counter driving its enable/disable, state the pure
    design never needed.
  - Reuses the same kind of periodic-timer infrastructure the
    `TIMERx_TICKS32()` prerequisite below already provides, so it isn't a
    brand new resource, just an added dependency on top of the tick
    source `ser_ioc` was already going to need regardless of variant.

## Prerequisite: a shared extended-tick counter in `lib/timer.[ch]`

Today, the "range-extended timer" pattern (`src/miditest.c`'s
`decisec_bres`/`decisec_count`: a `uint32_t` bumped by 256 on every
`TIMER0_INTERRUPT_FLAG`, i.e. the timer's own overflow count left-shifted
into the high bits, conceptually OR/ADD-able with a live read of `TMR0`
to get an accurate wide tick count at any instant) is owned and hand-
written entirely inside app code. `ser_ioc` needs read access to that
same kind of wide, monotonic tick count (to survive `TMRx` wraparound
across however long it's been since a channel's last edge) — but it
shouldn't duplicate the accumulation logic itself, and it definitely
shouldn't require every project to hand-roll its own copy just to satisfy
`ser_ioc`'s dependency.

So this extension logic moves into `lib/timer.[ch]`, once, per timer —
**responsibility for maintaining it moves to the library; ownership of
*which* timer runs, its prescaler, and whether/when its interrupt fires
stays exactly where it is today, with the app** (`timer0_init()` etc. are
unchanged, the app still enables the timer's interrupt itself).

Concretely, add to `lib/timer.h`/`lib/timer.c`, per timer (`TIMER0`
already exists; **`TIMER1`/`TIMER2` need this too, and `TIMER3` doesn't
exist in `lib/timer.[ch]` at all yet — needed anyway since `ser_ccp`'s
capture hardware is locked to Timer1 or Timer3** (on the 3 chips that
have a Timer3: 18F252/2550/25K50 — see the timer-ownership note above),
must be added chip-conditionally since PIC12F1840/16F876A have no TMR3):

```c
// lib/timer.h
extern volatile uint32_t timer0_ext_ticks;  // high bits: overflow count << 8

// called from the app's own ISR, same call site as TIMER0_INTERRUPT_CLEAR()
// today -- ownership of *when* this runs is still the app's, this macro
// just does the (previously hand-written, now shared) accumulation
#define TIMER0_EXTEND()                                                                                                \
  do {                                                                                                                 \
    if(TIMER0_INTERRUPT_FLAG) {                                                                                        \
      TIMER0_INTERRUPT_CLEAR();                                                                                        \
      timer0_ext_ticks += 256;                                                                                         \
    }                                                                                                                  \
  } while(0)

// combines the accumulated high bits with a live low-byte read -- an
// accurate wide tick count at any instant, not just at overflow boundaries
#define TIMER0_TICKS32() (timer0_ext_ticks + TMR0)
```

`timer0_ext_ticks` is `uint32_t` by default (matches what
`src/miditest.c`'s own `OSC_4/10` case already needs — the extra width
costs a few instructions per overflow, negligible), same pattern repeats
for `TIMER1_EXTEND()`/`TIMER1_TICKS32()` etc.

**`src/miditest.c`'s own decisecond code changes shape**, but not
behavior: instead of maintaining its own private `decisec_bres`
accumulator directly off the raw overflow flag, its ISR just calls
`TIMER0_EXTEND()` (shared, does the accumulation once), and its
decisecond logic becomes an ordinary Bresenham *consumer* of
`TIMER0_TICKS32()` — sample it, subtract the last sample, run the
existing `BRESENHAM_COND`/`BRESENHAM_SUB` math on that delta. `ser_ioc`
becomes a second, independent consumer of the exact same
`TIMER0_TICKS32()` value (or whichever timer's extension a project points
it at) — this is what finally answers `ser_ioc`'s "externally supplied
tick source" requirement concretely: **the tick source is just
`TIMERx_TICKS32()`, and the app picks which `x`.**

**Atomicity note**: reading `TIMER0_TICKS32()` from *inside the same ISR*
that calls `TIMER0_EXTEND()` (which is how `ser_ioc_int()` will use it,
called from the same `INTERRUPT_FN()`) is safe as-is — PIC ISRs don't
re-enter themselves. Reading it from main-loop/non-interrupt context is
not automatically safe (the extension could increment, or `TMR0` could
roll over, mid-read) and would need a brief `GIE` disable around the
read, same as the ready-bitset clear from question 1. Worth deciding: do
we want a second, explicitly interrupt-safe macro
(`TIMER0_TICKS32_SAFE()`, disables `GIE` around the read) for main-loop
callers, or leave that entirely to the caller since `ser_ioc`/`ser_ccp`
themselves only ever need the ISR-context version?

## OPEN QUESTIONS — need your answer before I write any code

1. ~~**Byte-ready notification.**~~ **Decided: shared `volatile` ready
   bitset** (1 bit per channel) + a per-channel byte array the caller
   reads then clears its own bit. Implementation note: clearing one bit
   from the main loop while the ISR concurrently sets a *different* bit
   in the same byte is a real hazard (`BCF`/`BSF` is a register
   read-modify-write — a stray interleaving can clobber the other side's
   bit), so the clear needs to briefly disable `GIE` around it. Cheap on
   PIC, just needs to actually be there.
2. ~~**`ser_ccp` API shape.**~~ **Decided: channel-indexed, symmetric with
   `ser_ioc`** (e.g. `ser_ccp_getbyte(0)`/`ser_ccp_getbyte(1)`, not
   separate `ser_ccp1_*`/`ser_ccp2_*` symbol sets). Reasons: one calling
   convention for both modules when used together; sidesteps `#ifdef`-ing
   away a whole symbol set on the 12F1840, which only has 1 CCP unit
   (`SER_CCP_CHANNELS` reports 1 or 2 per chip); negligible cost either
   way at this channel count.
3. **8-bit vs. 16-bit timer support — still open, `ser_ccp` only now.**
   Now that timer ownership is split (see the note under **Shared
   conventions**): `ser_ioc` is moot here, it never owns a timer, it just
   reads whatever tick source it's given, 8-bit-underlying or not — that
   overflow-counting concern lives entirely in *whoever provides the tick
   source* (e.g. `miditest.c`'s own Bresenham accumulator already handles
   it for TMR0). `ser_ccp` is the only module that owns a timer, and it's
   hardware-locked to Timer1 or Timer3 — both 16-bit on every chip in
   this list — so the 8-bit-timer question doesn't actually apply to
   either module in practice. I think this closes the question by itself;
   confirm and I'll drop it from the plan, or tell me if you had a
   different scenario in mind.
4. ~~**Channel count/pin set for `ser_ioc`.**~~ **Decided: fixed at
   RB4–RB7, compile-time `SER_IOC_MASK` bitmask** (see the `ser_ioc`
   module section above for the exact bit-to-channel numbering rule).
5b. **Main-loop-safe tick read.** Add a `GIE`-guarded `TIMERx_TICKS32_SAFE()`
   variant now (for any future main-loop caller), or skip it since
   `ser_ioc`/`ser_ccp` only ever need the ISR-context-safe plain macro?
6. **Framing/overrun errors.** Is detecting a bad stop bit (framing
   error) or a byte overwritten before the caller read it (overrun) in
   scope for v1, or deferred? If in scope, per-channel error flag(s) or
   something else?
7. **Which `ser_ioc` variant to implement**: the pure elapsed-time-
   inference design (self-corrects through silent runs, no periodic
   timer, more arithmetic), or the IOC-start + periodic-sample hybrid
   just added above (simpler per-channel state, but needs a gated
   periodic sampling timer and per-channel `IOCBx` masking)? Or both,
   as separate build-time-selectable backends within `ser_ioc.c`?
