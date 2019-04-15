A= 4.1;   
B = 5.9;
C = AddScalar(A,B);
assert( abs(C -(A+B)) < 1e-10, 'AddWrapper not correct')

A= rand(5);   
B = rand(5);
C = AddMatrix(A,B);
diff = abs(C -(A+B));
assert( max(diff(:)) < 1e-10, 'AddMatrixWrapper not correct')

x = rand(10,1);   
y = rand(10,1);
z = MyDot(x,y);
assert( abs(z-dot(x,y)) < 1e-10, 'DotWrapper not correct')

A = rand(10,5);    
x = rand(5,1);
y = MatrixMult(A,x);
assert( max(abs(y-A*x)) < 1e-10, 'MatrixMultWrapper not correct')

x = rand(5,1);   
y = rand(6,1);
try
   z = MyDot(x,y);
   assert( false , 'DotWrapper Length check failed')
catch
end