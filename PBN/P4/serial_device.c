#include <avr/sfr_defs.h>
#include <avr/io.h>
#include <stdint.h>
#include <stdbool.h>
void serial_init(void){
	UBBR0H = 0x00;
	UBRR0L = 0x67;
	UCSR0A = 0x20;
	UCSR0B = 0x98;
	
}

uint8_t serial_get(void){

	char a;

	while (UCSR0A & (1<<7)){
		a=UDR0;
	}	

}

void serial_put(uint8_t c){

	while (UCSR0A & (1<<5))
		UDR0 = c;
}

bool serial_can_read(void){
	if ((UCSR0A & (1<<7))== TRUE) return TRUE;
	else return FALSE;
}


