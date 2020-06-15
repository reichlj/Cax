gcc -Wall -c myAdd.c -o myAdd.o
ar -cr myAdd.lib myAdd.o

del myAdd.o
