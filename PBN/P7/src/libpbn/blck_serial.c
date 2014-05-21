#include "blck_serial.h"
#include <avr/io.h>
#include <avr/interrupt.h>

void print(char s[]){
  /* Envia pel port serie tots el elements de la taula s
     fins que troba un simbol de final de paraula */
  uint8_t i=0, c;
  while(s[i]!='\0'){
    serial_put(s[i]);
    i++;
  }
  serial_put('\r');
  serial_put('\n');
}

int readline(char s[],uint8_t m){
  /* Llegeix un numero de caracters m pel port serie
     i els fica en la taula s, en el cas de que es llegeixi
     un caracter no printable deixa de llegir */
  
  uint8_t i=0,a;
  a=serial_get();
  while (m!=i && isgraph(a)){
      s[i] = a;
      i++;
      a=serial_get();
    
  }
  s[i]='\0';
  return i;
}
