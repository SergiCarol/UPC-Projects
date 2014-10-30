#include <sys/types.h>
#include <dirent.h>

struct dirent *readdir(DIR *dirp);

int readdir_r(DIR *dirp, struct dirent *entry, struct dirent **result);

int main(int argc, char *argv[]){
  struct dirent dir;  
  DIR *fitxer;
  if (argc > 1){
    fitxer=opendir(argv[1]);
    while(fitxer=!NULL){
      dir=readdir(fitxer);
      printf("%c\n",dir.d_name);
      fitxer=dir;
    }
  }
}
