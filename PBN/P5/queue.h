#ifndef QUEUE_H
#define QUEUE_H

#define MIDA_BUFF 20
#include <stdbool.h>
#include <inttypes.h>

typedef struct
{
  uint8_t queue[MIDA_BUFF];
  uint8_t writePointer;
  uint8_t readPointer;
  uint8_t cont;       
} queue_t;

void queue_empty(queue_t *const q);
bool queue_is_empty(const queue_t *const q);
bool queue_is_full(const queue_t *const q);
void queue_enqueue(queue_t *const q, uint8_t v);
void queue_dequeue(queue_t *const q);
uint8_t queue_front(const queue_t *const q);

#endif
