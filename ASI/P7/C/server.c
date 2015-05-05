#include <avr/io.h>
#include <stdbool.h>
#include <inttypes.h>
#include "gpio_device.h"
#include "serial.h"

static pin_t led;

void lectura(void){
	uint8_t a;
	bool s;
	if (serial_can_read()){
		a=serial_get();
		if (a == 'O') pin_w(led,true);
		else if (a == 'F') pin_w(led,false);
		else if (a == 'C') {
			s = pin_r(led);
			if (s == true) serial_put('1');
			else if (s == false) serial_put('0');
			pin_w(led,s);
		}
	}
}

int main (void) {
	serial_open();
	led = pin_create(&PORTB,5,Output);
	while (serial_can_read()==false);
	pin_w(led,false);
	while(true) lectura();	
	return 0;
}