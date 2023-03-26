#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>



int main() {
    float f;
    int j, k, i = 0, n = 0, numnum = 0, number = 0;
    int eax = 0, ebx = 0, ecx = 0, edx = 0;
    int levoe = 0, pravoe = 0;
    int numnumber[1000];
    char c;
    char str[1000];
    printf ("press 'ret' to stop \n");
    printf ("            eax ebx ecx edx \n");
    printf ("             %d   %d   %d   %d\n", eax, ebx, ecx, edx);
    while (1) {
        while ((c = getchar()) != '\n') {
            str[i++] = c;
            k = i;
        }

        for (i = 0; i < k; i++) {
            while (str[i] == ' ') {
                for (j = i; j < k; j++)
                    str[j] = str[j+1];
            }
        }
        if (str[4] == 'a')
            levoe = eax;
        if (str[4] == 'b')
            levoe = ebx;
        if (str[4] == 'c')
            levoe = ecx;
        if (str[4] == 'd')
            levoe = edx;
        if (str[8] == 'a')
            pravoe = eax;
        if (str[8] == 'b')
            pravoe = ebx;
        if (str[8] == 'c')
            pravoe = ecx;
        if (str[8] == 'd')
            pravoe = edx;

        if (str[7] >= 48 && str[7]<=57) {
            for (n = 7; n < k; n++) {
                if (str[n] >= 48 && str[n]<=57)
                    numnum++;
                numnumber[n] = str[n] - '0';
            }
            for (n = numnum + 6; n > 6; n--) {
                number += (numnumber[n] * powf(10, f));
                f++;
            }
            pravoe = number;
        }



        if (str[7] == '-'){
            for (n = 8; n < k; n++) {
                if (str[n] >= 48 && str[n]<=57)
                    numnum++;
                numnumber[n] = str[n] - '0';
            }
            for (n = numnum + 7; n > 7; n--) {
                number += (numnumber[n] * powf(10, f));
                f++;
            }
            pravoe = (-number);
        }


        if ((str[0] == 'a') & (str[1] == 'd') & (str[2] == 'd'))
            levoe += pravoe;
        if ((str[0] == 'm') & (str[1] == 'o') & (str[2] == 'v'))
            levoe = pravoe;
        if ((str[0] == 's') & (str[1] == 'u') & (str[2] == 'b'))
            levoe -= pravoe;
        if ((str[0] == 'm') & (str[1] == 'u') & (str[2] == 'l'))
            levoe *= pravoe;
        if ((str[0] == 'd') & (str[1] == 'i') & (str[2] == 'v'))
            levoe /= pravoe;
        if ((str[0] == 'r') & (str[1] == 'e') & (str[2] == 't'))
            return 0;


        if (str[4] == 'a')
            eax = levoe;
        if (str[4] == 'b')
            ebx = levoe;
        if (str[4] == 'c')
            ecx = levoe;
        if (str[4] == 'd')
            edx = levoe;


        printf ("            eax ebx ecx edx \n");
        printf ("             %d   %d   %d   %d\n", eax, ebx, ecx, edx);


        for (i = 0; i < k; i++)
            str[i] = '\0';
        
        k = 0;
        i = 0;
        number = 0;
        levoe = 0;
        pravoe = 0;
        numnum = 0;
        f = 0;

    }
    
}
