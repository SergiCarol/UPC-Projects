#include <stdbool.h>
#include <avr/io.h>
#include <util/delay.h>
#include "serial.h"


void test2(void){
  char s[] ="holaquetal";
  serial_put(s[0]);
  serial_put(s[1]);
  serial_put(s[2]);
  serial_put(s[3]);
  serial_put(s[4]);
  serial_put(s[5]);

}	
void test3(char s[]){
  DDRD=0xFF;
  uint8_t a = s[0];
  //s[0] val h
  if (a=='h') PORTD=0xFF;   
  // Pero aqui ja no envia res
  serial_put('h');
  serial_put('o');
  serial_put('l');
  serial_put('a');
  serial_put('q');
  serial_put('u');

} 
void test(char s[]){
  uint8_t i=0;;
  for (i=0;i<5;i++){ 
    serial_put((uint8_t)s[i]);

  }  
}

int main(void){
  uint8_t a;
  char s[] ="holaquetal";
  serial_open();
  
  //test(s);        // Com crec que seria el blck_serial print
  //test2();      // Aquet test funciona
  test3(s);     // En canvi aquet ja no

  serial_close();
  return 0;
}