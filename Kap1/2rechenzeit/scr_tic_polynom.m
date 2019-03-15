clear all; clc
a = [ 10.1  -9.2  8.3  -7.4  6.5  -5.6 ...
       4.7  -3.8  2.9  -1.1  0.2 ];
%a = [a a a];
fprintf('Grad des Polynoms %d\n', length(a)-1)
x = linspace(0,1,1000000);
fprintf('Anzahl der Werte : %d\n', length(x))
disp('Rechenzeit : pvaluev2')
tic
   y = pvaluev2(a,x);
toc
disp('Rechenzeit : phorner')
tic
   y = phorner(a,x);
toc
disp('Rechenzeit : polyval')
tic
   y = polyval(a,x);
toc

