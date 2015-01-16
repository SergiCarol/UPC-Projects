#include "shrtbl.h"

//COMPILAR AMB -pthread

sem_t w;  //wait,mutex
taula data_t;


int create_shared_table(void){
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
  i=shm_unlink("nomfit");
  if (i!=0) return ERR;
  if (sem_destroy(&w) == -1) return ERR;
  if (sem_destroy(&mutex) == -1) return ERR;
  return OK; 
}

int bind_shared_table(void){
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
/*
  OPERACIONS AMB SEMAFORS
  sem_init();
  sem_wait(&nom_semafor); Decrementa el valor del semafor, si el valor es negatiu boloqueja fins que sigui positiu
  sem_post(&nom_semafor); Incrementa el valor del semafor
  sem_destroy(&nom_semafor); Destrueix el semafor
*/

void init_table(void){
  // sem_init(nom_semafor,hi_han_forks?,estat_inicial)
  int i;
  if (sem_init(w,1,1) == -1) return ERR;
  if (sem_init(mutex,1,1) == -1) return ERR;
  data_t.max = 0;
  data_t.read_line = 0;
			   
}


int add_party(const char id[]){
  int i;
  
  sem_wait(w);
  // Recorrem la taula
  for (i = 0; i < data_t.max; i++){
    // Comrpovem si el partit esta a la taula
    if (strcmp(data_t.dades[i].partit,id)==0){
      printf("Aquet partit ja existeix a la taula\n");
      sem_post(w);
      return OK;
    }
  }
  // Si no ho esta l'afegim
  strcpy(data_t.dades[data_t.max].partit,id);
  (data_t.max)++;
  sem_post(w);
  return OK;
}

int del_party(const char id[]){
  int i;
  
  sem_wait(w);
  for (i = 0; i < data_t.max; i++){
    if (strcmp(data_t.dades[i].partit,id)==0){
      // Canviem el partit de dalt per el que volem canviar
      data_t.dades[i].partit = data_t.dades[max].partit;
      data_t.dades[i].vots = data_t.dades[max].vots;
      // Eliminem el partit de dalt
      (data_t.max)--;
      sem_post(w);
      return OK;
    }
  }
  printf("Aquest partit no existeix\n");
  sem_post(w);
  return OK;
}

void inc_votes(const char party[], int votes){
  int i;
  bool a = false;
  
  sem_wait(w);
  for (i = 0; i<data_t.max; i++){
    if (strcmp(data_t.dades[i].partit,id)==0){
      data_t.dades[i].vots += votes;
      a = true;
      break;
    }
  }
  if (a == false) printf("No s'ha trobat el partit\n");
  sem_post(w);
}

int get_votes(const char party[]){
  int i;
  
  sem_wait(w);
  for(i = 0; i<data_t.max; i++){
    if (strcmp(data_t.dades[i].partit,id)==0){
      sem_post(w);
      return data_t.dades[i].vots;
    }
  }
  printf("Aquet partit no existeix\n");
  return ERR;
}

int get_nparties(void){
  int a;
  
  sem_wait(w);
  a = data_t.max;
  sem_post(w);
  
  return a;
}
