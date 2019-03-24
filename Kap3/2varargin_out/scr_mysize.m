clear all; clc
disp('mysize(rand(4,5))')
s = mysize(rand(4,5))
[s,row] = mysize(rand(5,6))
[s,row,col] = mysize(rand(7,8))
[s,row,col,h] = mysize(rand(8,9))

disp('mysize(rand(2,3,4))')
[s,row] = mysize(rand(2,3,4))
[s,row,col,h] = mysize(rand(2,3,4))
[s,~,col,h] = mysize(rand(2,3,4))
