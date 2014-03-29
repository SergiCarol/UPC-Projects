#include <stdint.h>
#include <stdbool.h>
/*Hacer un include de los modulos necesarios*/
#define tick 100 /*¿Definir así el tiempo de tick?*/

void controlsem_init(){
	/*Inicialitza el mòdul i el deixa a punt per a ser utilitzat. L'estat
	inicial del semàfor és Off.*/

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

}
