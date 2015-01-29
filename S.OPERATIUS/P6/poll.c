#define _POSIX_C_SOURCE 200809L
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

#include "shrtbl.h"



int main(int argc, char *argv[]){
  int a;

  // Ens ajuntem amb la memoria compartida del pollgraph
  if (bind_shared_table() == ERR){
    fprintf(stderr,"Error al fer el bind\n");
    return 1;
  }

  switch (argc){
  case 3 :
    // Si lo que hem escrit es "new"....
    if (strcmp(argv[1],"new") == 0) add_party(argv[2]);
    else if (strcmp(argv[1],"del") == 0) del_party(argv[2]);
    else printf("Error, parametres incorrectes 1\n");
    break;
  case 4 :
    // Si lo que em escrit es "add"...
    if (strcmp(argv[1],"add") == 0) inc_votes(argv[2],atoi(argv[3]));
    else if (strcmp(argv[1],"del") == 0) del_party(argv[2]);
    else printf("Error, parametres incorrectes 2\n");
    break;
    // Crec que faria falta un "del" per borrar la taula.....
  default:
    printf("Error, esciur new o add\n");
  }
  a = get_nparties();
  
  printf("Numero de partits: %d\n",a);
  
}
