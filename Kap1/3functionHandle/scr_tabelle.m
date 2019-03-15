clear all; clc

disp('1: gauss')
tabelle( @gauss, [1.1 2 4]);

disp('2: exp(-x.*x)')
tabelle( @(x) exp(-x.*x), [1.1 2 4]);

disp('3: 3*x*x+2*x+4')
tabelle( @(x) 3*x*x+2*x+4, [1.1 2 4]);

disp('4: hd')
hd = @(x) 3*x.*x+2*x+4
tabelle(hd, [1.1 2 4]);
