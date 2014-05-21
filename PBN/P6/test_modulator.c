#include "modulator.h"
#include <stdbool.h>
#include <util/delay.h>
#include "gpio_device.h"
#include "timer.h"
static pin_t a;


void hol(void){
	pin_toggle(a);
}


void main(void){

	a= pin_create(&PORTD,6,Output);
	timer_init();
	timer_every(TIMER_MS(100),hol);
	modulator_init();
	sei();
	while(1){
		modulator_set(true);
		_delay_ms(100);
		modulator_set(false);
		_delay_ms(100);
	}
}

