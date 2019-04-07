#include <stdlib.h>
#include <stdio.h>
#include "VektorAdd.h"

void erzeugeVektoren(int anzahl, int* n, double *zg[]);

int main()
{
    int k, n;
    double *zg[3],*x,*y,*z;
    erzeugeVektoren(3,&n,zg);
    x = zg[0];
    y = zg[1];
    z = zg[2];
    for (k=0; k<n; k++) {
        x[k] = k; y[k] = 10*k;
	}
	vektorAdd1(x,y,z,n);
    for (k=0; k<n; k++) {
        printf("%5.1f +%5.1f =%5.1f\n",x[k],y[k],z[k]);
	}
    for (k=0; k<3; k++) {
        free(zg[k]);
	}
    return 0;
}

void erzeugeVektoren(int anzahl, int* zn, double *zg[])
{   
    int k,n;   double *z; 
    printf("Wert fuer n: ");
    scanf("%d", &n);
	*zn = n;
	for (k=0;k<anzahl;k++) {
         z = (double *) malloc(n*sizeof(double));
		 zg[k] = z;
    }
}
