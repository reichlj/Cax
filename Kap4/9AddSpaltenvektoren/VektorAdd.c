#include<mex.h>
void vektorAdd(double *zgx,double *zgy,double *zgz,int n);
void mexFunction(int nlhs, mxArray *plhs[], 
          int nrhs, const mxArray *prhs[]){  
   int M;
   double *zgx,*zgy,*zgz;
   M = mxGetM(prhs[0]);     // M Anzahl der Zeilen
   zgx = mxGetPr(prhs[0]);  // Adresse des ersten Elements des ersten Vektors
   zgy = mxGetPr(prhs[1]);    
   plhs[0] = mxCreateDoubleMatrix(M,1,mxREAL);  // M*1 Array
   zgz = mxGetPr(plhs[0]); 
   vektorAdd(zgx,zgy,zgz,M);
}
void vektorAdd(double x[],double y[],double z[],int n) {
   int k;
   for (k=0;k<n;k++) 
   {
      z[k] = x[k] + y[k];   
   }   
}
/*
void vektorAddition(double *zgx,double *zgy,double *zgz,int n) {
   int k;
   for (k=0;k<n;k++) {
      *(zgz+k) = *(zgx+k) + *(zgy+k);   
   }   
}
*/
