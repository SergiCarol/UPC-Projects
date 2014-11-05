#include "frame.h"


uint8_t ta_tx[32];
static block_morse tx_H = ta_tx;
state_frame state_frames = transmissor;

int main(void){
	uint8_t a,i=0;
	serial_init();
	sei();
	frame_init();
	numeracio_trama=0;
	waiting_for='A';
	while(serial_can_read()==false);
	while(true){
		for(i=0;a=serial_get()!='\r';i++){
			serial_put(a);
			if (a=='r'){
				i=0;
				serial_put('\r');
				serial_put('\n');
				break;
			}
			else{
				tx_H[i]=a;
			}
		}
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

