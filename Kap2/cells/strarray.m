clear all; clc;
disp('Cell-Array: Vektor')
Z = {'Ja'  'Nein'  'Abbruch'}
S = {'Ja'; 'Nein'; 'Abbruch'}
x = Z(1,2)
y = Z{1,2}
whos

disp('Cell-Array: 2-d Array')
A = {'Ja'  'Nein';  'Abbruch' {} }
B = {'Ja'  'Nein';  'Abbruch' cell(1,1) }
C = {'Ja'  'Nein';  'Abbruch' '' }
D = {'Ja'  'Nein';  'Abbruch' [] }

disp('Array mit Elementen vom Typ char')
G = ['ab'  'cd'  'ef'  'gh']
H = ['ab', 'cd', 'ef', 'gh']
K = ['ab'  'cd'; 'ef'  'gh']
