#ifndef PICLIB_MCP3001_H
#define PICLIB_MCP3001_H

#ifdef USE_MCP3001

#include "device.h"
#include "typedef.h"

#ifdef __18f16q41
#define MCP3001_SS LATB4
#define MCP3001_DIN PORTBbits.RB5
#define MCP3001_CLK LATB6
#define MCP3001_TRIS() TRISB = (TRISB & (~0b1010000)) | 0b0100000
#else
#define MCP3001_SS LATC2
#define MCP3001_DIN PORTCbits.RC1
#define MCP3001_CLK LATC0
#define MCP3001_TRIS() TRISB = (TRISB & (~0b1010000)) | 0b0100000
#endif

void mcp3001_init(void);
void mcp3001_start(void);
char mcp3001_stop(void);
int16_t mcp3001_read(void);

#endif

#endif
