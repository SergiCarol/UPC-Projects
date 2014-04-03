#include"controlsem.h"
#include<stdio.h>
#include<util/delay.h>

int main(void){
  //Inicialitzem controlsem.
  controlsem_init();
  //Creem bucle indefinidament.
  while(1){ 
    //Espera 100ms.
    _delay_ms(100); 
    tick_monitor();
    tick_semaphore();
  }
 }
