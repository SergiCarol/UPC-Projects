#include <stdio.h>
#include <avr/io.h>
#include <stdbool.h>
#include "modulator.h"

void modulator_init(void){/*
  OCR2A = 0b01111100;
  //Inicialitzem Timer 2 en mode CTC i prescaler=64.
  TCCR2A = 0b01000010;
  TCCR2B = 0b00000100;
  //Posem el contador a zero.
  TCNT2 = 0;
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
    /*DDRB &= ~_BV(PB6);*/
    PORTB &= ~_BV(PB0);	
  }	
}

