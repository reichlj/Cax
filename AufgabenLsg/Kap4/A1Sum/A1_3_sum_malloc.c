#include<stdio.h>
#include<stdlib.h>
double myAdd(int n, double x[]);

int main(int argc, char *argv[])
{
   double sum, *sp;
   int k;
   if ( argc < 2) {
     printf("Fehler\n");
     printf("  Aufruf: %s z1 ...", argv[0]);
     return -1;
   } 
   sp = malloc((argc-1)*sizeof(double));
   if (sp == NULL) {
	   printf("Fehler bei malloc");
       return -2;
   }
   for (k=1; k<argc; k++) {
	   *(sp+k-1) = strtod(argv[k],0);
   }	   
   sum = myAdd(argc-1, sp);
   printf("Summe3 = %.2f\n", sum);
   if (sp != NULL) {
      free(sp);
   }
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