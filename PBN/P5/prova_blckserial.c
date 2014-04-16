#include "blck_serial.h"

int main(void){
  uint8_t i=0,c;
  serial_open();
  char s[]="acabaaat\n\r";
  char j[]="";
  c=readline(j,9);
  print (s);
  serial_put(c+0x30);
  serial_put('\n');
  serial_put('\r');
	serial_close();
	return 0;
} 