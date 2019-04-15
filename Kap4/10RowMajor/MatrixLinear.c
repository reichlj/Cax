#include<mex.h>
void mexFunction(int nlhs, mxArray *plhs[], 
           int nrhs, const mxArray *prhs[]){  
   int N,M,k;
   double x,*za;

   M = mxGetM(prhs[0]);
   N = mxGetN(prhs[0]);
   mexPrintf("Zeilen  M=%d\n",M);
   mexPrintf("Spalten N=%d\n",N);

   za = mxGetPr(prhs[0]); 
   for (k=0; k<M*N; k++) {
       x = *za;
       mexPrintf("k=%d   x=%.2f\n",k,x);
       za++;
   }
}

