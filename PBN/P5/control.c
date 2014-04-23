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

	/*Inicialitza el timer y activa les interrupcions.*/
	TCCR1A = 0;
  TCCR1B = (_BV(WGM12) | _BV(CS11) | _BV(CS10));  
 	OCR1AH = (uint8_t)(Target >> 8);    
  OCR1AL = (uint8_t)(Target);
  //Inicialitza els Semafors A i B, amb els seus ports corresponents.
  semaph_init(&(SemA.state), &PORTD, 5, &PORTD, 6, &PORTD, 7);    
  semaph_init(&(SemB.state), &PORTD, 4, &PORTC, 3, &PORTC, 2);
  //Posa a l'estat d'apagat els semafors.
  semaph_set(&(SemA.state),SemOff);                             
  semaph_set(&(SemB.state),SemOff);
  //Indiquem a la variable global que estem a l'estat d'off.
  (control).estat = Off;
  //Activem interrupcions
  sei();
}

void control_force(street_t s){
	/*Força el carrer t a l'estat Clear. Respecta els temps de seguretat
	establerts (vegeu descripció posterior).*/

  //Si tenim els semafors encesos fes l'operació. En altre cas, ignora l'ordre
	if(control.estat != Off){
    //Si es vol operar amb el carrer A fes l'operació
		if(s == StreetA){
      //Si estem amb Aclear simplement reinicia l'estat
			if(control.estat == Aclear) control.ticks = 80;
      //Si estem en AtoB, pasa a estar Aclear i reinicia el comptador
			else if(control.estat == AtoB){
				control.ticks = 80;
				control.estat = Aclear;
				semaph_set(&(SemA.state),SemClear);
  			semaph_set(&(SemB.state),SemStop);
			}
      //Si estem en Bclear, força l'estat BtoA
			else if(control.estat == Bclear){
				control.ticks = 20;
				control.estat = BtoA;
				semaph_set(&(SemA.state),SemStop);
  			semaph_set(&(SemB.state),SemApproach);
			}
      //Si estem en l'estat BtoA no facis res
		}
    //Si es vol operar amb el carrer B fes l'operació
		if(s == StreetB){
      //Si estem amb Aclear simplement reinicia l'estat
			if(control.estat == Bclear) control.ticks = 100;
      //Si estem en BtoA, pasa a estar Bclear i reinicia el comptador
			else if(control.estat == BtoA){
				control.ticks = 100;
				control.estat = Bclear;
				semaph_set(&(SemA.state),SemStop);
  			semaph_set(&(SemB.state),SemClear);
			}
      //Si estem en Aclear, força l'estat AtoB
			else if(control.estat == Aclear){
				control.ticks = 20;
				control.estat = AtoB;
				semaph_set(&(SemA.state),SemApproach);
  			semaph_set(&(SemB.state),SemStop);
			}
      //Si estem en l'estat BtoA no facis res
		}
	}
}

void control_off(void){
	/*Apaga els semàfors de la cruïlla y posem l'estat global a Off*/
	TIMSK1 &= ~_BV(OCIE1A);
	semaph_set(&(SemA.state),SemOff);
  semaph_set(&(SemB.state),SemOff);
  control.estat = Off;
}

void control_on(void){
	/*Engega els semàfors de la cruïlla i posem l'estat a On. Començem el cicle amb Aclear.*/
    TIMSK1 |= _BV(OCIE1A);
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

ISR(TIMER1_COMPA_vect){

    //Els ticks han arribat a 0?  
  	if (control.ticks == 0){
      //Sí han arribat a 0. Estem a l'estat Aclear?
    	if(control.estat == Aclear){
        //Sí estem en Aclear. Pasa al següent estat.
    		control.estat = AtoB;
    		control.ticks = 20;
    		semaph_set(&(SemA.state),SemApproach);
  			semaph_set(&(SemB.state),SemStop);
    	}
      //Estem a l'estat AtoB?
    	else if(control.estat == AtoB){
        //Sí estem en AtoB. Pasa al següent estat.
    		control.estat = Bclear;
    		control.ticks = 100;
    		semaph_set(&(SemA.state),SemStop);
  			semaph_set(&(SemB.state),SemClear);
    	}
      //Estem a l'estat Bclear?
    	else if(control.estat == Bclear){
        //Sí estem en Bclear. Pasa al següent estat.
    		control.estat = BtoA;
    		control.ticks = 20;
    		semaph_set(&(SemA.state),SemStop);
  			semaph_set(&(SemB.state),SemApproach);
    	}
      //Estem a l'estat BtoA?
    	else if(control.estat == BtoA){
        //Sí estem en BtoA. Pasa al següent estat.
    		control.estat = Aclear;
    		control.ticks = 80;
    		semaph_set(&(SemA.state),SemClear);
  			semaph_set(&(SemB.state),SemStop);
    	}
      //Si estem a qualsevol altre estat (per exemple Off), no facis res.
  	}
    //Els ticks no han arribat a 0. Resta una unitat a ticks.
  	else control.ticks--;
}
