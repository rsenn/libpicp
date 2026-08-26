#include "spi.h"
#include "const.h"

#ifndef SPI_USE_HW

// -------------------------------------------------------------------------
// software (bit-banged) backend -- Mode 0 timing (MSB first, clock
// idles low, data set up before the rising edge), matching what
// lib/lcd5110.c's CLK_IN macro did before this module existed. Default
// pins (lib/spi.h) assume a PORTB-having chip; override SPI_CLK/
// SPI_MOSI/SPI_MISO (and their _TRIS macros) from a project's *_DEFS on
// chips without one (e.g. PIC12F1840).

void
spi_init(void) {
  SPI_CLK_TRIS = OUTPUT;
  SPI_MOSI_TRIS = OUTPUT;
  SPI_MISO_TRIS = INPUT;
  SPI_CLK = 0;
}

uint8_t
spi_transfer(uint8_t data) {
  uint8_t i, result = 0;

  for(i = 0; i < 8; i++) {
    NOP();
    SPI_CLK = 0;
    NOP();
    SPI_MOSI = !!(data & 0x80);
    data <<= 1;
    NOP();
    SPI_CLK = 1;
    result = (result << 1) | SPI_MISO;
  }

  return result;
}

#else /* SPI_USE_HW */

// -------------------------------------------------------------------------
// hardware backend -- drives the chip's MSSP peripheral in SPI master
// mode, Mode 0 (SSPM<3:0>=0000, clock = Fosc/4, CKP/CKE/SMP=0). Per-chip pin
// defaults below are each chip's standard/fixed MSSP pin assignment
// (PIC18F25K50's SDO default is further redirected to RB3 by the
// SDOMX=RB3 config bit already set in src/config-18f25k50.h, matching
// this module's own SPI_MOSI default) -- override SPI_CLK/SPI_MOSI/
// SPI_MISO_TRIS from a project's *_DEFS if a design routes them
// differently.

void
spi_init(void) {
  SPI_CLK_TRIS = OUTPUT;
  SPI_MOSI_TRIS = OUTPUT;
  SPI_MISO_TRIS = INPUT;

  SSPCON1 = 0x00;
  CKE = 0;
  SMP = 0;
  CKP = 0;
  SSPM3 = 0; // master, clock = Fosc/4
  SSPM2 = 0;
  SSPM1 = 0;
  SSPM0 = 0;
  SSPEN = 1;
}

uint8_t
spi_transfer(uint8_t data) {
  SSPBUF = data;
  while(!BF)
    ;
  return SSPBUF;
}

#endif /* SPI_USE_HW */
