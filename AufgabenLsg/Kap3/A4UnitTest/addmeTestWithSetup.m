function tests = addmeTestWithSetup()
  tests = functiontests(localfunctions);
end

function setup(testCase)  % do not change function name
  testCase.TestData.a = 3;
  testCase.TestData.b = 4;
  testCase.TestData.x = [  2  3  4 ];
  testCase.TestData.y = [ 12 13 14 ];
end
function testAddTwoScalars(testCase)
  found = addme(testCase.TestData.a,testCase.TestData.b);
  expected = testCase.TestData.a + testCase.TestData.b;
  verifyEqual(testCase,found,expected)
end
function testAddTwoVektors(testCase)
  found = addme(testCase.TestData.x,testCase.TestData.y);
  expected = testCase.TestData.x+testCase.TestData.y;
  verifyEqual(testCase,found,expected)
end
function testOneScalar(testCase)
  found = addme(testCase.TestData.a);
  verifyEqual(testCase,found,2*testCase.TestData.a)
end
function testOneVektor(testCase)
  found = addme(testCase.TestData.x);
  expSolution = 2*testCase.TestData.x;
  verifyEqual(testCase,found,expSolution)
end
function testNoArgument(testCase)
  found = addme();
  verifyEqual(testCase,found,0)
end
