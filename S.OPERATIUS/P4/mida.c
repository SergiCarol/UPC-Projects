//#include <libc.h>
#include <sys/stat.h>
#include <stdio.h>


int main(int argc, char *argv[]) {

	struct stat buffer;
	int status,size_1,size_2,result=0;
	if (argc>1){
		 status=stat(argv[1],&buffer);
		if (status==0){
		 		 size_1=buffer.st_size;
		 		 size_2=(buffer.st_blksize*buffer.st_blocks);
		 		 result = size_2-size_1;
		}
		else {
			printf("%s\n","No existeix el fitxer");
			return 1;
		}
	}

	printf("%s%d\n","Aquesat es la mida del fitxer: ",size_1);
	printf("%s%d\n","Aquesat es la mida del block: ",size_2);
	printf("%s%d\n","Aquesta es al diferencia: ",result);
	return 0;

}