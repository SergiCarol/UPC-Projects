#include "frame.h"
#include "error_morse.h"
#include <stdlib.h>
#include <avr/io.h>
#include <avr/interrupt.h>

#define TIME_OUT 8000

static uint8_t t_rx[120];
static uint8_t t_tx[120];
static uint8_t trama_control[4];

static block_morse rx=t_rx;
static block_morse tx=t_tx;
static block_morse control=trama_control;



static void check(void);
static void start_timer(void);
static void estats (uint8_t a);
static void event_tx(events_tx e_tx);
static void event_rx(events_rx e_rx);
static void build(const block_morse b);
static void make_ACK(void);
static void make_NCK(void);
static void send(void);


static uint8_t intents=0;
static int8_t timeout_number;
static frame_callback_t funcio;
static state_tx estat_tx = enviar_0;
static state_rx estat_rx = rebut_0;
static events_rx e_rx;
static events_tx e_tx;


void frame_init(void){
  DDRB |= (1<<DDB5);
  PORTB &= ~(1<<PB5);
  timer_init();
  ether_init();
  serial_init();
  on_message_received(check);
  on_finish_transmission(start_timer);
}

bool frame_can_put(void){
  
  if (ether_can_put()) {
    return (estat_tx==enviar_0 || estat_tx==enviar_1); 
  }
}

void frame_block_put(const block_morse b){
 	
 	build(b);
 	print(tx);
 	send();
}


void on_frame_recived(frame_callback_t l){
  funcio=l;
}

void frame_block_get(block_morse b){
  uint8_t i=0;
  for (i; rx[i+1]!='\0'; i++) b[i]=rx[i+1];
  b[i-2]='\0';
}


void build (const block_morse b){
  uint8_t i=1;
  numero num;
  event_tx(ready_tx);
  
  for (uint8_t j=0; b[j]!='\0'; i++, j++) tx[i]=b[j];
  
  tx[i]='\0';
  num=crc_morse(tx);
  tx[i++]=num.a;
  tx[i++]=num.b;
  tx[i]='\0';
 }

void send(){
  if (intents<3) {
    if (ether_can_put()) {
      ether_block_put(tx);
      intents=0;
    }
    else {
      intents++;
      timer_after(TIMER_MS((rand()%(10+1))*1000), send);
    }
  }
  else {
  	// FIcar led
  	intents = 0;
  }
}


static void check(void){

  for (uint8_t i=0; i<120; i++) rx[i]='\0';
  ether_block_get(rx); 
  if (test_crc_morse(rx)) estats(rx[0]);
}

static void estats (uint8_t a){

    if (a=='0') event_rx(rep0);
    
    else if  (a=='1') event_rx(rep1); 
    
    else if (a=='A') event_tx(accep0);
    
    else if (a=='B') event_tx(accep1);
    
    else make_NCK();
}

static void event_tx(events_tx e_tx){
  switch(estat_tx) {
    case enviar_0:
      switch(e_tx) {
      case ready_tx:
	tx[0]='0';
	estat_tx=ACK0;
	break;
      }
    break;
    case enviar_1 :
      switch(e_tx){
      case ready_tx:
	tx[0]='1';
	estat_tx=ACK1;
	break;
      }
    break;
    case ACK0:
      switch(e_tx){
      case accep0:
	estat_tx=enviar_1;
	timer_cancel(timeout_number);
	break;
	
      }
    break;
    case ACK1: 
      switch(e_tx){
      case accep1:
	estat_tx=enviar_0;
	timer_cancel(timeout_number);
	break;
      }
    break;
  }    
}


static void event_rx(events_rx e_rx){
  switch(estat_rx){
  case rebut_0:
    switch(e_rx){
    case rep0:
      estat_rx=rebut_1;
      make_ACK();
      funcio();
      break;
    }
    break;
  case rebut_1:
    switch(e_rx){
    case rep1:
      estat_rx=rebut_0;
      make_ACK();
      funcio();
      break;
    }
    break;
  }
}


static void make_ACK(void){
  numero num;
  //serial_put('a');
  if (rx[0]=='0') control[0]='A';
  
  else if (rx[0]=='1') control[0]='B';
  
  control[1]='\0';
  num=crc_morse(control);
  control[1]=num.a;
  control[2]=num.b;
  control[3]='\0';
  ether_block_put(control);
}

static void make_NCK(void){

  numero num;

  if (rx[0]=='0') control[0]='B';

  else if (rx[0]=='1') control[0]='A';

  control[1]='\0';
  num=crc_morse(control);
  control[1]=num.a;
  control[2]=num.b;
  control[3]='\0';
  ether_block_put(control);
}


void timer_error(void){   

  if (ether_can_put()) ether_block_put(tx);

}


void start_timer(void){

  if ((tx[0]=='0') || (tx[0]=='1')) timeout_number=timer_ntimes(2,TIMER_MS(TIME_OUT),timer_error);

}


void print(uint8_t s[]){
  /* Envia pel port serie tots el elements de la taula s
     fins que troba un simbol de final de paraula */
  uint8_t i=0;
  while(isprint(s[i])){
    serial_put(s[i]);
    i++;
  }
  serial_put('\r');
  serial_put('\n');
}
