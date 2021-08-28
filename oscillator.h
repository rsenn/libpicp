#ifndef PICLIB_OSCILLATOR_H
#define PICLIB_OSCILLATOR_H 1

//#ifdef _XTAL_FREQ
//#warning External _XTAL_FREQ
//#endif

#define NO_XTAL 0
#define MHz_4 1
#define MHz_8 2
#define MHz_12 3
#define MHz_16 4
#define MHz_20 5
#define MHz_24 6
#define MHz_40 10
#define MHz_48 12

#if XTAL_USED != NO_XTAL

#if defined(XTAL_FREQ)
#define _XTAL_FREQ XTAL_FREQ
#else
#define _XTAL_FREQ 20000000 /** CPU clock */
#endif

#endif

#define KHZ ((_XTAL_FREQ) / 1000)
#define OSC_4 ((_XTAL_FREQ) / 4)

//----------------------------------------------------------------------------
// Preprocessor macros
//----------------------------------------------------------------------------
#define US_TO_OVERFLOWS(us, period) (US_CYCLES(us) / (period))
#define MS_TO_OVERFLOWS(ms, period) (MS_CYCLES(ms) / (period))

#endif // !defined(PICLIB_OSCILLATOR_H)
