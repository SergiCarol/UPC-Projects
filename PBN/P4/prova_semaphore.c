#include<util/delay.h>
#include"semaphore.h"

int main(void){
  semaphore_init();
  semaphore_state_t s;
  s=2;
  semaphore_set(s);
  return 0;
}
