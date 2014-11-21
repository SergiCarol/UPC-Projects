#ifndef FRAME_H
#define FRAME_H

#include <stdbool.h>
#include <pbn.h>
#include <ctype.h>
#include <inttypes.h>
#include <stdlib.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <pbn.h>



typedef void (*frame_callback_t)(void);

//Inicialitza el modul i per tant el protocol. Aixo implica que deixara les maquins d'estat en l'estat inicial. En l'estat inicail el protocol comença la transmisso amb el numero de trama "0", per tant el receptor espera rebre aquesta trama, que reconeixera amb un numero de trama "A".
 
void frame_init(void);

bool frame_can_put(void);

//El parametre es la taula block_morse que es vol transmetre
void frame_block_put(const block_morse b);

//Indica quan hi ha disponible un block de dades per llegir i per tan quan es pot cridar frame_block_get()
//bool frame_can_get(void);

//Te com a parametre la taula block_morse on es recollira el missatge, retorna l'adresa del node que ha enviat el misatge
void frame_block_get(block_morse b);

//Alternativa a les dues anteriors. Es cridada quan hi hagi dades disponibles.
void on_frame_recived(frame_callback_t l);
void print(uint8_t j[]);

typedef enum {enviar_0, ACK0, enviar_1, ACK1} state_tx;
typedef enum {ready_tx, accep0, accep1} events_tx;
typedef enum {rebut_0, rebut_1} state_rx;
typedef enum {rep0, rep1} events_rx;

#endif
