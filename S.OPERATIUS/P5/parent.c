#include <stdio.h>
#include <stdlib.h>


#define POSIX_C_SOURCE_200809L


int main (void){

	pid_t pid;
	pid = fork();
	pid = fork();
	pid = fork();
	switch (pid){
		case (-1):
			fprintf(stderr,"Fork failed");
			exit(1);
		case (0):
			printf("%s%d\n","Soc el process ",getpid());
			exit(0);
		default:
			wait(NULL);
			wait(NULL);
			wait(NULL);
			wait(NULL);
			return 0;
	}	
}