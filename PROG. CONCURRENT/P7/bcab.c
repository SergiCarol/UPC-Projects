#include <avr/io.h>
#include <stdbool.h>
#include <inttypes.h>
#include <util/delay.h>
#include "gpio_device.h"
#include "queue.h"
#include "serial.h"
#include "timer.h"

#define MAX_TIME 100

typedef struct BOTONERA {
  pin_t led; 
  pin_t pis;
} botonera;

botonera baix;
botonera primer;
botonera segon;
botonera tercer;
botonera quart;
botonera cinque;
botonera obrir;
botonera tancar;

// Gestor de rebots
static bool enabled = false;

void lectura(void){
  uint8_t a,b;
  if(serial_can_read()){
    a=serial_get();
    b=serial_get();
    switch(a){
    case 'E':
      switch(b){
      case '0':
	pin_w(baix.led, true);
	break;
      case '1':
	pin_w(primer.led, true);
	break;
      case '2':
	pin_w(segon.led, true);
	break;
      case '3':
	pin_w(tercer.led, true);
	break;
      case '4':
	pin_w(quart.led, true);
	break;
      case '5':
	pin_w(cinque.led, true);
	break;
      default:
	serial_put('E');
	break;
      }
      break;
    case 'A':
      switch(b){
      case '0':
	pin_w(baix.led, false);
	break;
      case '1':
	pin_w(primer.led, false);
	break;
      case '2':
	pin_w(segon.led, false);
	break;
      case '3':
	pin_w(tercer.led, false);
	break;
      case '4':
	pin_w(quart.led, false);
	break;
      case '5':
	pin_w(cinque.led, false);
	break;
      default:
	serial_put('A');
	break;
      }
      break;
    case 'D':
      switch(b){
      case '0':
	PORTD &=  (~(1<<5)&(~(1<<4))&(~(1<<6))&(~(1<<7)));
	break;
      case '1':
	PORTD &= ~(1<<5)&~(1<<6)&~(1<<7);
	PORTD |= (1<<4);
	break;
      case '2':
	PORTD &= (~(1<<5)&(~(1<<6))&(~(1<<4)));
	PORTD |= (1<<7);
	break;
      case '3':
	PORTD &= (~(1<<5)&(~(1<<6)));
	PORTD |= ((1<<4) | (1<<7));
	break;
      case '4':	
	PORTD &= (~(1<<5)&(~(1<<4))&(~(1<<7)));
	PORTD |= (1<<6);
	break;
      case '5':
	PORTD &= (~(1<<5)&(~(1<<7)));
	PORTD |= ((1<<4) | (1<<6));
	break;
      default:
	serial_put('A');
	break;
      } 
      break;
    }
    //serial_put('\r');
    //serial_put('\n');
  }
}

int main (void){
  timer_init();
  serial_open();
  DDRD = 0xF0;
  
  PCICR =  0b00000110;          
  PCMSK1 = 0b00111111;
  PCMSK2 = 0b00001100;
  sei();

  baix.led = pin_create(&PORTB,5,Output);
  baix.pis = pin_create(&PORTC,PC0,Input); 
  PORTC|=1<<PC0;
  //Pull-up intern

  primer.led = pin_create(&PORTB,4,Output);
  primer.pis = pin_create(&PORTC,PC1,Input);
  PORTC|=1<<PC1;

  segon.led = pin_create(&PORTB,3,Output);
  segon.pis = pin_create(&PORTC,PC2,Input);
  PORTC|=1<<PC2;

  tercer.led = pin_create(&PORTB,2,Output);
  tercer.pis = pin_create(&PORTC,PC3,Input);
  PORTC|=1<<PC3;
  
  quart.led = pin_create(&PORTB,1,Output);
  quart.pis = pin_create(&PORTC,PC4,Input); 
  PORTC|=1<<PC4;

  cinque.led = pin_create(&PORTB,0,Output);
  cinque.pis = pin_create(&PORTC,PC5,Input); 
  PORTC|=1<<PC5;
  
  obrir.pis = pin_create(&PORTD,2,Input);
  tancar.pis = pin_create(&PORTD,3,Input);
  PORTD|=1<<PC2;
  PORTD|=1<<PC3;
  
  PORTD&=~(1<<PD4)&~(1<<PD5)&~(1<<PD6)&~(1<<PD7);
  DDRD = 0xF0;
  while (serial_can_read()==false);
  while(true) lectura();

  return 0;
}

ISR(PCINT1_vect){
  
  if ((PINC & (1<<PC0))==false){
    serial_put('B');
    serial_put('0');
    serial_put('\r');
  }
  if ((PINC & (1<<PC1))==false){
    serial_put('B');
    serial_put('1');
    serial_put('\r');

  }
  if ((PINC & (1<<PC2))==false){
    serial_put('B');
    serial_put('2');
    serial_put('\r');
  }
  if ((PINC & (1<<PC3))==false){
    serial_put('B');
    serial_put('3');
    serial_put('\r');
  }
  if ((PINC & (1<<PC4))==false){
    serial_put('B');
    serial_put('4');
    serial_put('\r');
  }
  if ((PINC & (1<<PC5))==false){
    serial_put('B');
    serial_put('5');
    serial_put('\r');
  }
  _delay_ms(100); 	
}

ISR(PCINT2_vect){
  if ((PIND & (1<<PD2))==false){
    serial_put('T');
    serial_put('P');
    serial_put('\r');
    _delay_ms(100); 	
  }
  else if (PIND & (1<<PD2)) {
    _delay_ms(100); 	
  }
  if ((PIND & (1<<PD3))==false){
    serial_put('O');
    serial_put('P'); 
    serial_put('\r');
    _delay_ms(100); 	
  }
  else if (PIND & (1<<PD3)) {
    _delay_ms(100); 	
  }
}
