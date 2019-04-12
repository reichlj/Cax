#include<mex.h>
double myAdd(double, double); 
void mexFunction(int nlhs, mxArray *plhs[], 
          int nrhs, const mxArray *prhs[])
{  
  double c,*za,*zb;
  mexPrintf("nlhs=%d\n",nlhs);
  if ( (nrhs!=2) || (nlhs>1) ) {
    mexErrMsgTxt("Aufruf: c = myAdd(a,b)");
  } 
  za = mxGetPr(prhs[0]); 
  zb = mxGetPr(prhs[1]); 
  c = myAdd(*za,*zb);
  plhs[0] = mxCreateDoubleScalar(c); 
}

double myAdd(double a, double b) {
  double c;
  c = a + b;
  return c;
}