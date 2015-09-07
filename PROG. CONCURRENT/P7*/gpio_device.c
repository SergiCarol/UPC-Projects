#include "gpio_device.h"
#include <stdlib.h>
//Definició per evitar fer port-1 cada cop.
#define DDR(p) ((p-1))

pin_t pin_create(volatile uint8_t *port , uint8_t pin, pin_direction_t d){
  pin_t p;
  int a,b;
  p.port = port;
  p.pin = pin;
  if (d==Input){ 
    /*Input . Creem una serie de bits, agafem que pin es 2: 00000010 a continuació neguem tot : 11111101, fem una and, deixan-ho tot igualmenys el bit pin*/ 
    *DDR(p.port)=((*p.port) & ~(1<<p.pin));	 	  
  }
								
  else if (d==Output) {
    //Fem una OR per tal de ficar el bit pin a 1.
    *DDR(p.port)=((*p.port) | (1<<p.pin));
    //Retornem un objecte pin_t.
    return p;
  }
}

void pin_w(pin_t p,bool v){
  int a,b;
  //Fiquem el bit del pin que volem llegir en mode escriptura.
  *DDR(p.port)=((*p.port) | (1<<p.pin));
  //Comprovem si volem ficar un 0 o un 1.
  if (v == true){
    //Fiquem el valor del pin a 1.
    (*p.port |= (1<<p.pin)); 
  }
  else{
    // Fiquem el valor del pin a 0.
    (*p.port) &= ~(1<<p.pin);
  }
} 

bool pin_r(pin_t p){
  int a,b;
  bool i;
  //Fiquem el DDR del pin en mode lecutra.
  //*DDR(p.port)=((*p.port) & ~(1<<p.pin));
  //Guardem el valor del pin a i.
  i=(*p.port & (1<<p.pin));
  return i;		
}

void pin_toggle(pin_t p){
  bool a;
  //Agafem el valor del pin.
  a=pin_r(p);
  //Si retorna TRUE, parem el led.
  if (a==true) pin_w(p,false);
  //Si retorna FALSE, encenem el led. 
  else pin_w(p,true);
}

void pin_destroy(pin_t *const p){
  //Borrem el port.  
  (*p).port=NULL;
}
