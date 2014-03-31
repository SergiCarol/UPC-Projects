#include "serial_device.h"
#include <avr/io.h>
void serial_init(void){
	/*Inicialitza el modul i deixa la UART a punt per enviar/rebre
	caracters de 8 bit a 9600 s-1, amb un bit d'stop, sense paritat
	i en el mode asíncron.*/
	UBRR0H = 0x00;
	UBRR0L = 0x67;
	UCSR0A = 0x20;
	UCSR0B = 0x98;
	
}

uint8_t serial_get(void){
	/*Retorna un byte llegit del port sèria. Es bloqueja indefinidament
	fins que hi ha un caràcter disponible per a ser llegit. En cas que
	no es llegeixi prou sovint es poden perdre caràcters.*/

	char a;

	while ((UCSR0A & (1<<7))!=1) a=UDR0;	

}

void serial_put(uint8_t c){
	/*Envia un byte pel port sèrie. En cas que estigui ocupat enviant
	una altra dada, es bloqueja fins que l'enviament en curs acaba.*/

	while ((UCSR0A & (1<<5))!=1) UDR0 = c;
}

bool serial_can_read(void){
	/*Retorna true si hi ha un caràcter disponible per a ser llegit. Si
	aquesta funció retorna true es garanteix que una posterior crida a 
	serial_get() no es bloquejará.*/

	if ((UCSR0A & (1<<7))== true) return true;
	else return false;
}
void main(){

}

