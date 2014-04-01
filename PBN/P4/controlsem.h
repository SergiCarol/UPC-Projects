#ifndef __CONTROLSEM_H
#define __CONTROLSEM_H

#define Off 0
#define Clear 2
#define Approach 3
#define Stop 4

void controlsem_init();
void tick_monitor(void);
void tick_semaphore(void);

#endif