clear all; clc

z = integral(@(x) 3*x.*x+2*x+4, 2, 5)
tabelle( @(x) 3*x*x+2*x+4, [1.1 2 4]);

hd = @(x) 3*x.*x+2*x+4

z = integral(hd, 2, 5)
tabelle(hd, [1.1 2 4]);
