#ifndef __ETHER_H
#define __ETHER_H

#include <stdbool.h>
#include <inttypes.h>
#include <avr/io.h>
#include "mtbl.h"
#include "queue.h"
#include "modulator.h"
#include "timer.h"
#include "mchar.h"


void ether_init(void);
void ether_put(uint8_t c);

#endif