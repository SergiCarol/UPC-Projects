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
 
    state = check_checksum(j);
    if (state == true)
      {	
        char p[]="True";
        print(p);	
      }
    else
      {
        char d[]="Fals";
        print(d);
      }
  }
  serial_close();
  return 0; 
}
