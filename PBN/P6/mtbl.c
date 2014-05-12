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

/* Taula ASCII, amb els caracters codificats a la taula_m*/
static uint8_t taula_c[] = " ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

char mtbl_m2a(mchar_t c){
  /*Assignem un valor de caracter inicial -buit- */
  char v= 0;
  int i=0;
  /* Fem recerca a la taula per obtenir l'index
   i retornar el caracter corresponent o be enviar 
   el predefinit inicialment */
  while(c!=taula_m[i])i++;
  if(i<37) v=taula_c[i];
  return v;
}

mchar_t mtbl_a2m(char c){
    /*Assignem un valor de m_char inicial -buit- */
  mchar_t mv=mchar_empty;
  int i=0;
  /* Fem recerca a la taula per obtenir l'index
   i retornar el mchar_t corresponent o be enviar 
   el predefinit inicialment */
  while(c!=taula_c[i])i++;
  if(i<37) mv=taula_m[i];
  return mv;
}
