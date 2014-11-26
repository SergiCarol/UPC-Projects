#include "frame.h"
#include "error_morse.h"
#include "gpio_device.h"

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
static void next_tx(events_tx e_tx);
static void next_rx(events_rx e_rx);
static void build(const block_morse b);
static void mk_pk_ACK(void);
static void mk_pk_NCK(void);
static void send(void);

static uint8_t intents=0;
static int8_t timeout_number;
static uint8_t waiting_for_rx = '0';
static uint8_t numeracio_trama_tx = 'A';
static frame_callback_t funcio;
static state_tx estat_tx = enviar_0;
static events_rx e_rx;
static events_tx e_tx;
static pin_t pin;

void frame_init(void){
  timer_init();
  ether_init();
  serial_init();
  on_message_received(check);
  on_finish_transmission(start_timer);
  pin = pin_create(&PORTB,5,Output);
  pin_w(pin,false);
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
  
  next_tx(ready_tx);
  
  tx[0]=numeracio_trama_tx;
  
  for (i=1;b[i-1]!='\0';i++){
    tx[i]=b[i-1];
  }
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
    pin_w(pin,true);
    intents = 0;
  }
}


static void check(void){
  
  for (uint8_t i=0; i<120; i++) rx[i]='\0';
  ether_block_get(rx); 
  if (test_crc_morse(rx)) estats(rx[0]);
}

static void estats (uint8_t a){
  
  if (a=='0') next_rx(rep0);
  
  else if  (a=='1') next_rx(rep1); 
  
  else if (a=='A') next_tx(accep0);
  
  else if (a=='B') next_tx(accep1);
  
  else mk_pk_NCK();
}



static void next_rx(events_rx e_rx){

  if (waiting_for_rx == '0'){
    switch(e_rx){
    case rep0:
      waiting_for_rx = '1';
      mk_pk_ACK();
      funcio();
      break;
    default:
      mk_pk_NCK();
      break;
    }
  }
  
  else if (waiting_for_rx == '1') {
    switch(e_rx){
    case rep1:
      waiting_for_rx = '0';
      mk_pk_ACK();
      funcio();
      break;
    default:
      mk_pk_NCK();
      break;
    }
  }
}

static void next_tx(events_tx e_tx){
  switch(estat_tx) {
  case enviar_0:
    switch(e_tx) {
    case ready_tx:
      numeracio_trama_tx = '0';
      estat_tx=ACK0;
      break;
    }
    break;
  case enviar_1 :
    switch(e_tx){
    case ready_tx:
      numeracio_trama_tx = '1';
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

static void mk_pk_ACK(void){
  numero num;
  
  if (rx[0]=='0') control[0]='A';
  
  else if (rx[0]=='1') control[0]='B';
  
  control[1]='\0';
  num=crc_morse(control);
  control[1]=num.a;
  control[2]=num.b;
  control[3]='\0';
  ether_block_put(control);
}

static void mk_pk_NCK(void){
  
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


void start_timer(void){
  
  if ((tx[0]=='0') || (tx[0]=='1')) timeout_number=timer_after(TIMER_MS(TIME_OUT),send);
  
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
