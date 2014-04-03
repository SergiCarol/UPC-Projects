#include <stdio.h>

/*Esto es un comentario mal tabulado en Sublime Text*/ 
                                    /*Esto es un comentario mal tabulado en emacs*/



void queue_empty(queue_t *const q){
  /*Inicialitza la cua q a l'estat buit.*/
}

bool queue_is_empty(const queue_t *const q){
  /*Retorna true si q és buida.*/
}

bool queue_is_full(const queue *const q){
  /*Retorna true si q és plena.*/
}

void queue_enqueue(queue_t *const q, uint8_t v){
  /*Encua l'element v a la cua q. Si la cua és plena no encua res.*/
}

void queue_dequeue(queue_t *const q){
  /*Desencua l¡element del davant de la cua q. Si la cua és buida no
fa res.*/
}

uint8_t queue_front(const queue_t *const q){
  /*Retorna l'element del davant de la cua q. Si la cua és buida retorna
un valor arbitrari.*/
}


//http://www.sites.upiicsa.ipn.mx/polilibros/portal/Polilibros/P_terminados/EstrRepreDat/Files/listas_circulares.html
