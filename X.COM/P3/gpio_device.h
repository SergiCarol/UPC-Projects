#ifndef __GPIO_DEVICE_H
#define __GPIO_DEVICE_H

#include <avr/io.h>
#include <stdbool.h>
#include <util/delay.h>

typedef enum {Input, Output} pin_direction_t;

typedef struct {											// pin_t.port agafa el port
  volatile uint8_t*  port ;						
  uint8_t pin;											// pin_t.pin agafa el pin del port
} pin_t;


pin_t pin_create(volatile uint8_t *port , uint8_t pin, pin_direction_t d);
void pin_w(pin_t p,bool v);
bool pin_r(pin_t p);
void pin_toggle(pin_t p);

#endif
