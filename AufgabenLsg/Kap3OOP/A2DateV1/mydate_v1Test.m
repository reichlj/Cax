function tests = mydate_v1Test()
  tests = functiontests(localfunctions);
end
function testConstructor(testCase)
  found = mydate_v1(2021,3,2);
  verifyEqual(testCase,found.year,2021)
  verifyEqual(testCase,found.month,3)
  verifyEqual(testCase,found.day,2)
end
function test_tick1(testCase)
  date = mydate_v1(2021,3,25);
  found = date.tick();
  verifyEqual(testCase,found.year,2021);
  verifyEqual(testCase,found.month,3);
  verifyEqual(testCase,found.day,26);
end
function test_tick2(testCase)
  date = mydate_v1(2021,1,31);
  found = date.tick();
  verifyEqual(testCase,found.year,2021);
  verifyEqual(testCase,found.month,2);
  verifyEqual(testCase,found.day,1);
end
function test_tick3(testCase)
  date = mydate_v1(2021,12,31);
  found = date.tick();
  verifyEqual(testCase,found.year,2022);
  verifyEqual(testCase,found.month,1);
  verifyEqual(testCase,found.day,1);
end
function test_tick4(testCase)
  date = mydate_v1(1997,2,28);
  found = date.tick();
  verifyEqual(testCase,found.year,1997);
  verifyEqual(testCase,found.month,3);
  verifyEqual(testCase,found.day,1);
end
function test_tick5(testCase)
  date = mydate_v1(1996,2,28);
  found = date.tick();
  verifyEqual(testCase,found.year,1996);
  verifyEqual(testCase,found.month,2);
  verifyEqual(testCase,found.day,29);
end
function test_tick6(testCase)
  date = mydate_v1(1997,1,1);
  for k=1:365
     date = date.tick();
  end
  verifyEqual(testCase,date.year,1998);
  verifyEqual(testCase,date.month,1);
  verifyEqual(testCase,date.day,1);
end
