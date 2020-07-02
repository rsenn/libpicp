#ifndef PICLIB_INTERRUPT_H
#define PICLIB_INTERRUPT_H 1

#if defined(HI_TECH_C) || defined(__XC) || defined(__XC8__)
//#warning interrupt.h
#define INTERRUPT_FN() interrupt isr()
#elif defined(MCC18)
#pragma interrupt  isr
#define INTERRUPT_HANDLER() void isr()
#else
#if defined(__SDCC) || __SDCC__
#define INTERRUPT_FN() void isr() __interrupt 1
//#  define INTERRUPT_FN() void isr(); char interrupt_fn() { isr(); return 0; } __interrupt 0; void isr()
#else
#define INTERRUPT_FN()                                                                                                 \
  void isr();                                                                                                          \
  interrupt() { void isr(); };                                                                                         \
  isr()
#endif
#endif // !defined(HI_TECH_C)

#if defined(__SDCC) || defined(__SDCC)
#define INTERRUPT_DISABLE()                                                                                            \
  do {                                                                                                                 \
    GIE = 0;                                                                                                           \
  } while(0);
#define INTERRUPT_ENABLE()                                                                                             \
  do {                                                                                                                 \
    GIE = 1;                                                                                                           \
  } while(0);
#else
#ifdef __IAR_SYSTEMS_ICC__
#define INTERRUPT_DISABLE()                                                                                            \
  { __disable_interrupt(); }
#define INTERRUPT_ENABLE()                                                                                             \
  { __enable_interrupt(); }
#else

#if 0 // def HI_TECH_C
#define INTERRUPT_DISABLE() #asm bcf GIE #endasm
#define INTERRUPT_ENABLE() #asm bsf GIE #endasm
#else
#define INTERRUPT_DISABLE() (INTCON &= 0x7f);
#define INTERRUPT_ENABLE() (INTCON |= 0x80);
#endif
#endif
#endif

#endif // !defined(PICLIB_INTERRUPT_H)
