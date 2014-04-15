#include <stdbool.h>
#include <avr/io.h>
#include <util/delay.h>
#include "serial.h"

int main(void){
  uint8_t a;
  serial_open();
    
    /*a=serial_get();
    if (a=='A') {
      DDRD=0xFF;
      PORTD=0xFF;
    }
    else if (a=='B'){
      DDRD=0x00;
      PORTD=0x00;
    }*/
  _delay_ms(2000);
 	serial_put('m');
  serial_put('a');
  serial_put('r');
 	serial_put('m');
 	serial_put('o');
 	serial_put('t');
 	serial_put('a');
 	serial_put('\0');
  return 0;
}
	
