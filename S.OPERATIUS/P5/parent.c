#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <stdbool.h>
#include <unistd.h>
#include "matrix.h"
#define POSIX_C_SOURCE_200809L


int main (void){

	pid_t pid;
	int i,a,c,e;
	int t[4];
	char ch[]="child";
	char child[8],child2[2];
	for (i = 0; i < 4; i++){
		pid = fork();
		if (pid > 0){	
			t[i]=pid;
			wait(&c);
			if (WIFEXITED(c)){
				if (WEXITSTATUS(c)==EXIT_FAILURE){
					for (a=0;a<=i;a++){
						printf("%s\n","Process matat");
						kill(t[a],SIGTERM);
						wait(NULL);
					}
					exit(EXIT_FAILURE);
				}
			}
		}	
		else if (pid == -1){
			fprintf(stderr,"Fork failed");
			exit(EXIT_FAILURE);
		}
		else if (pid == 0){
			sprintf(child,"%s%d",ch,i);
			sprintf(child2,"%d",i);
			e=execlp("./child",child,"hola",child2,NULL);
			printf("%d\n",i );
			if (e!=0){
				printf("%s\n","Error al cridar el programa");
				exit(EXIT_FAILURE);
			}
			exit(EXIT_SUCCESS);
		}
		
	}
	exit(EXIT_SUCCESS);
}