void vektorAdd1(double x[],double y[],double z[],int n) 
{
   int k;
   for (k=0;k<n;k++) 
   {
      z[k] = x[k] + y[k];   
   }   
}

void vektorAdd2(double *zg_x,double *zg_y,double *zg_z,int n) 
{
   int k;
   for (k=0;k<n;k++) 
   {
      *(zg_z+k) = *(zg_x+k) + *(zg_y+k);   
   }   
}

void vektorAdd3(double x[],double y[],double z[],int n) 
{
   int k;
   for (k=0;k<n;k++) 
   {
      *(z+k) = *(x+k) + *(y+k);   
   }   
}

void vektorAdd4(double x[],double y[],double z[],int n) 
{
   int k;
   for (k=0;k<n;k++) 
   {
      *z = *x + *y;   
      z++; x++; y++;   
   }   
}