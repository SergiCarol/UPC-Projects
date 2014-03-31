#include<util/delay.h>
#include"semaphore.h"

int main(void){
  semaphore_init();
  semaphore_state_t s;
  s=2;
  semaphore_set(s);
  while(1){
 	semaphore_next();
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

  }

  return 0;
}
