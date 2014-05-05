#include "timer.h"

// Maxim number of entries
#define N 20

#define Input_Frequency 16000000
#define Target_time 10
#define Prescale 64
#define Target ((Input_Frequency/(Prescale*Target_time) - 1))

// Aixó esta ficat a la practica
// Entenc que la entry és per guardar els valors de temps de la funció, per aixó tenim més espais per casa funcio
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
	// Funcio més inutil que he vist en me vida
	return timer_ntimes(1,ticks,f);
}

timer_handler_t timer_every(uint8_t ticks, timer_callback_t f){
	// Funcio més inutil que he vist en me vida 2.0
	return timer_ntimes(0,ticks,f);
}

timer_handler_t timer_ntimes(uint8_t n, uint8_t ticks, timer_callback_t f){


	uint8_t i;
	// Recorrem tota la "taula" per buscar algun lloc en que no hi haguem ficat res
	for (i=0;i!=N;i++){
		if (i>N) return TIMER_ERR;
		// Aixó nose si esta bé, jo entenc que el every es per dir si esta ocupat o no
		if (tt.t[i].every==0){
			tt.t[i].remaning = ticks;
			// PREGUNTAR AL SBS
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
	// Si no troba cap espai but que retorni el error aquet
	return TIMER_ERR;
}

void timer_cancel (timer_handler_t h){

	tt.t[h].every = 0;
}

void timer_cancel_all (void){

	uint8_t i;	
	for (i=0;i!=N;i++){
		tt.t[i].every=0;
	}
}


ISR(TIMER1_COMPA_vect){

	uint8_t i;
	for (i=0;i!=N,i++){
		if (tt.t[i].every != 0){
			tt.t[i].remaning--
		}
		if ((tt.t[i].remaning == 0) && (tt.t[i].ntimes = 1)){
			tt.every = 0;
			tt.t[i].callback;
		else if ((tt.t[i].remaning == 0) && (tt.t[i].ntimes = 0)){ 
			tt.t[i].remaning = tt.t[i].every ;
			tt.t[i].callback;
		}
		else tt.[i].ntimes--;

	}
}	
