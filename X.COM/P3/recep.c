#include "frame.h"


uint8_t ta_rx[32];
static block_morse rx_H = ta_rx;
state_frame state_frames = receptor;
static void pinta(void);


int main(void){
	serial_init();
	sei();
	frame_init();
	numeracio_trama='A';
	waiting_for=0;
	while(serial_can_read()==false);
	on_frame_recived(pinta);
	while(true);
}

static void pinta(void){
	serial_put('\r');
	serial_put('\n');
	frame_block_get(rx_H);
	print(rx_H);

}