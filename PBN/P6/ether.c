#include "ether.h"



#define DOT 50
#define GAP DOT
#define DASH 3*DOT
#define LETTERGAP 3*DOT


static queue_t m;
static mchar_iter_t mchar;
static mchar_t t; 
static void dot(void);
static void dash(void);
static void gap(void);
static void down(void);
static void automat(void);


void ether_init(void){
  modulator_init();
  timer_init();
  queue_empty(&m);
}

void ether_put(uint8_t c){
  bool a;
  a= queue_is_empty(&m);
  // Ens esperem mentres linia cua estigui plena
  while (queue_is_full(&m));
  // Un cop ho deixa de estar afegim el caracter C a la cua
  queue_enqueue(&m,c);
  /* Basicament si no hem acabat de transmetre ens esperarem, ja que la mc_i encara 
     estaria sobre un caracter que podem transmetre (. o -) */
  if (a && !mchar_valid(mchar)) automat();
}

static void automat (void){
  uint8_t a;
  if (queue_is_empty(&m)==true){
		// Aqui hi va algu??? no,no????
  }
  // Crec que aixo es podria fer més façil, pero quedaria una linia tope llarga 
  else{
    a=queue_front(&m);
    t=mtbl_a2m(a);
    mchar=mchar_iter(t);
    queue_dequeue(&m);
    // Si el caracter es un punt, pues fem un punt
    // Recordar que el mchar_next dona el valor del que estem ara i l'avança
    if (mchar_next(&mchar)==MDot) dot();
    // Si no, fem una ratlla
    else dash();
  }
}


static void dot(void){
  // Si es una punt engegem el modulator i ens esperem el temps de punt
  modulator_set(true);
  timer_after(TIMER_MS(DOT),down);
}

static void dash(void){
  // Lo mateix pero amb temps de ratlla
  modulator_set(true);
  timer_after(TIMER_MS(DASH),down);
}

static void gap(void){
  // En el cas de que sigui un punt pues anem a fer un DOT
  if (mchar_next(&mchar)==MDot) dot();
  // Si no, una ratlla
  else dash();
}

static void down(void){
  modulator_set(false);
  // Comprobem si el caracter que volem enviar es valid
  if (mchar_valid(mchar)){
    // Si ho es fem un silenci de GAP
    timer_after(TIMER_MS(GAP),gap);
  }
  // En cas contrari fem pausa de lletra
  else timer_after(TIMER_MS(LETTERGAP),automat);
}


