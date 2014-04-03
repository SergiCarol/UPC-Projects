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
  //Especifiquem variable pin_direction_t com a sortida.
  d=Output; 
  //Associem el port, el pin i el mode.
  verd=pin_create(&PORTD, 5, d); 
  groc=pin_create(&PORTD, 6, d);
  vermell=pin_create(&PORTD, 7, d);
  // Comprovem si el estat es 0 o 4.
  if (state==0 || state==4) 	
    state=2;
  else
    //Incrementem valor de l'estat per passar al seguent.
    state++; 
 
  switch(state){
    //SemaphoreClear
  case 2:
    //Activa o desactiva el pin segons el boolea.
    pin_w(verd,true); 
    pin_w(groc, false);
    pin_w(vermell, false);
    break;
    //SemaphoreApproach
  case 3: 
    pin_w(verd, false);    
    pin_w(groc,true);
    pin_w(vermell, false);
    break;
    //SemaphoreStop
  case 4: 
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
  //Fiquem el estat global del semafor al estat s.
  state=s; 
  switch(s){
    //SemaphoreClear
  case 2: 
    //Comuta el valor del pin.
    pin_w(verd,true);  
    pin_w(groc, false);
    pin_w(vermell, false);
    break;
    //SemaphoreApproach
  case 3: 
    pin_w(verd, false);    
    pin_toggle(groc);
    pin_w(vermell, false);
    break;
    //SemaphoreStop
  case 4: 
    pin_w(verd, false);
    pin_w(groc, false);
    pin_toggle(vermell);
    break;
    //SemaphoreOff
  default: 
    pin_w(verd, false);
    pin_w(groc, false);
    pin_w(vermell, false);
  }
}
