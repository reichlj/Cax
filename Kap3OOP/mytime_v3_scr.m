t = mytime_v3(14,30,58);
time1 = t.gettime()
h=t.hour()
m=t.minute()
s=t.second()
t = t.tick();
time2 = t.gettime()
t = t.tick(20);
time3 = t.gettime()
