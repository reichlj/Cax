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

  printf("sizeof(int)      = %I64u\n",sizeof(k));
  printf("sizeof(double)   = %I64u\n",sizeof(x));
  printf("sizeof(zg_int)   = %I64u\n",sizeof(zg_int));
  printf("sizeof(zg_double)= %I64u\n",sizeof(zg_double));
}

