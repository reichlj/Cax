#include<mex.h>
double addiereC(double, double); 
void mexFunction(int nlhs, mxArray *plhs[], 
          int nrhs, const mxArray *prhs[])
{  
  double a,b,c, *za,*zb,*zc;  
  // Werte von a und b aus prhs holen
  za = mxGetPr(prhs[0]); 
  zb = mxGetPr(prhs[1]); 
  a = *za;
  b = *zb;
  c = addiereC(a,b);
  // Rueckgabevariable erzeugen
  plhs[0] = mxCreateDoubleMatrix(1,1,mxREAL); 
  zc = mxGetPr(plhs[0]);     
  // Rueckgabewert speichern
  *zc = c;       
}