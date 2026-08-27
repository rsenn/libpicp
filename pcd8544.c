#include "pcd8544.h"
#include "delay.h"
#include "spi.h"

void
pcd8544_init(void) {
  PCD8544_CE_TRIS = 0;
  PCD8544_DC_TRIS = 0;
  PCD8544_RESET_TRIS = 0;

  spi_init();

  PCD8544_CE = 1;
  PCD8544_DC = 0;

  pcd8544_reset();
}

void
pcd8544_reset(void) {
  PCD8544_RESET = 0;
  __delay_ms(20);
  PCD8544_RESET = 1;
  __delay_ms(20);
}

void
pcd8544_command(uint8_t byte) {
  PCD8544_DC = 0;
  PCD8544_CE = 0;
  spi_transfer(byte);
  PCD8544_CE = 1;
}

void
pcd8544_data(uint8_t byte) {
  PCD8544_DC = 1;
  PCD8544_CE = 0;
  spi_transfer(byte);
  PCD8544_CE = 1;
}

void
pcd8544_nop(void) {
  pcd8544_command(0x00);
}

void
pcd8544_function_set(uint8_t pd, uint8_t v, uint8_t h) {
  pcd8544_command(0x20 | ((!!pd) << 2) | ((!!v) << 1) | (!!h));
}

void
pcd8544_set_display_mode(uint8_t mode) {
  pcd8544_command(mode);
}

void
pcd8544_set_y(uint8_t y) {
  pcd8544_command(0x40 | (y & 0x07));
}

void
pcd8544_set_x(uint8_t x) {
  pcd8544_command(0x80 | (x & 0x7F));
}

void
pcd8544_set_temp_coeff(uint8_t tc) {
  pcd8544_command(0x04 | (tc & 0x03));
}

void
pcd8544_set_bias(uint8_t bs) {
  pcd8544_command(0x10 | (bs & 0x07));
}

void
pcd8544_set_vop(uint8_t vop) {
  pcd8544_command(0x80 | (vop & 0x7F));
}
