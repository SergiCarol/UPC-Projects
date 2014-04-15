#include<util/delay.h>
#include"semaph.h"

int main(void){
  
  semaph_t s;

  (*s).s=SemOff;
  semaph_init(&s, &PORTD, 5, &PORTD, 6, &PORTD, 7);
  semaph_set(s);

  while(1){
    _delay_loop_ms(100);
    semaph_get();
  }
  return 0;
}
