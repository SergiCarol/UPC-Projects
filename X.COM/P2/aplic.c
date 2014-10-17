#include "aplic.h"


uint8_t t_tx[32];
uint8_t t_rx[32];
block_morse tx_H = t_tx; // transmissio 
block_morse rx_H = t_rx; // recepcio
/*
void pinta(void){
	lan_block_get();
}
*/
void main(void){
	uint8_t a,i=0;
//	on_lan_recived(pinta);
	serial_init();
	sei();
	serial_put('E');
	print("Escriu el node d'origen");
	serial_put('-');
	serial_put('>');
	while(serial_can_read()==false);
	a=serial_get();
	serial_put(a);
	lan_init(a);
	print("\r\nEscriiu el missatge");
	while(true){
		while(serial_can_read()==false);
		a=serial_get();
		while (a!='\r'){
			serial_put(a);
			if (a=='r'){
				estat=esperant;
				i=0;
				print("\n\r Escriu un nou missatge");
			}
			else {
				tx_H[i++]=a;
				a=serial_get();
			}
		}
		while (lan_can_put()==pendent_enviar);
		print("\n\rEscriu un node de desti");
		serial_put('-');
		serial_put('>');
		a=serial_get();
		serial_put(a);
		tx_H[i]='\0';
		print(tx_H);
		i=0;
		lan_block_put(tx_H,a);
		
	}
}

