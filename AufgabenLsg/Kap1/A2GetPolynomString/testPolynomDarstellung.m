clear all; clc
a = [4.1 3.7 -2.1 0.7];
disp(getPolynomString(a, 'y1'))
disp(getPolynomStringV2(a, 'y2'))

a = [-4.1 3.7 -2.1 0.7];
disp(getPolynomString(a, 'y1'))
disp(getPolynomStringV2(a, 'y2'))

a = [-4.1 0.0 0.0 0.7];
disp(getPolynomString(a, 'y1'))
disp(getPolynomStringV2(a, 'y2'))

a = [2.1 0.7];
disp(getPolynomString(a, 'y1'))
disp(getPolynomStringV2(a, 'y2'))

a = [-2.1 0.7];
disp(getPolynomString(a, 'y1'))
disp(getPolynomStringV2(a, 'y2'))

a = [0.7];
disp(getPolynomString(a, 'y1'))
disp(getPolynomStringV2(a, 'y2'))

a = [-0.7];
disp(getPolynomString(a, 'y1'))
disp(getPolynomStringV2(a, 'y2'))
