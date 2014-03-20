#ifndef __SEMAPHORE_H
#define __SEMAPHORE_H

	typedef enum {
		SemaphoreOff=0,
		SemaphoreClear=2,
		SempahoreApproach=3,
		SempahoreStop=4,
	}	sempahore_state_t;

	void sempahore_init(void);
	void semamphore_next(void);
	void sempaphore_set(sempahore_state_t s);

#endif