#include "checksum.h"

uint8_t main (void) {
  numero num;
  uint8_t i=0,a;
  bool state;
  char j[64];
  serial_open();
  while(true){
    char s[]="Escriu alguna cosa";
    print(s);
    while (serial_can_read());
    readline(j,64);
    print(j);
    state = check_crc(j);
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
