#include "matrix.h"
#include <stdio.h>

void prod_matrix(const matrix a, const matrix b, matrix r,int minf, int maxf, int minc, int maxc){
  int i,j,k;
  for(i = minf; i < maxf;i++){
    for(j = minc; j < maxc; j++){
      for (k = 0;k < DIM; k++){ 
	r[i][j]+= a[i][k] * b[k][j];
      }
    }
  }
}

void print_matrix(const matrix a){
  int i,j;
  for (i = 0; i < DIM; i++){
    for (j = 0; j < DIM; j++){
      printf("%lf ",a[i][j]);
      if (j==7) printf("\n");
    }
  }
  printf("\n");
}

void const_matrix(matrix m, float v){
  int i,j;
  for (i = 0; i < DIM; i++){
    for (j = 0;j < DIM; j++){
      m[i][j] = v;
    }
  }
}

void save_matrix(const char filename[],const matrix m){
  int i,j;
  FILE *fp;
  
  fp = fopen(filename,"w");
  for (i = 0; i < DIM; i++){
    for (j = 0;j < DIM; j++){
      fprintf(fp,"%f ",m[i][j]);
    }
    fprintf(fp,"\n");
  }
  fclose(fp);
}

void load_matrix(const char filename[],matrix m){
  int i,j;
  FILE *fp;  
  fp = fopen(filename,"r");
  for (i = 0; i < DIM; i++){
    for (j = 0;j < DIM; j++){
      fscanf(fp,"%f,",&m[i][j]);
    }
  }
  fclose(fp);
}

