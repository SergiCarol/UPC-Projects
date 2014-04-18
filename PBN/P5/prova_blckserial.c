#include "blck_serial.h"
#include <stdbool.h>
#include <stdio.h>
#include <avr/io.h>


int main(void){
  uint8_t c;
  char j[20];
  serial_open();
  while(1){
    c=readline(j,5);
    print (j);
  }
  serial_close();

  return 0;
} 
