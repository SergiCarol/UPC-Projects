#include "blck_serial.h"
#include <stdbool.h>
#include <avr/io.h>



bool test(void){

  uint8_t i=0,c;
  char s[]="acabaaat\n\r";
  char j[]="";
  char y[]="";
  c=readline(j,9);
  print (s);
  serial_put(c+0x30);
  return true;
}


void test2(void){
  while(1){
    serial_put(serial_get());
  }
}

int main(void){

  bool a;

  serial_open();
  test2();
  serial_put('\n');
  serial_put('\r');
  serial_close();
  PORTD=0xFF ;
  return 0;
} 
