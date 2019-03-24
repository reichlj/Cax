clear all; clc

disp('left hand side: no argument')
addme2(2,-5)
disp('left hand side: one argument')
x = addme2(2,-5)
disp('left hand side: two arguments')
[y, yabs] = addme2(2, -3)
[z, zabs] = addme2(2, 5)
