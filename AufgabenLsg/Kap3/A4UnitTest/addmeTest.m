function tests = addmeTest()
  tests = functiontests(localfunctions);
end

function testAddTwoScalars(testCase)
  actSolution = addme(3,4);
  expSolution = 7;
  verifyEqual(testCase,actSolution,expSolution)
end
function testAddTwoVektors(testCase)
  x = [  2  3  4 ];
  y = [ 12 13 14 ];
  z = [ 14 16 18 ];
  actSolution = addme(x,y);
  expSolution = z;
  verifyEqual(testCase,actSolution,expSolution)
end
function testOneScalar(testCase)
  a=3;
  actSolution = addme(a);
  verifyEqual(testCase,actSolution,2*a)
end
function testOneVektor(testCase)
  x = [  2  3  4 ];
  actSolution = addme(x);
  verifyEqual(testCase,actSolution,x+x)
end
function testNoArgument(testCase)
  actSolution = addme();
  verifyEqual(testCase,actSolution,0)
end
