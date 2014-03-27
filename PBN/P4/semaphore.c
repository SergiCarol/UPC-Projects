#include<stdio.h>
#include<avr/scr_defs.h>
#include<avr/io.h>

DDRB=0xFF;

void semaphore_init(void){
  semaphore_state_t state;
  state = SempahoreOff;
  PD2=0;
  PD3=0;
  PD4=0;
}
void semaphore_next(void){
  semaphore_state_t state;
  if state!=0{
      if (state>1){
	state++;
	}
      else if (state=4){
	  state=2;
	}
    }
  swich(state){
  case 2:
    PD2=1;
    PD3=0;
    PD4=0;
    break;
  case 3:
    PD2=0;
    PD3=1;
    PD4=0;
    break;
  case 4:
    PD2=0;
    PD3=0;
    PD4=1;
    break;
  default:
    PD2=0;
    PD3=0;
    PD4=0;
  }
}

void semaphore_set(sempahore_state_t s){
  state=s;
  swich(state){
  case 2:
    PD2=1;
    PD3=0;
    PD4=0;
    break;
  case 3:
    PD2=0;
    PD3=1;
    PD4=0;
    break;
  case 4:
    PD2=0;
    PD3=0;
    PD4=1;
    break;
  default:
    PD2=0;
    PD3=0;
    PD4=0;
  }
}

