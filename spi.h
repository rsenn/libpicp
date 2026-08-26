#ifndef PICLIB_SPI_H
#define PICLIB_SPI_H 1

#include "typedef.h"
#include "device.h"

// SPI_USE_HW selects the hardware MSSP backend; undefined (default)
// means software bit-banged SPI, which works on every chip. Falls back
// to software with a warning if requested on a chip this module doesn't
// have a hardware backend for yet. Two chips are deliberately left out,
// both confirmed (not assumed) via their real SDCC device headers:
// - PIC12F1840: its header exposes the MSSP peripheral only under
//   SSP1xxx names (no SSPBUF/SSPCON1/SSPSTAT aliases), which
//   lib/device.h doesn't normalize yet.
// - PIC18F2550: its TRISC/PORTC bitfield struct leaves bits 3-5
//   unnamed placeholders (those pins are USB D+/D- and a reserved bit
//   on this chip) -- it does not expose MSSP on RC3/RC4/RC5 the way
//   PIC18F252 does, and this module doesn't yet know its real SPI pins.
// Add the missing device.h plumbing / verified pin defaults before
// enabling either here.
#ifdef SPI_USE_HW
#if !(defined(__18f25k50) || defined(__18f252) || defined(__16f876a))
#warning "SPI_USE_HW requested on an unsupported chip -- falling back to software SPI"
#undef SPI_USE_HW
#endif
#endif

// pin assignment -- override any of these from the build (e.g. a
// project's *_DEFS in build/vars.mk) to rewire without editing this
// file. SPI_CLK/SPI_MOSI/SPI_MISO (the plain GPIO macros) are only used
// by the software backend; SPI_*_TRIS are used by both backends to set
// data direction. The SPI_USE_HW defaults below are each chip's fixed
// MSSP pin assignment -- PIC18F25K50's SDO is further redirected to RB3
// by the SDOMX=RB3 config bit already set in src/config-18f25k50.h.
#ifdef SPI_USE_HW

#if defined(__18f25k50)
#ifndef SPI_CLK_TRIS
#define SPI_CLK_TRIS TRISB1
#endif
#ifndef SPI_MOSI_TRIS
#define SPI_MOSI_TRIS TRISB3
#endif
#ifndef SPI_MISO_TRIS
#define SPI_MISO_TRIS TRISB0
#endif
#elif defined(__18f252) || defined(__16f876a)
#ifndef SPI_CLK_TRIS
#define SPI_CLK_TRIS TRISC3
#endif
#ifndef SPI_MOSI_TRIS
#define SPI_MOSI_TRIS TRISC5
#endif
#ifndef SPI_MISO_TRIS
#define SPI_MISO_TRIS TRISC4
#endif
#endif

#else /* !SPI_USE_HW -- software backend, arbitrary GPIO */

#ifndef SPI_CLK
#define SPI_CLK OUTB6
#endif
#ifndef SPI_CLK_TRIS
#define SPI_CLK_TRIS TRISB6
#endif
#ifndef SPI_MOSI
#define SPI_MOSI OUTB5
#endif
#ifndef SPI_MOSI_TRIS
#define SPI_MOSI_TRIS TRISB5
#endif
#ifndef SPI_MISO
#define SPI_MISO OUTB0
#endif
#ifndef SPI_MISO_TRIS
#define SPI_MISO_TRIS TRISB0
#endif

#endif /* SPI_USE_HW */

// Mode 0 only (CPOL=0/CPHA=0, MSB first) -- the only mode any current
// consumer (lib/lcd5110.c) needs.
void spi_init(void);
uint8_t spi_transfer(uint8_t data);

#endif // PICLIB_SPI_H
