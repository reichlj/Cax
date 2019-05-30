%% Test 1 : addiere zwei Skalare
A= 4.1;      B = 5.9;
C = AddScalar(A,B);
assert( abs(C -(A+B)) < 1e-10, 'AddWrapper not correct')
%% Test 2 : addiere zwei 5*5-Matrizen
A= rand(5);  B = rand(5);
C = AddMatrix(A,B);
diff = abs(C -(A+B));
assert( max(diff(:)) < 1e-10, 'AddMatrixWrapper not correct')
%% Test 3 : Skalarprodukt zweier Vektoren mit 10 Elementen
x = rand(10,1);  y = rand(10,1);
z = MyDot(x,y);
assert( abs(z-dot(x,y)) < 1e-10, 'DotWrapper not correct')
%% Test 4 : Matrix-Vektor Multiplikation
A = rand(10,5);  x = rand(5,1);
y = MatrixMult(A,x);
assert( max(abs(y-A*x)) < 1e-10, 'MatrixMultWrapper not correct')
%% Test 5 : Vektoren mit unterschiedlicher Länge
try
   z = MyDot(rand(5,1),rand(6,1));
catch E
end
assert(isobject(E),'Check Vektorlänge falsch')
%% Test 6 : Check zwei Aufrufparameter
try
   z = MyDot(rand(5,1));
catch E1
end
assert(isobject(E1),'Check 2 Parameter falsch')
%% Test 7 : Check nur ein Ergebnis
try
   [z1,z2] = MyDot(rand(5,1),rand(5,1));
catch E2
end
assert(isobject(E2),'Check nur ein Ergebnis falsch')
%% Test 8 :  Check Vektoren als Parameter
try
   z = MyDot(rand(5,2),rand(5,2));
catch E3
end
assert(isobject(E3),'Check Vektoren als Parameter')