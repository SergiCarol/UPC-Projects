#include <sys/types.h>
#include <dirent.h>
#include <sys/stat.h>
#include <stdio.h>

#define NULL ((void *)0)

int main(int argc, char *argv[]) {
	DIR *fitxer;
	struct stat buffer;
	int status,size_1,size_2,result=0;
	struct dirent *dir;
	if (argc>1){
    	fitxer=opendir(argv[1]);
    	while((dir = readdir(fitxer)) != NULL){  
    		if (dir -> d_name[0] != '.'){
				status=stat(dir -> d_name,&buffer);
				if (status==0){
		 		 	size_1=buffer.st_size;
		 		 	size_2=(512*buffer.st_blocks);
		 		 	result = size_2-size_1;
					printf("%-20s%8d\n",dir->d_name,result);
				}
				else {
					printf("%s\n","No existeix el fitxer");
					return 1;
				}
			}
		}
	}
	return 0;
}