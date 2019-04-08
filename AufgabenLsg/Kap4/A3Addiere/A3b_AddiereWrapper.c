#include<mex.h>
double addiere2(double, double); 
double subtrahiere2(double, double); 
void mexFunction(int nlhs, mxArray *plhs[], 
          int nrhs, const mxArray *prhs[])
{  
  double a,b,summe,diff, *za,*zb,*zsumme,*zdiff;  
  // Werte von a und b aus prhs holen
  za = mxGetPr(prhs[0]); 
  zb = mxGetPr(prhs[1]); 
  a = *za;
  b = *zb;
  summe = addiere2(a,b);
  diff = subtrahiere2(a,b);
  // Rueckgabevariable erzeugen
  plhs[0] = mxCreateDoubleMatrix(1,1,mxREAL); 
  zsumme = mxGetPr(plhs[0]);     
  plhs[1] = mxCreateDoubleMatrix(1,1,mxREAL); 
  zdiff = mxGetPr(plhs[1]);     
  // Rueckgabewert speichern
  *zsumme = summe;       
  *zdiff = diff;       
}