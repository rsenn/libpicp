#include "device.h"
#undef EEDATA
#define EEDATA EE_DAT

#if PIC18
extern volatile unsigned char EE_DAT @0xFA8;
#elif defined(__16f628a)
extern volatile unsigned char EE_DAT @0x09a;
#else
extern volatile unsigned char EE_DAT @0x10C;
#endif

unsigned char
ee_read(unsigned char addr) {
  EEADR = addr;
  EEPGD = 0;
#if PIC18
  CFGS = 0;
#endif
  RD = 1;

  return EEDATA;
}

void
ee_write(unsigned char addr, unsigned char data) {
  EEADR = addr;
  EEDATA = data;
#if PIC18
  CFGS = 0;
#endif
  EEPGD = 0;
  WREN = 1;
  GIE = 0;
  EECON2 = 0x55;
  EECON2 = 0xaa;
  WR = 1;
  GIE = 1;
  while(WR)
    ;
  WREN = 0;
}

#if USE_EEPROM
unsigned char
Read_b_eep(unsigned int badd) {
  EEADR = (badd & 0x0ff);
#if PIC18
  CFGS = 0;
#endif
  EEPGD = 0;
  RD = 1;
  Nop();         // Nop may be required for latency at high frequencies
  Nop();         // Nop may be required for latency at high frequencies
  return EEDATA; // return with read byte
}

void
Write_b_eep(unsigned int badd, unsigned char bdata) {
  EEADR = (badd & 0x0ff);
  EE_DAT = bdata;
  EEPGD = 0;
#if PIC18
  CFGS = 0;
#endif
  WREN = 1;
  GIE = 0;
  EECON2 = 0x55;
  EECON2 = 0xAA;
  WR = 1;
  while(WR)
    ;
  GIE = 1;
  WREN = 0;
}
#endif
