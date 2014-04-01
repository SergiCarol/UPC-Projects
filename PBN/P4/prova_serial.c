#include "serial_device.h"
#include <stdbool.h>
#include <avr/io.h>

int main(void){
	uint8_t a;
	serial_init();
    while(1){

    	a=serial_get();
    	if (a=='A') {
    		DDRD=0xFF;
    		PORTD=0xFF;
    	}
    	else if (a=='B'){
    		DDRD=0x00;
    		PORTD=0x00;
    	}
    	serial_put(a);
}
return 0;
}
	
