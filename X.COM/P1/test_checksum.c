#include "checksum.h"

uint8_t main (void) {
  numero num;
  uint8_t i=0,a;
  bool state;
  char j[64];
  char s[]="Escriu alguna cosa";
  serial_open();
  print(s);
  while (serial_can_read());
  readline(j,64);
  print(j);
  num = checksum(j);
  while(j[i]!='\0'){
    i++;
  }
  j[i++] = num.b;
  j[i++] = num.a;
  j[i] = '\0';
  //-----------------------------------
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
  serial_close();
  return 0; 
}
