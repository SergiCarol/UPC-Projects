#include "error_morse.h"
#include <string.h>
#include <stdio.h>
#include <util/crc16.h>

static numero byte2hex(uint8_t b){
  numero resultat;
  resultat.a=b2h(b>>4);
  resultat.b=b2h(b&0x0F);
  return resultat;
}

uint8_t hex2byte(numero b){
  uint8_t high, low;
  high=((h2b(b.a))<<4);
  low=(h2b(b.b));
  return high+low;
}

static uint8_t b2h(uint8_t b){
  if (b>=0 & b<10) //0-9
    return b+48;
  else if (b>=10 && b<16) //10-15
    return b+55;
}

static uint8_t h2b(uint8_t b){
  if (b>=48 & b<58) //Ascii 0-9
    return b-48;
  else if (b>=65 && b<71) //A-F
    return b-55;
}



numero check_morse(uint8_t dades[120]){
  uint8_t carry=0;
  uint16_t suma=0;
  for (uint8_t i=0; dades[i]!='\0'; i++)
    suma+=dades[i];
  while (suma>255) {//Mentre que suma sigui mes gran que 0xFF (hi ha carry), sumem la part de "suma" sense el carry + la part de "suma" amb nomes el carry.
    carry=(suma>>8);
    suma&=0xFF;
    suma+=carry;
  }
  // suma=(suma&0xFF)+ (suma>>8);
  suma=~suma; //Invertim el resultat*/
  return byte2hex(suma);
}

numero crc_morse(uint8_t dades[120]){
  uint8_t resultat=0;
  for (uint8_t i=0; dades[i]!='\0'; i++)
    resultat=_crc_ibutton_update(resultat, dades[i]);
  return byte2hex(resultat);
}


bool test_check_morse(uint8_t dades[120]){
  numero num;
  uint16_t r2=0;
  uint8_t r1=0, i=0, i2=0, carry=0;
  for (i; dades[i]!='\0'; i++); //longitud de la taula
  num.a=dades[i-2]; //Part alta de la redundancia
  num.b=dades[i-1]; //Part baixa de la redundancia
  r1=hex2byte(num); //Convertim a byte la redundancia
  for (i2; i2<(i-2); i2++)
    r2+=dades[i2];
  while (r2>255) {//Mentre que suma sigui mes gran que 0xFF (hi ha carry), sumem la part de "suma" sense el carry + la part de "suma" amb nomes el carry.
    carry=(r2>>8);
    r2&=0xFF;
    r2+=carry;
  }
  r2+=r1;
  
  if (r2==0xFF)
    return true;
  else
    return false; 
}

bool test_crc_morse(uint8_t dades[120]){
  numero num;
  uint8_t r1=0, i=0, i2=0, r2=0;
  for (i; dades[i]!='\0'; i++); //longitud de la taula
  num.a=dades[i-2]; //Part alta de la redundancia
  num.b=dades[i-1]; //Part baixa de la redundancia
  r1=hex2byte(num); //Convertim a byte la redundancia
  for (i2; i2<(i-2); i2++)
    r2=_crc_ibutton_update(r2, dades[i2]);
  r2=_crc_ibutton_update(r2, r1);
  if (r2==0x00)
    return true;
  else
    return false;
}


