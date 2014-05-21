#include <stdio.h>
#include "mchar.h"

void print_morse(mchar_t m){

  mchar_iter_t i = mchar_iter(m);
  //printf("%d\n",i.m);
  //printf("%d\n",i.mask);
  //printf("%d\n",i.sentinel);
  while (mchar_valid(i)){
    if(mchar_next(&i) == MDot)
      printf(".");
    else
      printf("-");
  }
  printf("\n");
}

int main(void){
  
  printf("\nPRIMER TEST");
  printf("\n----------\n");

  mchar_t m = mchar(101);
  print_morse(m);

  m = mchar(1011);
  print_morse(m);

  m = mchar(0101);
  print_morse(m);

  m = mchar(00101);
  print_morse(m);

  printf("\nSEGON TEST");
  printf("\n----------\n");
  
  m = mchar(0);
  print_morse(m);
  m = mchar_add(m,MDash);
  print_morse(m);
  m = mchar_add(m,MDot);
  print_morse(m);
  m = mchar_add(m,MDash);
  print_morse(m);
}
