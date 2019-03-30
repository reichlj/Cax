#include<stdio.h>
int main(void)
{
  int k=5, *zg_int;
  double x=7.0, *zg_double;
  zg_int = &k;
  zg_double = &x;

  printf("k          = %d\n",k);
  printf("*zg_int    = %d\n",*zg_int);
  printf("x          = %f\n",x);
  printf("*zg_double = %f\n",*zg_double);

  printf("zg_int     = %p\n",zg_int);
  printf("zg_double  = %p\n",zg_double);

  printf("sizeof(int)      = %d\n",sizeof(k));
  printf("sizeof(double)   = %d\n",sizeof(x));
  printf("sizeof(zg_int)   = %d\n",sizeof(zg_int));
  printf("sizeof(zg_double)= %d\n",sizeof(zg_double));
}

