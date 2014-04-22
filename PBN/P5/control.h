#ifndef CONTROL
#define CONTROL

typedef enum {StreetA, StreetB} street_t;

typedef struct{
	street_t nom;
	semaph_t state;
} carrer;

typedef struct{
	uint8_t estat;
	uint8_t ticks;
} control_carrer;




#define Aclear 0
#define AtoB 1
#define Bclear 2
#define BtoA 3
#define Off 4

void control_init(void);
void control_force(street_t t);
void control_off(void);
void control_on(void);
semaph_state_t control_get_state(street_t s);

#endif
