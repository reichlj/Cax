#include<mex.h>
double myAdd(double, double); 
void mexFunction(int nlhs, mxArray *plhs[], 
          int nrhs, const mxArray *prhs[])
{  
  double a,b,c, *za,*zb,*zc;
  za = mxGetPr(prhs[0]); 
  zb = mxGetPr(prhs[1]); 
  a = *za;
  b = *zb;
  c = myAdd(a,b);
  plhs[0] = mxCreateDoubleMatrix(1,1,mxREAL); 
  zc = mxGetPr(plhs[0]);   
  *zc = c;       
}
double myAdd(double a, double b) {
  double c;
  c = a + b;
  return c;
}