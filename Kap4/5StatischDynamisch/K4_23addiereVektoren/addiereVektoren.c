#include <stdlib.h>
#include <stdio.h>
#include "VektorAdd.h"

double* erzeugeVektor(int n);

int main()
{
    int k, n;
    double *x,*y,*z;
    printf("Wert fuer n: ");
    scanf("%d", &n);
    x = erzeugeVektor(n);
    y = erzeugeVektor(n);
    z = erzeugeVektor(n);
    for (k=0; k<n; k++) {
        x[k] = k; y[k] = 10*k;
    }
    vektorAdd1(x,y,z,n);
    for (k=0; k<n; k++) {
        printf("%5.1f +%5.1f =%5.1f\n",x[k],y[k],z[k]);
    }
    free(x); free(y); free(z);
    return 0;
}

double* erzeugeVektor(int n)
{
    double *z;
    z = (double *) malloc(n*sizeof(double));
    return z;
}
