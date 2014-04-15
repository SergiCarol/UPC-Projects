#ifndef __SERIAL_H
#define __SERIAL_H


void serial_open(void);
void serial_close(void);
uint8_t serial_get(void);
void serial_put(uint8_t c);
bool serial_can_read(void);


#endif