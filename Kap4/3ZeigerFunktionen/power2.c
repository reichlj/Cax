#include <stdio.h>
void power(double, int, double*);
int main(void)
{
 double x,y,z,t;
 int n;
 x = 3.0;
 n = 4;
 power(x, n, &z);
 printf("z=%f\n",z);
 y = 3.75;
 power(y, 5, &t);
 printf("t=%f\n",t);
 return 0;
}
void power(double x, int k, double* zg)
{
 int i; double y=1.0;
 for (i=1; i<=k; i++)
     y = y * x;
 *zg = y;
}
