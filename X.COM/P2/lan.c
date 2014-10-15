#include "lan.h"

#define pendent_enviar 0 // suposu que es fa aixi xD False
#define esperant 1	// ^ True
#define MAX_TRY 3 // Numero maxim d'intens

static void fix(const block_morse b, uint8_t nd);
static bool envia(const block_morse b);

uint8_t t_tx[32];
uint8_t t_rx[32];
block_morse tx = t_tx; // transmissio 
block_morse rx = t_rx; // recepcio

static uint8_t node_origen; // guardem el node d'origen
static uint8_t intens = 0; // Numero d'intens d'enviar (MAXIM TRES)
uint8_t estat;

void lan_init(uint8_t no){	
  node_origen = no;
  on_message_received(comp);
  ether_init();
  serial_init();
  timer_init();
}

bool lan_can_put(void){
  return ether_can_put();
}

void lan_block_put(const block_morse b , uint8_t nd){
  // [no,nd,missatje,checksum]
  estat=pendent_enviar;
  lan_can_put();
  fix(b,nd);
  envia(tx);
  ether_block_put(t);
  estat=esperant;
}

void on_lan_recived(lan_callback_t l){
  funcio=l;
}

static void fix(const block_morse b, uint8_t nd){
  uint8_t i = 0;
  tx[i++]=node_origen;  // node origen ve de la variable global
  tx[i++]=nd; // node desti
  
  for (i;b[i-2]!='\0';i++){
    tx[i]=b[i-2];      // fiquem els valors del block morse dintre la taula
  }
  // checksum, fa falta?????
}
// Faltarien fer mes funcions estatiques per comprovar coses...

static bool envia(const block_morse b){
  //Coprovar 3 cops si pot enviar.
  if (intens < MAX_TRY){
    if(lan_can_put()){
      return true;
    }
    else{
      intens++;
    }
  }
  else{
    return false;
  }
}

  
  //comprova{
  //ether_block_get(rx){
  //si es error
  //si es destinatari
  //exe.f()}}
