/**
 * Nokia 3310 LCD (PCD8544) Controller
 * Source code written in MikroC language (v5.61 2012)
 *
 * @link http://www.EngMHatab.com
 * @author Mohammed Abu-Hatab
 * @package mhatab
 * @version 1.0
 * @copyright 2017
 */

#include "device.h"
#include "pcd8544.h"

#if USE_PCD8544

// main constants
#define COMMAND_BYTE 0
#define DATA_BYTE 1
#define CHAR_WIDTH 6
#define MAX_ROWS 6
#define MAX_COLS 84
#define MAX_CHAR_INLINE 14

char delay_char = 200; // 200 ms
int temp_index;

#define lcd_goto_offset(row, col) lcd_gotoxy(col, row)

static char init_cmd[] = {CHIP_ACTIVE,
                          BIAS_SYSTEM,
                          VOLTAGE_OPERATION,
                          DISPLAY_SEGMENTS_ON,
                          DISPLAY_BLANK,
                          DISPLAY_NORMAL_MODE,
                          WRITE_HORIZONTAL_MODE};
/**
 * GLCD English Font of ASCII Characters
 * Source code written in MikroC language (v5.61 2012)
 *
 * @link http://www.EngMHatab.com
 * @author Mohammed Abu-Hatab
 * @package mhatab
 * @version 1.0
 * @copyright 2017
 */

static const unsigned char English_Font[][5] = {
    {0x00, 0x00, 0x00, 0x00, 0x00}, // sp
    {0x00, 0x00, 0x2f, 0x00, 0x00}, // !
    {0x00, 0x07, 0x00, 0x07, 0x00}, // "
    {0x14, 0x7f, 0x14, 0x7f, 0x14}, // #
    {0x24, 0x2a, 0x7f, 0x2a, 0x12}, // $
    {0xc4, 0xc8, 0x10, 0x26, 0x46}, // %
    {0x36, 0x49, 0x55, 0x22, 0x50}, // &
    {0x00, 0x05, 0x03, 0x00, 0x00}, // '
    {0x00, 0x1c, 0x22, 0x41, 0x00}, // (
    {0x00, 0x41, 0x22, 0x1c, 0x00}, // )
    {0x14, 0x08, 0x3E, 0x08, 0x14}, // *
    {0x08, 0x08, 0x3E, 0x08, 0x08}, // +
    {0x00, 0x00, 0x50, 0x30, 0x00}, // ,
    {0x10, 0x10, 0x10, 0x10, 0x10}, // -
    {0x00, 0x60, 0x60, 0x00, 0x00}, // .
    {0x20, 0x10, 0x08, 0x04, 0x02}, // /
    {0x3E, 0x51, 0x49, 0x45, 0x3E}, // 0
    {0x00, 0x42, 0x7F, 0x40, 0x00}, // 1
    {0x42, 0x61, 0x51, 0x49, 0x46}, // 2
    {0x21, 0x41, 0x45, 0x4B, 0x31}, // 3
    {0x18, 0x14, 0x12, 0x7F, 0x10}, // 4
    {0x27, 0x45, 0x45, 0x45, 0x39}, // 5
    {0x3C, 0x4A, 0x49, 0x49, 0x30}, // 6
    {0x01, 0x71, 0x09, 0x05, 0x03}, // 7
    {0x36, 0x49, 0x49, 0x49, 0x36}, // 8
    {0x06, 0x49, 0x49, 0x29, 0x1E}, // 9
    {0x00, 0x36, 0x36, 0x00, 0x00}, // :
    {0x00, 0x56, 0x36, 0x00, 0x00}, // ;
    {0x08, 0x14, 0x22, 0x41, 0x00}, // <
    {0x14, 0x14, 0x14, 0x14, 0x14}, // =
    {0x00, 0x41, 0x22, 0x14, 0x08}, // >
    {0x02, 0x01, 0x51, 0x09, 0x06}, // ?
    {0x32, 0x49, 0x59, 0x51, 0x3E}, // @
    {0x7E, 0x11, 0x11, 0x11, 0x7E}, // A
    {0x7F, 0x49, 0x49, 0x49, 0x36}, // B
    {0x3E, 0x41, 0x41, 0x41, 0x22}, // C
    {0x7F, 0x41, 0x41, 0x22, 0x1C}, // D
    {0x7F, 0x49, 0x49, 0x49, 0x41}, // E
    {0x7F, 0x09, 0x09, 0x09, 0x01}, // F
    {0x3E, 0x41, 0x49, 0x49, 0x7A}, // G
    {0x7F, 0x08, 0x08, 0x08, 0x7F}, // H
    {0x00, 0x41, 0x7F, 0x41, 0x00}, // I
    {0x20, 0x40, 0x41, 0x3F, 0x01}, // J
    {0x7F, 0x08, 0x14, 0x22, 0x41}, // K
    {0x7F, 0x40, 0x40, 0x40, 0x40}, // L
    {0x7F, 0x02, 0x0C, 0x02, 0x7F}, // M
    {0x7F, 0x04, 0x08, 0x10, 0x7F}, // N
    {0x3E, 0x41, 0x41, 0x41, 0x3E}, // O
    {0x7F, 0x09, 0x09, 0x09, 0x06}, // P
    {0x3E, 0x41, 0x51, 0x21, 0x5E}, // Q
    {0x7F, 0x09, 0x19, 0x29, 0x46}, // R
    {0x46, 0x49, 0x49, 0x49, 0x31}, // S
    {0x01, 0x01, 0x7F, 0x01, 0x01}, // T
    {0x3F, 0x40, 0x40, 0x40, 0x3F}, // U
    {0x1F, 0x20, 0x40, 0x20, 0x1F}, // V
    {0x3F, 0x40, 0x38, 0x40, 0x3F}, // W
    {0x63, 0x14, 0x08, 0x14, 0x63}, // X
    {0x07, 0x08, 0x70, 0x08, 0x07}, // Y
    {0x61, 0x51, 0x49, 0x45, 0x43}, // Z
    {0x00, 0x7F, 0x41, 0x41, 0x00}, // [
    {0x55, 0x2A, 0x55, 0x2A, 0x55}, // 55
    {0x00, 0x41, 0x41, 0x7F, 0x00}, // ]
    {0x04, 0x02, 0x01, 0x02, 0x04}, // ^
    {0x40, 0x40, 0x40, 0x40, 0x40}, // _
    {0x00, 0x01, 0x02, 0x04, 0x00}, // '
    {0x20, 0x54, 0x54, 0x54, 0x78}, // a
    {0x7F, 0x48, 0x44, 0x44, 0x38}, // b
    {0x38, 0x44, 0x44, 0x44, 0x20}, // c
    {0x38, 0x44, 0x44, 0x48, 0x7F}, // d
    {0x38, 0x54, 0x54, 0x54, 0x18}, // e
    {0x08, 0x7E, 0x09, 0x01, 0x02}, // f
    {0x0C, 0x52, 0x52, 0x52, 0x3E}, // g
    {0x7F, 0x08, 0x04, 0x04, 0x78}, // h
    {0x00, 0x44, 0x7D, 0x40, 0x00}, // i
    {0x20, 0x40, 0x44, 0x3D, 0x00}, // j
    {0x7F, 0x10, 0x28, 0x44, 0x00}, // k
    {0x00, 0x41, 0x7F, 0x40, 0x00}, // l
    {0x7C, 0x04, 0x18, 0x04, 0x78}, // m
    {0x7C, 0x08, 0x04, 0x04, 0x78}, // n
    {0x38, 0x44, 0x44, 0x44, 0x38}, // o
    {0x7C, 0x14, 0x14, 0x14, 0x08}, // p
    {0x08, 0x14, 0x14, 0x18, 0x7C}, // q
    {0x7C, 0x08, 0x04, 0x04, 0x08}, // r
    {0x48, 0x54, 0x54, 0x54, 0x20}, // s
    {0x04, 0x3F, 0x44, 0x40, 0x20}, // t
    {0x3C, 0x40, 0x40, 0x20, 0x7C}, // u
    {0x1C, 0x20, 0x40, 0x20, 0x1C}, // v
    {0x3C, 0x40, 0x30, 0x40, 0x3C}, // w
    {0x44, 0x28, 0x10, 0x28, 0x44}, // x
    {0x0C, 0x50, 0x50, 0x50, 0x3C}, // y
    {0x44, 0x64, 0x54, 0x4C, 0x44}, // z
};
/**
 * Delay Time in ms (millisecond)
 * 18 Bytes of ROM usage
 *
 * @param int delay ,value[0-65535]
 */
/*void DelayMs(unsigned int delay) {
    while (delay > 0) {
        Delay_500us(); //Delay_500us this function take 9 Bytes of ROM usage
        Delay_500us();
        delay--;
    }
}
*/
/**
 * Write Byte on Nokia LCD
 * 25 Bytes of ROM usage
 *
 * @param char temp_data
 */
void
lcd_write_byte(char temp_data) {
  char data_index;

  LCD_CSE = 0; // chip enabled

  for(data_index = 0; data_index < 8; data_index++) {
    LCD_SDIN = (temp_data & 0x80) ? 1 : 0;
    __delay_us(5);

    LCD_SCLK = 1;
    __delay_us(5);

    temp_data <<= 1;

    LCD_SCLK = 0;
  }
  LCD_CSE = 1; // chip disabled
}

/**
 * Send command to PCD8544
 * 7 Bytes of ROM usage
 *
 * @param char temp_data
 */
void
lcd_cmd(char temp_data) {
  LCD_DC = COMMAND_BYTE;
  lcd_write_byte(temp_data);
}

/**
 * Send Data to PCD8544
 * 7 Bytes of ROM usage
 *
 * @param char temp_data
 */
void
lcd_data(char temp_data) {
  LCD_DC = DATA_BYTE;
  lcd_write_byte(temp_data);
}

/**
 * Goto offset (Y ,X)
 * 17 Bytes of ROM usage
 *
 * @param char y_axis ,value [0-5]
 * @param char x_axis ,value [0-83]
 */
void
lcd_gotoxy(char x_axis, char y_axis) {
  lcd_cmd((Y_ADDRESS | (y_axis & 0x07))); // Y-axis value : 0100 0yyy ; 0 <= Y <= 5
  lcd_cmd((X_ADDRESS | (x_axis & 0x7f))); // X-axis value : 1xxx xxxx ; 0 <= X <= 83
}

/**
 * Write Char on Nokia LCD
 * 45 Bytes of ROM usage
 *
 * @param char temp_char
 */
void
lcd_putch(char temp_char) {
  // this right 6 bytes foreach char  = 5 bytes + space
  char temp_index;

  temp_char -= 32;
  for(temp_index = 0; temp_index < 5; temp_index++) {
    lcd_data(English_Font[temp_char][temp_index]); // send data to nokia
  }
  lcd_data(0x00); // space between char
  __delay_ms(delay_char);
}

/**
 * Write Message on Nokia LCD
 * 27 Bytes of ROM usage
 *
 * @param const char* message
 */
void
lcd_puts(const char* message) {
  while(*message) // Look for end of string
    lcd_putch(*message++);
}

/**
 * Write Unsigned Integer Number on Nokia LCD
 * 67 Bytes of ROM usage
 *
 * @param unsigned int num , value [0,65535]
 */
void
lcd_out_unsigned_int(unsigned int num) {
  // num = 135
  char numCache[6];
  unsigned int num_mod;
  unsigned int num_div;
  char digit_index = 0;
  num_div = num;
  do {
    num_mod = num_div % 10;               // 5 ,3,1
    num_div = num_div / 10;               // 13,1,0
    numCache[digit_index] = num_mod + 48; // char + (32 + 16) = char + 48
    digit_index++;
  } while(num_div > 0);

  while(digit_index > 0) {
    digit_index--;
    lcd_putch(numCache[digit_index]);
  }
}

/**
 * Write Integer Number on Nokia LCD
 * 35 Bytes of ROM usage
 *
 * @param int num , value [-32765,32767]
 */
void
lcd_out_int(int num) {
  if(num < 0) {
    lcd_putch('-');
    num *= -1;
  }
  lcd_out_unsigned_int(num);
}

/**
 * Draw Image Bitmap on Nokia LCD
 * 41 Bytes of ROM usage
 *
 * @param const char* img , array of 504 bytes
 */
void
lcd_image(const char* img) {
  lcd_goto_offset(0, 0);
  for(temp_index = 0; temp_index < 504; temp_index++) {
    lcd_data(img[temp_index]);
  }
}

/**
 * Flash Nokia LCD
 * 25 Bytes of ROM usage
 *
 * @param char flash_number , value [0,255]
 */
void
lcd_flash(char flash_number) {
  while(flash_number > 0) {
    __delay_ms(1500);
    lcd_cmd(DISPLAY_INVERSE_MODE);
    __delay_ms(1500);
    lcd_cmd(DISPLAY_NORMAL_MODE);
    flash_number--;
  }
}

/**
 * Clear All Pixels in DDRAM of Nokia LCD
 * 19 Bytes of ROM usage
 */
void
lcd_clear() {
  char temp_row;
  char temp_column;

  for(temp_row = 0; temp_row < MAX_ROWS; temp_row++) {
    for(temp_column = 0; temp_column < MAX_COLS; temp_column++) {
      lcd_data(0x00);
    }
  }
}

/**
 * Clear Line of Nokia LCD
 * 16 Bytes of ROM usage
 *
 * @param char temp_row , value [0,5]
 */
void
lcd_clear_line(char temp_row) {

  char temp_column;
  lcd_goto_offset(temp_row, 0);

  for(temp_column = 0; temp_column < MAX_COLS; temp_column++) {
    lcd_data(0x00);
  }
}

/**
 * Initialize Nokia LCD
 * 27 Bytes of ROM usage
 */
void
lcd_init() {
  char temp_cmd_index;

  LCD_TRIS();

  // The serial interface is initialized
  LCD_CSE = 1; // chip disabled

  /*The RES input must be < 0.3 VDD when VDD reaches VDDmin
      (or higher) within a maximum time of 100 ms after VDD
      goes HIGH , from data-sheet page 15 */
  LCD_RES = 0; // reset chip
  __delay_ms(250);
  LCD_RES = 1;

  for(temp_cmd_index = 0; temp_cmd_index < 7; temp_cmd_index++) {
    lcd_cmd(init_cmd[temp_cmd_index]);
  }
  lcd_clear();
  lcd_goto_offset(0, 0);
}
#endif
