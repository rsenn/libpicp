unsigned char
ee_read(unsigned char addr) {
  EEADRL = addr;
  EEPGD = 0;
  CFGS = 0;
  RD = 1;

  return EEDATL;
}

void
ee_write(unsigned char addr, unsigned char data) {
  EEADRL = addr;
  EEDATL = data;
  CFGS = 0;
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
