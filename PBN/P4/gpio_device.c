#include "gpio_device.h"

// FUNCIONAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA TT que ilu

#define DDR(p) ((p-1))  									// Allo que ha ficat el sbs per no tenir que fer port-1v(pero sense apunt)
															// a el (*(p-1))


pin_t pin_create(volatile uint8_t *port , uint8_t pin, pin_direction_t d){
	pin_t p;
	int a,b;
	p.port = port;
	p.pin = pin;
	if (d==Input){ 
		*DDR(p.port)=((*p.port) & ~(1<<p.pin));	 			// Es amb un apuntador no sense...
	}														/* Input . Creem una serie de bits, agafem que pin es 2: 00000010  
															 a continuació neguem tot : 11111101, fem una and, deixan-ho tot igual 
															 menys el bit pin */ 
	else if (d==Output) {
		*DDR(p.port)=((*p.port) | (1<<p.pin));				// Fem una OR per tal de ficar el bit pin a 1
	return p;												// Retornem un objecte pin_t
	}
}

void pin_w(pin_t p,bool v){
	int a,b;
	*DDR(p.port)=((*p.port) | (1<<p.pin)); 					// Fiquem el bit del pin que volem llegir en mode escriptura
	if (v == true){											// Comprovem si volem ficar un 0 o un 1								
		(*p.port |= (1<<p.pin));							// Fiquem el valor del pin a 1 
	}
	else{													// Si no...
		(*p.port) &= ~(1<<p.pin);							// Fiquem el valor del pin a 0
	}
} 

bool pin_r(pin_t p){
	int a,b;
	bool i;
	*DDR(p.port)=((*p.port) & ~(1<<p.pin)); 				// Fiquem el DDR del pin en mode lecutra				
	i=(*p.port & (1<<p.pin));								// Guardem el valor del pin a i
	return i;		
}

void pin_toggle(pin_t p){
	bool a;
	
	a=pin_r(p); 											// Agafem el valor del pin
	if (a==true) pin_w(p,false);							// Si retorna TRUE, parem el led 
	else pin_w(p,true);										// Si retorna FALSE , encenem el led

}



void main(void){											// Main de proba
	bool i;
	pin_t a;												// Creem un type de pin_t
	pin_direction_t d;										// Creem una direcció
	d=Output;
	a=pin_create(&PORTD,6,d);								// Creem el pin (suposu que el port el ficarme sempre com a punter)
	while(1){
		i=pin_r(a);											// Llegim el valor del pin
		pin_toggle(a);										// L'anirem canviat de on a off
		_delay_loop_2(30000);								// Delay, ni idea de quant de temps és
		_delay_loop_2(30000);
		_delay_loop_2(30000);
		_delay_loop_2(30000);
	
	}
}
