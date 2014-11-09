#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <stdbool.h>
#define POSIX_C_SOURCE_200809L


int main (void){

	pid_t pid;
	int i,a,c;
	int t[4];
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
			printf("%s%d\n","Soc el process ",i);
			exit(EXIT_SUCCESS);
		}
		
	}
	exit(EXIT_SUCCESS);
}