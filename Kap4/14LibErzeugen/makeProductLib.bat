gcc -Wall -c myDot.c -o myDot.o 
gcc -Wall -c myMult.c -o myMult.o
ar -cr myProduct.lib myDot.o myMult.o

del myDot.o
del myMult.o