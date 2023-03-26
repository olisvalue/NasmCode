#include <stdio.h>
#include <string.h>
#include <malloc.h>
#include <stdlib.h>

long int filesize( FILE *fp ) {
    long int save_pos, size_of_file;

    save_pos = ftell( fp );
    fseek( fp, 0L, SEEK_END );
    size_of_file = ftell( fp );
    fseek( fp, save_pos, SEEK_SET );
    return( size_of_file );
  }

void main(int argc, char **argv){

    int length;
    length = strlen(argv[2]);

    char ch;
    char str[100000];
    int i = 0, j = 0;
    int kk = 0;
    int count = 0;


    FILE* fin ;

    fin = fopen(argv[1], "r+");

    while ( count != filesize(fin) ) {   //считали все символы из файла
        ch = fgetc(fin);
        str[i] = ch;
        i++;
        count++;
    }
    for (i = 0; i < count; i++){    //найдём и заменим то, что надо, остальное не тронем
        for (j = 0; j < length; j++) {
            if (str[i] == (argv[2])[j]){
                i++;
                kk++;

            }

            else {
                j = length;
                i = i - kk;
                kk = 0;
            }

        }
        i = i - kk;
        if (kk == length) {
            for (j = 0; j < length; j++) {
                str[i] = (argv[3])[j];
                i++;
            }
            i = i - kk;
        }

    }

    fclose(fin);

    fin = fopen(argv[1], "w");  //удалили всё из файла  

    fclose(fin);

    fin = fopen(argv[1], "r+"); //записали в файл обратно всё то, что там было, НО с уже выполненной заменой слова
    fwrite (str, 1, count, fin);
    fclose(fin);

}
