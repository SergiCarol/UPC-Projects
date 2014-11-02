#include "frame.h"


uint8_t ta_rx[32];
static block_morse rx_H = ta_rx;

static void pinta(void);


int main(void){
	serial_init();
	sei();
	frame_init();
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