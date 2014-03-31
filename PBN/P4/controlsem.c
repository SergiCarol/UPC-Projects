#include <stdint.h>
#include <stdbool.h>
/*Hacer un include de los modulos necesarios*/
#define tick 100 /*¿Definir así el tiempo de tick?*/

void controlsem_init(void){
	/*Inicialitza el mòdul i el deixa a punt per a ser utilitzat. L'estat
	inicial del semàfor és Off.*/
	semaphore_control sempahore;
	semaphore_init();
}

void tick_monitor(void){
	/*Determina si hi ha alguna ordre del supervisor per llegir. Les
	ordres segueixen el protocol que s'ha explicat a l'apartat 2.1. Si
	és el cas la llegeix i executa l'acció associada a l'ordre.*/

}

void tick_semaphore(void){
	/*Decrementa el nombre de ticks que falten per canviar l'estat del
	semàfor i, si escau, canvia l'estat del semafor. Cal que tingui en
	compte que el semafor pot estar apagat i, en aquest cas, no es
	produeixen rotacions ni es comptabilitzen ticks.*/
		if (semaphore.estat != Off){	/*Si el semaforo está funcionando
										realiza las operaciones de tick.*/
			if(semaphore.ticks_remaining == 0){
				semaphore_next();
				if(semaphore.estat == Clear){
					 semaphore.estat = Approach;
					 sempahore.ticks_remaining = /*Voy por aqui*/	
				}
				else if(semaphore.estat == Approach) semaphore.estat = Stop;
				else semaphore.estat = Clear;
			}
			else {
				semaphore.ticks_remaining--;
			}
		}
}


static typedef struct {	
	uint8_t  estat;						
	uint8_t ticks_remaining;
} semaphore_control;