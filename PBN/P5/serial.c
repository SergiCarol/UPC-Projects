#include <avr/interrupt.h>
#include <avr/io.h>
#include <stdbool.h>
#include <stdint.h>
#include "serial.h"
#include "queue.h"

#define BAUD_RATE 9600
#define CLK_BY100 F_CPU/100
#define BDR 16*BAUD_RATE/100
#define MYUBRR ((CLK_BY100/BDR)-1)

/*		  Bibliografia
 http://www.appelsiini.net/2011/simple-usart-with-avr-libc
*/
 
static queue_t tx , rx;

void serial_open(void){

	queue_empty(&tx);
	queue_empty(&rx);
  	UBRR0H = 0x00;
  	UBRR0L = 0x67;
  	UCSR0A = _BV(UDRE0);
  	UCSR0B = _BV(RXCIE0) | _BV(RXEN0) | _BV(TXEN0);
  	UCSR0C = _BV(UCSZ01) | _BV(UCSZ00);
  	sei();
}

void serial_close(void){
	loop_until_bit_is_set(UCSR0A,UDRE0);
	UCSR0B &= ~(_BV(RXCIE0) | _BV(RXEN0) | _BV(TXEN0));
	cli();
}

uint8_t serial_get(void){
	
  	uint8_t a;
  	loop_until_bit_is_set(UCSR0A,RXC0);
  	a=queue_front(&rx);
  	queue_dequeue(&rx);
  	return a;
}

void serial_put(uint8_t c){
 	while (queue_is_full(&tx));
  	queue_enqueue(&tx,c);
  	UCSR0B |= (_BV(UDRIE0));
}

bool serial_can_read(void){
	if (bit_is_set(UCSR0A ,RXC0)==true) return true;
	else return false;
}
ISR(USART_RX_vect){
	uint8_t c;
	/*
	UCSR0B |= (_BV(UDRIE0));
	serial_put(UDR0);
	c=UDR0;*/
	queue_enqueue(&rx, UDR0);
}

ISR(USART_UDRE_vect){
	
	uint8_t a;
	if (queue_is_empty(&tx)==false){
		UDR0 = queue_front(&tx);
		queue_dequeue(&tx);
		  
	}
	else UCSR0B &= ~(_BV(UDRIE0));
}

