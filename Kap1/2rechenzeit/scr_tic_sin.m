clear all; clc

x = 0:0.001:2*pi;
fprintf('\nAnzahl der Werte : %d\n', length(x))
disp('Rechenzeit : sin')
tic
   y = sin(x);
toc

x = linspace(0,1,100000);
fprintf('\nAnzahl der Werte : %d\n', length(x))
disp('Rechenzeit : sin')
tic
   y = sin(x);
toc
