#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <stdbool.h>
#include <unistd.h>
#define POSIX_C_SOURCE_20080

int main(int argc, char *argv[]){
	int i;
	if (argc==3){
		for (i=0;i<3;i++)
		printf("%s ",argv[i]);
	}
	printf("\n");
	exit(EXIT_SUCCESS);
}