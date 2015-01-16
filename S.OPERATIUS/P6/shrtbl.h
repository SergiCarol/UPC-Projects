#ifndef __SHRTBL_H
#define __SHRTBL_H

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <semaphore.h>
#include <string.h>



#define OK 0
#define ERR 1
#define SIZE 20

typedef struct {
  char partit [SIZE/2];
  int vots;
  // Cada "partit" es una linia
} partit;

typedef struct{
  // Linia per la qual estem llegint
  int read_line;
  // Linies totals
  int max;
  // Numero de linies que podem tenir
  partit dades[SIZE];
}taula;



int create_shared_table(void);
int remove_shared_table(void);
int bind_shared_table(void);
void init_table(void);
int add_party(const char id[]);
int del_party(const char id[]);
void inc_votes(const char party[], int votes);
int get_votes(const char party[]);
int get_nparties(void);

#endif
