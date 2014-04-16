#include "blck_serial.h"
#include <util/delay.h>
void print(char s[]){
	uint8_t i=0, c;
    while(s[i]!='\0'){
      	serial_put(s[i]);
      	i++;
	}

}

int readline(char s[],uint8_t m){
	uint8_t i=0,a;
	while (m!=i || ispunct(s[i])){
		a=serial_get();
		s[i] = a;
		i++;
	}
	return i;
}
