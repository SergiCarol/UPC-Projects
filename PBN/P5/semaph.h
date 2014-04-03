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

#endif
