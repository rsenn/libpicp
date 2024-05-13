#ifdef USE_SER

#define _SER_C_
#include "device.h"
#include "oscillator.h"
#include "ser.h"
#include "const.h"
#include "interrupt.h"

#ifndef SER_BAUD
#define SER_BAUD 38400
#endif

#define HIGH_SPEED 1

#ifndef SER_BRG
#if HIGH_SPEED == 1
#define SER_BRG ((uint16_t)((double)(_XTAL_FREQ) / (16 * (double)(SER_BAUD))) - 1)
#else
#define SER_BRG ((uint16_t)((double)(_XTAL_FREQ) / (64 * (double)(SER_BAUD))) - 1)
#endif
#endif

uint8_t ser_brg = SER_BRG;

uint8_t ser_rxfifo[SER_BUFFER_SIZE];
volatile uint8_t ser_rxiptr, ser_rxoptr;
uint8_t ser_txfifo[SER_BUFFER_SIZE];
volatile uint8_t ser_txiptr, ser_txoptr;
uint8_t ser_tmp;

char
ser_isrx(void) {
  if(OERR) {
    CREN = 0;
    CREN = 1;
    return 0;
  }
  return (ser_rxiptr != ser_rxoptr);
}

unsigned char
ser_rxsize(void) {
  unsigned char ret;
  INTERRUPT_DISABLE();
  ret = ser_rxiptr < ser_rxoptr ? SER_BUFFER_SIZE - ser_rxiptr + ser_rxoptr : ser_rxiptr - ser_rxoptr;
  INTERRUPT_ENABLE();
  return ret;
}

unsigned char
ser_txsize(void) {
  unsigned char ret;
  INTERRUPT_DISABLE();
  ret = ser_txiptr < ser_txoptr ? SER_BUFFER_SIZE - ser_txiptr + ser_txoptr : ser_txiptr - ser_txoptr;
  INTERRUPT_ENABLE();
  return ret;
}

uint8_t
ser_rxat(unsigned char at) {
  return ser_rxfifo[at & SER_FIFO_MASK];
}

uint8_t
ser_getch(void) {
  uint8_t c;

  while(ser_isrx() == 0) continue;

  GIE = 0;
  c = ser_rxfifo[ser_rxoptr];
  ++ser_rxoptr;
  ser_rxoptr &= SER_FIFO_MASK;
  GIE = 1;
  return c;
}

void
ser_putch(char c) {
  while(((ser_txiptr + 1) & SER_FIFO_MASK) == ser_txoptr) continue;
  GIE = 0;
  ser_txfifo[ser_txiptr] = c;
  ser_txiptr = (ser_txiptr + 1) & SER_FIFO_MASK;
  TXIE = 1;
  GIE = 1;
}

void
ser_puts(const char* s) {
  while(*s) ser_putch(*s++);
}
void
ser_put(const char* s, unsigned n) {
  while(n--) ser_putch(*s++);
}

void
ser_puts2(uint8_t* s) {
  while(*s) ser_putch(*s++);
}

void
ser_puthex(uint8_t v) {
  uint8_t c;

  c = v >> 4;
  if(c > 9) {
    ser_putch((char)('A' - 10 + c));
  } else {
    ser_putch((char)('0' + c));
  }

  c = v & 0x0F;
  if(c > 9) {
    ser_putch((char)('A' - 10 + c));
  } else {
    ser_putch((char)('0' + c));
  }
}

void
ser_init(void) {
  SER_TX_TRIS();
  // SER_TX_PIN = LOW;
  SER_RX_TRIS();

  BRGH = HIGH_SPEED; // high speed
  //	SPBRG=25;				//9,600 @ 4MHz, SPBRG = (4MHz/(16*BAUD_RATE))-1;
  //	SPBRG=12;				//19.2K @ 4MHz, SPBRG = (4MHz/(16*BAUD_RATE))-1;
  //  SPBRG=31;       //38.4K @ 20MHz, SPBRG = (20MHz/(16*BAUD_RATE))-1;
  //  SPBRG=39;       //31.25K @ 20MHz, SPBRG = (20MHz/(16*BAUD_RATE))-1;
  //	SPBRG=64;				//19.2K @ 20MHz, SPBRG = (20MHz/(16*BAUD_RATE))-1;
  SPBRG = ser_brg; // 56.7K @ 20MHz, SPBRG = (20MHz/(16*BAUD_RATE))-1;
  //	SPBRG=10;				//115.2K @ 20MHz, SPBRG = (20MHz/(16*BAUD_RATE))-1;

  TX9 = 0; // 8 bits
  RX9 = 0; //

  SYNC = 0; // uart settings
  SPEN = 1;
  CREN = 1;
  TXIE = 0;
  RCIE = 1;
  TXEN = 1;
  PEIE = 1;

  ser_rxiptr = ser_rxoptr = ser_txiptr = ser_txoptr = 0;
}

#endif // USE_SER
