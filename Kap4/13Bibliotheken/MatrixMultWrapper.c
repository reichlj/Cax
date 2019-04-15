#include<mex.h>
#include "myProduct.h"
#include "myUtility.h"
void mexFunction(int nlhs, mxArray *plhs[], 
           int nrhs, const mxArray *prhs[])
{  
   int rows,cols;
   double *zga,*zgx,*zgy;
   void *sp;
   double (*a)[cols];
   rows = mxGetM(prhs[0]);
   cols = mxGetN(prhs[0]);
   zga = mxGetPr(prhs[0]);
   zgx = mxGetPr(prhs[1]);
 
   plhs[0] = mxCreateDoubleMatrix(rows,1,mxREAL); 
   zgy = mxGetPr(plhs[0]); 
 
   sp = mxMalloc(rows*cols*sizeof(double));    // nicht malloc verwenden
   a = sp;
   columnMajor2RowMajor(rows, cols, a, zga);
   mult(rows,cols,a,zgx,zgy);
   mxFree(sp);
} 

