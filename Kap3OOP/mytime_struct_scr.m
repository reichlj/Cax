time1 = mytime_struct(14,30,15);
disp('Zeit:')
disp(time1)
k = 35;
time1.minute = time1.minute + k;
time1.hours = 12;
disp('Geänderte Zeit:')
disp(time1)