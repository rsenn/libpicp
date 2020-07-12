#ifndef PICLIB_EEPROM_H
#define PICLIB_EEPROM_H 1

unsigned char ee_read(unsigned char addr);
void ee_write(unsigned char addr, unsigned char data);

#endif
