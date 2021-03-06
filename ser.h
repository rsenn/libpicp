#ifndef PICLIB_SER_H_
#define PICLIB_SER_H_

#if USE_SER

#include "typedef.h"

#ifdef __12f1840
#define SER_TX_PIN OUTA0
#define SER_TX_TRIS TRISA0
#define SER_RX_PIN OUTA1
#define SER_RX_TRIS TRISA1
#elif defined(__16f628a)
#define SER_TX_PIN OUTB2
#define SER_TX_TRIS TRISB2
#define SER_RX_PIN OUTB1
#define SER_RX_TRIS TRISB1
#else
#define SER_TX_PIN OUTC6
#define SER_TX_TRIS() TRISC &= ~0x40
#define SER_RX_PIN OUTC7
#define SER_RX_TRIS() TRISC |= 0x80
#endif

/* Valid buffer size value are only power of 2 (ex: 2,4,..,64,128) */
#define SER_BUFFER_SIZE (uint8_t)16

#define SER_FIFO_MASK (SER_BUFFER_SIZE - 1)

/* Insert this macro inside the interrupt routine */
#define ser_int()                                                                                                      \
  if(RCIF) {                                                                                                           \
    ser_rxfifo[ser_rxiptr] = RCREG;                                                                                    \
    ser_tmp = (ser_rxiptr + 1) & SER_FIFO_MASK;                                                                        \
    if(ser_tmp != ser_rxoptr)                                                                                          \
      ser_rxiptr = ser_tmp;                                                                                            \
  };                                                                                                                   \
  if(TXIF && TXIE) {                                                                                                   \
    TXREG = ser_txfifo[ser_txoptr];                                                                                    \
    ++ser_txoptr;                                                                                                      \
    ser_txoptr &= SER_FIFO_MASK;                                                                                       \
    if(ser_txoptr == ser_txiptr) {                                                                                     \
      TXIE = 0;                                                                                                        \
    };                                                                                                                 \
    TXIF = 0;                                                                                                          \
  }

extern uint8_t ser_rxfifo[SER_BUFFER_SIZE];
extern volatile uint8_t ser_rxiptr, ser_rxoptr;
extern uint8_t ser_txfifo[SER_BUFFER_SIZE];
extern volatile uint8_t ser_txiptr, ser_txoptr;
extern uint8_t ser_tmp;

char ser_isrx(void);
unsigned char ser_rxsize(void);
uint8_t ser_getch(void);
void ser_putch(char byte);
void ser_put(const char* s, unsigned n);
void ser_puts(const char* s);
void ser_puts2(uint8_t* s);
void ser_puthex(uint8_t v);
void ser_init(void);

uint8_t ser_rxat(unsigned char at);
unsigned char ser_size(void);

#if 1 // ndef _SER_C_
extern uint8_t ser_rxfifo[SER_BUFFER_SIZE];
extern volatile uint8_t ser_rxiptr, ser_rxoptr;
extern /*bank1*/ uint8_t ser_txfifo[SER_BUFFER_SIZE];
extern volatile uint8_t ser_txiptr, ser_txoptr;
extern uint8_t ser_tmp;
#endif
extern uint8_t ser_brg;
#endif

#endif
