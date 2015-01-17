#define _POSIX_C_SOURCE 200809L
#include "shrtbl.h"
 
//COMPILAR AMB -pthread

static taula *addr;
static taula *t;  //wait
int fd;




int remove_shared_table(void){
  int ft;
  if ((ft=shm_unlink("nomfit"))==-1){
    sem_destroy(&(t->w));
    return ERR;
  }
  sem_destroy(&(t->w));
  return OK;	
}


int create_shared_table(void){
	int c;

	if((fd=shm_open("nomfit", O_RDWR|O_CREAT,S_IRUSR|S_IWUSR))==-1) return ERR;
  c=ftruncate(fd,SIZE);
  if (c == -1){
   	remove_shared_table();
   	return ERR;
  }
  return OK;
}



int bind_shared_table(void){
  int c;
  fd = shm_open("nomfit", O_RDWR, S_IRUSR|S_IWUSR);	
  if (fd == -1) {
    return ERR;
  }
  addr=mmap(NULL,SIZE,PROT_READ|PROT_WRITE, MAP_SHARED,fd,0);

  if (addr==MAP_FAILED){
    remove_shared_table();
    return ERR;
  }
  c=close(fd);
  if(c==-1){
    remove_shared_table();
    return ERR;
  }
  t=addr;
  return OK;
}



void init_table(void){
  t->max=0;
  sem_init(&(t->w),1,1);
}

int add_party(const char id[]){
  int i;
  
  sem_wait(&(t->w));
  // Recorrem la t
  for (i = 0; i < t->max; i++){
    // Comrpovem si el partit esta a la t
    if (strcmp(t->dades[i].partit,id)==0){
      printf("Aquet partit ja existeix a la t\n");
      sem_post(&(t->w));
      return OK;
    }
  }
  // Si no ho esta l'afegim
  strcpy(t->dades[t->max].partit,id);
  (t->max)++;
  sem_post(&(t->w));
  return OK;
}

int del_party(const char id[]){
  int i;
  
  sem_wait(&(t->w));
  for (i = 0; i < t->max; i++){
    if (strcmp(t->dades[i].partit,id)==0){
      // Canviem el partit de dalt per el que volem canviar
      t->dades[i] = t->dades[t->max];
      // Eliminem el partit de dalt
      (t->max)--;
      sem_post(&(t->w));
      return OK;
    }
  }
  printf("Aquest partit no existeix\n");
  sem_post(&(t->w));
  return OK;
}

void inc_votes(const char party[], int vots){
  int i;
  bool a = false;
  
  sem_wait(&(t->w));
  // Mateix concepte que abans, busquem el partit a la t
  for (i = 0; i<t->max; i++){
    if (strcmp(t->dades[i].partit,party) == 0){
      // Si el trobem li sumem els vots
      t->dades[i].vots += vots;
      a = true;
      break;
    }
  }
  // Si no el trobem error
  if (a == false) printf("No s'ha trobat el partit\n");
  sem_post(&(t->w));
}

int get_votes(const char party[]){
  int i;
  
  sem_wait(&(t->w));
  
  for(i = 0; i<t->max; i++){
    if (strcmp(t->dades[i].partit,party) == 0){
      sem_post(&(t->w));
      return t->dades[i].vots;
    }
  }
  printf("Aquet partit no existeix\n");
  sem_post(&(t->w));
  return ERR;
}

int get_nparties(void){
  int a;
  
  sem_wait(&(t->w));
  a = t->max;
  sem_post(&(t->w));
  
  return a;
}

void traverse(travapp *const f, void *const data){
  int i;
   
  sem_wait(&(t->w));
  //-------------------------------------
  for (i = 0; i < t->max; i++){
    f(t->dades[i].partit,t->dades[i].vots,NULL);
  }
  sem_post(&(t->w)); 
}

/*
int main(void){
  
  int a,b;
  create_shared_table();
  bind_shared_table();
  init_table();
  
  add_party("Pato");
  add_party("Lobo");
  printf("Afegit Pato i Lobo\n");
 
  inc_votes("Pato",2);
  
  b = get_votes("Pato");
  printf("Numero de vots de Pato: %d\n",b);
  
  a = get_nparties();
  printf("Numero de partits: %d\n",a);


  add_party("Pato");
  del_party("Pato");

  a = get_nparties();
  remove_shared_table();
  printf("Numero de partits: %d\n",a);
  return 0;
}
*/
