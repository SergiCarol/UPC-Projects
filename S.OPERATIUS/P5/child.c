#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <stdbool.h>
#include <unistd.h>
#include <sys/mman.h>
#include <sys/stat.h>        
#include <fcntl.h> 
#include <string.h>
#include "matrix.h"        
#define _POSIX_C_SOURCE_200809L

int main(int argc, char *argv[]){
  int i,fd;
  void *addr;
  struct stat st;
  if (argc==3){
    fd = shm_open(argv[1],O_RDWR,0);
    if(fstat(fd,&st)==-1) exit(EXIT_FAILURE);
    addr=mmap(NULL,st.st_size,PROT_READ | PROT_WRITE,MAP_SHARED,fd,0);
    i=close(fd);
    if (i!=0){
      printf("%s\n","Close erroni");
      shm_unlink("nomfit");
      exit(EXIT_FAILURE);
    }

    matrix AA = addr;
    matrix BB = addr + SIZE;
    matrix RR = addr + SIZE*2;
    if (*argv[2]=='0'){
      prod_matrix(AA,BB,RR,0,DIM/2,0,DIM/2);
    }
    else if (*argv[2]=='1'){
      prod_matrix(AA,BB,RR,DIM/2,DIM,0,DIM/2);
    }
    else if (*argv[2]=='2'){
      prod_matrix(AA,BB,RR,0,DIM/2,DIM/2,DIM);
    }
    else if (*argv[2]=='3'){
      prod_matrix(AA,BB,RR,DIM/2,DIM,DIM/2,DIM);
    }
  }
  else exit(EXIT_FAILURE);

  exit(EXIT_SUCCESS);
}
