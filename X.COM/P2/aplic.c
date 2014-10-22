#include "aplic.h"

	
uint8_t ta_tx[32];
uint8_t ta_rx[32];
static block_morse tx_H = ta_tx; // transmissio 
static block_morse rx_H = ta_rx; // recepcio

static void pinta(void);

void main(void){
	uint8_t a,i=0,b;
	serial_init();
	sei();
	print("Escriu el node d'origen i a continuacio el de desti");
	while(serial_can_read()==false);
	a=serial_get();
	serial_put(a);
	lan_init(a);
	on_lan_recived(pinta);
	while(true){
		begin:
		serial_put('-');
		serial_put('>');
		b=serial_get();
		serial_put(b);
		  //print("\r\nEscriu el missatge");
		serial_put(':');
	// -------------------------------------------------------------
		while(serial_can_read()==false);
		a=serial_get();
		while (a!='\r'){
			serial_put(a);
			if (a=='r'){
				estat=esperant;
				i=0;
				print("\n\rHas reiniciat el programa.");
				a='\r';
				break;
				
			}
			else {
				tx_H[i++]=a;
				a=serial_get();
			}
		}
		while (lan_can_put()==pendent_enviar);
		if (i>0){
		  // print(tx_H);
			tx_H[i]='\0';
			i=0;
			lan_block_put(tx_H,b);
			print("\n\rEscriu un nou node de desti i escriu un nou missatge");
		}
	}
}



void pinta(void){
	uint8_t a,i;
	char t[]="\r\nNode:";
	a=lan_block_get(rx_H);
	print(t);
	serial_put(a);
	serial_put('\r');
	serial_put('\n');
	   //Tot aixo esta aqui perque si feia print em sortia "*" * HOLA
	serial_put('M');
	serial_put('i');
	serial_put('s');
	serial_put('s');
	serial_put('a');
	serial_put('t');
	serial_put('g');
	serial_put('e');
	serial_put(':');
	serial_put('\r');
	serial_put('\n');
	print(rx_H);

}

