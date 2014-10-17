#include "lan.h"

#define pendent_enviar 0 // suposu que es fa aixi xD False
#define esperant 1	// ^ True
#define MAX_TRY 3 // Numero maxim d'intens

static void fix(const block_morse b, uint8_t nd);
static void envia(void);
static void comp(void);
uint8_t t_tx[32];
uint8_t t_rx[32];
block_morse tx = t_tx; // transmissio 
block_morse rx = t_rx; // recepcio

static uint8_t node_origen; // guardem el node d'origen
static uint8_t intens = 0; // Numero d'intens d'enviar (MAXIM TRES)


void lan_init(uint8_t no){	
  node_origen = no;
  on_message_received(comp);
  ether_init();
  timer_init();
}

bool lan_can_put(void){
  return ether_can_put();
}

void lan_block_put(const block_morse b , uint8_t nd){
  // [no,nd,missatje,checksum]
  estat=pendent_enviar;
  fix(b,nd);
  	print("\n\rTrama: ");
  	print(tx); 
  envia();
  intens=0;
  estat=esperant;
}

void on_lan_recived(lan_callback_t l){
  // funcio =l
}

static void fix(const block_morse b, uint8_t nd){
  uint8_t i = 0;
  numero num;
  tx[i++]=node_origen;  // node origen ve de la variable global
  tx[i++]=nd; // node desti
  while (b[i-2]!='\0'){
  	tx[i]=b[i-2];
  	i++;
  }
  num=crc_morse(tx);
  tx[i++]=num.a;
  tx[i++]=num.b;
  tx[i]='\0';
}
// Faltarien fer mes funcions estatiques per comprovar coses...

static void envia(void){
  //Coprovar 3 cops si pot enviar.
  if (intens < MAX_TRY){
    if(lan_can_put()){// AIxo despres es te que treure (es per mirar que surt)
      	ether_block_put(tx);
    }
    else{
      intens++;
      timer_after(TIMER_MS(rand()),envia);
    }
  }
}



void print(char s[]){
  /* Envia pel port serie tots el elements de la taula s
     fins que troba un simbol de final de paraula */
  uint8_t i=0, c;
  while(s[i]!='\0'){
    serial_put(s[i]);
    i++;
  }
  serial_put('\r');
  serial_put('\n');
}

void readline(char s[],uint8_t m){
  /* Llegeix un numero de caracters m pel port serie
     i els fica en la taula s, en el cas de que es llegeixi
     un caracter no printable deixa de llegir */
  
  uint8_t i=0,a;
  a=serial_get();
  while (m!=i && isgraph(a)){
      s[i] = a;
      i++;
      a=serial_get();
    
  }
  s[i]='\0';
}



static void comp(void){

}  
  //comprova{
  //ether_block_get(rx){
  //si es error
  //si es destinatari
  //exe.f()}}
