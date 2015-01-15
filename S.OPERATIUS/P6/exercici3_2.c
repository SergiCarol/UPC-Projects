#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

int main(void){

  FILE *gnuplotPipe;
  time_t random;

  gnuplotPipe = popen("gnuplot","w");
  srand((unsigned)time(&random));
  
  if (!gnuplotPipe){
    fprintf (stderr, "Error\n");
    exit(EXIT_FAILURE);
  }

  else {
    printf ("OK\n");
    fprintf(gnuplotPipe,"set auto x\n");
    fprintf(gnuplotPipe,"set yrange [2:20]\n");
    fprintf(gnuplotPipe,"set style histogram cluster gap 1\n");
    fprintf(gnuplotPipe,"set style fill transparent solid 0.75 border -3\n");
    fprintf(gnuplotPipe,"set output 'ex1.png'\n");
    fprintf(gnuplotPipe,"set boxwidth 0.75\n");
    fprintf(gnuplotPipe,"set bmargin 3\n");
    fprintf(gnuplotPipe,"set grid x\n");
    fprintf(gnuplotPipe,"set grid y\n");
    fprintf(gnuplotPipe,"set xlabel 'Agrupacions'\n");
    fprintf(gnuplotPipe,"set ylabel 'Vots (Percentatge)\n");
    fprintf(gnuplotPipe,"plot '-' u 2:xticlabels(1) w boxes ls 2 notitle\n");
    fprintf(gnuplotPipe,"Petra 20\n");
    fprintf(gnuplotPipe,"Pol 3\n");
    fprintf(gnuplotPipe,"Paula 7\n");
    fprintf(gnuplotPipe,"Pep 7\n");
    fprintf(gnuplotPipe,"e\n");
  }
  
  while(true){
    fflush(gnuplotPipe);
    sleep(4);
    fprintf(gnuplotPipe,"replot\n");
    fprintf(gnuplotPipe,"Petra %d\n",rand() % 20);
    fprintf(gnuplotPipe,"Pol %d\n",rand() % 20);
    fprintf(gnuplotPipe,"Paula %d\n",rand() % 20);
    fprintf(gnuplotPipe,"Pep %d\n",rand() % 20);
    fprintf(gnuplotPipe,"e\n");
  }
  
  pclose(gnuplotPipe);
  return 0;
}
