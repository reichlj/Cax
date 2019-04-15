#include<stdio.h>
#define COLS 3
#define ROWS 2
int main(void)
{
  int i,j;
  double x[COLS]= {2,4,6};
  double y[ROWS];
  double mat[ROWS][COLS]= {{1,2,3},{10,20,30}};
  for (i=0; i<ROWS; i++)
  {
    y[i] = 0.0;
    for (j=0; j<COLS; j++)
    {
      y[i] = y[i] + mat[i][j]*x[j];
    }
  }
  printf("y[0]=%5.1f\n",y[0]);
  printf("y[1]=%5.1f\n",y[1]);
  return 0;
}

