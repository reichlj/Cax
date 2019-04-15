double dotProduct(double x[], double y[], int n)  
{
   int k;   
   double sp = 0.0;
   for (k=0; k<n ;k++) 
      sp = sp + x[k] * y[k];   
   return sp;
}

