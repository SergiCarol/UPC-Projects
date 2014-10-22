#ifndef LAN_H
#define LAN_H 
#define pendent_enviar 0 // suposu que es fa aixi xD False
#define esperant 1	// ^ True

#include <inttypes.h>
#include <stdbool.h>
#include <stdlib.h>
#include <ctype.h>
#include <pbn.h>
#include "checksum.h"
#include "gpio_device.h"

typedef void (*lan_callback_t)(void);

void lan_init(uint8_t no);

bool lan_can_put(void);
void lan_block_put(const block_morse b,uint8_t nd);
uint8_t lan_block_get(block_morse b);
void on_lan_recived(lan_callback_t l);

void print(char s[]);
void readline(char s[],uint8_t m);

uint8_t estat;

#endif
