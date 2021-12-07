/**
 * PCD8544 Constants
 * Source code written in MikroC language (v5.61 2012)
 *
 * @link http://www.EngMHatab.com
 * @author Mohammed Abu-Hatab
 * @package mhatab
 * @version 1.0
 * @copyright 2017
 */

#ifndef __PCD8544_H__
#define __PCD8544_H__

// for nokia display configrations
#define DISPLAY_BLANK 0x08       // mod control blank change (all off)
#define DISPLAY_SEGMENTS_ON 0x09 // function set (H = 0) display control Y address X address
#define DISPLAY_NORMAL_MODE 0x0c
#define DISPLAY_INVERSE_MODE 0x0d

#define CHIP_ACTIVE 0x21       // set chip is active , set horizontal addressing, set extended instruction set
#define BIAS_SYSTEM 0x13       // set Bias System (BSx)
#define VOLTAGE_OPERATION 0xa0 // set VOP (voltage operation )

// for nokia write configrations
#define WRITE_HORIZONTAL_MODE 0x20 //  write from left to right , X-axis are incremented automatically
#define WRITE_VERTICAL_MODE 0x22   //  write from up to down    , Y-axis are incremented automatically

#define Y_ADDRESS 0x40
#define X_ADDRESS 0x80

#define LCD_CSE LATB2
#define LCD_RES LATB3
#define LCD_DC LATB4
#define LCD_SDIN LATB5
#define LCD_SCLK LATB6

#define LCD_TRIS() TRISB &= ~0b01111100

void lcd_write_byte(char);
void lcd_cmd(char);
void lcd_data(char);
void lcd_gotoxy(char x, char y);
void lcd_putch(char);
void lcd_puts(const char* message);
void lcd_out_unsigned_int(unsigned int num);
void lcd_out_int(int num);
void lcd_image(const char* img);
void lcd_flash(char flash_number);
void lcd_clear(void);
void lcd_clear_line(char temp_row);
void lcd_init(void);

#endif /* __PCD8544_H__ */
