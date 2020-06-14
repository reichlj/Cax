#include<stdio.h>
#include<stdlib.h>
double myAdd(int n, char *zahl[]);

int main(int argc, char *argv[])
{
   double sum;
   if ( argc < 2) {
     printf("Fehler\n");
     printf("  Aufruf: %s z1 ...", argv[0]);
     return -1;
   }
   sum = myAdd(argc-1, argv+1);
   //sum = myAdd(argc-1, &argv[1]);
   printf("Summe1 = %.2f\n", sum);
   return 0;
}

double myAdd(int n, char *zahl[])
{
  double sum=0, a;
  int k;
  for (k=0; k < n; k++) {
      a = strtod(zahl[k],0);
      sum = sum + a;
  }
  return sum;
}
