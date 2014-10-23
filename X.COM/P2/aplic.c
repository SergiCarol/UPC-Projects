#include "aplic.h"

	
uint8_t ta_tx[120];
uint8_t ta_rx[120];
static block_morse tx_H = ta_tx; // transmissio 
static block_morse rx_H = ta_rx; // recepcio

static void pinta(void);

void main(void){
  uint8_t a,i=0,b;
  //Iniciem el serial
  serial_init();
  //Activem les interrupcions
  sei();
  while(serial_can_read()==false);
  //Agafem el node d'origen
  //Aixo nomes es fa un cop al principi
  a=serial_get();
  serial_put(a);
  //Incialitzem el lan
  lan_init(a);
  on_lan_recived(pinta);
  while(true){
    serial_put('-');
    serial_put('>');
    //Agafem el node de desti
    b=serial_get();
    serial_put(b);
    serial_put(':');
    // -------------------------------------------------------------
    while(serial_can_read()==false);
    //Començem a agafar el missatge
    a=serial_get();
    while (a!='\r'){
      serial_put(a);
      //Si hem escrit una 'r'
      if (a=='r'){
        //Reiniciem el programa
        estat=esperant;
        i=0;
        serial_put('\r');
        serial_put('\n');
        a='\r';
        break;
      }
      // Sino...
      else {
        //Anem guardan lo que anem escribint
        tx_H[i++]=a;
        a=serial_get();
      }
    }
    //Ens esperem fins que s'hagi acabat de enviar (si es que hi ha alguna cosa)
    while (lan_can_put()==pendent_enviar);
    if (i>0){
      tx_H[i]='\0';
      i=0;
      //Enviem el missatge
      lan_block_put(tx_H,b);    
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

