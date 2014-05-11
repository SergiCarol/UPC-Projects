#include <inttypes.h>
#include "mchar.h"
#include <avr/io.h>
mchar_t mchar_add(mchar_t m, msign_t s){
  
    //posicio = 7 - mchar_len(m);
  uint8_t comptador;
  comptador = mchar_len(m);
  if(comptador < 5){ //Si no has acabado, devuelve error
    if (s == 0){ //Si s es un dot por un dot
      m++;
    }
    else{        //Si no, pon un dash
      if(comptador == 0)  m|=8;
      if(comptador == 1)  m|=16;
      if(comptador == 2)  m|=32;
      if(comptador == 3)  m|=64;
      if(comptador == 4)  m|=128;
      m++;
    } 
    return m;
  }
}

//------------------------------------------------------

mchar_iter_t mchar_iter(mchar_t m){

  mchar_iter_t iter;
  iter.m = m;
  iter.mask = _BV(7);
  iter.sentinel = _BV(7-mchar_len(m));
  return iter;

}

msign_t mchar_next(mchar_iter_t *const i){

  msign_t a;
  mchar_t b = i->m;
  b &= i->mask;

  if (b == (*i).mask) a = MDash;
  else a = MDot;
  i->mask = (i->mask >> 1);
  return a;
}


bool mchar_valid(mchar_iter_t i){
  
  if(i.mask > i.sentinel) return true;
  else return false;
}



