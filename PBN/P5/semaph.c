#include <stdio.h>
#include "lamp.h"
#include "semaph.h"
#include <avr/io.h>
#include <stdbool.h>

//Creem variables unicament per aquest modul.
static semaph_state_t state;  
//static pin_direction_t d;
static lamp_t verd, groc, vermell;

//Inicialitzem el modul i posem l'estat a SemaphoreOff.
void semaph_init(semaph_t *const s, volatile unit8_t *port, unit8_t pin){
  state = SemOff;  
}

void semaph_set(semaph_t *const sem, semaph_state_t s){
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

semaph_state_t semaph_get(const semaph_t sem){
  return sem.s;
}
