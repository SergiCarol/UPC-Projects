#ifndef __FRAME_H
#define __FRAME_H 

#include <stdbool.h>
#include <pbn.h>
#include <ctype.h>
#include <inttypes.h>
#include <stdlib.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include "checksum.h"
#include "gpio_device.h"

typedef void (*frame_callback_t)(void);

typedef enum {esperant,enviant} estat;

void frame_init(void);

bool frame_can_put(void);
void frame_block_put(const block_morse b);

void frame_block_get(block_morse b);
void on_frame_recived(frame_callback_t l);

void print(uint8_t j[]);
// Fiquem si soc transmissor o receptor

uint8_t numeracio_trama_rx;
uint8_t waiting_for_rx;
uint8_t not_waiting_for_rx;

uint8_t numeracio_trama_tx;
uint8_t waiting_for_tx;
uint8_t not_waiting_for_tx;
#endif
