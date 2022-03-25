/*
  MCP3001 driver library
84x48 lcd display PCD8544
by Regulus Berdin
V1.0 11/23/04   Created.
*/

#include "mcp3001.h"

#if USE_MCP3001
#define MCP3001_NOP() __delay_us(50)

#define CLK_OUT() ((MCP3001_CLK = 1), (MCP3001_NOP()), (MCP3001_CLK = 0), (MCP3001_NOP()), (MCP3001_DIN));

// -------------------------------------------------------------------------
void
mcp3001_init(void) {
  MCP3001_TRIS();
  MCP3001_SS = 1;
  __delay_ms(20);
}

// -------------------------------------------------------------------------
void
mcp3001_start(void) {
  MCP3001_CLK = 0;
  MCP3001_NOP();
  MCP3001_SS = 0;
  MCP3001_NOP();

  // clock 1: start
  CLK_OUT();
}

// -------------------------------------------------------------------------
char
mcp3001_stop(void) {
  return CLK_OUT();
}

// -------------------------------------------------------------------------
int16_t
mcp3001_read(void) {
  char i, sign, b;
  int16_t val = 0;
  sign = CLK_OUT();
  for(i = 12; i >= 0; --i) {
    b = CLK_OUT();

    val |= b ? (1 << i) : 0;
  }
  return val;
}

#endif // USE_MCP3001
