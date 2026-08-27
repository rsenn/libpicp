#ifndef PICLIB_LCD5110_H
#define PICLIB_LCD5110_H

#include "device.h"
#include "typedef.h"

// pin assignment (chip-select/data-command/reset) and the SPI bus pins
// are now owned by lib/pcd8544.h/lib/spi.h -- override PCD8544_CE/DC/
// RESET or SPI_CLK/MOSI/MISO from there if rewiring.

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
