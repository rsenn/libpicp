#include "midi.h"
#include "uart.h"

// -------------------------------------------------------------------------
void
midi_send(const putch_ptr putch, uint8_t cmd, uint8_t d1, uint8_t d2, uint8_t chan) {
  putch((cmd & 0b11110000) | (chan & 0b1111));
  putch(d1);
  putch(d2);
}

queue midi_rxq;

// -------------------------------------------------------------------------
void
midi_init(void) {
  uart_init();
  PIE1 |= 0b00100000; // RCIE = 1 -- uart_enable() leaves this off by default
}

// -------------------------------------------------------------------------
int
midi_getch(void) {
  if(queue_count(&midi_rxq) == 0)
    return -1;
  return (int)dequeue(&midi_rxq);
}
