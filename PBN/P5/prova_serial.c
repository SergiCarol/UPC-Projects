#include <stdbool.h>
#include <avr/io.h>
#include <util/delay.h>
#include "serial.h"

int main(void){
  uint8_t a;
  serial_open();

 	serial_put('m');
  serial_put('a');
  serial_put('r');
 	serial_put('m');
 	serial_put('o');
 	serial_put('t');
 	serial_put('a');
 	serial_put('\0');
  /*
    while (1){
    a=serial_get();
    _delay_ms(1000);
    serial_put(a);
    _delay_ms(1000);
  }*/
  serial_close();
  return 0;
}
	
