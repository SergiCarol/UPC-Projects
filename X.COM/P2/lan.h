#ifndef LAN_H
#define LAN_H 
#define pendent_enviar 0 // suposu que es fa aixi xD False
#define esperant 1	// ^ True

#include <inttypes.h>
#include <stdbool.h>
#include <stdlib.h>
#include <pbn.h>


typedef void (*lan_callback_t)(void);
typedef void (*funcio)(void);

void lan_init(uint8_t no);

bool lan_can_put(void);
void lan_block_put(const block_morse b,uint8_t nd);

void on_lan_recived(lan_callback_t l);

#endif
