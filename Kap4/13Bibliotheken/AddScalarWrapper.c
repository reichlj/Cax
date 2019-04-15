#include<mex.h>
#include "myAdd.h"
void mexFunction(int nlhs, mxArray *plhs[], 
          int nrhs, const mxArray *prhs[])
{  
  double c, *za,*zb;  
  if ( (nrhs!=2) || (nlhs>1) ) {
    mexErrMsgTxt("Aufruf: c = AddWrapper(a,b)");
  } 
  za = mxGetPr(prhs[0]); 
  zb = mxGetPr(prhs[1]); 
  c = addScalar(*za,*zb);
  // Wert c zurückgeben
  plhs[0] = mxCreateDoubleScalar(c);
}