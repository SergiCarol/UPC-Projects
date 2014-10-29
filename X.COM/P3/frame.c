#include "frame.h"

static block_morse tx = t_tx; // transmissio 
static block_morse rx = t_rx; // recepcio

uint8_t numeracio_trama = 0;
uint8_t waiting_for = "A";

static typedef enum {esperant,enviat} estat;
static estat state = esperant;


static void build(const block_morse b);
static void send(void);
static void check(void);
 
void frame_init(void){
	numeracio_trama = 0;
	state = esperant;
	timer_init();
  	ether_init();
  	on_message_recived(check);
}

bool frame_can_put(void){
	if (ether_can_put()){
  		if (state = esperant) return true;
  	}
  	else return false;
}


void frame_block_put(const block_morse b){
	//[0/1,DADES,CHECKSUM]
	build(b);
	send();
}

void frame_block_get(block_morse b){

}

void on_frame_recived(framce_callback_t l){


}



static void build(block_morse b){
	uint8_t i;
	numero num;
	tx[0]=numeracio_trama;
	for (i=1;b[i]!='\0';i++){
		tx[i]=b[i-1];
	}
	num=checksum(tx);
	tx[i++]=num.a;
	tx[i++]=num.b;
	tx[i]='\0';
} 

static void send(void){

}

static void check(void){

	// COMPROVAR ORIGEN 0,1,A,B
	// COMPROVAR LO QUE ESPERAVEM

	ether_block_get(rx);
	if (rx[0]==waiting_for){
		if (check_checksum(rx)){
			if (state_frame==receptor){
				// Algu aqui (Mostrar per pantalla)
				// Enviar confirmacio
				// tx=["numeracio_trama",checksum]
			}
			else if (state_frame == transmissor){
			// Algu aqui (OK)	
			}
		}
	}
}

