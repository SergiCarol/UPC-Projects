#include <stdio.h>
#include "semaphore.h"
#include "serial_device.h"
#include "controlsem.h"
#include <avr/io.h>
#include <inttypes.h>

#define Off 0
#define Clear 2
#define Approach 3
#define Stop 4

/*Definimos la variable state en global. Si no lo hacemos así tendremos problemas a la hora
de acceder a esta variable.*/
static semaphore_state_t state;
/* Definimos la variable ticks remaining en global*/
static uint8_t ticks_remaining;
/*Definimos los mensajes que enviaremos*/


uint8_t i;

void controlsem_init(void){
	/*Inicialitza el mòdul i el deixa a punt per a ser utilitzat. L'estat
	inicial del semàfor és Off.*/
	semaphore_init();
  	serial_init();
}

void tick_monitor(void){
	/*Determina si hi ha alguna ordre del supervisor per llegir. Les
	ordres segueixen el protocol que s'ha explicat a l'apartat 2.1. Si
	és el cas la llegeix i executa l'acció associada a l'ordre.*/	
	uint8_t char_order;
	if(serial_can_read()){	//Si hay algun tipo de información para leer, haz el proceso
		char_order = serial_get();
		if(char_order == 'E'){			//Si hemos recibido una 'E' (Emergency)
				if (state!=Off){
					state = Clear;
					semaphore_set(state);
					ticks_remaining = 40;
								/*Enviar el mensaje de "Emergency"*/
					
					serial_put('E');
					serial_put('M');
					serial_put('E');
					serial_put('R');
					serial_put('G');
					serial_put('E');
					serial_put('N');
					serial_put('C');
					serial_put('Y');
					serial_put('\n');
						
					
				}
				else {
					serial_put('N');	
					serial_put('\n');
				}
		}
	
		else if(char_order == 'S'){
			if(state != Off){
				state=Off;
				semaphore_set(state);
				//for(i=0;i<=8;i++){
				serial_put('S');
				serial_put('H');
				serial_put('U');
				serial_put('T');
				serial_put('D');
				serial_put('O');
				serial_put('W');
				serial_put('N');
				serial_put('\n');
				//}
			}
			else{
				serial_put('J');
				serial_put('\n');
			}
	}
		else if(char_order == 'R'){
			if(state == Off){
				state = Clear;
				semaphore_set(state);
				ticks_remaining = 40;
				
				/*Enviar el mensaje de "restart"*/
				//for(i=0;i<7;i++){
				serial_put('R');
				serial_put('E');
				serial_put('S');
				serial_put('T');
				serial_put('A');
				serial_put('R');
				serial_put('T');
				serial_put('\n');
				//}
				
			}
			else{
				serial_put('J');
				serial_put('\n');
			}
		}
	}
}


void tick_semaphore(void){
	/*Decrementa el nombre de ticks que falten per canviar l'estat del
	semàfor i, si escau, canvia l'estat del semafor. Cal que tingui en
	compte que el semafor pot estar apagat i, en aquest cas, no es
	produeixen rotacions ni es comptabilitzen ticks.*/
	if (state != Off){
		if(ticks_remaining == 0){
			if(state == Clear){
				semaphore_next();
				state = Approach;
				ticks_remaining = 10;
			}
			else if(state == Approach){
				semaphore_next();
				state = Stop;
				ticks_remaining = 60;
			}
			else if(state == Stop){
				semaphore_next();
				state = Clear;
				ticks_remaining = 40;
			}
		}
		else{
			ticks_remaining--;}
		
}
}