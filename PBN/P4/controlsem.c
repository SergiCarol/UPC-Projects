#include <stdio.h>
#include <avr/io.h>
#include <inttypes.h>
#include "semaphore.h"
#include "serial_device.h"
#include "controlsem.h"
/*Definim el estats per a fer mes facil la programació.*/
#define Off 0
#define Clear 2
#define Approach 3
#define Stop 4

/*Definimos la variable state en global. Si no lo hacemos así tendremos problemas a la hora
  de acceder a esta variable.*/
static semaphore_state_t state;
/* Definimos la variable ticks remaining en global*/
static uint8_t ticks_remaining;
/*Definimos los mensajes que enviaremos*/

uint8_t i;

void controlsem_init(void){
  /*Inicialitza el mòdul i el deixa a punt per a ser utilitzat. L'estat
    inicial del semàfor és Off.*/
  semaphore_init();
  /*Inicialitza el mòdul que permet establir comunicació amb l'ordinador*/
  serial_init();
}

void tick_monitor(void){	/*Determina si hi ha alguna ordre del supervisor per llegir. Les
				  ordres segueixen el protocol que s'ha explicat a l'apartat 2.1. Si
				  és el cas la llegeix i executa l'acció associada a l'ordre.*/	
  uint8_t char_order;	      	/*Declarem la variable per a enmagatzemar la lletra que rebem.*/
  if(serial_can_read()){	/*Si hi ha informació rebuda, llegeix-la. En cas contrari, salta
				  tot el procés.*/
    char_order = serial_get();	/*Rep l'irdre.*/
    if(char_order == 'E'){	/*Si hem rebut la "E" ves al procés d'emergencia.*/
      if (state!=Off){		/*Si el semafor está parat no facis el procés.*/
	state = Clear;		/*Posa en verd el semafor.*/
	semaphore_set(state);
	ticks_remaining = 40;	/*Reinicia el temps d'estar amb el semafor en verd.*/
	
	/*Enviem el missatge que indica que s'ha cambiat correctament el semafor*/				
	serial_put('E');
	serial_put('M');
	serial_put('E');
	serial_put('R');
	serial_put('G');
	serial_put('E');
	serial_put('N');
	serial_put('C');
	serial_put('Y');
	serial_put('\n');
      }
      else {			/*Si tenim el semafor parat, retorna una "N"*/
	serial_put('N');	
	serial_put('\n');
      }
    }
    
    else if(char_order == 'S'){	/*Si hem rebut la "S" ves al procés d'apagat.*/
      if(state != Off){		/*Si el semafor está parat no facis el procés.*/
	state=Off;		/*Posa en verd el semafor.*/
	semaphore_set(state);
	
	/*Enviem el missatge que indica que s'ha apagat correctament el semafor*/	
	serial_put('S');
	serial_put('H');
	serial_put('U');
	serial_put('T');
	serial_put('D');
	serial_put('O');
	serial_put('W');
	serial_put('N');
	serial_put('\n');
	
      }
      else{
	serial_put('J');
	serial_put('\n');
      }
    }
    else if(char_order == 'R'){	/*Si hem rebut la "R" ves al procés d'start.*/
      if(state == Off){		/*Si el semafor está parat fes el procés.*/
	state = Clear;		/*Posa en verd el semafor.*/
	semaphore_set(state);
	ticks_remaining = 40;	/*Reinicia el temps d'estar amb el semafor en verd.*/
	
	/*Enviem el missatge que indica que s'ha encés correctament el semafor*/	
	serial_put('R');
	serial_put('E');
	serial_put('S');
	serial_put('T');
	serial_put('A');
	serial_put('R');
	serial_put('T');
	serial_put('\n');
      }
      else{
	serial_put('J');
	serial_put('\n');
      }
    }
  }
}


void tick_semaphore(void){
  /*Decrementa el nombre de ticks que falten per canviar l'estat del
    semàfor i, si escau, canvia l'estat del semafor. Cal que tingui en
    compte que el semafor pot estar apagat i, en aquest cas, no es
    produeixen rotacions ni es comptabilitzen ticks.*/
  if (state != Off){			/*Si el semafor está engegat fes la funció*/
    if(ticks_remaining == 0){		/*S'ha arribat al final dels "ticks"?*/
      if(state == Clear){		/*Hem acabat dels "ticks". ¿Estem en verd?*/
	semaphore_next();		/*Ves al següent estat.*/
	state = Approach;		/*Indicat que ara estás en taronja.*/
	ticks_remaining = 10;	        /*Reinicia els "ticks" amb el valor del taronga.*/
      }
      else if(state == Approach){	/*Hem acabat dels "ticks". ¿Estem en taronja?*/
	semaphore_next();		/*Ves al següent estat.*/
	state = Stop;			/*Indicat que ara estás en vermell.*/
	ticks_remaining = 60;	        /*Reinicia els "ticks" amb el valor del vermell.*/
      }
      else if(state == Stop){		/*Hem acabat dels "ticks". ¿Estem en vermell?*/
	semaphore_next();		/*Ves al següent estat.*/
	state = Clear;			/*Indicat que ara estás en verd.*/
	ticks_remaining = 40;	        /*Reinicia els "ticks" amb el valor del verd.*/
      }
    }
    else ticks_remaining--;	/*No hem arribat als 0 "ticks". Resta una unitat.*/  
  }
}
