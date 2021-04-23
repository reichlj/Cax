function tests = mytime_v1Test()
 tests = functiontests(localfunctions);
end
function testConstructor(testCase)
 actSolution = mytime_v1(14,30,58);
 verifyEqual(testCase,actSolution.hour,14)
 verifyEqual(testCase,actSolution.minute,30)
 verifyEqual(testCase,actSolution.second,58)
end
function test_nbr_of_seconds(testCase)
  time = mytime_v1(2,2,10);
  verifyEqual(testCase,time.nbr_of_seconds(),7330)
end
function test_tick(testCase)
  t = mytime_v1(14,30,58)
  t = t.tick()
  verifyEqual(testCase,t.second,59)
end
function test_tick_overflow(testCase)
  t = mytime_v1(23,59,59)
  verifyError(testCase,@()t.tick(),'mytime_v1:timeoverflow')
end