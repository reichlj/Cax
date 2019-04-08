#include<stdio.h>
#include<stdlib.h>
double myAdd(int n, double x[]);

int main(int argc, char *argv[])
{
   double sum,y[1000];
   int k;
   if ( argc < 2) {
     printf("Fehler\n");
     printf("  Aufruf: %s z1 ...", argv[0]);
     return -1;
   } 
   else if (argc> 1001) {
     printf("Fehler\n");
     printf("  Aufruf: %s z1 ...\n", argv[0]);
     printf("          maximal 1000 Zahlen erlaubt!");
     return -1;
   }
   for (k=1;k<argc;k++) {
	   y[k-1] = strtod(argv[k],0);
   }	   
   sum = myAdd(argc-1, y);
   printf("Summe = %.2f", sum);
   return 0;
}

double myAdd(int n, double x[])
{
  double sum=0;
  int k;
  for (k=0; k < n; k++) {
      sum = sum + x[k];
  }
  return sum;
}