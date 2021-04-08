function tests = solverTest()
 tests = functiontests(localfunctions);
end
function testRealSolution(testCase)
 actSolution = quadraticSolver(1,-3,2);
 expSolution = [2 1];
 verifyEqual(testCase,actSolution,expSolution)
end
function testImaginarySolution(testCase)
 found = quadraticSolver(1,2,10);
 expected = [-1+3i -1-3i];
 verifyEqual(testCase,found,expected)
end
function testStringArgument(testCase)
 verifyError(testCase,@()quadraticSolver('otto',-3,2),'quadraticSolver:InputMustBeNumeric')
end
function testANonZero(testCase)
 verifyError(testCase,@()quadraticSolver(0,-3,2),'quadraticSolver:aMustNotBeZero')
end


