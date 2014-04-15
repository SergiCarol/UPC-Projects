#include <stdio.h>
#include "lamp.h"
#include "semaph.h"
#include <avr/io.h>
#include <stdbool.h>

//Creem variables unicament per aquest modul.
static semaph_state_t state;  
static lamp_t l;
/*static lamp_t green, yellow, red;*/

//Inicialitzem el modul i posem l'estat a SemaphoreOff.
void semaph_init(semaph_t *const s, volatile uint8_t *port_green,
uint8_t pin_green, volatile uint8_t *port_yell, uint8_t pin_yell,volatile uint8_t *port_red, uint8_t pin_red){
  state = SemOff;  
}

void semaph_set(semaph_t *const sem, semaph_state_t s){//Fer amb LAMP
  color_t verd, groc, vermell;
  verd=Green;
  groc=Yellow;
  vermell=Red;
  //Fiquem el estat global del semafor al estat s.
  state=s; 
  switch(state){
    //SemaphoreClear
  case SemClear: 
    //Comuta el valor del pin.
    lamp_on(sem.l, verd);
    lamp_off(sem.l, groc);
    lamp_off(sem.l, vermell);
    break;
    //SemaphoreApproach
  case SemApproach: 
    lamp_off(sem.l, verd);    
    lamp_toggle(sem.l, groc);
    lamp_off(sem.l, vermell);
    break;
    //SemaphoreStop
  case SemStop: 
    lamp_off(sem.l, verd);
    lamp_off(sem.l, groc);
    lamp_toggle(sem.l, vermell);
    break;
    //SemaphoreOff
  default: 
    lamp_off(sem.l, verd);
    lamp_off(sem.l, groc);
    lamp_off(sem.l, vermell);
  }
}

semaph_state_t semaph_get(const semaph_t sem){
  return sem.state;
}
