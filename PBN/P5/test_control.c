#include <util/delay.h>
#include "control.h"

int main(void){

	control_init();
	control_on();
	while(1){
		_delay_ms(2000);

	}


}

