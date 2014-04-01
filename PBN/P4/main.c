#include"controlsem.h"
#include<stdio.h>
#include<util/delay.h>

int main(void){
  controlsem_init();
  while(1){
    _delay_ms(2000);
    tick_monitor();
    tick_semaphore();
  }
