#include "blck_serial.h"
#include <avr/io.h>
#include <avr/interrupt.h>

void print(char s[]){
	uint8_t i=0, c;
    while(s[i]!='\0'){
      	serial_put(s[i]);
      	i++;
	}
	serial_put('\r');
	serial_put('\n');
}

int readline(char s[],uint8_t m){
	uint8_t i=0,a;
	while (m!=i || ispunct(s[i])){
		a=serial_get();
		s[i] = a;
		i++;
	}
	s[i]='\0';
	return i;
}
