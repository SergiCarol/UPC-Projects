#ifndef __QUEUE_H
#define __QUEUE_H

#include <stdbool.h>
#include <inttypes.h>
#define ELEMENTS 20

typedef struct
{
  uint8_t memoria[ELEMENTS];
  uint8_t comptador;
  uint8_t punter_lectura;
  uint8_t punter_escritura;     
} queue_t;

void queue_empty(queue_t *const q);
bool queue_is_empty(const queue_t *const q);
bool queue_is_full(const queue_t *const q);
void queue_enqueue(queue_t *const q, uint8_t v);
void queue_dequeue(queue_t *const q);
uint8_t queue_front(const queue_t *const q);

#endif
