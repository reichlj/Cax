#include<mex.h>

// aus Matrix im column-major format Matrix im row-major format erzeugen
// acm : Zeiger auf erstes Element der Matrix im column-major format
// a : Zeiger auf erstes Element der Matrix im row-major format
void columnMajor2RowMajor(int rows,int cols,double a[][cols],double *acm) 
{
   int i,j;
   for (i=0; i<rows; i++) {
       for (j=0; j<cols; j++) {
           a[i][j] = *(acm+i+j*rows);     // Matrix a belegen
       }
   }   
}

void checkDimensions2d(int nrhs, const mxArray *prhs[]) 
{
  int M1,M2;
  if (nrhs !=2) 
     mexErrMsgTxt("Zwei Aufrufparameter notwendig.");
  if ( (mxGetNumberOfDimensions(prhs[0])!=2) || 
       (mxGetNumberOfDimensions(prhs[1])!=2)   ) {
     mexErrMsgTxt("Nur 2d-Arrays werden addiert.");
  }
  M1 = mxGetM(prhs[0]);
  M2 = mxGetM(prhs[1]);
  if ( (M1!=M2) || (mxGetN(prhs[0])!=mxGetN(prhs[1])) ) 
     mexErrMsgTxt("Nur 2d-Arrays mit gleicher Größe erlaubt.");  
}

// prüfe, ob ein Array ein Vektor ist und Länge zurückgeben
// -1 zurückgeben, falls das Array kein Vektor ist
int getVectorLength(const mxArray *zg) 
{
  int m,n,min,max;
  if ( mxGetNumberOfDimensions(zg) != 2 )
     return -1;    // 3 oder mehr Dimensionen – kein 2d-Array!
  m = mxGetM(zg);  // Array ist ein 2d-Array
  n = mxGetN(zg);   
  if (m>=n) {
     max = m;
     min = n;
  } else {
     max = n;
     min = m;
  }
  if (min == 1) 
     return max;  //Länge des Vektors
  else 
     return -1;   //Matrix mit mehr als einer Zeile oder Spalte
}
