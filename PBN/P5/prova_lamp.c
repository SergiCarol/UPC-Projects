#include "lamp.h"


void main(void){

	lamp_t t;
	color_t c;

	lamp_init(&t ,&PORTD, 5 ,&PORTD, 6,&PORTD,7);
	while (1){
		c=Green;
		_delay_ms(1000);
		lamp_toggle(t,c);
		c=Yellow;
		_delay_ms(1000);
		lamp_toggle(t,c);
		c=Red;
		_delay_ms(1000);
		lamp_toggle(t,c);

	}
}