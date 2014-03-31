#include<util/delay.h>
#include"semaphore.h"

int main(void){
  semaphore_init();
  semaphore_state_t s;
  s=3;
  semaphore_set(s);
  while(1){
  _delay_loop_2(40000);
  _delay_loop_2(40000);
  _delay_loop_2(40000);
    _delay_loop_2(40000);
  _delay_loop_2(40000);
  _delay_loop_2(40000);
    _delay_loop_2(40000);
  _delay_loop_2(40000);
  _delay_loop_2(40000);
    _delay_loop_2(40000);
  _delay_loop_2(40000);
  _delay_loop_2(40000);
    _delay_loop_2(40000);
  _delay_loop_2(40000);
  _delay_loop_2(40000);
    _delay_loop_2(40000);
  _delay_loop_2(40000);
  _delay_loop_2(40000);
  _delay_loop_2(40000);
  _delay_loop_2(40000);
  _delay_loop_2(40000);
    _delay_loop_2(40000);
  _delay_loop_2(40000);
  _delay_loop_2(40000);
    _delay_loop_2(40000);
  _delay_loop_2(40000);
  _delay_loop_2(40000);
    _delay_loop_2(40000);
  _delay_loop_2(40000);
  _delay_loop_2(40000);
    _delay_loop_2(40000);
  _delay_loop_2(40000);
  _delay_loop_2(40000);
    _delay_loop_2(40000);
  _delay_loop_2(40000);
  _delay_loop_2(40000);
  semaphore_next();

  }

  return 0;
}
