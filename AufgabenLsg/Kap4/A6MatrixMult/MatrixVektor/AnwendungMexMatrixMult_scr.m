clear all; clc
disp('Multipliziere 3*3-Matrix mit 3-Vektor')
A = [2 3 4;
     4 5 6;
     7 8 9]
x = [10; 20; 30]
y = mexMatrixMult(A,x)
y1 = A*x

disp('Multipliziere 3*4-Matrix mit 4-Vektor')
A = [2 3  4  5;
     4 5  6  7;
     8 9 10 11]
x = [10; 20; 30; 40]
y2 = mexMatrixMult(A,x)
y3 = A*x

