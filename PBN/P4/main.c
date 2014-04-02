#include"controlsem.h"
#include<stdio.h>
#include<util/delay.h>

int main(void){
  controlsem_init(); //Inicialitzem controlsem.
  while(1){ //Creem bucle indefinidament.
    _delay_ms(100); //Espera 100ms.
    tick_monitor();
    tick_semaphore();
  }
 }
