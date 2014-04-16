#include "queue.h"
#include <stdbool.h>
#include <stdio.h>
#include <inttypes.h>

#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/atomic.h>

//#define ATOMIC_BLOCK(type): Crea un bloc que es executat atomicament. El flag de Global Interrupt Status del SREG és 0 quan entrem en el bloc i 1 al sortir.
//#define ATOMIC_FORCEON: paràmetre del ATOMIC_BLOCK, força a aquest a habilitar les interrupcions.
//#define ATOMIC_RESTORESTATE: paràmetre del ATOMIC_BLOCK, restaura el valor del registre SREG, guardat abans de que el bit I del SREG fos deshabilitat.

void queue_empty(queue_t *const q){
  //Inicialitza una cua buida.
    q->inici=0;
    q->final=0;
}

bool queue_is_empty(const queue_t *const q){
  //Retorna true ssi q es buida.
    return (q->inici==q->final);
  
}

bool queue_is_full(const queue_t *const q){
  //Retorna true ssi q es plena.
  if (q->inici!=0) {
      return ((q->final-1)==(q->inici));
    }
}

void queue_enqueue(queue_t *const q, uint8_t v){
  //Encua l'element v a la cua q. Si es plena no encua res.
  ATOMIC_BLOCK(ATOMIC_RESTORESTATE){
    if (!queue_is_full(q)){
      (q->cua)[q->final]=v;
      q->final=((++(q->final))%50);
    }
  }
}

void queue_dequeue(queue_t *const q){
  //Desencua l'element del davant de la cua q. Si es buida no fa res.
  ATOMIC_BLOCK(ATOMIC_RESTORESTATE){
    if (!queue_is_empty(q))
      q->inici=((++(q->inici))%50);
  }
}

uint8_t queue_front(const queue_t *const q){
  //Retorna l'element del davant de la cua q. Si es buida torna un valor arbitrari.
  if (!queue_is_empty(q))
    return (q->cua)[q->inici];
  else
    return 0;
}
