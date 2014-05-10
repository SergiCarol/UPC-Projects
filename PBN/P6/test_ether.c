#include <avr/interrupt.h>

#include <avr/io.h>

#include <util/delay.h>

#include "ether.h"

#include "timer.h"

char msg[]="SOS";

int main(void){

  



  ether_init();

  sei();

  uint8_t i=0;

  while(msg[i]){

    ether_put(msg[i]);

    i++;

  }

  for(;;);

  return 0;

}
