#include "timer.h"
// Maxim number of entries
#define N 20

#define Input_Frequency 16000000
#define Target_time 50 //per obtenir 5ms, abans 100
#define Prescale 64
#define Target ((Input_Frequency/(Prescale*Target_time) - 1))

// Aixó esta ficat a la practica
// Entenc que la entry és per guardar els valors de temps de la funció, per aixó tenim més espais per casa funcio
typedef struct {
  uint8_t remaining, every, ntimes;
  timer_callback_t callback;
} entry;

typedef struct {
	// Per mirar l'estat que esta el cronometre ( ences (true)  o parat(false) segon la practica)
	// El on aquet esta de mes per mirar si ja hem creat el cronometre o no que si ho feia tot amb el estat després es liava a la hora de fer el cronometre i al entrar a la interrupcio
	bool estat,on ;
	// Comprador del cronometre en si.
	uint8_t cronometre;
} cron;


typedef union {
	// El union pel que he llegit siginfica que tot esta a la mateixa adreça per tan quant fem el union[20] de sota el crono i em timer compartiran cel·les
	cron crono;
	entry timer;
} t;


static struct {
  // Diria que ara va aixi
  t unio[N];
  //Numero de entrades valides
  uint8_t n;
} tt;



void timer_init(void){
  
  //Configurem el timer per que entri a la interrupcio cada 10 ms
  TCCR1A = 0;
  TCCR1B = (_BV(WGM12) | _BV(CS11) | _BV(CS10));  
  OCR1AH = (uint8_t)(Target >> 8);    
  OCR1AL = (uint8_t)(Target);
  
  timer_cancel_all();
}

timer_handler_t timer_after(uint8_t ticks, timer_callback_t f){
  return timer_ntimes(1,ticks,f);
}

timer_handler_t timer_every(uint8_t ticks, timer_callback_t f){
  return timer_ntimes(0,ticks,f);
}

timer_handler_t timer_ntimes(uint8_t n, uint8_t ticks, timer_callback_t f){
  
  
  uint8_t i;
  // Recorrem tota la "taula" per buscar algun lloc en que no hi haguem ficat res
  for (i=0;i!=N;i++){
    // Si la posicio no esta ocupada hi escribim
    if (tt.unio[i].timer.every==0 && tt.unio[i].crono.on==false){
      tt.n++;
      tt.unio[i].timer.remaining = ticks;
      tt.unio[i].timer.every = ticks;
      tt.unio[i].timer.ntimes = n;
      tt.unio[i].timer.callback = f; 
      
      // Si no hem planificat abans activem el timer 
      if (tt.n > 0){
	TCNT1 = 0;
	TIMSK1 |= _BV(OCIE1A);
      }
      return i;
    }
  }
	// Si no troba cap espai buit que retorni el error aquet
  return TIMER_ERR;
}

void timer_cancel (timer_handler_t h){
  if (h<N) tt.unio[h].timer.every = 0;
}

void timer_cancel_all (void){
  
  uint8_t i;	
  for (i=0;i!=N;i++){
    tt.unio[i].timer.every=0;
  }
}

timer_chrono_t chrono(void){
  
	for (uint8_t i=0;i!=N;i++){
	    // Si la posicio no esta ocupada hi escribim
	    if (tt.unio[i].crono.on==false && tt.unio[i].timer.every==0){
	      tt.n++;
	      tt.unio[i].crono.on = true;
	      // la pregunta és, aqui s'activa el cronometre ja???
	     
	      if (tt.n > 0){
		TCNT1 = 0;
		TIMSK1 |= _BV(OCIE1A);
	      }
	      return i;
	    }
	  }
 return CHRONO_ERR;

}

void chrono_start(timer_chrono_t c){
	if (tt.unio[c].crono.on = true){ 
		tt.unio[c].crono.estat = true;
		tt.unio[c].crono.cronometre = 0;
	}
	else{}
}
uint8_t chrono_get(timer_chrono_t c){

	return tt.unio[c].crono.cronometre;
}



void chrono_stop(timer_chrono_t c){

	tt.unio[c].crono.estat = false;
}



void chrono_cancel(timer_chrono_t c){

	tt.unio[c].crono.on = false;
}





ISR(TIMER1_COMPA_vect){
  uint8_t i;
  // Recorrem la taula
  for (i=0;i!=N;i++){
  	 // Mirem si en la posicio N tenim un cronometre o un timer (comrpovem si el crono esta ences o apagat)
  	if (tt.unio[i].crono.estat != true){
  	    // Entrem dintre els valors que hem escrit
  	    if (tt.unio[i].timer.every != 0){
  	      // Hi restem un tick
  	      tt.unio[i].timer.remaining--;
  	      // Si hem acabat de restar...
  	      if (tt.unio[i].timer.remaining == 0){
	  		// Cridem al funcio
	  		(tt.unio[i].timer.callback)();
	  		// En el cas de que aquet fos l'ultim cop que la teniem que cridar fiquem el every a 0
	  		if (tt.unio[i].timer.ntimes == 1) tt.unio[i].timer.every = 0;
	  		// Si es te que fer indefinidament tornem a guardar el valor de ticks al remaining
	  		else if (tt.unio[i].timer.ntimes == 0) tt.unio[i].timer.remaining = tt.unio[i].timer.every ;
	  		// En cas de que no fos cap dels de abans restem un ntimes i tornem a ficar el valor de remaning a every
	  		else{
	  		  tt.unio[i].timer.ntimes--;
	  		  tt.unio[i].timer.remaining = tt.unio[i].timer.every;
	  			}
  	     	}
  	   	}	
  	}
  	else{ 
  		if (tt.unio[i].crono.cronometre == 255){
  			// aqui poder es tindria que ficar algu en plan, quant arribi a 255 sumu a un altre lloc 1 per portar el compte no?

  			tt.unio[i].crono.cronometre=0;
  		} 
  		else tt.unio[i].crono.cronometre++;

  	}
  }
}	
