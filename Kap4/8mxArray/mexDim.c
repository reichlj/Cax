#include<mex.h>
/* Information über Dimension eines Parametersausgeben */
void mexFunction(int nlhs, mxArray *plhs[], 
          int nrhs, const mxArray *prhs[]){  
    mwSize k, n, *dim;  // mwSize == int16
    n = mxGetNumberOfDimensions(prhs[0]);
    mexPrintf("Dimension: %d\n",n);
    // dim : Zeiger auf einen Vektor der Länge n
    dim = mxGetDimensions(prhs[0]); 
    for (k=0; k<n; k++)  {
        mexPrintf("%4d",dim[k]);
    }
    mexPrintf("\nmxGetM: %d",mxGetM(prhs[0]));
    mexPrintf("  mxGetN: %d\n",mxGetN(prhs[0]));
}