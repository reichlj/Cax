#include <stdio.h>
double power(double , int );
int main(void)
{
 double x,y,z,t;
 int n;
 x = 3.0;
 n = 4;
 z = power(x, n);
 printf("z=%f\n",z);
 y = 3.75;
 t = power(y, 5);
 printf("t=%f\n",t);
 return 0;
}
double power(double x, int k)
{
 int i;
 double y=1.0;
 for (i=1; i<=k; i++)
     y = y * x;
 return y;
} 
