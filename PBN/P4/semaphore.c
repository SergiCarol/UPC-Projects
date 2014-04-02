#include <stdio.h>
#include "semaphore.h"
#include <avr/io.h>
#include "gpio_device.h"
#include <stdbool.h>
//Creem variables unicament per aquest modul.
static semaphore_state_t state;  
static pin_direction_t d;
static pin_t verd, groc, vermell;

//Inicialitzem el modul i posem l'estat a SemaphoreOff.
void semaphore_init(void){
  state = 0;  
}

//Força le semafor a l'estat seguent.
void semaphore_next(void){
  //Creem i associem els leds.
  d=Output; //Especifiquem variable pin_direction_t com a sortida.
  verd=pin_create(&PORTD, 5, d); //Associem el port, el pin i el mode.
  groc=pin_create(&PORTD, 6, d);
  vermell=pin_create(&PORTD, 7, d);
  
  if (state==0 || state==4) 	// Comprovem si el estat es 0 o 4.
    state=2;
  else
    state++; //Incrementem valor de l'estat per passar al seguent.
 
  switch(state){
  case 2: //SemaphoreClear
    pin_w(verd,true); //Activa o desactiva el pin segons el boolea.
    pin_w(groc, false);
    pin_w(vermell, false);
    break;
  case 3: //SemaphoreApproach
    pin_w(verd, false);    
    pin_w(groc,true);
    pin_w(vermell, false);
    break;
  case 4: //SemaphoreStop
    pin_w(verd, false);
    pin_w(groc, false);
    pin_w(vermell,true);
    state=1;
    break;
  }
  
}
//Podem l'estat que ens indica 's'.
void semaphore_set(semaphore_state_t s){

  d=Output;
  verd=pin_create(&PORTD, 5, d);
  groc=pin_create(&PORTD, 6, d);
  vermell=pin_create(&PORTD, 7, d);

  state=s; // Fiquem el estat global del semafor al estat s.
  switch(s){
  case 2: //SemaphoreClear
    pin_toggle(verd); //Comuta el valor del pin. 
    pin_w(groc, false);
    pin_w(vermell, false);
    break;
  case 3: //SemaphoreApproach
    pin_w(verd, false);    
    pin_toggle(groc);
    pin_w(vermell, false);
    break;
  case 4: //SemaphoreStop
    pin_w(verd, false);
    pin_w(groc, false);
    pin_toggle(vermell);
    break;
  default: //SemaphoreOff
    pin_w(verd, false);
    pin_w(groc, false);
    pin_w(vermell, false);
  }
}
