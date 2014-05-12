#include <avr/io.h>
#include "mtbl.h"
#include "mchar.h"

/*Taula de codificació de mchar_t*/
static mchar_t taula_m[] = {
  mchar(01010), 
  mchar(01), 
  mchar(1000),
  mchar(1010),
  mchar(100),
  mchar(0),
  mchar(0010), 
  mchar(110),
  mchar(0000),
  mchar(00),
  mchar(0111),
  mchar(101),
  mchar(0100),
  mchar(11),
  mchar(10),
  mchar(111),
  mchar(0110),
  mchar(1101),
  mchar(010),
  mchar(000),
  mchar(1),
  mchar(001),
  mchar(0001),
  mchar(011),
  mchar(1001),
  mchar(1011),
  mchar(1100),
  mchar(11111), 
  mchar(01111), 
  mchar(00111), 
  mchar(00011),
  mchar(00001),
  mchar(00000),
  mchar(10000),
  mchar(11000),
  mchar(11100),
  mchar(11110)
};


char mtbl_m2a(mchar_t m){
  char v;
  uint8_t i;
  for(i=0;m!=taula_m[i]&&i<37;i++);
  if(i<37) v=taula_c[i];
  else v=0;
  return v;
}

mchar_t mtbl_a2m(char c){
  mchar_t m=mchar_empty;
  uint8_t i=0;
  for(i=0;c!=taula_c[i]&&i<37;i++);
  if(i<37)m=taula_m[i];
  else m=0;
  return m;
}
