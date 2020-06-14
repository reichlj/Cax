#include <stdio.h>
#include <stdlib.h>
int main(void)
{
  int **array;
  int i, j, n;
  printf("Zahl der Zeilen\n");
  scanf("%d",&n);

  // Speicher für n Zeiger auf int - n mal (int *)
  array = (int **)malloc(n*sizeof(int *));

  for (i=0; i<n; i++)
  {
      // Zeile i enthält i+1 Werte
      // Speicher für i+1 Werte vom Typ int
      array[i] = (int *)malloc((i+1)*sizeof(int));
  }

  array[0][0] = 1;
  for (i=1; i<n; i++)
  {
      array[i][0] = 1;
      for (j=1; j<i; j++)
      {
          array[i][j] = array[i-1][j-1]+array[i-1][j];
      }
      array[i][i] = 1;
  }

  for (i=0; i<n; i++)
  {
      // Zeile i besitzt i+1 Werte
      for (j=0; j<=i; j++)
      {
          printf("%4d ",array[i][j]);
      }
      printf("\n");
  }

  for (i=0; i<n; i++)
  {
      // Speicherplatz für die Vektoren freigeben
      free(array[i]);
  }
  // Speicher für den Vektor mit Zeigern freigeben
  free(array);

  return 0;
}
