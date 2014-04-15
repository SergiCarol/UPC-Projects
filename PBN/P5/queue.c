#include <stdio.h>
#include <stdbool.h>
#include <avr/io.h>
#include "queue.h"
/*Esto es un comentario mal tabulado en Sublime Text*/ 
                                    /*Esto es un comentario mal tabulado en emacs*/


void queue_empty(queue_t *const q){
  /*Inicialitza la cua q a l'estat buit.*/  
	q->punter = 0;
}

bool queue_is_empty(const queue_t *const q){
  /*Retorna true si q és buida.*/
	if(q->punter == 0) return 1;
	else return 0;
}

bool queue_is_full(const queue_t *const q){
  /*Retorna true si q és plena.*/
	if(q->punter == ELEMENTS-1) return 1;
	else return 0;
}

void queue_enqueue(queue_t *const q, uint8_t v){
  /*Encua l'element v a la cua q. Si la cua és plena no encua res.*/
	if(q->punter != ELEMENTS-1){
		q->memoria[q->punter]=v;
		q->punter++;
	}
}

void queue_dequeue(queue_t *const q){
  /*Desencua l¡element del davant de la cua q. Si la cua és buida no
fa res.*/
	if(q->punter != ELEMENTS-1){
		q->memoria[q->punter]=0;
		q->punter--;
	}
}

uint8_t queue_front(const queue_t *const q){
/*Retorna l'element del davant de la cua q. Si la cua és buida retorna
un valor arbitrari.*/
	if (queue_is_empty(q)) return 0;
    else return q->memoria[q->punter];
}


//http://www.sites.upiicsa.ipn.mx/polilibros/portal/Polilibros/P_terminados/EstrRepreDat/Files/listas_circulares.html
