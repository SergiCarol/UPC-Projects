#define  _XOPEN_SOURCE
#define _POSIX_C_SOURCE 200809L
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <signal.h>

#include "shrtbl.h"

//#define VALOR_VOTS(x,y) ((x*y)/100) 
#define PARCENTATGE(x,y)((x/y)*100)

static int vots_totals=0;
static volatile bool must_end = false;
static FILE *gnuplotPipe;


static void handler(int sig) {
  must_end = true;
}

static void total_votes(const char *const id, int votes, void *const data) {
  
  vots_totals+= votes;  
  printf("vots totals: %d\n",vots_totals);
}

static int actualitza_parcentatge(float j){
  int i; //vots_totals
  i=PARCENTATGE(j,vots_totals);
  printf("Valor percentatge actualitza %d \n",i);
  return i;
}
static void printentry(const char *const id, int votes, void *const data) {

  fprintf(gnuplotPipe,"%s %d\n", id,actualitza_parcentatge(votes));
  fflush(gnuplotPipe);
}



void gnuplot_init(void){
  
  fprintf(gnuplotPipe,"reset\n");
  fprintf(gnuplotPipe,"set output 'ex1.png'\n");
  fflush(gnuplotPipe);
  fprintf(gnuplotPipe,"set auto x\n");
  fprintf(gnuplotPipe,"set boxwidth 0.75\n");
  fprintf(gnuplotPipe,"set bmargin 3\n");
  fprintf(gnuplotPipe,"set grid x\n");
  fprintf(gnuplotPipe,"set grid y\n");
  fprintf(gnuplotPipe,"set terminal png truecolor\n");
  fprintf(gnuplotPipe,"set style fill transparent solid 0.75 border -3\n");
  fprintf(gnuplotPipe,"set style data histogram\n");
  fprintf(gnuplotPipe,"set style histogram cluster gap 1\n");
  fprintf(gnuplotPipe,"set yrange [0:100]\n");
  fprintf(gnuplotPipe,"set ylabel 'Vots (Percentatge)'\n");
  fprintf(gnuplotPipe,"set xlabel 'Agrupacions'\n");
}

void actualitza(void){
  traverse(total_votes,NULL);
  fprintf(gnuplotPipe,"set output 'ex1.png'\n");
  fflush(gnuplotPipe);
  fprintf(gnuplotPipe,"replot\n");
  fflush(gnuplotPipe);
  if (get_nparties() > 0) traverse(printentry,NULL);
  fprintf(gnuplotPipe,"e\n");  
  fflush(gnuplotPipe);
  vots_totals=0;
}

int main(void){
  
  signal(SIGINT,handler);
  signal(SIGHUP,handler);
  
  gnuplotPipe = popen("gnuplot","w");
 
  if (!gnuplotPipe){
    fprintf (stderr, "Error\n");
    exit(EXIT_FAILURE);
  }
 
  if (create_shared_table() == ERR){
    fprintf(stderr,"Error al fer el bind\n");
    return 1;
  }
  if (bind_shared_table() == ERR) {
    fprintf(stderr,"Error al fer el bind\n");
    return 1;
  }
  init_table();

  gnuplot_init();

  while (get_nparties() == 0) sleep(2);
  fprintf(gnuplotPipe,"plot '-' using 2:xticlabels(1) w boxes ls 2 notitle\n");
  fflush(gnuplotPipe);
  traverse(printentry,NULL);
  fprintf(gnuplotPipe,"e\n");
  fflush(gnuplotPipe);

  while (!must_end){
   sleep(4);
   actualitza();
  }
  
  if (remove_shared_table() == ERR) {
    fprintf(stderr,"Error al borrar la taula\n");
    return 1;
  }
  pclose(gnuplotPipe);
  
  return 0;
}




/*
static int calculate_parcentage(int vots_afegir, int vots_actuals){
  float i,j;

  total_votes(vots_afegir);
  printf("Vots_totals %d \n",vots_totals);
  
  j = VALOR_VOTS(vots_actuals,(vots_totals-vots_afegir));
  j+=vots_afegir;
  //if (j == 0) j=vots_afegir;
  //printf("VALOR_VOTS %f \n",j);
  i = PARCENTATGE(j,vots_totals);
  printf("PARECENTATGE %f \n",i);
  return i;
  }*/
