#include "serial_device.h"
#include <avr/io.h>
#include <stdbool.h>
#include "serial_device.h"

#define BAUD_RATE 9600
#define CLK_BY100 F_CPU/100
#define BDR 16*BAUD_RATE/100
#define MYUBRR ((CLK_BY100/BDR)-1)

/*		  Bibliografia
 http://www.appelsiini.net/2011/simple-usart-with-avr-libc
*/
 
void serial_init(void){
  /*Inicialitza el modul i deixa la UART a punt per enviar/rebre caracters de 8 bit a 9600 s-1, amb un bit d'stop, sense paritat i en el mode asíncron.*/
  UBRR0H = 0x00;
  UBRR0L = 0x67;
  UCSR0A &= ~_BV(U2X0);
  UCSR0B = _BV(RXEN0) | _BV(TXEN0) ;
  UCSR0C = _BV(UCSZ01) | _BV(UCSZ00);
}

uint8_t serial_get(void){
  /*Retorna un byte llegit del port sèria. Es bloqueja indefinidament fins que hi ha un caràcter disponible per a ser llegit. En cas que no es llegeixi prou sovint es poden perdre caràcters.*/

  uint8_t a;
  loop_until_bit_is_set(UCSR0A,RXC0);
  return UDR0;
}

void serial_put(uint8_t c){
  /*Envia un byte pel port sèrie. En cas que estigui ocupat enviant una altra dada, es bloqueja fins que l'enviament en curs acaba.*/
  loop_until_bit_is_set(UCSR0A,UDRE0);
  UDR0 = c;
}

bool serial_can_read(void){
  /*Retorna true si hi ha un caràcter disponible per a ser llegit. Si aquesta funció retorna true es garanteix que una posterior crida a serial_get() no es bloquejará.*/
  return bit_is_set(UCSR0A ,RXC0);
}
