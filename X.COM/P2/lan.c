#include "lan.h"

#define pendent_enviar 0 // suposu que es fa aixi xD False
#define esperant 1  // ^ True
#define MAX_TRY 3 // Numero maxim d'intens

static void fix(const block_morse b, uint8_t nd);
static void envia(void);
static void comp(void);
char t_tx[120];
char t_rx[120];
static block_morse tx = t_tx; // transmissio 
static block_morse rx = t_rx; // recepcio
static lan_callback_t funcio;
static uint8_t node_origen; // guardem el node d'origen
static uint8_t intens = 0; // Numero d'intens d'enviar (MAXIM TRES)
static pin_t pin;

void lan_init(uint8_t no){  
  node_origen = no;
  timer_init();
  ether_init();
  on_message_received(comp);
  DDRB=0x00;
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
   funcio = l;
}


uint8_t lan_block_get(block_morse b){
  /* Conclusio meva:
     Aixo per l'unic que serveix es per passar de la taula morse
     del lan a la de l'aplicacio */
  uint8_t i;
  for (i=0;rx[i+2]!='\0';i++){
    b[i]=rx[i+2];
  }
  b[i-1]='\0';
  return rx[0];
  
  
}
static void fix(const block_morse b, uint8_t nd){
  uint8_t i = 0;
  numero num;
  tx[i++]=node_origen;  // node origen ve de la variable global
  tx[i]=nd; // node desti
  for (i=2;b[i-2]!='\0';i++){
    tx[i]=b[i-2];
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
      for(uint8_t i=0; i<32;i++) tx[i]='\0';
    }
    else{
      intens++;
      timer_after(TIMER_MS(rand()%10+1*1000),envia);
    }
  }
  else DDRB=0xFF;
}


static void comp(void){
  /*
    1- El on_message_recived del init detecta que rebem un missatge
    2- El on_message_recived crida a la funcio comp ^
    3- La funcio comp comprova que tot funcioni be i crida a la funcio funcio()
    4- La funcio funcio() s'hagfa del on_lan_recived
    5- La funcio on_lan_recived es crida al main de l'applicacio
    6- La funcio cridada es la funcio pinta del modul aplicacio .c
  */
  // Agafem els blocks
  while (ether_can_get()==false);
  ether_block_get(rx);
  serial_put('A');
  // Comprovem el crc 
  if (check_crc(rx)){
    // Comprovem el origen
    if(rx[1]==node_origen){
      funcio();
    }
    else DDRB=0xFF;
  }
  else DDRB=0xFF;
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
