%% Test 1: 8*12 * 12*14-Matrix
A = rand(8,12);
B = rand(12,14);
C = mexArrayMult(A,B);
C1 = A*B;
assert(norm(C(:)-C1(:))< 1.e-10, 'Multiplikation 8*12 * 12*14')

%% Test 3: 3*3-Matrix
A = [2 3 4;
     4 5 6;
     7 8 9];
x = [10; 20; 30];
y = mexArrayMult(A,x);
y1 = A*x;                  % Berechnung mit Matlab
assert(norm(y1-y)< 1.e-10, 'Multiplikation bei 3*3-Matrix falsch')

%% Test 3: 10*10-Matrix mit Vektor der Länge 11
A = rand(5,12);
B = rand(13,14);
try
   C = mexArrayMult(A,B);
   assert(false, 'Fehler bei 5*12 * 13*14  nicht erkannt')
catch
end