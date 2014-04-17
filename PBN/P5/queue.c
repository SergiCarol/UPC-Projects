#include <stdio.h>
#include <stdbool.h>
#include <util/atomic.h>
#include "queue.h"
/*Esto es un comentario mal tabulado en Sublime Text*/ 
                                    /*Esto es un comentario mal tabulado en emacs*/


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
	ATOMIC_BLOCK(ATOMIC_RESTORESTATE){
		if(q->comptador != ELEMENTS-1){
			q->memoria[q->punter_escritura]=v;
			q->comptador++;
			q->punter_escritura++;
			if(q->punter_escritura == ELEMENTS) q->punter_escritura = 0;
		}
	}
}

void queue_dequeue(queue_t *const q){
  /*Desencua l¡element del davant de la cua q. Si la cua és buida no
fa res.*/
	ATOMIC_BLOCK(ATOMIC_RESTORESTATE){
		if(q->comptador != ELEMENTS-1){
			q->punter_lectura++;
			q->comptador--;
			if(q->punter_lectura == ELEMENTS) q->punter_lectura = 0;
		}
	}
}

uint8_t queue_front(const queue_t *const q){
/*Retorna l'element del davant de la cua q. Si la cua és buida retorna
un valor arbitrari.*/
	if (queue_is_empty(q)) return 0;
    else{
    	//q->comptador--;
    	//q->punter_lectura++;
    	/*if(q->punter_lectura == ELEMENTS){
    		q->*punter_lectura = 0;
    		return q->memoria[ELEMENTS-1];
    	} 
    	else{*/
    		return q->memoria[q->punter_lectura];
    	//}
    }
}


//http://www.sites.upiicsa.ipn.mx/polilibros/portal/Polilibros/P_terminados/EstrRepreDat/Files/listas_circulares.html
