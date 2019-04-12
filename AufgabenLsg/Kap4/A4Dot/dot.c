double dotProduct(double *zgx, double *zgy, int n) 
{
   int k;   double sp=0.0;
   for (k=0; k<n; k++) {
      sp = sp + *(zgx+k) * (*(zgy+k));   
   }   
   return sp;
}

// identisch mit dotProduct - nur andere Schreibweise
double dotProduct1(double *zgx, double *zgy, int n) 
{
   int k;   double sp=0.0;
   for (k=0; k<n; k++) {
      sp = sp + zgx[k] * zgy[k];   
   }   
   return sp;
}

// identisch mit dotProduct - nur andere Schreibweise
double dotProduct2(double x[], double y[], int n) 
{
   int k;   double sp=0.0;
   for (k=0; k<n ;k++) {
      sp = sp + x[k] * y[k];   
   }   
   return sp;
}