double addScalar(double a, double b)
{
   double c;
   c = a + b;
   return c;
}

void addMatrix(double *zga,double *zgb,double *zgc, int anzahl) 
{
   int k;
   for (k=0; k<anzahl; k++) 
      *(zgc+k) = *(zga+k) + *(zgb+k);   
}

void subMatrix(double *zga,double *zgb,double *zgc, int anzahl) 
{
   int k;
   for (k=0; k<anzahl; k++) 
      *(zgc+k) = *(zga+k) - *(zgb+k);   
}
