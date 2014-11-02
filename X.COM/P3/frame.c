#include "frame.h"

#define MAX_TRY 3


uint8_t t_tx[32];
uint8_t t_rx[32];
static block_morse tx = t_tx; // transmissio 
static block_morse rx = t_rx; // recepcio

uint8_t numeracio_trama = 0;
uint8_t waiting_for = 'A';


static estat state = esperant;
static frame_callback_t funcio;
static pin_t pin;
static uint8_t intens=0;

static void build(const block_morse b);
static void send(void);
static void check(void);
static void next(void);
static void time_out(void);

void frame_init(void){
	numeracio_trama = 0;
	waiting_for = 'A';
	state = esperant;
	timer_init();
  	ether_init();
  	on_message_received(check);
  	pin = pin_create(&PORTB,5,Output);
  	pin_w(pin,false);
}

bool frame_can_put(void){
	if (ether_can_put()){
  		if (state = esperant) return true;
  		else return false;
  	}
  	else return false;
}


void frame_block_put(const block_morse b){
	//[0/1,DADES,CHECKSUM]
	// Tenim que esperanr-nos fins que haguem acabat de enviar i rebre la confirmacio
	state = enviant;
	build(b);
	send();
}

void frame_block_get(block_morse b){
  uint8_t i;
  for (i=0;rx[i+2]!='\0';i++){
    b[i]=rx[i+2];
  }
  b[i-1]='\0';
}

void on_frame_recived(frame_callback_t l){
	funcio=l;
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
	if (intens < MAX_TRY){
    	if(frame_can_put()){
      	// Si el canal no esat ocupat enviem
      	ether_block_put(tx);
      	for(uint8_t i=0; i<64;i++) tx[i]='\0';
    }
    else{
      // Si el canal esta ocupat sumem 1 als intents
      intens++;
      // Esperem un temps aleatori i tornem a provar.
      timer_after(TIMER_MS(rand()%((10+1)*1000)),send);
    }
  }
  // En el cas de que no s'hagi pogut enviar encenem el LED
  else pin_w(pin,true);
}

static void time_out(void){
	
}

static void check(void){
	ether_block_get(rx);
	// Comprovem si hem rebut lo que esperavem
	if (rx[0]==waiting_for){
		// Comprovem el crc
		if (check_checksum(rx)){
/*			// Fem els canvis oportuns al numeracio_trama i al waiting_for
			next();
			// Mirem si som transmissor o receptor
			if ((rx[0]==0) || (rx[0]==1)) {		
				// Enviem un missatge sense informacio ( acabar de mirar )
				frame_block_put("\0");
				// Cavniem el estat a esperant
				state = esperant;
*/				// I cridem la funcio perque ens mostri per pantalla el missatge rebut
				funcio();
			}
			// Si som el transmissor 
			/*else{
				// Ja hem rebut la confirmacio i per tan podem tornar a enviar
				state = esperant;
				// Serial_put de confirmacio nse si fa falta
				serial_put('K');
				serial_put('\r');
				serial_put('\n');
			}
		*/
	}
}

void next(void){
	if ((rx[0]==0) || (rx[0]==1)){
		// Mirem la numeracio de la trama
		if (rx[0]==0){
			// Si hem rebut un 0 tenim que enviar un missatge de confirmacio amb una A
			numeracio_trama = 'A';
			// I el seguent missatge que rebem te que començar per 1
			waiting_for = 1;
		}
		else {
			// En cas contrari tenim que enviar una B
			numeracio_trama = 'B';
			// I el seguent missatge te que començar per 0
			waiting_for = 0;
		}
	}
	// En el cas de que siguem el transmissor
	else {
		// Comprovem si el missatge de confirmacio es una A
		if (rx[0]=='A'){
			// Si ho es el seguent missatge te que començar amb un 1
			numeracio_trama = 1;
			waiting_for = 'B';
		}
		else {
			numeracio_trama = 0;
			waiting_for = 'A';
		}
	}
}

void print(char s[]){
  /* Envia pel port serie tots el elements de la taula s
     fins que troba un simbol de final de paraula */
  uint8_t i=0, c;
  while(s[i]!='\0'){
    serial_put(s[i]);
    i++;
  }
  serial_put('\r');
  serial_put('\n');
}
