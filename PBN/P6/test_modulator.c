#include "modulator.h"
#include <stdbool.h>
#include <util/delay.h>


void main(void){

	modulator_init();
	while(1){
		modulator_set(true);
		_delay_ms(100);
		modulator_set(false);
		_delay_ms(100);
	}
}