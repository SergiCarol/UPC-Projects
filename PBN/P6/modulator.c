#include <stdio.h>
#include <avr/io.h>
#include <stdbool.h>
#include "modulator.h"

void modulator_init(void){
  //Desactivem la sortida.*/
  DDRB |= _BV(PB0);
  PORTB &= ~_BV(PB0);
}

void modulator_set(bool l){
  //Genera l'accio de portadora.
  if (l==true){
    PORTB |= _BV(PB0);
    }	
  else{
    PORTB &= ~_BV(PB0);	
  }	
}

