function tests = testWrapper()
 tests = functiontests(localfunctions);
end
function test1AddScalar(testCase)
  A= 4.1;      B = 5.9;
  found = AddScalar(A,B);
  expected = 10.0;
  % prüfe, ob exakt gleich
  verifyEqual(testCase,found,expected)
end
function test1AddScalarAbsTol(testCase)
  A= 4.1;      B = 5.9;
  found = AddScalar(A,B);
  expected = 10.0;
  % prüfe, ob gleich mit absoluter Toleranz
  verifyEqual(testCase,found,expected,'AbsTol', 1.0e-10)
end
function test1AddScalarRelTol(testCase)
  A= 4.1;      B = 5.9;
  found = AddScalar(A,B);
  expected = 10.0;
  % prüfe, ob gleich mit relativer Toleranz
  verifyEqual(testCase,found,expected,'RelTol', 1.0e-9)
end
function test2AddMatrix(testCase)
  A= rand(5);  B = rand(5);
  found = AddMatrix(A,B);
  expected = A + B; % verwende Matlab
  verifyEqual(testCase,found,expected,'RelTol', 1.0e-9)
end
function test3MyDot(testCase)
  x = rand(10,1);  y = rand(10,1);
  found = MyDot(x,y);
  expected = dot(x,y); % verwende Matlab
  verifyEqual(testCase,found,expected,'RelTol', 1.0e-9)
end
function test4MatrixMult(testCase)
  A = rand(10,5);  x = rand(5,1);
  found = MatrixMult(A,x);
  expected = A*x; % verwende Matlab
  verifyEqual(testCase,found,expected,'RelTol', 1.0e-9)
end
function test5MyDotDifferentLength(testCase)
  try 
    z = MyDot(rand(5,1),rand(6,1));
  catch E
  end
  verifyInstanceOf(testCase, E, 'MException')
end
function test6MyDotOneParameter(testCase)
  try 
    z = MyDot(rand(5,1));
  catch E
  end
  verifyInstanceOf(testCase, E, 'MException')
end
function test7MyDotTwoResults(testCase)
  try 
    [z1,z2] = MyDot(rand(5,1),rand(5,1));
  catch E
  end
  verifyInstanceOf(testCase, E, 'MException')
end
function test8MyDotMatrix(testCase)
  try 
    z = MyDot(rand(5,2),rand(5,2));
  catch E
  end
  verifyInstanceOf(testCase, E, 'MException')
end