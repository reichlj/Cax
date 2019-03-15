clear all; clc

y1 = integral2(@gauss2d,0,3,0,4)
y2 = integral2(@(x,y) exp(-x.*x-y.*y),0,3,0,4)