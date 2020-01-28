#ifndef LIB_DEVICE_H
#define LIB_DEVICE_H


#ifdef __XC
#include <xc.h>
#endif

#ifdef __10f206
#define PIC10 1
#endif
#ifdef __12f1840
#define PIC12 1
#endif
#ifdef __16f628a
#define PIC16 1
#endif
#ifdef __16f876a
#define PIC16 1
#endif
#ifndef PIC18
#ifdef __18f2450
#define PIC18 1
#endif
#ifdef __18f2455
#define PIC18 1
#endif
#ifdef __18f252
#define PIC18 1
#endif
#ifdef __18f2520
#define PIC18 1
#endif
#ifdef __18f2550
#define PIC18 1
#endif
#ifdef __18f25k22
#define PIC18 1
#endif
#ifdef __18f25k50
#define PIC18 1
#endif
#endif

#ifdef __10f206
#define PIC10 1
#endif
#ifdef __12f1840
#define PIC12 1
#endif
#ifdef __16f628a
#define PIC16 1
#endif
#ifdef __16f876a
#define PIC16 1
#endif
#ifdef __18f2450
#define PIC18 1
#endif
#ifdef __18f2455
#define PIC18 1
#endif
#ifdef __18f252
#define PIC18 1
#endif
#ifdef __18f2520
#define PIC18 1
#endif
#ifdef __18f2550
#define PIC18 1
#endif
#ifdef __18f25k22
#define PIC18 1
#endif
#ifdef __18f25k50
#define PIC18 1
#endif

#if defined(__SDCC) 
#ifndef __SDCC
#define __SDCC 1
#endif
#ifdef __16f628a
#include <pic14/pic16f628a.h>
#endif
#ifdef __16f876a
//#warning __16f876a
#include <pic14/pic16f876a.h>
#endif
#ifdef __18f252
#include <pic16/pic18f252.h>
#endif
#ifdef __18f2455
#include <pic16/pic18f2455.h>
#endif
#ifdef __18f2450
#include <pic16/pic18f2450.h>
#endif
#ifdef __18f2520
#include <pic16/pic18f2520.h>
#endif
#ifdef __18f2550
#include <pic16/pic18f2550.h>
#endif
#ifdef __18f25k22
#include <pic16/pic18f25k22.h>
#endif
#ifdef __18f25k50
#include <pic16/pic18f25k50.h>
#endif

//#elif defined(__XC8) || defined(__XC)

//#define __XC 1
//#undef HI_TECH_C

#elif defined(HI_TECH_C) && !defined(__XC)
//#warning HI-TECH
#include <htc.h>
#ifdef __PIC10F206_H
#define __10f206 1
#endif
#ifdef __PIC12F1840_H
#define __12f1840 1
#endif
#ifdef __PIC16F628A_H
#define __16f628a
#endif
#ifdef __PIC16F876A_H
#define __16f876a 1
#endif
#ifdef __PIC18F252_H
#define __18f252 1
#endif
#ifdef __PIC18F2450_H
#define __18f2450 1
#endif
#ifdef __PIC18F2455_H
#define __18f2455 1
#endif
#ifdef __PIC18F2550_H
#define __18f2550 1
#endif
#ifdef __PIC18F2520_H
#define __18f2520 1
#endif
#ifdef __PIC18F25K22_H
#define __18f25k22 1
#endif
#ifdef __PIC18F25K50_H
#define __18f25k50 1
#endif

#endif

#if  defined(HI_TECH_C) && !defined(__XC)
#ifdef __10f206
#include <pic10f206.h>
#endif
#ifdef __12f1840
#include <pic12f1840.h>
#endif
#ifdef __16f628a
#include <pic16f628a.h>
#endif
#ifdef __16f876a
//#warning pic16f876a.h
#include <pic16f876a.h>
#endif
#ifdef __18f252
#include <pic18f252.h>
#endif
#ifdef __18f2450
#include <pic18f2450.h>
#endif
#ifdef __18f2455
#include <pic18f2455.h>
#endif
#ifdef __18f2520
#include <pic18f2520.h>
#endif
#ifdef __18f2550
#include <pic18f2550.h>
#endif
#ifdef __18f25k22
#include <pic18f25k22.h>
#endif
#ifdef __18f25k50
#include <pic18f25k50.h>
#endif
#endif

#if defined(__SDCC) || defined(__SDCC)
#define CONFIG_WORD (_FOSC_HS & _PWRTE_ON & _WDT_OFF & _BODEN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF)
#define double float
#endif

#if defined(__10f206) || defined(__12f1840)
#if defined(__10f206)
#define NO_PORTA 1
#endif
#define NO_PORTB 1
#define NO_PORTC 1
#define NO_SSP 1
#elif defined(__16f628a)
#define NO_PORTC 1
#define NO_SSP 1
#define TMR0IE T0IE
#define TMR0IF T0IF
#endif

#ifndef NO_PORTA
#define NO_PORTA 0
#endif
#ifndef NO_PORTB
#define NO_PORTB 0
#endif
#ifndef NO_PORTC
#define NO_PORTC 0
#endif

#if defined(HI_TECH_C) || defined(__XC__)
#if 0 // ndef nRBPU
volatile uint8_t           OPTION_REG          @ 0x081;

volatile bit nRBPU               @((unsigned)&OPTION_REG * 8) + 7;
//#define nRBPU OPTION_REGbits.nRBPU
#endif
/*
#if !NO_PORTB
#define NOT_RBPU nRBPU
#endif
*/
#endif

#if defined(__18f252) || defined(__18f2520) || defined(__18f2450) || defined(__18f2455) || defined(__18f2550) ||       \
    defined(__18f14k50) || defined(__18f25k22) || defined(__18f25k50)
#ifndef PIC18
#define PIC18 1
#endif
#endif

#if defined(__12f1840)
#define PIC12 1
#endif

#if !defined(__16f628a) && !defined(__18f25k22) && !defined(__18f25k50) && !defined(__12f1840)
#define HAVE_ADC 1

#define PCFG ADCON1bits.PCFG
#endif

#if defined(__16f628a) || defined(__16f876a) || defined(__18f2550) || defined(__18f25k50)
#define HAVE_COMPARATOR 1
#endif

#if !defined(__10f206)
#define HAVE_TIMER0 1
#endif

#if HAVE_COMPARATOR && defined(__18f25k50)
#define CMCON CM1CON0
#define CMCONbits CM1CON0bits
#endif

#if defined(PIC16)
#define LATC0 RC0
#define LATC1 RC1
#endif

#ifdef PIC16
#define LATA PORTA
#define LATB PORTB
#define LATC PORTC
#endif

#ifdef PIC18
#ifdef HI_TECH_C
#define N_RBPU INTCON2bits.nRBPU
#else
#define N_RBPU INTCON2bits.NOT_RBPU
#endif
#else
#ifdef HI_TECH_C
#define N_RBPU OPTION_REGbits.nRBPU
#else
#define N_RBPU OPTION_REGbits.NOT_RBPU
#endif
#endif

#if defined(PIC18) || defined(PIC12)
//#warning PIC18 or PIC12
#define TMR1CS T1CONbits.TMR1CS

#ifdef PIC12
#define T0CS OPTION_REGbits.T0CS
#define T0SE OPTION_REGbits.T0SE
#else
#define T0CS T0CONbits.T0CS
#define T0SE T0CONbits.T0SE
#endif

#define TMR0IF INTCONbits.TMR0IF
#define T0IE INTCONbits.T0IE

#define ADCS2 ADCON1bits.ADCS2
#define ADFM ADCON1bits.ADFM
#define ADIE PIE1bits.ADIE
#define ADIF PIR1bits.ADIF
#define ADON ADCON0bits.ADON
#define BRGH TXSTAbits.BRGH
#define C STATUSbits.C
#define CREN RCSTAbits.CREN
#define D SSPSTATbits.D
#define GIE INTCONbits.GIE
#define GO_DONE ADCON0bits.GO_DONE
#define OERR RCSTAbits.OERR
#define P SSPSTATbits.P
#define PEIE INTCONbits.PEIE
#define R SSPSTATbits.R
#define RCEN SSPCON2bits.RCEN
#define RCIE PIE1bits.RCIE
#define RCIF PIR1bits.RCIF
#define RX9 RCSTAbits.RX9
#define RX9D RCSTAbits.RX9D
#define S SSPSTATbits.S
#define SPEN RCSTAbits.SPEN
#define SSPEN SSPCONbits.SSPEN
#define SYNC TXSTAbits.SYNC
#define T0IE INTCONbits.T0IE
#define T0IF INTCONbits.T0IF
#define T1CKPS0 T1CONbits.T1CKPS0
#define T1CKPS1 T1CONbits.T1CKPS1
#define TMR0IE INTCONbits.TMR0IE
#define TMR0IF INTCONbits.TMR0IF
#define TMR1CS T1CONbits.TMR1CS
#define TMR1IE PIE1bits.TMR1IE
#define TMR1IF PIR1bits.TMR1IF
#define TMR1ON T1CONbits.TMR1ON
#define TMR2IE PIE1bits.TMR2IE
#define TMR2IF PIR1bits.TMR2IF
#define TMR2ON T2CONbits.TMR2ON
#define TRISA0 TRISAbits.TRISA0
#define TRISA1 TRISAbits.TRISA1
#define TRISA2 TRISAbits.TRISA2
#define TRISB0 TRISBbits.TRISB0
#define TRISB1 TRISBbits.TRISB1
#define TRISB2 TRISBbits.TRISB2
#define TRISC3 TRISCbits.TRISC3
#define TX9 TXSTAbits.TX9
#define TXEN TXSTAbits.TXEN
#define TXIE PIE1bits.TXIE
#define TXIF PIR1bits.TXIF
#define Z STATUSbits.Z
#define LATA0 LATAbits.LATA0
#define LATA1 LATAbits.LATA1
#define LATA2 LATAbits.LATA2
#define LATA3 LATAbits.LATA3
#define LATA4 LATAbits.LATA4
#define LATA5 LATAbits.LATA5
#define LATA6 LATAbits.LATA6
#define LATA7 LATAbits.LATA7
#define TRISA0 TRISAbits.TRISA0
#define TRISA1 TRISAbits.TRISA1
#define TRISA2 TRISAbits.TRISA2
#define TRISA3 TRISAbits.TRISA3
#define TRISA4 TRISAbits.TRISA4
#define TRISA5 TRISAbits.TRISA5
#define TRISA6 TRISAbits.TRISA6
#define TRISA7 TRISAbits.TRISA7
#define TRISB0 TRISBbits.TRISB0
#define TRISB1 TRISBbits.TRISB1
#define TRISB2 TRISBbits.TRISB2
#define TRISB3 TRISBbits.TRISB3
#define TRISB4 TRISBbits.TRISB4
#define TRISB5 TRISBbits.TRISB5
#define TRISB6 TRISBbits.TRISB6
#define TRISB7 TRISBbits.TRISB7
#define TRISC0 TRISCbits.TRISC0
#define TRISC1 TRISCbits.TRISC1
#define TRISC2 TRISCbits.TRISC2
#define TRISC3 TRISCbits.TRISC3
#define TRISC4 TRISCbits.TRISC4
#define TRISC5 TRISCbits.TRISC5
#define TRISC6 TRISCbits.TRISC6
#define TRISC7 TRISCbits.TRISC7
#define FERR RCSTAbits.FERR
#define LATB0 LATBbits.LATB0
#define LATB1 LATBbits.LATB1
#define LATB2 LATBbits.LATB2
#define LATB3 LATBbits.LATB3
#define LATB4 LATBbits.LATB4
#define LATB5 LATBbits.LATB5
#define LATB6 LATBbits.LATB6
#define LATB7 LATBbits.LATB7
#define LATC0 LATCbits.LATC0
#define LATC1 LATCbits.LATC1
#define LATC2 LATCbits.LATC2
#define LATC3 LATCbits.LATC3
#define LATC4 LATCbits.LATC4
#define LATC5 LATCbits.LATC5
#define LATC6 LATCbits.LATC6
#define LATC7 LATCbits.LATC7
#define RA0 PORTAbits.RA0
#define RA1 PORTAbits.RA1
#define RA2 PORTAbits.RA2
#define RA3 PORTAbits.RA3
#define RA4 PORTAbits.RA4
#define RA5 PORTAbits.RA5
#define RA6 PORTAbits.RA6
#define RA7 PORTAbits.RA7

#define RB0 PORTBbits.RB0
#define RB1 PORTBbits.RB1
#define RB2 PORTBbits.RB2
#define RB3 PORTBbits.RB3
#define RB4 PORTBbits.RB4
#define RB5 PORTBbits.RB5
#define RB6 PORTBbits.RB6
#define RB7 PORTBbits.RB7

#if defined(__XC) || defined(__SDCC)
#define RC0 PORTCbits.RC0
#define RC1 PORTCbits.RC1
#define RC2 PORTCbits.RC2
#define RC3 PORTCbits.RC3
#define RC4 PORTCbits.RC4
#define RC5 PORTCbits.RC5
#define RC6 PORTCbits.RC6
#define RC7 PORTCbits.RC7
#endif

#endif

/*#ifdef __18f2550
#define T0PS0 T1CKPS0
#define T0PS1 T1CKPS1
#define T0PS2 T1CKPS2
#endif
*/
#ifdef PIC18
#define INTF INT0F
#define INTE INT0E
#define PS0 T0PS0
#define PS1 T0PS1
#define PS2 T0PS2
#define T0PS T0CONbits.T0PS
#define T08BIT T0CONbits.T08BIT
#define PSA T0CONbits.PSA
#define TMR0ON T0CONbits.TMR0ON
//#define T1CS
#define INTEDG INTEDG0
#ifndef CM
#define CM CMCONbits.CM
#endif
#define SSPCONbits SSPCON1bits

#define OUTA LATA
#define OUTB LATB
#define OUTC LATC
//
#define OUTA0 LATA0
#define OUTA1 LATA1
#define OUTA2 LATA2
#define OUTA3 LATA3
#define OUTA4 LATA4
#define OUTA5 LATA5
#define OUTB0 LATB0
#define OUTB1 LATB1
#define OUTB2 LATB2
#define OUTB3 LATB3
#define OUTB4 LATB4
#define OUTB5 LATB5
#define OUTB6 LATB6
#define OUTB7 LATB7
#define OUTC0 LATC0
#define OUTC1 LATC1
#define OUTC2 LATC2
#define OUTC3 LATC3
#define OUTC4 LATC4
#define OUTC5 LATC5
#define OUTC6 LATC6
#define OUTC7 LATC7

#else
#define T0PS OPTION_REGbits.PS
#define OUTA PORTA
#define OUTB PORTB
#define OUTC PORTC

#define OUTA0 RA0
#define OUTA1 RA1
#define OUTA2 RA2
#define OUTA3 RA3
#define OUTA4 RA4
#define OUTA5 RA5
#define OUTB0 RB0
#define OUTB1 RB1
#define OUTB2 RB2
#define OUTB3 RB3
#define OUTB4 RB4
#define OUTB5 RB5
#define OUTB6 RB6
#define OUTB7 RB7
#define OUTC0 RC0
#define OUTC1 RC1
#define OUTC2 RC2
#define OUTC3 RC3
#define OUTC4 RC4
#define OUTC5 RC5
#define OUTC6 RC6
#define OUTC7 RC7
#endif

#if defined(__SDCC) || defined(__SDCC)
#ifndef acos
#define acos acosf
#endif /* defined(acos) */
#ifndef asin
#define asin asinf
#endif /* defined(asin) */
#ifndef atan
#define atan atanf
#endif /* defined(atan) */
#ifndef atan2
#define atan2 atan2f
#endif /* defined(atan2) */
#ifndef ceil
#define ceil ceilf
#endif /* defined(ceil) */
#ifndef cos
#define cos cosf
#endif /* defined(cos) */
#ifndef cosh
#define cosh coshf
#endif /* defined(cosh) */
#ifndef exp
#define exp expf
#endif /* defined(exp) */
#ifndef fabs
#define fabs fabsf
#endif /* defined(fabs) */
#ifndef floor
#define floor floorf
#endif /* defined(floor) */
#ifndef frexp
#define frexp frexpf
#endif /* defined(frexp) */
#ifndef ldexp
#define ldexp ldexpf
#endif /* defined(ldexp) */
#ifndef log
#define log logf
#endif /* defined(log) */
#ifndef log10
#define log10 log10f
#endif /* defined(log10) */
#ifndef modf
#define modf modff
#endif /* defined(modf) */
#ifndef pow
#define pow powf
#endif /* defined(pow) */
#ifndef sin
#define sin sinf
#endif /* defined(sin) */
#ifndef sinh
#define sinh sinhf
#endif /* defined(sinh) */
#ifndef sqrt
#define sqrt sqrtf
#endif /* defined(sqrt) */
#ifndef tan
#define tan tanf
#endif /* defined(tan) */
#ifndef tanh
#define tanh tanhf
#endif /* defined(tanh) */

#include <float.h>

#ifndef DBL_DIG
#define DBL_DIG FLT_DIG
#endif /* defined(DBL_DIG) */
#ifndef DBL_EPSILON
#define DBL_EPSILON FLT_EPSILON
#endif /* defined(DBL_EPSILON) */
#ifndef DBL_MANT_DIG
#define DBL_MANT_DIG FLT_MANT_DIG
#endif /* defined(DBL_MANT_DIG) */
#ifndef DBL_MAX
#define DBL_MAX FLT_MAX
#endif /* defined(DBL_MAX) */
#ifndef DBL_MAX_10_EXP
#define DBL_MAX_10_EXP FLT_MAX_10_EXP
#endif /* defined(DBL_MAX_10_EXP) */
#ifndef DBL_MAX_EXP
#define DBL_MAX_EXP FLT_MAX_EXP
#endif /* defined(DBL_MAX_EXP) */
#ifndef DBL_MIN
#define DBL_MIN FLT_MIN
#endif /* defined(DBL_MIN) */
#ifndef DBL_MIN_10_EXP
#define DBL_MIN_10_EXP FLT_MIN_10_EXP
#endif /* defined(DBL_MIN_10_EXP) */
#ifndef DBL_MIN_EXP
#define DBL_MIN_EXP FLT_MIN_EXP
#endif /* defined(DBL_MIN_EXP) */
#ifndef DBL_RADIX
#define DBL_RADIX FLT_RADIX
#endif /* defined(DBL_RADIX) */
#ifndef DBL_ROUNDS
#define DBL_ROUNDS FLT_ROUNDS
#endif /* defined(DBL_ROUNDS) */
#endif

//#define T1CONbits T1CON_bits

#ifndef __XC
#if(_HTC_VER_MINOR_ > 0 && _HTC_VER_MINOR_ < 80)
#ifndef OPTION_REG
#define OPTION_REG OPTION
#endif
#endif
#endif

#if defined(__18f2550) || defined(__18f25k22) || defined(__18f25k50)
#define PIC18_USB 1
#endif

#if defined(__SDCC) || defined(__SDCC)

#if defined(__18f25k22) // || defined(__18f25k50)
#define SPEN SPEN1

#define TXEN TXEN1
#define CREN CREN1
#define RX9D RX9D1
#define BRGH BRGH1
#define RX9 RX91
#define TX9 TX91
#define OERR OERR1
#define SYNC SYNC1

//#define SSPEN SSPEN1
#endif

#ifndef GIE
#define GIE INTCONbits.GIE
#endif // defined(GIE)
#ifndef PEIE
#define PEIE INTCONbits.PEIE
#endif // defined(PEIE)
#ifndef RCIF
#define RCIF PIR1bits.RCIF
#endif // defined(RCIF)
#ifndef TXIF
#define TXIF PIR1bits.TXIF
#endif // defined(TXIF)
#ifndef RCIE
#define RCIE PIE1bits.RCIE
#endif // defined(RCIE)
#ifndef TXIE
#define TXIE PIE1bits.TXIE
#endif // defined(TXIE)
#ifndef RCEN
#define RCEN RCSTAbits.RCEN
#endif // defined(RCEN)
#ifndef RX9
#define RX9 RCSTAbits.RX9
#endif // defined(RX9)
#ifndef OERR
#define OERR RCSTAbits.OERR
#endif // defined(OERR)
#ifndef CREN
#define CREN RCSTAbits.CREN
#endif // defined(CREN)
#ifndef SPEN
#define SPEN RCSTAbits.SPEN
#endif // defined(SPEN)
#ifndef TXEN
#define TXEN TXSTAbits.TXEN
#endif // defined(TXEN)
#ifndef TX9
#define TX9 TXSTAbits.TX9
#endif // defined(TX9)
#ifndef BRGH
#define BRGH TXSTAbits.BRGH
#endif // defined(BRGH)
#ifndef SYNC
#define SYNC TXSTAbits.SYNC
#endif // defined(SYNC)

#endif

#if defined(__SDCC) && defined(PIC16)

#ifndef _CONFIG
#define _CONFIG 0x2007
#endif
__code unsigned int __at(_CONFIG) __configword = CONFIG_WORD;
#endif

#if defined(__XC)
#ifndef NOP
#define NOP() asm("nop")
#endif
#else
#ifndef NOP
#define NOP() __asm nop __endasm
#endif
#endif

#endif /* LIB_DEVICE_H */
