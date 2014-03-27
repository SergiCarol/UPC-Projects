#include <avr/io.h>
#include <stdbool.h>

#define DDR(p) (*(p-1));

typedef enum {Input, Output} pin_direction_t; 

typedef struct {
	volatile uint8_t ∗port = NULL;
	uint8_t pin;
} pin_t;


pin_t pin_create(volatile uint8_t *port , uint8_t pin, pin_direction_t d){
	pin_t = pins;
	pins.port = port;
	pins.pin =  pin;
	if (d==Input) DDR(port)=(port &= ~(1<<pin)); 			// Input , fiquem a o el bit 0.pin  neguem el (1<<pin) i fem una and amb el port 
	else if (d==Output) DDR(port)=((port=0x00) |= (0<<pin));

	return pins;
}

void pin_w(pin_t p,bool v){

	if (v == TRUE){
		//DDR(p.port)=0xFF;
		p.port=(p.port |= (1<<p.pin));
	}
	else{
		//DDR(p.port)=0xFF;
		p.port=((p.port=0x00) &= ~(1<<p.pin));

	}
}

bool pin_r(pin_t p){
	int i;

	//DDR(p.port)=0x00;
	i=(p.port & (1<<p.pin));
	return i;
}

void pin_toggle(pin_t p){

	p.port = port;
	p.pin = pin;
}