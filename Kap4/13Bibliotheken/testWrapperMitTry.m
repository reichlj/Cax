A= 4.1;      B = 5.9;
C = AddScalar(A,B);
assert( abs(C -(A+B)) < 1e-10, 'AddWrapper not correct')

A= rand(5);  B = rand(5);
C = AddMatrix(A,B);
diff = abs(C -(A+B));
assert( max(diff(:)) < 1e-10, 'AddMatrixWrapper not correct')

x = rand(10,1);  y = rand(10,1);
z = MyDot(x,y);
assert( abs(z-dot(x,y)) < 1e-10, 'DotWrapper not correct')

A = rand(10,5);  x = rand(5,1);
y = MatrixMult(A,x);
assert( max(abs(y-A*x)) < 1e-10, 'MatrixMultWrapper not correct')

try
   z = MyDot(rand(5,1),rand(6,1));
   disp('Kein Fehler beim Aufruf von MyDot aufgetreten!');
catch E
   disp(sprintf('1 Fehlermeldung von MyDot: %s', E.message))
   disp(sprintf('  Datei: %s', E.stack.file)) 
   disp(sprintf('  Dateiname: %s', E.stack.name)) 
   disp(sprintf('  Zeile: %d', E.stack.line)) 
end

try
   z = MyDot(rand(5,1));
catch E1
end
assert(isobject(E1), 'Check zwei Parameter falsch')

try
   [z1,z2] = MyDot(rand(5,1),rand(5,1));
catch E2
end
assert(isobject(E2), 'Check ein Ergebnis falsch')

try
   z = MyDot(rand(5,2),rand(5,2));
catch E3
end
assert(isobject(E3), 'Check Vektoren als Parameter')