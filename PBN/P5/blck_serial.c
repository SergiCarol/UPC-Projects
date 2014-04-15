#include "blck_serial.h"


void print(char s[]){
	uint8_t i, c;

	for (i=0;c!='\0';i++){
		c=s[i]
		serial_put(c);
	}
	serial_put('\n');
}

int readline(char s[],uint8_t m){
	uint8_t i=0,a;
	while (m!=i || ispunct()){
		a=serial_get();
		s[i] = a;
		i++;
	}
	return i;
}