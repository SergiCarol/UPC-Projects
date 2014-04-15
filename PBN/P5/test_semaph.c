#include<util/delay.h>
#include"semaph.h"

int main(void){
  
  semaph_t s;
  semaph_state_t a,b,c,d,h;
  a=SemClear;
  b=SemApproach;
  c=SemStop;
  semaph_init(&s, &PORTD, 5, &PORTD, 6, &PORTD, 7);
  
  while(1){
    _delay_ms(1000);
    semaph_set(&s,a);
    _delay_ms(1000);
    semaph_set(&s,b);
   
    _delay_ms(1000);
    semaph_set(&s,c);
    _delay_ms(1000);
    semaph_set(&s,h);
    _delay_ms(1000);
    semaph_set(&s,d);
    _delay_ms(1000);
    d=semaph_get(s);
  }
  return 0;
}
