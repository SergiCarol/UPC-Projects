#include "shrtbl.h"

//COMPILAR AMB -pthread
sem_t w,mutex;  //wait,mutex

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
  // apartir d'aqui ja no se xD
}
