#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <stdbool.h>
#include <unistd.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <fcntl.h>  
#include "matrix.h"
#define POSIX_C_SOURCE_200809L

int main (void){

  pid_t pid;
  int i,a,c,e,t[4],fd;
  char ch[]="child";
  char child[8],child2[2];
  void *addr;
  fd=shm_open ("nomfit",O_RDWR|O_CREAT,S_IRUSR|S_IWUSR);
  if (fd==-1) exit(EXIT_FAILURE);
  if(ftruncate(fd,3*SIZE)==-1)exit(EXIT_FAILURE);
  addr=mmap(NULL,3*SIZE,PROT_READ|PROT_WRITE,MAP_SHARED,fd,0);
  if(addr==MAP_FAILED) exit(EXIT_FAILURE);
  // memcpy(addr,"Hola",5);
  close(fd);
  matrix A = addr;
  matrix B = addr + SIZE;
  matrix R = addr + 2*SIZE;

  for (i = 0; i < 4; i++){
    pid = fork();
    if (pid > 0){	
      t[i]=pid;
    }	
    else if (pid == -1){
      fprintf(stderr,"Fork failed");
      exit(EXIT_FAILURE);
    }
    else if (pid == 0){
      sprintf(child,"%s%d",ch,i);
      sprintf(child2,"%d",i);
      e=execlp("./child",child,"nomfit",child2,NULL);
      if (e!=0){
	printf("%s\n","Error al cridar el programa");
	exit(EXIT_FAILURE);
      }
      exit(EXIT_SUCCESS);
    } 
  }
  for (a=0;a<i;a++){
  wait(&c);
  if (WIFEXITED(c)){
    if (WEXITSTATUS(c)==EXIT_FAILURE){
      for (a=0;a<i;a++){
	printf("%s\n","Process matat");
	kill(t[a],SIGTERM);
	wait(NULL);
      }
      shm_unlink("nomfit");
      exit(EXIT_FAILURE);     
    }
  }
  }
  shm_unlink("nomfit");
  exit(EXIT_SUCCESS); 
}
