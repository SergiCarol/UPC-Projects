#include "shrtbl.h"
 
//COMPILAR AMB -pthread


taula data_t;
sem_t w;  //wait
int fd;
void *addr;


int create_shared_table(void){
  int i;
  
  fd=shm_open ("nomfit",O_RDWR|O_CREAT,S_IRUSR|S_IWUSR);
  if (fd==-1) return ERR;
  
  if ((ftruncate(fd,SIZE))==-1){
    shm_unlink("nomfit");
    return ERR;
  }
  i = close(fd);
  
  return OK;
}

int remove_shared_table(void){
  int i;
  i=shm_unlink("nomfit");
  if (i!=0) return ERR;
  if (sem_destroy(&w) == -1) return ERR;
  return OK; 
}

int bind_shared_table(void){
  int i;
  
  fd=shm_open ("nomfit",O_RDWR|O_CREAT,S_IRUSR|S_IWUSR);
  if (fd==-1) return ERR;

  addr=mmap(NULL,SIZE,PROT_READ|PROT_WRITE,MAP_SHARED,fd,0);

  if(addr==MAP_FAILED) {
    shm_unlink("nomfit");
    return ERR;
  }
  i = close(fd);
  
  return OK;
}

void init_table(void){

  sem_init(&w,1,1);
  data_t.max = 0;
}


int add_party(const char id[]){
  int i;
  
  sem_wait(&w);
  // Recorrem la taula
  for (i = 0; i < data_t.max; i++){
    // Comrpovem si el partit esta a la taula
    if (strcmp(data_t.dades[i].partit,id)==0){
      printf("Aquet partit ja existeix a la taula\n");
      sem_post(&w);
      return OK;
    }
  }
  // Si no ho esta l'afegim
  strcpy(data_t.dades[data_t.max].partit,id);
  (data_t.max)++;
  sem_post(&w);
  return OK;
}

int del_party(const char id[]){
  int i;
  
  sem_wait(&w);
  for (i = 0; i < data_t.max; i++){
    if (strcmp(data_t.dades[i].partit,id)==0){
      // Canviem el partit de dalt per el que volem canviar
      data_t.dades[i] = data_t.dades[data_t.max];
      // Eliminem el partit de dalt
      (data_t.max)--;
      sem_post(&w);
      return OK;
    }
  }
  printf("Aquest partit no existeix\n");
  sem_post(&w);
  return OK;
}

void inc_votes(const char party[], int votes){
  int i;
  bool a = false;
  
  sem_wait(&w);
  // Mateix concepte que abans, busquem el partit a la taula
  for (i = 0; i<data_t.max; i++){
    if (strcmp(data_t.dades[i].partit,party) == 0){
      // Si el trobem li sumem els vots
      data_t.dades[i].vots += votes;
      a = true;
      break;
    }
  }
  // Si no el trobem error
  if (a == false) printf("No s'ha trobat el partit\n");
  sem_post(&w);
}

int get_votes(const char party[]){
  int i;
  
  sem_wait(&w);
  
  for(i = 0; i<data_t.max; i++){
    if (strcmp(data_t.dades[i].partit,party) == 0){
      sem_post(&w);
      return data_t.dades[i].vots;
    }
  }
  printf("Aquet partit no existeix\n");
  sem_post(&w);
  return ERR;
}

int get_nparties(void){
  int a;
  
  sem_wait(&w);
  a = data_t.max;
  sem_post(&w);
  
  return a;
}

void traverse(travapp *const f, void *const data){
  int i;
   
  sem_wait(&w);
  //-------------------------------------
  for (i = 0; i < data_t.max; i++){
    f(data_t.dades[i].partit,data_t.dades[i].vots,NULL);
  }
  sem_post(&w); 
}

 
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
  
  printf("Numero de partits: %d\n",a);
  return 0;
}
