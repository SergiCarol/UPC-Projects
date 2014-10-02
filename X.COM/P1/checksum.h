#ifndef __CHECKSUM_H
#define __CHECKSUM_H
#include <stdio.h>
#include <inttypes.h>
#include <stdbool.h>
#include <util/crc16.h>
#include "blck_serial.h"
#include "serial.h"

numero checksum(uint8_t j[]);
bool check_checksum(uint8_t j[]);
numero crc_morse(uint8_t j[]);
bool check_crc(uint8_t j[]);

#endif
