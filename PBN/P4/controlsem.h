#ifndef __CONTROLSEM_H
#define __CONTROLSEM_H

#define Off 0
#define Clear 2
#define Approach 3
#define Stop 4

static typedef struct {											// pin_t.port agafa el port
	uint8_t  estat = 0;						
	uint8_t ticks_remaining;
} semaphore_control;

#endif