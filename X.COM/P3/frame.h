#ifndef __FRAME_H
#define __FRAME_H 

#include <stdbool.h>
#include <pbn.h>
#include <ctype.h>
#include <inttypes.h>
#include <stdlib.h>
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

void print(char j[]);
// Fiquem si soc transmissor o receptor
typedef enum {transmissor,receptor} state_frame;

#endif