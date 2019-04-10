clear all; clc; close all;
x =0:pi/100:2*pi;
y = sin(x);
z = cos(x);
plot(x,y, x,z, 'LineWidth',3)
%h=legend('Sinus','Cosinus')  % Strings als Parameter
cellarray = {'Sinus', 'Cosinus'}
h = legend(cellarray)      % Cell-Array als Parameter
name1 = input('Sinusfunktion: neuer Name ', 's');
h.String(1) = {name1};
name2 = input('Cosinusfunktion: neuer Name ', 's');
h.String(2) = {name2};
input('Vertausche - Weiter mit Enter ', 's');
% vertausche die Namen
h.String = {name2 name1};
