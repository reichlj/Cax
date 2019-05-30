#include<mex.h>
#include "myProduct.h"
#include "myUtility.h"
void mexFunction(int nlhs, mxArray *plhs[], 
         int nrhs, const mxArray *prhs[]){      
  int length1, length2;
  double erg, *zeiger_x, *zeiger_y;

  if ( (nrhs!=2) || (nlhs>1) ) {   // prüfe Zahl der Argumente
     mexErrMsgTxt("Aufruf z = mexDot(x,y)");
  }
  /* prüfe, ob Vektoren gleiche Länge besitzen */
  length1 = getVectorLength(prhs[0]);
  length2 = getVectorLength(prhs[1]);
  if ( (length1==-1) || (length2==-1) || (length1!=length2) ) {
     char str[80];
     sprintf(str, "Length: Vektor1: %d Vektor2: %d",length1, length2);
     mexErrMsgTxt(str);
  }
  zeiger_x = mxGetPr(prhs[0]); 
  zeiger_y = mxGetPr(prhs[1]); 
  erg = dotProduct(zeiger_x, zeiger_y, length1);
  plhs[0] = mxCreateDoubleScalar(erg);   
}
