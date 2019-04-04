#include <stdio.h>
#include "VektorAdd.h"
int main(void)
{
 double z[3], *zg_x, *zg_y, *zg_z;
 double x[]={1.1,1.2,1.3};
 double y[]={2.1,2.2,2.3};
 zg_x = x;
 zg_y = &y[0];
 zg_z = z;

 vektorAdd1(zg_x,zg_y,zg_z,3);
 printf("A: z[1]=%f\n", z[1]);
 vektorAdd2(zg_x,zg_y,zg_z,3);
 printf("B: z[1]=%f\n", z[1]);
 return 0;
}
