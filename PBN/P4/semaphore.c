#include<stdio.h>

void semaphore_init(void){
  semaphore_state_t state;
  state = SempahoreOff;
}
void semaphore_next(void){
  semaphore_state_t state;
  if state!=SemaphoreOff{
    if state>1{
	state++;
      }
    else if state=4{
	state=2;
      }
    }
}
void semaphore_set(sempahore_state_t s){
  state=s;
}
