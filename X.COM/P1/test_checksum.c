#include "checksum.h"

uint8_t main (void) {

  numero num;
  uint8_t i=0,a;
  bool state;
  char j[64];

  char s[]="Escriu alguna cosa:";
  serial_open();
  while(1){
    print(s);
    while (serial_can_read());
    readline(j,64);
    print(j);
    num = checksum(j);
    serial_put(num.a);
    serial_put(num.b);
    serial_put('\n');
    serial_put('\r');
    i=0;
    while(j[i]!='\0'){
      i++;
    }
    j[i++] = num.a;
    j[i++] = num.b;
    j[i] = '\0';
  }
  serial_close();
  return 0; 
}
