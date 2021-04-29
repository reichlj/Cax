function tests = mydate_v2Test()
  tests = functiontests(localfunctions);
end
function testConstructor(testCase)
  found = mydate_v2(2021,3,2);
  verifyEqual(testCase,found.year,2021)
  verifyEqual(testCase,found.month,3)
  verifyEqual(testCase,found.day,2)
end
function test_tickA1(testCase)
  verifyError(testCase,@()mydate_v2(2021,13,31),'mydate_v2:invalidmonth')
end
function test_tickA2(testCase)
  verifyError(testCase,@()mydate_v2(2021,0,31),'mydate_v2:invalidmonth')
end
function test_tickA3(testCase)
  verifyError(testCase,@()mydate_v2(2021,2,-1),'mydate_v2:invalidday')
end
function test_tickB(testCase)
  date = mydate_v2(2021,1,31);
  verifyError(testCase,@()date.set_month(2),'mydate_v2:set_month')
end
function test_tickC(testCase)
  date = mydate_v2(2024,2,29);
  verifyError(testCase,@()date.set_year(2025),'mydate_v2:set_year')
end
function test_tickD(testCase)
  date = mydate_v2(2024,2,29);
  verifyError(testCase,@()date.set_day(31),'mydate_v2:set_day')
end
function test_tick1(testCase)
  date = mydate_v2(2021,3,25);
  found = date.tick();
  verifyEqual(testCase,found.year,2021);
  verifyEqual(testCase,found.month,3);
  verifyEqual(testCase,found.day,26);
end
function test_tick2(testCase)
  date = mydate_v2(2021,1,31);
  found = date.tick();
  verifyEqual(testCase,found.year,2021);
  verifyEqual(testCase,found.month,2);
  verifyEqual(testCase,found.day,1);
end
function test_tick3(testCase)
  date = mydate_v2(2021,12,31);
  found = date.tick();
  verifyEqual(testCase,found.year,2022);
  verifyEqual(testCase,found.month,1);
  verifyEqual(testCase,found.day,1);
end
function test_tick4(testCase)
  date = mydate_v2(1997,2,28);
  found = date.tick();
  verifyEqual(testCase,found.year,1997);
  verifyEqual(testCase,found.month,3);
  verifyEqual(testCase,found.day,1);
end
function test_tick5(testCase)
  date = mydate_v2(1996,2,28);
  found = date.tick();
  verifyEqual(testCase,found.year,1996);
  verifyEqual(testCase,found.month,2);
  verifyEqual(testCase,found.day,29);
end
function test_tick6(testCase)
  date = mydate_v2(1997,1,1);
  for k=1:365
     date = date.tick();
  end
  verifyEqual(testCase,date.year,1998);
  verifyEqual(testCase,date.month,1);
  verifyEqual(testCase,date.day,1);
end
