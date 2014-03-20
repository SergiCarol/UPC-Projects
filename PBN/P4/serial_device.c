#include <avr/sfr_defs.h>
#include <avr/io.h>
#include <stdint.h>

void serial_init(void){
	/*
	UDR0 = 0xc6
	UBRR0H = 0xc5
	UBRR0L = 0xc4
	UCSR0C = 0xc2
	UCSR0B = 0xC1
	UCSR0A = 0xC0
	*/
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


	     