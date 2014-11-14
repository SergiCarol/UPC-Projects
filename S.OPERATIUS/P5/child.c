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
#define POSIX_C_SOURCE_20080

int main(int argc, char *argv[]){
  int i,fd;
  void *addr;
  struct stat st;
  if (argc==3){
    fd = shm_open(argv[1],O_RDWR,0);
    if(fstat(fd,&st)==-1) exit(EXIT_FAILURE);
    addr=mmap(NULL,st.st_size,PROT_READ | PROT_WRITE,MAP_SHARED,fd,0);
    close(fd);
    matrix AA = addr;
    matrix BB = addr + SIZE;
    matrix RR = addr + SIZE*2;
    if (*argv[2]=='0'){
      const_matrix(AA,5);
    }
    if (*argv[2]=='3'){
      print_matrix(BB);
    }
     print_matrix(AA);
  }
  else exit(EXIT_FAILURE);

  exit(EXIT_SUCCESS);
}
