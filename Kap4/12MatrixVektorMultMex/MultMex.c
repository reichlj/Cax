#include<mex.h>
#include<stdio.h>
void mult(int rows,int cols,double a[][cols],double x[],double y[]);
void columnMajor2RowMajor(int rows,int cols,double a[][cols],double *acm); 

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

   sp = mxMalloc(rows*cols*sizeof(double)); // nicht malloc verwenden
   a = sp;
   columnMajor2RowMajor(rows, cols, a, zga); 
   
   mult(rows,cols,a,zgx,zgy);
   
   mxFree(sp);

}

void mult(int rows,int cols,double a[][cols],double x[],double y[]) 
{
   int i,j;
   for (i=0; i<rows; i++) {
       y[i] = 0.0;
       for (j=0; j<cols; j++) {
           y[i] = y[i] + a[i][j] * x[j];   
       }
   }   
}

// aus Matrix im column-major format eine Matrix im row-major format erzeugen
// acm : Zeiger auf erstes Element der Matrix im column-major format
// a : Zeiger auf erstes Element der Matrix im row-major format
void columnMajor2RowMajor(int rows,int cols,double a[][cols],double *acm) 
{
   int i,j;
   for (i=0; i<rows; i++) {
       for (j=0; j<cols; j++) {
           a[i][j] = *(acm+i+j*rows);   
       }
   }   
   for (i=0; i<rows; i++) {
       for (j=0; j<cols; j++) {
           printf("%6.2f",a[i][j]);   
       }
       printf("\n");   
   }   
}