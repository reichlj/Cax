#include<mex.h>
void mexFunction(int nlhs, mxArray *plhs[], 
           int nrhs, const mxArray *prhs[]){  
   int m,n,N,M;
   double x,*za;

   M = mxGetM(prhs[0]);
   N = mxGetN(prhs[0]);
   mexPrintf("Zeilen  M=%d\n",M);
   mexPrintf("Spalten N=%d\n",N);

   za = mxGetPr(prhs[0]); 
   for (m=0; m<M; m++) 
   {
       for (n=0; n<N; n++) 
       {
           //x = *(za+m+n*M);
           x = za[m+n*M];           
           mexPrintf("%6.2f",x);
       }
       mexPrintf("\n");
   }
}