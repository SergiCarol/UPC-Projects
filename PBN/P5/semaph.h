#ifndef __SEMAPH_H
#define __SEMAPH_H

typedef enum{
  SemOff,
  SemClear,
  SemApproach,
  SemStop,
} semaph_state_t;

typedef struct{
  lamp_t l;
  semaph_state_t s;
} semaph_t;

void semaph_init(semaph_t *const s, volatile uint8_t *port, uint8_t pin);
void semaph_set(semaph_t *const sem, semaph_state_t s);
semaph_state_t sempah_get(const semaph_t sem);

#endif
