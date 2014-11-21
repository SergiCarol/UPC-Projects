#ifndef ERROR_MORSE_H
#define ERROR_MORSE_H

#include <stdbool.h>
#include <inttypes.h>


//Estructura que retorna el resultat en hexadecimal dels bits de major pes (H) i menor pes (L).
typedef struct {
  uint8_t a;
  uint8_t b;
} numero;

uint8_t hex2byte(numero b);
static numero byte2hex(uint8_t b);

static uint8_t b2h(uint8_t b);
static uint8_t h2b(uint8_t b);

//Suma de totes les paraules de 1Byte que formen el bloc de dades, un cop feta la suma, s'agafen els bits de carry i es tornen a sumar, el resultat invertint els bits (CA1) es el Checksum. Si el resultat es tot '1' vol dir que no hi ha hagut errors i el Checksum es correcte. Els parametres d'entrada es un apuntador a una taula. 
numero check_morse(uint8_t dades[120]);

//Funciona igual que el Checksum. S'ha de processar el stream de bytes afegint un byte amb tot zeros al final. Si el resultat final es tot '0' vol dir que no hi ha hagut errors. Els parametres d'entrada es un apuntador a una taula.
numero crc_morse(uint8_t dades[120]);

//Funcio de test del Checksum. Els parametres d'entrada es una taula.
bool test_check_morse(uint8_t dades[120]);

//Funcio de test del CRC. Els parametres d'entrada es una taula.
bool test_crc_morse(uint8_t dades[120]);

#endif
