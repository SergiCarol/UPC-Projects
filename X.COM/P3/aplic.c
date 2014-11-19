#include "frame.h"

uint8_t ta_rx[32];
static block_morse rx_H = ta_rx;

uint8_t ta_tx[32];
static block_morse tx_H = ta_tx;

static void pinta(void);

int main(void){
  uint8_t i,a;
  
  serial_init();
  sei();
  frame_init();
  numeracio_trama_tx='0';
  waiting_for_tx='A';
  numeracio_trama_rx='A';
  waiting_for_rx='0';
  on_frame_recived(pinta);
  
  while(true){
    //while (frame_can_put()==false);
    serial_put('-');
    serial_put('>');
    a=serial_get();
    while (a!='\r'){
      serial_put(a);
      if (a=='r'){
	i=0;
	serial_put('\r');
	serial_put('\n');
	break;
      }
      else{
	tx_H[i]=a;
	i++;
	a=serial_get();
      }
    }
    serial_put('\n');
    serial_put('\r');
    while (frame_can_put()==false);
    if (i>0){
      tx_H[i]='\0';
      i=0;
      //Enviem el missatge
      frame_block_put(tx_H);     
    }
  }
  return 0;
}

static void pinta(void){
	frame_block_get(rx_H);
	print(rx_H);
}
