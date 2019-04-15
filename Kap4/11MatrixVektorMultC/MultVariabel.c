#include<stdio.h>
void mult(int rows,int cols, double mat[][cols],double x[],double y[]);

int main(void)
{
  double y[2];
  double x3[3]= {2,4,6};
  double mat[2][3]= {{1,2,3},{10,20,30}};
  double x4[4]= {2,4,6,8};
  double mat4[2][4]= {{1,2,3,4},{10,20,30,40}};
  mult(2,3,mat,x3,y);
  printf("y3[0]=%5.1f\ny3[1]=%5.1f\n",y[0],y[1]);
  mult(2,4,mat4,x4,y);
  printf("y4[0]=%5.1f\ny4[1]=%5.1f\n",y[0],y[1]);
  return 0;
}
void mult(int rows,int cols, double mat[][cols],double x[],double y[])
{
   int i,j;
   for (i=0; i<rows;i++) {
       y[i] = 0.0;
       for (j=0;j<cols;j++) {
           y[i] = y[i] + mat[i][j]*x[j];
       }
   }
}


