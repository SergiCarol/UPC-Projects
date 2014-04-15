
#include "lamp.h"
#include <util/delay.h>

// ACABAAAAAAAAAAAAT

void lamp_init(lamp_t *const l , volatile uint8_t *port_green,uint8_t pin_green ,volatile uint8_t *port_yell,uint8_t pin_yell,volatile uint8_t *port_red,uint8_t pin_red){

	(l)->green = pin_create(port_green,pin_green,Output);

	(l)->yellow = pin_create(port_yell,pin_yell,Output);

	(l)->red = pin_create(port_red,pin_red,Output);

}

void lamp_on(lamp_t l,color_t c){

	if (c==Green) pin_w(l.green,true);
	else if (c==Yellow) pin_w(l.yellow,true);
	else if (c==Red) pin_w(l.red,true);

}

void lamp_off(lamp_t l, color_t c){

	if (c==Green) pin_w(l.green,false);
	else if (c==Yellow) pin_w(l.yellow,false);
	else if (c==Red) pin_w(l.red,false);
}
void lamp_toggle(lamp_t l ,color_t c){
	if (c==Green) pin_toggle(l.green);
	else if (c==Yellow) pin_toggle(l.yellow);
	else if (c==Red) pin_toggle(l.red);
}
bool lamp_is_on(lamp_t l , color_t c){

	bool a;
	
	if (c==Green) a = pin_r(l.green);
	else if (c==Yellow) a = pin_r(l.yellow);
	else if (c==Red) a = pin_r(l.red);

	return a;

}
