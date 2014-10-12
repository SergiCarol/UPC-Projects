#include "ether.h"
#include "lan.h"

#define pendent_enviar 0
#define esperant 1

block_morse tx[64]; // transmissio
block_morse rx[64]; // recepcio

static uint8_t node_origen;
static uint8_t intens = 0;

void lan_init(uint8_t no){	

	node_origen = no;
	ether_init();
	serial_init();
	timer_init()
	// acabat
}

bool lan_can_put(void){
	return ether_can_put(); // true, fals o pendent_enviar / esperant ??
}

void lan_block_put(const block_morse b , uint8_t nd){
	// [no,nd,missatje,checksum]
	// Fer funcio per ficar ^ ????
	// COmrpovar intents (fer funcior que miri el lan_can_put, si retorna fals 3 cops print ERROR)
	ether_block_put(b)
}

void on_lan_recived(lan_callback_t l){
	// on_message_recived del ether???
}

// Faltarien fer mes funcions estatiques per comprovar coses...