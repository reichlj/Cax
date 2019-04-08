#include<mex.h>
double addiere3(double, double, double); 
void mexFunction(int nlhs, mxArray *plhs[], 
          int nrhs, const mxArray *prhs[])
{  
  double a,b,c,d, *za,*zb,*zc,*zd;  
  // Werte von a und b aus prhs holen
  za = mxGetPr(prhs[0]); 
  zb = mxGetPr(prhs[1]); 
  zc = mxGetPr(prhs[2]); 
  a = *za;
  b = *zb;
  c = *zc;
  d = addiere3(a,b,c);
  // d = addiere3(*za,*zb,*zc);
  // Rueckgabevariable erzeugen
  plhs[0] = mxCreateDoubleMatrix(1,1,mxREAL); 
  zd = mxGetPr(plhs[0]);     
  // Rueckgabewert speichern
  *zd = d;       
}