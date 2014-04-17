#include <stdio.h>
#include "queue.h"

int main(void){
  queue_t q;
  queue_empty(&q);
  queue_enqueue(&q,'f');  
  queue_enqueue(&q,'a');  
  queue_enqueue(&q,'r');  
  queue_enqueue(&q,'g');  
  queue_enqueue(&q,'a');
  queue_enqueue(&q,'s');
  while (!(queue_is_empty(&q))){
    printf("%c \n",queue_front(&q));
    queue_dequeue(&q);
  }
  return 0;
}
