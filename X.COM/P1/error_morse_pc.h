#ifndef __ERROR_MORSE_PC_H
#define __ERROR_MORSE_PC_H


#include <stdio.h>
#include <inttypes.h>
#include <stdbool.h>
//#include <util/crc16.h>

typedef struct num{
  uint8_t a,b;
} numero;



numero checksum(char j[]);
bool check_checksum(char j[]);
numero crc_morse(char j[]);

#endif