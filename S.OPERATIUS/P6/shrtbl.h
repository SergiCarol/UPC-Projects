#ifndef __SHRTBL_H
#define __SHRTBL_H

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <semaphore.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/stat.h>        /* For mode constants */
#include <fcntl.h> 


#define OK 0
#define ERR 1
#define DIM 30
#define SIZE sizeof(taula)

typedef struct {
  char partit [DIM/2];
  int vots;
  // Cada "partit" es una linia
} partit;

typedef struct{
  int max;
  // Numero de linies que podem tenir
  partit dades[DIM];
}taula;

typedef void travapp(const char *const id, int votes, void *const data);

int create_shared_table(void);
int remove_shared_table(void);
int bind_shared_table(void);
void init_table(void);
int add_party(const char id[]);
int del_party(const char id[]);
void inc_votes(const char party[], int votes);
int get_votes(const char party[]);
int get_nparties(void);
void traverse(travapp *const f, void *const data);


#endif
