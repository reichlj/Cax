clear all; close all; clc
x = 0:pi/100:2*pi;
y = sin(x);
z = cos(x);
plot(x,y, x,z, 'LineWidth',3)
h = legend('Sinus', 'Cosinus')
%h = legend({'Sinus', 'Cosinus'})
