#ifndef __BLCK_SERIAL_H
#define __BLCK_SERIAL_H

#include <avr/io.h>
#include <stdbool.h>
#include <stdint.h>
#include "serial.h"

void print(char s[]);
int readline(char s[],uint8_t m);

#endif