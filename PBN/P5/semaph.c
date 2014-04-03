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

void semaph_set(semaph_t *const sem, semaph_state_t s){}

semaph_state_t semaph_get(const semaph_t sem){}
