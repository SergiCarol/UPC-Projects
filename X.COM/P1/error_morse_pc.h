#ifndef __ERROR_MORSE_PC_H
#define __ERROR_MORSE_PC_H


#include <stdio.h>
#include <inttypes.h>
#include <stdbool.h>
//#include <util/crc16.h>

typedef struct num{
  uint8_t a,b;
} numero;



numero checksum(uint8_t j[]);
bool check_checksum(uint8_t j[]);
numero crc_morse(char j[]);

#endif