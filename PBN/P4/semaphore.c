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
  d=Output;
  verd=pin_create(&PORTD, 5, d);
  groc=pin_create(&PORTD, 6, d);
  vermell=pin_create(&PORTD, 7, d);
  
  if (state==0 || state==4)
    state=2;
  else
    state++; //Incrementem valor de l'estat per passar al seguent.
 
  switch(state){
  case 2: //SemaphoreClear
    pin_w(verd,true);
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

  state=s;
  switch(s){
  case 2: //SemaphoreClear
    pin_toggle(verd);
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
