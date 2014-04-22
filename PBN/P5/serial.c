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
  
  /* Creem dues cues buides, una de transmicio (tx)
     i una altre de recepcio (rx) */
  queue_empty(&tx);
  queue_empty(&rx);
  /* Configurem el UART */
  UBRR0H = 0x00;
  UBRR0L = 0x67;
  UCSR0A = _BV(UDRE0);
  /* Activem les interrupcions de recepcio, pero 
     les de transmicio encara no */
  UCSR0B = _BV(RXCIE0) | _BV(RXEN0) | _BV(TXEN0);
  UCSR0C = _BV(UCSZ01) | _BV(UCSZ00);
  sei();
}

void serial_close(void){
  /* Desactivem el UART, aixi com les interrupcions.
     Primer pero, mirem si s'esta enviant alguna cosa */
  loop_until_bit_is_set(UCSR0A,UDRE0);
  UCSR0B &= ~(_BV(RXCIE0) | _BV(RXEN0) | _BV(TXEN0));
  cli();
}

uint8_t serial_get(void){
  /* Agafem l'element superior del la cua de recpecio */
  uint8_t a;
  while (queue_is_empty(&rx));
  a=queue_front(&rx);
  queue_dequeue(&rx);
  return a;
}

void serial_put(uint8_t c){
  /* Fiquem un element al principi de la cua de transmissio */
  while (queue_is_full(&tx));
  queue_enqueue(&tx,c);
  UCSR0B |= (_BV(UDRIE0));
}

bool serial_can_read(void){
  /* Mirem si el port serir pot introduir mes valors a la cua */
  if (queue_is_empty(&rx)==true) return false;
  else return true;
}
ISR(USART_RX_vect){
  /* Interrupcio de recepcio */
  uint8_t c;
  queue_enqueue(&rx, UDR0);
}

ISR(USART_UDRE_vect){
  /* Interrupcio de transmicio */
  if (queue_is_empty(&tx)==false){
    UDR0 = queue_front(&tx);
    queue_dequeue(&tx);
    
  }
  else {
    /* En el cas de que la cua estigui buida desactivem les interrupcions
       fins que realitzem un serial_put() */
    UCSR0B &= ~(_BV(UDRIE0));
  }
}
