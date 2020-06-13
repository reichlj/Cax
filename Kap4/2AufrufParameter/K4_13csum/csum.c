#include<stdio.h>
#include<stdlib.h>
double myAdd(double a, double b);

int main(int argc, char *argv[])
{
   double a,b,c;
   if ( argc != 3) {
     printf("Fehler\n");
     printf("  Aufruf: csum a b");
     return -1;
   }
   printf("%s\n", argv[0]);
   a = strtod(argv[1],0);
   b = strtod(argv[2],0);
   c = myAdd(a,b);
   printf("%.2f+%.2f=%.2f\n",a,b,c);
   return 0;
}

double myAdd(double a, double b)
{
  double sum;
  sum = a + b;
  return sum;
}
