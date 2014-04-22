#include "control.h"

carrer SemA;
carrer SemB;

control_carrer control;

/* http://www.avrfreaks.net/index.php?name=PNphpBB2&file=viewtopic&t=50106 */

#define Input_Frequency 16000000
#define Target_Frequency 100
#define Prescale 64
#define Target ((Input_Frequency/Prescale)/Target_Frequency - 1)

void control_init(void){
	/*Inicialitza el mòdul de control. ës imprescindible cridar la funció
	abans d'usar el mòdul. Una vegada inicialitzat deixa els semàfors
	apagats i cal engegar-los explícitament.*/

	/*Inicialitza el timer y activa les interrupcions.*//*SERGIIII AYUDA CON ESTA PARTE*/
	TCCR1A = 0;
  TCCR1B = (_BV(WGM12) | _BV(CS11) | _BV(CS10));  
 	OCR1AH = (uint8_t)(Target >> 8);    
  OCR1AL = (uint8_t)(Target);
  	//-----------------------
  semaph_init(&(SemA.state), &PORTD, 5, &PORTD, 6, &PORTD, 7);
  semaph_init(&(SemB.state), &PORTD, 4, &PORTC, 3, &PORTC, 2);
  	//Pongo los dos semaforos apagados
  semaph_set(&(SemA.state),SemOff);
  semaph_set(&(SemB.state),SemOff);

  	/*Esta es la parte "propia"*/
  (control).estat = Off;

  	//Activar interrupciones
  sei();
}

void control_force(street_t s){
	/*Força el carrer t a l'estat Clear. Respecta els temps de seguretat
	establerts (vegeu descripció posterior).*/

	//AQUI DEBERIA QUITAR LAS INTERRUPCIONES
	if(control.estat != Off){
		if(s == StreetA){
			if(control.estat == Aclear) control.ticks = 80;
			else if(control.estat == AtoB){
				control.ticks = 80;
				control.estat = Aclear;
				semaph_set(&(SemA.state),SemClear);
  			semaph_set(&(SemB.state),SemStop);
			}
			else if(control.estat == Bclear){
				control.ticks = 20;
				control.estat = BtoA;
				semaph_set(&(SemA.state),SemStop);
  				semaph_set(&(SemB.state),SemApproach);
			}
		}
		if(s == StreetB){
			if(control.estat == Bclear) control.ticks = 100;
			else if(control.estat == BtoA){
				control.ticks = 100;
				control.estat = Bclear;
				semaph_set(&(SemA.state),SemStop);
  				emaph_set(&(SemB.state),SemClear);
			}
			else if(control.estat == Aclear){
				control.ticks = 20;
				control.estat = AtoB;
				semaph_set(&(SemA.state),SemApproach);
  				semaph_set(&(SemB.state),SemStop);
			}
		}
	}
	//Y AQUI QUITARLAS
}

void control_off(void){
	/*Apaga els semàfors de la cruïlla.*/
	TIMSK1 &= ~_BV(OCIE1A);//COSA QUE NO SE PARA QUE SIRVE
	semaph_set(&(SemA.state),SemOff);
  	semaph_set(&(SemB.state),SemOff);
  	control.estat = Off;
}

void control_on(void){
	/*Engega els semàfors de la cruïlla.*/
	  TCNT1H = 0;//COSA QUE NO SE PARA QUE SIRVE
  	TCNT1L = 0;//COSA QUE NO SE PARA QUE SIRVE
    TIMSK1 |= _BV(OCIE1A);//COSA QUE NO SE PARA QUE SIRVE
    /*Pongo la calle A en clear y se empieza el ciclo.*/
    semaph_set(&(SemA.state),SemClear);
  	semaph_set(&(SemB.state),SemStop);
  	control.estat = Aclear;
  	control.ticks = 80;

}
semaph_state_t control_get_state(street_t s){
	/*Retorna l'estat del semàfor del carrer s.*/
	if(s == StreetA) return semaph_get(SemA.state);
	if(s == StreetB) return semaph_get(SemB.state);
}

//TIMER

ISR(TIMER1_COMPA_vect){

  	DDRB = 0xff;//COSA QUE NO SE PARA QUE SIRVE
  	PORTB ^= 0xff;//COSA QUE NO SE PARA QUE SIRVE
  
  	if (control.ticks == 0){
    	if(control.estat == Aclear){
    		control.estat = AtoB;
    		control.ticks = 20;
    		semaph_set(&(SemA.state),SemApproach);
  			semaph_set(&(SemB.state),SemStop);
    	}
    	else if(control.estat == AtoB){
    		control.estat = Bclear;
    		control.ticks = 100;
    		semaph_set(&(SemA.state),SemStop);
  			semaph_set(&(SemB.state),SemClear);
    	}
    	else if(control.estat == Bclear){
    		control.estat = BtoA;
    		control.ticks = 20;
    		semaph_set(&(SemA.state),SemStop);
  			semaph_set(&(SemB.state),SemApproach);
    	}
    	else if(control.estat == BtoA){
    		control.estat = Aclear;
    		control.ticks = 80;
    		semaph_set(&(SemA.state),SemClear);
  			semaph_set(&(SemB.state),SemStop);
    	}  
  	}
  	else control.ticks--;
}
