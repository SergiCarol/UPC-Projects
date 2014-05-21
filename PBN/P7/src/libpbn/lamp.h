#ifndef __LAMP_H
#define __LAMP_H

#include <avr/io.h>
#include <stdbool.h>
#include <util/delay.h>
#include "gpio_device.h"

typedef enum {Green , Yellow , Red} color_t;

typedef struct {											// pin_t.port agafa el port
	pin_t green;
	pin_t yellow;
	pin_t red;											// pin_t.pin agafa el pin del port
} lamp_t;

void lamp_init(lamp_t *const l , volatile uint8_t *port_green,uint8_t pin_green ,volatile uint8_t *port_yell,uint8_t pin_yell,volatile uint8_t *port_red,uint8_t pin_red);
void lamp_on(lamp_t l,color_t c);
void lamp_off(lamp_t l, color_t c);
void lamp_toggle(lamp_t l ,color_t c);
bool lamp_is_on(lamp_t l , color_t c);

#endif