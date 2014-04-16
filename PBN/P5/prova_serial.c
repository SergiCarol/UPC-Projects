#include <stdbool.h>
#include <avr/io.h>
#include <util/delay.h>
#include "serial.h"

void test(void){
 	while (1){
  	serial_put(serial_get());
  } 
}

int main(void){
  serial_open();
  
  test();        // Com crec que seria el blck_serial print

  serial_close();
  return 0;
}