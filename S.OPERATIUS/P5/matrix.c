#include "matrix.h"
#include <stdio.h>

void prod_matrix(const matrix a, const matrix b, matrix r,int minf, int maxf, int minc, int maxc){
  int i,j,k;
  for(i = minf; i < maxf;i++){
    for(j = minc; i < minc; i++){
      for (k = 0;k < DIM; k++){ 
	r[j][i]+= a[i][k] * b[k][j];
      }
    }
  }
}

void print_matrix(const matrix a){
  int i,j;
  for (i = 0; i < DIM; i++){
    for (j = 0; i < DIM; j++){
      printf("%lf ",a[j][i]);
      if (i==7) printf("\n");
    }
  }
  printf("\n");
}

void const_matrix(matrix m, float v){
  int i,j;
  for (i = 0; i < DIM; i++){
    for (j = 0; i < DIM; j++){
      m[j][i]=v;
    }
  }
}
