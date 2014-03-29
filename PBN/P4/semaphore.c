#include<stdio.h>
#include"semaphore.h"
#include<avr/scr_defs.h>
#include<avr/io.h>
#include"gpio_divice.h"

void semaphore_init(void){
  semaphore_state_t state;
  state = SempahoreOff;
  pin_direction_t d;
  d=Output;
  pin_t verd;
  verd=pin_create(&PORTD, 5, d);
  pin_t groc;
  groc=pin_create(&PORTD, 6, d);
  pin_t vermell;
  vermell=pin_create(&PORTD, 7, d);

}
void semaphore_next(void){
  semaphore_init();
  semaphore_state_t state;
  if state!=0{
      if (state>1){
	state++;
	}
      else if (state=4){
	  state=2;
	}
    }
  swich(state){
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

void semaphore_set(sempahore_state_t s){
  state=s;
  swich(state){
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
