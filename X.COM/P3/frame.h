#ifndef __FRAME_H
#define __FRAME_H 

#include <inttype.h>
#include <stdbool.h>
#include <pbn.h>
#include "checksum.h"

typedef void (*framce_callback_t)(void);

void frame_init(void);

bool frame_can_put(void);
void frame_block_put(const block_morse b);

void frame_block_get(block_morse b);
void on_frame_recived(framce_callback_t l);

// Fiquem si soc transmissor o receptor
typedef enum {transmissor,receptor} state_frame;

#endif