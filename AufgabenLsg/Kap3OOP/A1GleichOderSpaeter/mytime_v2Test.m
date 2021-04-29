function tests = mytime_v2Test()
 tests = functiontests(localfunctions);
end
function test_spaeter1(testCase)
  time1 = mytime_v2(2,3,10);
  time2 = mytime_v2(4,3,10);
  verifyEqual(testCase,time1.gleich_oder_spaeter(time2),true)
end
function test_spaeter2(testCase)
  time1 = mytime_v2(2,3,10);
  time2 = mytime_v2(2,4,10);
  verifyEqual(testCase,time1.gleich_oder_spaeter(time2),true)
end
function test_spaeter3(testCase)
  time1 = mytime_v2(2,3,10);
  time2 = mytime_v2(2,3,11);
  verifyEqual(testCase,time1.gleich_oder_spaeter(time2),true)
end
function test_spaeter4(testCase)
  time1 = mytime_v2(3,3,10);
  time2 = mytime_v2(2,3,10);
  verifyEqual(testCase,time1.gleich_oder_spaeter(time2),false)
end
function test_spaeter5(testCase)
  time1 = mytime_v2(2,3,10);
  time2 = mytime_v2(2,3,10);
  verifyEqual(testCase,time1.gleich_oder_spaeter(time2),true)
end
