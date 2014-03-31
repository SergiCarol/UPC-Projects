#include <stdio.h>
#include "semaphore.h"
#include <avr/io.h>
#include "gpio_device.h"
#include <stdbool.h>

static semaphore_state_t state;
static pin_direction_t d;
static pin_t verd, groc, vermell;

void semaphore_init(void){
  state = 0;
  
}
void semaphore_next(void){
  semaphore_init();
  
  d=Output;
  verd=pin_create(&PORTD, 5, d);
  groc=pin_create(&PORTD, 6, d);
  vermell=pin_create(&PORTD, 7, d);
  
  if (state==0 || state==4)
    state=2;
  else
    state++;
 
  switch(state){
  case 2:
    pin_w(verd,true);
    pin_w(groc, false);
    pin_w(vermell, false);
    break;
  case 3:
    pin_w(verd, false);    
    pin_w(groc,true);
    pin_w(vermell, false);
    break;
  case 4:
    pin_w(verd, false);
    pin_w(groc, false);
    pin_w(vermell,true);
    state=1;
    break;
  }
  
}

void semaphore_set(semaphore_state_t s){
  semaphore_init();

  d=Output;
  verd=pin_create(&PORTD, 5, d);
  groc=pin_create(&PORTD, 6, d);
  vermell=pin_create(&PORTD, 7, d);

  state=s;
  switch(s){
  case 2:
    pin_toggle(verd);
    pin_w(groc, false);
    pin_w(vermell, false);
    break;
  case 3:
    pin_w(verd, false);    
    pin_toggle(groc);
    pin_w(vermell, false);
    break;
  case 4:
    pin_w(verd, false);
    pin_w(groc, false);
    pin_toggle(vermell);
    break;
  default:
    pin_w(verd, false);
    pin_w(groc, false);
    pin_w(vermell, false);
  }
}
