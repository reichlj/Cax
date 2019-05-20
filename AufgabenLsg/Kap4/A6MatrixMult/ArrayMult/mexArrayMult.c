#include<mex.h>
#include<stdio.h>
#include<stdlib.h>
void rowMajor2ColumnMajor(int rows,int cols,double a[][cols], double *zga); 
void columnMajor2RowMajor(int rows,int cols,double a[][cols], double *zga); 
void arrayMult(int n,int m, int k, double a[][m], double b[][k], double c[][k]); 



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