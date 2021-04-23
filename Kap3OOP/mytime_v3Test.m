function tests = mytime_v3Test()
 tests = functiontests(localfunctions);
end
function test_gettime(testCase)
  time1 = mytime_v3(2,3,10);
  verifyEqual(testCase,time1.gettime(),'02:03:10')
end
function test_tick1(testCase)
  time1 = mytime_v3(2,3,10);
  time1 = time1.tick();
  verifyEqual(testCase,time1.second(),11)
end
function test_tick2(testCase)
  time1 = mytime_v3(2,3,10);
  time1 = time1.tick(50);
  verifyEqual(testCase,time1.second(),0)
  verifyEqual(testCase,time1.minute(),4)
end
function test_spaeter1(testCase)
  time1 = mytime_v3(2,3,10);
  time2 = mytime_v3(4,3,10);
  verifyEqual(testCase,time1.gleich_oder_spaeter(time2),true)
end
function test_spaeter2(testCase)
  time1 = mytime_v3(2,3,10);
  time2 = mytime_v3(2,4,10);
  verifyEqual(testCase,time1.gleich_oder_spaeter(time2),true)
end
function test_spaeter3(testCase)
  time1 = mytime_v3(2,3,10);
  time2 = mytime_v3(2,3,11);
  verifyEqual(testCase,time1.gleich_oder_spaeter(time2),true)
end
function test_spaeter4(testCase)
  time1 = mytime_v3(3,3,10);
  time2 = mytime_v3(2,3,10);
  verifyEqual(testCase,time1.gleich_oder_spaeter(time2),false)
end
function test_spaeter5(testCase)
  time1 = mytime_v3(2,3,10);
  time2 = mytime_v3(2,3,10);
  verifyEqual(testCase,time1.gleich_oder_spaeter(time2),true)
end
