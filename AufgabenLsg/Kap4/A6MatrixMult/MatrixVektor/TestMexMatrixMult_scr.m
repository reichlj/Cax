%% Test 1: 1*1-Matrix
A = [3];
x = [4];
y = mexMatrixMult(A,x);
assert(norm(12-y)< 1.e-10, 'Multiplikation bei 1*1-Matrix falsch')

%% Test 2: 3*3-Matrix
A = [2 3 4;
     4 5 6;
     7 8 9];
x = [10; 20; 30];
y = mexMatrixMult(A,x);
y1 = A*x;                  % Berechnung mit Matlab
assert(norm(y1-y)< 1.e-10, 'Multiplikation bei 3*3-Matrix falsch')

%% Test 3: 10*12-Matrix
A = rand(10,12);
x = rand(12,1);
y = mexMatrixMult(A,x);
y1 = A*x;
assert(norm(y1-y)< 1.e-10, 'Multiplikation bei 10*12-Matrix falsch')

%% Test 4: 10*10-Matrix mit Vektor der Länge 11
A = rand(10);
x = rand(11,1);
try
   y = mexMatrixMult(A,x);
   assert(false, 'Fehler bei 10*10-Matrix mit Vektor 11*1 nicht erkannt')
catch
end