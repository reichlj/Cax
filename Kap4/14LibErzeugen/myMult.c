void mult(int rows, int cols, double a[][cols], double x[], double y[]) 
{  
   int i,j;
   for (i=0; i<rows; i++) {
       y[i] = 0.0;
       for (j=0; j<cols; j++) {
           y[i] = y[i] + a[i][j] * x[j];   
       }
   }   
}
