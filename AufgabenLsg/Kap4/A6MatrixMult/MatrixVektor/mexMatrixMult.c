#include<mex.h>
#include<stdio.h>
#include<stdlib.h>
void rowMajor2ColumnMajor(int rows,int cols,double a[][cols], double *zga); 
void printCMatrix(int rows,int cols,double a[][cols]);
void matrixVektorMult(int rows,int cols, double a[][cols],double x[],double y[]); 

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])           
{  
   int rows,cols,i;
   double *zga,*zgx,*zgy;

   rows = mxGetM(prhs[0]); // Anzahl der Zeilen der Matrix
   cols = mxGetN(prhs[0]); // Anzahl der Spalten der Matrix
   //https://stackoverflow.com/questions/32050256/function-to-dynamically-allocate-matrix
   // Der Zeiger a zeigt auf einen zusammenhängenden Bereich im Speicher,
   // d.h. a verhält sich so, als würde man das Array wie folgt definieren
   // double a[rows][cols]
   double(*a)[cols] = mxMalloc(rows*cols*sizeof(double));
    
   zga = mxGetPr(prhs[0]); // Adresse des ersten Elements der Matlab-Matrix
   zgx = mxGetPr(prhs[1]); // Adresse des ersten Elements des Vektors
   
   // Speicherplatz für das Ergebnis reservieren - ein Vektor
   plhs[0] = mxCreateDoubleMatrix(rows,1,mxREAL); 
   zgy = mxGetPr(plhs[0]); 

   // Matrix im C-Format speichern - zeilenweise
   rowMajor2ColumnMajor(rows, cols, a, zga);
   printCMatrix(rows, cols, a);
   
   matrixVektorMult(rows, cols, a, zgx, zgy);
   
   mxFree(a);
}

void matrixVektorMult(int rows,int cols, double a[][cols],double x[],double y[]) 
{
   int i,j;
   for (i=0; i<rows; i++) 
   {
       y[i] = 0.0;
       for (j=0; j<cols; j++) 
       {
           y[i] = y[i] + a[i][j] * x[j];   
       }
   }   
}

// erzeuge aus einer Matrix im row major format (Matlab-Matrix)
// eine Matrix im column major format (C-Matrix)
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

// Matrix a, die im C-Format gespeichert ist, ausgeben
void printCMatrix(int rows,int cols,double a[][cols]) 
{
   int i,j;
   mexPrintf("Mex Function Matrix %d*%d\n",rows,cols);   
   for (i=0; i<rows; i++) 
   {
       for (j=0; j<cols; j++) 
       {
           mexPrintf("%5.1f",a[i][j]);   
       }
       mexPrintf("\n");   
   }   
}