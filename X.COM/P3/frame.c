#include "frame.h"

#define MAX_TRY 3
#define TIME_OUT 8000

char t_tx[32];
uint8_t t_rx[32];
static block_morse tx = t_tx; // transmissio 
static block_morse rx = t_rx; // recepcio

static estat state = esperant;
static frame_callback_t funcio;
static pin_t pin;
static uint8_t intens=0;
static int8_t timeout_number;
static bool first_time = true;

static void build(const block_morse b);
static void send(void);
static void check(void);
static void next_rx(void);
static void next_tx(void);
static void start_timer(void);
static void error(void);


void frame_init(void){
  state = esperant;
  timer_init();
  ether_init();
  on_finish_transmission(start_timer);
  on_message_received(check);
  pin = pin_create(&PORTB,5,Output);
  pin_w(pin,false);
  // Canviar sempre on_finished
  
}

bool frame_can_put(void){
  if (ether_can_put()){
    if (state == esperant) return true;
    else return false;
  }
  else return false;
}

void frame_block_put(const block_morse b){
  //[0/1,DADES,CHECKSUM]
  // Tenim que esperanr-nos fins que haguem acabat de enviar i rebre la confirmacio
  state = enviant;
  for(uint8_t i=0;i<32;i++) tx[i]='\0'; 
  build(b);
  print(tx);
  send();
}

void frame_block_get(block_morse b){
  uint8_t i;
  for (i=0;rx[i+1]!='\0';i++){
    b[i]=rx[i+1];
  }
  b[i-2]='\0';
  for(uint8_t i=0;i<32;i++) rx[i]='\0'; 
}

void on_frame_recived(frame_callback_t l){
  funcio=l;
}

static void build(block_morse b){
  uint8_t i,a=0;
  numero num;
  tx[0]=numeracio_trama_tx;
  // Fica be la numeracio
  for (i=0;b[i]!='\0';i++){
    tx[i+1]=b[i];
  }
  // Fica be el bloc
  num=crc_morse(tx);
  tx[++i]=num.a;
  tx[++i]=num.b;
  tx[++i]='\0';
  //MIRAR CRC
} 

static void send(void){

  if(ether_can_put()){
    // Si el canal no esat ocupat enviem
    ether_block_put(tx);
  }
  // En el cas de que no s'hagi pogut enviar encenem el LED
  else {
    pin_w(pin,true);
    state=esperant;
  }
}

static void check(void){
  for(uint8_t i=0;i<32;i++) rx[i]='\0'; 
  ether_block_get(rx);
  print(rx);
  if (check_crc(rx)){
    if ((rx[0]=='A') || (rx[0]=='B')) timer_cancel(timeout_number);
    if (rx[0]==waiting_for_tx) next_tx();
    else if (rx[0]==waiting_for_rx) next_rx(); 
    else error();
  }
  else{
    pin_w(pin,true);
  }
}

void next_rx (void){
  numero num;
  // Mirem la numeracio de la trama
  if (rx[0]=='0'){
    // Si hem rebut un 0 tenim que enviar un missatge de confirmacio amb una A
    numeracio_trama_rx = 'A';
    // I el seguent missatge que rebem te que començar per 1
    waiting_for_rx = '1';
  }
  else {
    // En cas contrari tenim que enviar una B
    numeracio_trama_rx = 'B';
    // I el seguent missatge te que començar per 0
    waiting_for_rx = '0';
  }
  tx[0]=numeracio_trama_rx;
  tx[1]='\0';
  num = crc_morse(tx);
  tx[1]=num.a;
  tx[2]=num.b;
  tx[3]='\0';
  //while(frame_can_put()==false);
  ether_block_put(tx);
  print(tx);
  funcio();
  for(uint8_t i=0;i<32;i++) tx[i]='\0'; 
}

void next_tx(void){
  numero num;
  // En el cas de que siguem el transmissor
  // Comprovem si el missatge de confirmacio es una A
  if (rx[0]=='A'){
    // Si ho es el seguent missatge te que començar amb un 1
    numeracio_trama_tx = '1';
    waiting_for_tx = 'B';
  }
  else {
    numeracio_trama_tx = '0';
    waiting_for_tx = 'A';
  }
  state=esperant;
  for(uint8_t i=0;i<32;i++) tx[i]='\0'; 
}

void error(void){
  numero num;
  if ((rx[0]=='0') || (rx[0]=='1')){
    if (waiting_for_rx == '0') {
      tx[0]='B';
    }
    else{
      tx[0]='A';
    }
    num = crc_morse(tx);
    tx[1]=num.a;
    tx[2]=num.b;
    tx[3]='\0';
    while(frame_can_put()==false);
    ether_block_put(tx);
  }
  else {
    //while(frame_can_put()==false);
    print(tx);
    ether_block_put(tx);
  }
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

void start_timer(void){
  if(numeracio_trama_tx == '0'||numeracio_trama_tx == '1'){
    timeout_number=timer_after(TIMER_MS(TIME_OUT),error);
  }
}
  
