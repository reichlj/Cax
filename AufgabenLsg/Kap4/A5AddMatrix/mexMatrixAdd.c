#include<mex.h>
void addMatrix(double *zga,double *zgb,double *zgc,int anzahl);
void checkDimensions(int nrhs, const mxArray *prhs[]);

/* addiere zwei Matrizen */
void mexFunction(int nlhs, mxArray *plhs[], 
          int nrhs, const mxArray *prhs[]){  
   double *zga,*zgb,*zgc;
   int N,M;

   checkDimensions(nrhs,prhs);
   zga = mxGetPr(prhs[0]); 
   zgb = mxGetPr(prhs[1]); 
   M = mxGetM(prhs[0]);
   N = mxGetN(prhs[0]);
   // erzeuge Variable für das Ergebnis
   plhs[0] = mxCreateDoubleMatrix(M,N,mxREAL); 
   zgc = mxGetPr(plhs[0]); 
   addMatrix(zga,zgb,zgc,M*N);
}

void checkDimensions(int nrhs, const mxArray *prhs[]) {
   int M1,M2;
   if (nrhs !=2 ) {
      mexErrMsgTxt("Zwei Aufrufparameter notwendig.");
   }
   if ( (mxGetNumberOfDimensions(prhs[0])!=2) || 
        (mxGetNumberOfDimensions(prhs[1])!=2)   ) {
      mexErrMsgTxt("Nur 2d-Arrays werden addiert.");
   }
   M1 = mxGetM(prhs[0]);
   M2 = mxGetM(prhs[1]);
   if ( (M1!=M2) || (mxGetN(prhs[0])!=mxGetN(prhs[1])) ) {
      mexErrMsgTxt("Nur 2d-Arrays mit gleicher Größe erlaubt.");
   }    
}

// addiere spaltenweise
void addMatrix(double *zga,double *zgb,double *zgc, int anzahl) {
   int k;
   for (k=0; k<anzahl; k++) {
      *(zgc+k) = *(zga+k) + *(zgb+k);   
   }   
}