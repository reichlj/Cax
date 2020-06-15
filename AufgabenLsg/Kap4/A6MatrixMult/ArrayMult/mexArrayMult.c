#include<mex.h>
#include<stdio.h>
#include<stdlib.h>
void rowMajor2ColumnMajor(int rows,int cols,double a[][cols], double *zga); 
void columnMajor2RowMajor(int rows,int cols,double a[][cols], double *zga); 
void arrayMult(int n,int m, int k, double a[][m], double b[][k], double c[][k]); 

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])           
{  
   int n,m,k,m1;
   double *zga, *zgb, *zgc;
   char err[100];  // speichert Fehlermeldung
   n = mxGetM(prhs[0]); // Zeilen der Matrix a -  (n,m) * (m,k) = (n,k)
   m = mxGetN(prhs[0]); // Spalten der Matrix a
   m1 = mxGetM(prhs[1]); // Zeilen der Matrix b 
   k = mxGetN(prhs[1]); // Spalten der Matrix b
   if (m != m1)  {
       sprintf(err,"m=%d ungleich m1%d",m,m1);
       mexErrMsgTxt(err);
   } 
   double(*a)[m] = mxMalloc(n*m*sizeof(double));
   double(*b)[k] = mxMalloc(m*k*sizeof(double));
   double(*c)[k] = mxMalloc(n*k*sizeof(double));
   zga = mxGetPr(prhs[0]); // Adresse erstes Element der Matlab-Matrix a
   zgb = mxGetPr(prhs[1]); // Adresse erstes Element der Matlab-Matrix b
   // Speicherplatz für das Ergebnis reservieren - eine Matrix
   plhs[0] = mxCreateDoubleMatrix(n,k,mxREAL); 
   zgc = mxGetPr(plhs[0]); 
   // Matrix im C-Format speichern - zeilenweise
   rowMajor2ColumnMajor(n, m, a, zga);
   rowMajor2ColumnMajor(m, k, b, zgb);
   arrayMult(n, m, k, a, b, c); // (n,m) * (m,k) = (n,k)
   columnMajor2RowMajor(n, k, c, zgc);
   mxFree(a);   mxFree(b);  mxFree(c);
}


void arrayMult(int n, int m, int k, double a[][m],double b[][k],double c[][k]) 
{
   int z,s,i;
   double sum;
   // (n,m) * (m,k) = (n,k)
   for (z=0; z<n; z++) 
   {
       for (s=0; s<k; s++) 
       {
           sum=0.0;
           for (i=0; i<m; i++)
           {
               sum += a[z][i]*b[i][s];
           }
           c[z][s] = sum;
       }
   }   
}

// erzeuge aus einer Matrix im row major format (Matlab-Matrix - zga)
// eine Matrix im column major format (C-Matrix) - die Matrix a
// kopiere von zga nach a
// a : Zeiger auf Matrix mit cols Spalten - im column major format
// zga : Zeiger auf das erste Element einer Matrix im row major format
void rowMajor2ColumnMajor(int rows,int cols,double a[][cols], double *zga) 
{
   int i,j;
   for (i=0; i<rows; i++) 
   {
       for (j=0; j<cols; j++) 
       {
           a[i][j] = *(zga+i+j*rows);   
       }
   }   
}

// erzeuge aus einer Matrix im column major format (C-Matrix - Matrix a)
// eine Matrix im row major format (Matlab-Matrix - zga)
// kopiere von a nach zga
// a : Zeiger auf Matrix mit cols Spalten - im column major format
// zga : Zeiger auf das erste Element einer Matrix im row major format
void columnMajor2RowMajor(int rows,int cols,double a[][cols], double *zga) 
{
   int i,j;
   for (i=0; i<rows; i++) 
   {
       for (j=0; j<cols; j++) 
       {
           *(zga+i+j*rows) = a[i][j];    
       }
   }   
}