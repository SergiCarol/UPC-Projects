#include <sys/types.h>
#include <dirent.h>
#include <stdio.h>

#define NULL ((void *)0)

//struct dirent *readdir(DIR *dirp);

//int readdir_r(DIR *dirp, struct dirent *entry, struct dirent **result);

int main(int argc, char *argv[]){
  struct dirent *dir;
  //const char *d_name;  
  DIR *fitxer;
  if (argc > 1){
    fitxer=opendir(argv[1]);
    while(dir!=NULL){
    dir=readdir(fitxer);
    //d_name= dir->d_name;
    if (!dir) break;   
    if (dir -> d_name[0] != '.'){
      printf("%s\n",dir->d_name);
      }
    }
  }
}
