#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <stdbool.h>
#include <unistd.h>
#include <sys/mman.h>
#include <sys/stat.h>        
#include <fcntl.h>         
#define POSIX_C_SOURCE_20080

int main(int argc, char *argv[]){
	int i,fd;
	void *addr;
	struct stat st;
	if (argc==3){
//		for (i=0;i<3;i++) printf("%s ",argv[i]);
//		printf("\n");
		fd = shm_open(argv[1],O_RWR,0);
		if(fstat(fd,&st)==-1) exit(EXIT_FAILURE);
		addr=mmap(NULL,st.st_size,PROT_READ | PROT_WRITE,MAP_SHARED,fd,0);
		close(fd);
	}
	
	exit(EXIT_SUCCESS);
}