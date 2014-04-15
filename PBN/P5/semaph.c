#include <stdio.h>
#include <avr/io.h>
#include <stdbool.h>
#include "lamp.h"
#include "semaph.h"



//Inicialitzem el modul i posem l'estat a SemaphoreOff.
void semaph_init(semaph_t *const s, volatile uint8_t *port_green, uint8_t pin_green, volatile uint8_t *port_yell, uint8_t pin_yell,volatile uint8_t *port_red, uint8_t pin_red){
  lamp_init(&((s)->l) , port_green, pin_green , port_yell, pin_yell, port_red, pin_red);
  (*s).s = SemOff;  
}

void semaph_set(semaph_t *const sem, semaph_state_t s){
  //Fiquem el estat global del semafor al estat s.
  (*sem).s=s; 
  switch(s){
    //SemaphoreClear
  case SemClear: 
    //Comuta el valor del pin.
    lamp_on((*sem).l, Green);
    lamp_off((*sem).l, Yellow);
    lamp_off((*sem).l, Red);
    break;
    //SemaphoreApproach
  case SemApproach: 
    lamp_off((*sem).l, Green);
    lamp_on((*sem).l, Yellow);
    lamp_off((*sem).l, Red);
    break;
    //SemaphoreStop
  case SemStop: 
    lamp_off((*sem).l, Green);
    lamp_off((*sem).l, Yellow);
    lamp_on((*sem).l, Red);
    break;
    //SemaphoreOff
  default: 
    lamp_off((*sem).l, Green);
    lamp_off((*sem).l, Yellow);
    lamp_off((*sem).l, Red);
  }
}

semaph_state_t semaph_get(const semaph_t sem){
  return sem.s;
}
