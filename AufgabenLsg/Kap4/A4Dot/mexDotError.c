#include<mex.h>
#include "dot.h"

int getVectorLength(const mxArray *zg); 

/* berechne das Skalarprodukt von zwei Vektoren */
void mexFunction(int nlhs, mxArray *plhs[], 
          int nrhs, const mxArray *prhs[]){  
    
   int length1, length2;
   double erg, *zeiger_x, *zeiger_y;
   
   /* pruefe die Anzahl der Argumente */
   //if ( (nrhs!=2) || (nlhs>1) ) {
   //   mexErrMsgTxt("Aufruf z = mexDot(x,y)");
   //}

   /* pruefe, ob Vektoren gleiche Laenge besitzen */
   length1 = getVectorLength(prhs[0]);
   length2 = getVectorLength(prhs[1]);
   if ( (length1==-1)||(length2==-1)||(length1!=length2) ) {
       // Fehlermeldung ausgeben - Aufruf wird beendet
       char str[80];
       sprintf(str,"Length mismatch: Vektor1: %d Vektor2: %d",
                  length1,length2);
       mexErrMsgTxt(str);
   }
   
   /* Zeiger auf die beiden Vektoren */
   zeiger_x = mxGetPr(prhs[0]); 
   zeiger_y = mxGetPr(prhs[1]); 
   
   erg = dotProduct(zeiger_x, zeiger_y, length1);
   // speichere das Ergebnis in einem Skalar
   plhs[0] = mxCreateDoubleScalar(erg);   
}

// prüfe, ob ein Array ein Vektor ist und Länge zurückgeben
// -1 zurückgeben, falls das Array kein Vektor ist
int getVectorLength(const mxArray *zg) 
{
   int m,n,min,max;
   if (mxGetNumberOfDimensions(zg) != 2)
      return -1;
   m = mxGetM(zg);
   n = mxGetN(zg);
   if (m>=n) {
       max = m;
       min = n;
   } else {
       max = n;
       min = m;
   }
   if (min == 1) 
       return max;
   else 
       return -1;
}

