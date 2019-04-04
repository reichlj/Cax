#include <stdio.h>
#include "VektorAdd.h"
#define N 3
int main(void)
{
 double x[N],z[N];
 double y[]={2.1,2.2,2.3};
 x[0]=1.1;
 x[1]=1.2;
 x[2]=1.3;
 vektorAdd1(x,y,z,3);
 printf("A: z[1]=%f\n", z[1]);
 vektorAdd1(&x[0],&y[0],&z[0],3);
 printf("B: z[1]=%f\n", z[1]);
 vektorAdd2(x,y,z,3);
 printf("C: z[1]=%f\n", z[1]);
 vektorAdd2(&x[0],&y[0],&z[0],3);
 printf("D: z[1]=%f\n", z[1]);
 return 0;
}
