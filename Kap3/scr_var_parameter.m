clear all; clc
A = [  1  5  8;
       3  7  2 ];
B = [  2  3  7;
       5  9  3 ];
  
xa  = mean(A);
xa1 = mean(A,1);
xa2 = mean(A,2);

ya  = max(A);
ya1 = max(A,[],1);
ya2 = max(A,[],2);
yab = max(A,B);

d = size(A);
[m, n] = size(A);
p = size(A,2);