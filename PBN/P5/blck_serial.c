#include "blck_serial.h"
#include <util/delay.h>
void print(char s[]){
	uint8_t i=0, c;
    while(s[i]!='\0'){
      	serial_put((uint8_t)s[i]);
      	i++;
	}

}

int readline(char s[],uint8_t m){
	int i=0,a;
	while (m!=i || ispunct(s[i])){
		a=serial_get();
		s[i] = a;
		i++;
	}
	return i;
}


int main(void){
  	uint8_t i=0,c;
  	serial_open();
  	char j[]="aasdfghasdfgbh";
  	while(j[i]!='\0'){
    	serial_put(j[i]);
    	i+=1;
	}
 	//print(s);
 	/*serial_put(s[0]);
	serial_put(s[1]);
	serial_put(s[2]);
	serial_put(s[3]);
	serial_put(s[4]);
	serial_put(s[5]);
	serial_put('\0');*/
	serial_close();
} 