#ifndef PICLIB_MCP3001_H
#define PICLIB_MCP3001_H

#if USE__MCP3001

#include "device.h"
#include "typedef.h"



#define MCP3001_SS LATB4
#define MCP3001_DIN RB5
#define MCP3001_CLK LATB6
#define MCP3001_TRIS() TRISB = (TRISB & (~0b1010000))  | 0b0100000

/*uint8_t mcp3001_str_width(const char* c);
void mcp3001_send(uint8_t a, uint8_t cmd);
void mcp3001_init(void);
void mcp3001_test(void);
void mcp3001_clear(void);
void mcp3001_gotoxy(uint8_t x, unsigned y);
void mcp3001_putch(char c);
void mcp3001_puts(const char* s);
void mcp3001_puts2(char* s);
void mcp3001_clear_line(uint8_t y);
void mcp3001_center_puts(uint8_t y, const char* c);
void mcp3001_center_puts2(uint8_t y, char* c, uint8_t len);

void mcp3001_battery(uint8_t chg);
// void mcp3001_bluetooth(void);

// first element array is the length
void mcp3001_symbol(const char* sym);
*/
// void  print_digit(uint8_t line, uint8_t column, uint8_t digit);
#endif

#endif
