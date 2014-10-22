#include "aplic.h"

	
uint8_t ta_tx[120];
uint8_t ta_rx[120];
static block_morse tx_H = ta_tx; // transmissio 
static block_morse rx_H = ta_rx; // recepcio

static void pinta(void);

void main(void){
  uint8_t a,i=0,b;
  serial_init();
  sei();
  //print("Escriu el node d'origen i a continuacio el de desti");
  while(serial_can_read()==false);
  a=serial_get();
  serial_put(a);
  lan_init(a);
  on_lan_recived(pinta);
  while(true){
  begin:
    serial_put('-');
    serial_put('>');
    b=serial_get();
    serial_put(b);
    //print("\r\nEscriu el missatge");
    serial_put(':');
    // -------------------------------------------------------------
    while(serial_can_read()==false);
    a=serial_get();
    while (a!='\r'){
      serial_put(a);
      if (a=='r'){
	estat=esperant;
	i=0;
  	serial_put('\r');
  	serial_put('\n');
	//print("\n\rHas reiniciat el programa.");
	a='\r';
	break;
	
      }
      else {
	tx_H[i++]=a;
	a=serial_get();
      }
    }
    while (lan_can_put()==pendent_enviar);
    if (i>0){
      // print(tx_H);
      tx_H[i]='\0';
      i=0;
      lan_block_put(tx_H,b);
      //print("\n\rEscriu un nou node de desti i escriu un nou missatge");
    }
  }
}



void pinta(void){
  uint8_t a;
  a=lan_block_get(rx_H);
  serial_put('N');
  serial_put(':');
  serial_put(a);
  serial_put('\r');
  serial_put('\n');
  serial_put('M');
  serial_put(':');
  print(rx_H);
  
}

