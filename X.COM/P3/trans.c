#include "frame.h"


uint8_t ta_tx[32];
static block_morse tx_H = ta_tx;

int main(void){
	uint8_t a,i=0;
	serial_init();
	sei();
	frame_init();
	numeracio_trama='0';
	waiting_for='A';
	while(true){
		while (frame_can_put()==false);
		serial_put('-');
		serial_put('>');
		a=serial_get();
    	while (a!='\r'){
			serial_put(a);
			if (a=='r'){
				i=0;
				serial_put('\r');
				serial_put('\n');
				break;
			}
			else{
				tx_H[i]=a;
				i++;
				a=serial_get();
			}
		}
		serial_put('\n');
      	serial_put('\r');
		while (frame_can_put()==false);
    	if (i>0){
      		tx_H[i]='\0';
      		i=0;
      		//Enviem el missatge
      		frame_block_put(tx_H);  

    	}
	}
	return 0;
}

