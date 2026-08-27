#ifndef PICLIB_PCD8544_H
#define PICLIB_PCD8544_H 1

#include "typedef.h"
#include "device.h"

// pin assignment -- override any of these from the build (e.g. a
// project's *_DEFS in build/vars.mk) to rewire without editing this
// file. These are the PCD8544 chip's own control pins (chip enable,
// data/command select, reset) -- distinct from the SPI bus pins in
// lib/spi.h, which this module owns/configures via spi_init().
#ifndef PCD8544_CE
#define PCD8544_CE OUTB2
#endif
#ifndef PCD8544_CE_TRIS
#define PCD8544_CE_TRIS TRISB2
#endif
#ifndef PCD8544_RESET
#define PCD8544_RESET OUTA3
#endif
#ifndef PCD8544_RESET_TRIS
#define PCD8544_RESET_TRIS TRISA3
#endif
#ifndef PCD8544_DC
#define PCD8544_DC OUTB4
#endif
#ifndef PCD8544_DC_TRIS
#define PCD8544_DC_TRIS TRISB4
#endif

// 'display control' instruction values (datasheet Table 1/2) -- D/E bit
// combinations, byte = 0x08 | D<<2 | E
#define PCD8544_DISPLAY_BLANK 0x08
#define PCD8544_DISPLAY_NORMAL 0x0C
#define PCD8544_DISPLAY_ALL_ON 0x09
#define PCD8544_DISPLAY_INVERSE 0x0D

// X (column) range: 0-83. Y (bank) range: 0-5, each bank is 8 rows tall
// (48 total). Not enforced here -- same "trust the caller" convention
// lcd5110.c's lcd_gotoxy() already used.

// One-time setup: configures the CE/DC/RESET pins, calls spi_init(),
// and applies the mandatory post-power-on reset pulse (datasheet
// §8.1/8.2). Leaves the chip in its documented post-reset state:
// power-down, blank, basic instruction set, horizontal addressing,
// X=Y=0. Does NOT pick VOP/bias/temperature-coefficient/display-mode --
// those are panel-specific tuning values owned by the caller (e.g.
// lib/lcd5110.c's lcd_init()), not by this generic chip driver.
void pcd8544_init(void);

// Just the RES pulse (§8.1/8.2 timing) -- pcd8544_init() already calls
// this once; exposed separately in case a caller needs to re-reset
// without redoing pin/spi_init() setup.
void pcd8544_reset(void);

// Low-level command/data framing -- D/C select + CE-bracketed
// spi_transfer(). Every instruction function below is built on these.
void pcd8544_command(uint8_t byte);
void pcd8544_data(uint8_t byte);

// Full instruction set (datasheet Table 1, §8) -----------------------

void pcd8544_nop(void);

// PD: 0=active, 1=power-down. V: 0=horizontal addressing, 1=vertical.
// H: 0=basic instruction set, 1=extended -- selects how subsequent
// command bytes are interpreted until the next function-set call.
void pcd8544_function_set(uint8_t pd, uint8_t v, uint8_t h);

// basic instruction set (H=0) only:
void pcd8544_set_display_mode(uint8_t mode); // one of PCD8544_DISPLAY_*
void pcd8544_set_y(uint8_t y);               // 0-5
void pcd8544_set_x(uint8_t x);               // 0-83

// extended instruction set (H=1) only:
void pcd8544_set_temp_coeff(uint8_t tc); // 0-3
void pcd8544_set_bias(uint8_t bs);       // 0-7
void pcd8544_set_vop(uint8_t vop);       // 0-127

#endif // PICLIB_PCD8544_H
