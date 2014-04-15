#include<util/delay.h>
#include"semaph.h"

int main(void){
  
  semaph_t s;
  semaph_state_t a;
  a=SemClear;
  (*s).s=SemOff;
  semaph_init(&s, &PORTD, 5, &PORTD, 6, &PORTD, 7);
  semaph_set(s, a);

  while(1){
    _delay_loop_ms(100);
    a=semaph_get(s);
    semaph_set(s,a);
  }
  return 0;
}
