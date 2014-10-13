#include "lan.h"

#define pendent_enviar 0 // suposu que es fa aixi xD False
#define esperant 1	// ^ True
#define MAX_TRY 3 // Numero maxim d'intens

static block_morse fix(const block_morse b, uint8_t nd);

block_morse tx[32]; // transmissio 
block_morse rx[32]; // recepcio

static uint8_t node_origen; // guardem el node d'origen
static uint8_t intens = 0; // Numero d'intens d'enviar (MAXIM TRES)
static uint8_t estat;
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
	block_morse t;
	t=fix(b,nd);
	// Passar a estat pendent_enviar 
	// COmrpovar intents (fer funcior que miri el lan_can_put, si retorna fals 3 cops print ERROR (ENRIC))
	ether_block_put(t);
}

void on_lan_recived(lan_callback_t l){
	// on_message_recived del ether???
}




static block_morse fix(const block_morse b, uint8_t nd){
	uint8_t t[32];
	uint8_t i = 0;

	t[i++]=node_origen;  // node origen ve de la variable global
	t[i++]=nd // node desti

	for (;b[i-2]!='\0';i++){
		t[i]=b[i-2];      // fiquem els valors del block morse dintre la taula
	}
	// checksum, fa falta?????

	return t;
}
// Faltarien fer mes funcions estatiques per comprovar coses...