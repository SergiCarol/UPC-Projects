#include <stdio.h>
#include <avr/io.h>
#include <stdbool.h>
#include "gpio_device.h"
#include "modulator.h"



static pin_t a;
void modulator_init(void){
  //Desactivem la sortida.*/

  //a= pin_create(&PORTB,1,Output);
  DDRB |= _BV(PB1);
  PORTB &= ~_BV(PB1);
}

void modulator_set(bool l){
  //Genera l'accio de portadora.
  
  if (l==true){
    PORTB |= _BV(PB1);
    }	
  else{
    PORTB &= ~_BV(PB1);	
  }	

    //pin_w(a,l);

}

