#include <stdio.h>
#include <stdbool.h>
#include <util/atomic.h>
#include "queue.h"

void queue_empty(queue_t *const q){
  /*Inicialitza la cua q a l'estat buit.*/  
  q->comptador = 0;
  q->punter_lectura = 0;
  q->punter_escritura = 0;
}

bool queue_is_empty(const queue_t *const q){
  /*Retorna true si q és buida.*/
  if(q->comptador == 0) return true;
  else return false;
}

bool queue_is_full(const queue_t *const q){
  /*Retorna true si q és plena.*/
  if(q->comptador == ELEMENTS-1) return true;
  else return false;
}

void queue_enqueue(queue_t *const q, uint8_t v){
  /*Encua l'element v a la cua q. Si la cua és plena no encua res.*/
  
	//Utilitzem l'Atomic.
  ATOMIC_BLOCK(ATOMIC_RESTORESTATE){
    //La cua no es buida?
    if(q->comptador != ELEMENTS-1){
      //La cua conté informació. Encua l'informació.
      q->memoria[q->punter_escritura]=v;
      q->comptador++;
      q->punter_escritura++;
      //Si hem arribat al numero maxim de la cua, torna a començar.
      if(q->punter_escritura == ELEMENTS) q->punter_escritura = 0;
    }
  }
}

void queue_dequeue(queue_t *const q){
  /*Desencua l'element del davant de la cua q. Si la cua és buida no
    fa res.*/
  
  //Utilitzem l'Atomic.
  ATOMIC_BLOCK(ATOMIC_RESTORESTATE){
    //La cua no es buida?
    if(q->comptador != ELEMENTS-1){
      //La cua conté informació. Suma el comptador de lectura per a ignorar el valor davanter actual.
      q->punter_lectura++;
      q->comptador--;
      //Si hem arribat al numero maxim de la cua, torna a començar.
      if(q->punter_lectura == ELEMENTS) q->punter_lectura = 0;			
    }
  }
}

uint8_t queue_front(const queue_t *const q){
  /*Retorna l'element del davant de la cua q. Si la cua és buida retorna
    un valor arbitrari.*/

  //Si la cua es buida retorna un 0.
  if (queue_is_empty(q)) return 0;
  //Si la cua conté alguna cosa envia l'element de davant.
  else{
    return q->memoria[q->punter_lectura];
  }
}

