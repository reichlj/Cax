#include<mex.h>
#include "myAdd.h"
#include "myUtility.h"
void mexFunction(int nlhs, mxArray *plhs[], 
                 int nrhs, const mxArray *prhs[]) {  
  double *zga, *zgb, *zgc;
  int N,M;
  checkDimensions2d(nrhs, prhs);
  zga = mxGetPr(prhs[0]);   
  zgb = mxGetPr(prhs[1]); 
  M = mxGetM(prhs[0]);     // Anzahl der Zeilen
  N = mxGetN(prhs[0]);     // Anzahl der Spalten
  plhs[0] = mxCreateDoubleMatrix(M,N, mxREAL); 
  zgc = mxGetPr(plhs[0]); 
  addMatrix(zga, zgb, zgc, M*N);
}
