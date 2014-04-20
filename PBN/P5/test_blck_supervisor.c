#include "blck_serial.h"
#include <avr/io.h>
#include "serial.h"


int main(void){
	uint8_t a;
	char s[20];
	serial_open();

	while (1){
		a = readline(s,4);
		if ((s[0]=='C') && (s[1]=='_') && (s[2]=='o') && (s[3]=='n')){

			char j[]="control_on";
			print(j);
		}
		else if ((s[0]=='C') && (s[1]=='_') && (s[2]=='o') && (s[3]=='f')){

			char j[]="apagat";
			print(j);

		}
		else if ((s[0]=='F') && (s[1]=='o') && (s[2]=='r') && (s[4]=='A')){

			char j[]="encesA\r\n";
			print(j);
		}

		else if ((s[0]=='F') && (s[1]=='o') && (s[2]=='r') && (s[4]=='B')){

			char j[]="encesB\r\n";
			print(j);
		}

	}
	return 0;
}