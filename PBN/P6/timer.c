#include "timer.h"

// Maxim number of entries
#define N 20

#define Input_Frequency 16000000
#define Target_time 10
#define Prescale 64
#define Target ((Input_Frequency/(Prescale*Target_time) - 1))

// Aixó esta ficat a la practica
typedef struct {
	uint8_t remaining, every, ntimes;
	timer_callback_t callback;
} entry;

static struct {
	entry t[N];
	//Numero de entrades valides
	uint8_t n;
}tt;


void timer_init(void){

	//Configurem el timer
	TCCR1A = 0;
  	TCCR1B = (_BV(WGM12) | _BV(CS11) | _BV(CS10));  
  	OCR1AH = (uint8_t)(Target >> 8);    
  	OCR1AL = (uint8_t)(Target);	
}

timer_handler_t timer_after(uint8_t ticks, timer_callback_t f){
	return timer_ntimes(1,ticks,f);
}

timer_handler_t timer_every(uint8_t ticks, timer_callback_t f){
	return timer_ntimes(0,ticks,f);
}

timer_handler_t timer_ntimes(uint8_t n, uint8_t ticks, timer_callback_t f){


	uint8_t i;
	for (i=0;i!=N;i++){
		if (i>N) return TIMER_ERR;
		if (tt.every==0){
			tt.t[i].remaning = ticks;
			tt.t[i].every = ticks;
			tt.t[i].ntimes = n;
			tt.t[i].entry.callback = f; 
		
		// Si no hem planificat abans activem el timer 
			if (tt.n > 0){
				TCNT1 = 0;
				TIMSK1 |= _BV(OCIE1A);
			}
			return i;
		}
	}
	return TIMER_ERR;
}

ISR(TIMER1_COMPA_vect){

}	
