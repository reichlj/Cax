#include <stdio.h>
#include "VektorAdd.h"
#define N 3
int main(void)
{
  double z[N], *zg_x, *zg_y, *zg_z;
  double x[]={1.1,1.2,1.3};
  double y[]={2.1,2.2,2.3};
  zg_x = x;
  zg_y = &y[0];
  zg_z = z;

  vektorAdd1(zg_x,zg_y,zg_z,N);
  printf("A: z[1]=%f\n", z[1]);
  printf("0: z[0]=%f\n", *zg_z); 
  printf("1: z[1]=%f\n", *(zg_z+1)); 
  printf("2: z[2]=%f\n", *(zg_z+2));
  vektorAdd2(zg_x,zg_y,zg_z,N);
  printf("B: z[1]=%f\n", z[1]);
  return 0;
}
