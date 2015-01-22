#define _POSIX_C_SOURCE 200809L
#include "shrtbl.h"

#define VALOR_VOTS(x,y) ((x*y)/100) 
#define PARCENTATGE(x,y)((x/y)*100)

//COMPILAR AMB -pthread

static taula *addr;
static taula *t;  //wait
static int vots_totals = 0;
int fd;


static int calculate_parcentage(int vots_afegir, int vots_actuals){
  float i,j;
  printf("Vots_afegir i vots_actuals %d, %d \n",vots_afegir,vots_actuals);
  j = VALOR_VOTS(vots_actuals,(vots_totals-vots_afegir));
  j+=vots_afegir;
  //if (j == 0) j=vots_afegir;
  printf("VALOR_VOTS %f \n",j);
  i = PARCENTATGE(j,vots_totals);
  printf("PARECENTATGE %f \n",i);
  return i;
}

static void actualitza_parcentatge(int vots_afegir ,int f){
  float i,j;
  int a,total;
  total = vots_totals - vots_afegir;
  
  printf ("Vots totals dintr antualitza %d\n",total);
  for (a = 0; a < t->max; a++){
    if (a!=f){
      printf("Estem mirant: %s\n",t->dades[a].partit);
      printf("Vots actuals actualitza %d\n",t->dades[a].vots);
      j = VALOR_VOTS(t->dades[a].vots,(vots_totals-vots_afegir))+0.05;
      printf("VALOR_VOTS actualitza %0.1f \n",j);
      t->dades[a].vots= PARCENTATGE(j,vots_totals);
      printf("Valor percentatge actualitza %f \n",PARCENTATGE(j,vots_totals));
    }
  }
}


int create_shared_table(void){
  int i;
  
  fd=shm_open("nomfit", O_RDWR|O_CREAT,S_IRUSR|S_IWUSR);
  if (fd==-1) return ERR;

  if (ftruncate(fd,SIZE) == -1){
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
  if (sem_destroy(&(t->w)) == -1) return ERR;

  return OK; 
}


int bind_shared_table(void){
  int i;
    
  fd = shm_open("nomfit", O_RDWR, S_IRUSR|S_IWUSR);	
  if (fd == -1) return ERR;
 
  addr=mmap(NULL,SIZE,PROT_READ|PROT_WRITE, MAP_SHARED,fd,0);

  if (addr==MAP_FAILED){
    shm_unlink("nomfit");
    return ERR;
  }

  close(fd);
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
      printf("Aquet partit ja existeix a la taula\n");
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
  int i,j;
  
  sem_wait(&(t->w));
  for (i = 0; i < t->max; i++){
    if (strcmp(t->dades[i].partit,id)==0){
      // Canviem el partit de dalt per el que volem canviar
      for (i;i<t->max;i++) t->dades[i] = t->dades[i+1];
      // Eliminem el partit de dalt
      t->max--;
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
  
  vots_totals += vots;
  printf("vots_totals %d \n",vots_totals);
  sem_wait(&(t->w));
  // Mateix concepte que abans, busquem el partit a la t
  for (i = 0; i<t->max; i++){
    if (strcmp(t->dades[i].partit,party) == 0){
      // Si el trobem li sumem els vots
      t->dades[i].vots = calculate_parcentage(vots,t->dades[i].vots);
      actualitza_parcentatge(vots,i);
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
static void printentry(const char *const id, int votes, void *const data) {
  printf("%s %d\n", id, votes);
}

int main(void){
  
  int a,b;
  float i;

  create_shared_table();
  bind_shared_table();
  init_table();
  
  add_party("Pato");

  printf("Afegit Pato i Lobo\n");

  inc_votes("Pato",2);
  add_party("Lobo");
  inc_votes("Lobo",2);
  inc_votes("Pato",3);
  
  b = get_votes("Pato");
  printf("Numero de vots de Pato: %d\n",b);
  
  a = get_nparties();
  printf("Numero de partits: %d\n",a);

  add_party("Hola");
  
  //printf("Afegit Hola \n");


  a = get_nparties();

  inc_votes("Hola",3);
  inc_votes("Hola",3);
  traverse(printentry,NULL);
  
  remove_shared_table();
  printf("Numero de partits: %d\n",a);
  
  return 0;
}





*/
