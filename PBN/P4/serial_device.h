#ifndef __CONTROLSEM_H
#define __CONTROLSEM_H

#include <avr/sfr_defs.h>
#include <stdint.h>
#include <stdbool.h>

void serial_init(void);
uint8_t serial_get(void);
void serial_put(uint8_t c);
bool serial_can_read(void);


#endif