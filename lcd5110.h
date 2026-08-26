#ifndef PICLIB_LCD5110_H
#define PICLIB_LCD5110_H

#include "device.h"
#include "typedef.h"

// pin assignment -- override any of these from the build (e.g. a
// project's *_DEFS in build/vars.mk) to rewire without editing this file.
// RB0/RB1/RB3 are avoided by default since they have no alternate-pin
// option on some chips (e.g. 18F25K50) and are commonly needed for
// hardware SPI (see lib/spi.h) -- LCD_RESET defaults to RA3 instead of
// RB3 for that reason.
#ifndef LCD_CE
#define LCD_CE OUTB2
#endif
#ifndef LCD_CE_TRIS
#define LCD_CE_TRIS TRISB2
#endif
#ifndef LCD_RESET
#define LCD_RESET OUTA3
#endif
#ifndef LCD_RESET_TRIS
#define LCD_RESET_TRIS TRISA3
#endif
#ifndef LCD_DC
#define LCD_DC OUTB4
#endif
#ifndef LCD_DC_TRIS
#define LCD_DC_TRIS TRISB4
#endif

// the clock/data lines are lib/spi.h's SPI_CLK/SPI_MOSI -- spi_init()
// (called from lcd_init()) sets their TRIS bits, not this macro

// each bit is set individually -- if LCD_CE/RESET/DC are overridden to a
// non-default pin, override the matching *_TRIS macro too (they're
// independent so the whole port isn't forced to output)
#define LCD_TRIS()                                                                                                     \
  LCD_CE_TRIS = 0;                                                                                                     \
  LCD_DC_TRIS = 0;                                                                                                     \
  LCD_RESET_TRIS = 0

#define LCD_TCMD 0
#define LCD_TDATA 1

uint8_t lcd_str_width(const char* c);
void lcd_send(uint8_t a, uint8_t cmd);
void lcd_init(void);
void lcd_test(void);
void lcd_clear(void);
void lcd_gotoxy(uint8_t x, unsigned y);
void lcd_putch(char c);
void lcd_puts(const char* s);
void lcd_puts2(char* s);
void lcd_clear_line(uint8_t y);
void lcd_center_puts(uint8_t y, const char* c);
void lcd_center_puts2(uint8_t y, char* c, uint8_t len);

void lcd_battery(uint8_t chg);
// void lcd_bluetooth(void);

// first element array is the length
void lcd_symbol(const char* sym);

// void  print_digit(uint8_t line, uint8_t column, uint8_t digit);

#endif
