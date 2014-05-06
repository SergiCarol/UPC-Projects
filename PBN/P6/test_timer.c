#include <avr/io.h>
#include <avr/interrupt.h>
#include "timer.h"
#include "lamp.h"
static lamp_t lamp; 

void lamp_red(void) {

  lamp_toggle(lamp, Red);
}

void lamp_green(void) {

  lamp_toggle(lamp, Green);
}


int main(void) { 
  timer_init();
  lamp_init(&lamp ,&PORTD, 5 ,&PORTD, 6,&PORTD,7);
  sei();
  timer_every(TIMER_MS(1000),lamp_red);
  timer_every(TIMER_MS(500),lamp_green);
  for(;;);
  return 0;
}
