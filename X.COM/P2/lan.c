#include "lan.h"



static void fix(const block_morse b, uint8_t nd);
static void envia(void);
static void comp(void);

char t_tx[64];
char t_rx[64];
static block_morse tx = t_tx; // transmissio 
static block_morse rx = t_rx; // recepcio
static lan_callback_t funcio;
static uint8_t node_origen; // guardem el node d'origen
static uint8_t intens = 0; // Numero d'intens d'enviar (MAXIM TRES)
static pin_t pin;

void lan_init(uint8_t no){
  // Guardem el node d'origen
  node_origen = no;
  // Inicialitzem el timer i el ether
  timer_init();
  ether_init();
  // En el cas de que rebem un missatge fem un callback
  on_message_received(comp);
  // Crem un pin_t per el led
  pin = pin_create(&PORTB,5,Output);
  pin_w(pin,false);
}

bool lan_can_put(void){
  // Comprova si podem enviar per l'ether o no
  if (ether_can_put()){
  	if (estat = esperant) return true;
  }
  else return false;
}

void lan_block_put(const block_morse b , uint8_t nd){
  // [no,nd,missatje,crc]
  // Fiquem l'estat a pendent d'enviar
  estat=pendent_enviar;
  // Fiquem la trama be
  fix(b,nd);
  print("\n\rTrama: ");
  print(tx); 
  // Enviem la trama
  envia();   
  intens=0;
  print("Done");
  // Un cop hem acabat d'enviar tornem al principi
  estat=esperant;
}

void on_lan_recived(lan_callback_t l){
  // Creem un callback
  funcio = l;
}


uint8_t lan_block_get(block_morse b){
  /* 1- Treiem el node d'origen i el de desti de la trama 
     2- Passem el block morse original (rx) a una altre block morse (b)
     3- Retornem el node d'origen de rx*/
  
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
  // A la posicio 0 hi fiquem el node d'origen (variable global del fitxer)
  tx[i++]=node_origen;  
  // A la seguent posicio hi guardem el node de desti
  tx[i]=nd; 
  // Guardem els valors de el block morse b dintre al block morse de transmissio
  for (i=2;b[i-2]!='\0';i++){
    tx[i]=b[i-2];
  }
  // Creem un crc
  num=crc_morse(tx);
  // Guardem els valors del crc dintre el block morse de transmissio
  tx[i++]=num.a;
  tx[i++]=num.b;
  tx[i]='\0';
}


static void envia(void){
  //Coprovar 3 cops si pot enviar.
  if (intens < MAX_TRY){
    if(lan_can_put()){
      // Si el canal no esat ocupat enviem
      ether_block_put(tx);
      for(uint8_t i=0; i<64;i++) tx[i]='\0';
    }
    else{
      // Si el canal esta ocupat sumem 1 als intents
      intens++;
      // Esperem un temps aleatori i tornem a provar.
      timer_after(TIMER_MS(rand()%((10+1)*1000)),envia);
    }
  }
  // En el cas de que no s'hagi pogut enviar encenem el LED
  else pin_w(pin,true);
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
  ether_block_get(rx);
  if (check_crc(rx)){
    // Comprovem el origen
    if(rx[1]==node_origen){
      // Fem el callback
      funcio();
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
