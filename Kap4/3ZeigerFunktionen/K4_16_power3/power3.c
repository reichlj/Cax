#include <stdio.h>
void power(double, int, double*);
int main(void)
{
 double x, z, *ptr;
 int n;
 x = 3.0;
 n = 4;
 ptr = &z;
 power(x, n, ptr);
 printf("z=%f\n", z);
 printf("z=%f\n", *ptr);
 return 0;
}
void power(double x, int k, double* zg)
{
 int i; double y=1.0;
 for (i=1; i<=k; i++)
     y = y * x;
 *zg = y;
}

