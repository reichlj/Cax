clear all; clc
disp('Multipliziere 3*4-Matrix mit 4*5-Matrix')
A = [2 3 4 5;
     4 5 6 6;
     7 8 9 7];
B = [12 13 14 15 16;
     14 15 16 16 17;
     17 18 19 17 18;
     17 18 19 17 18;];
C = mexArrayMult(A,B)
C1 = A*B

