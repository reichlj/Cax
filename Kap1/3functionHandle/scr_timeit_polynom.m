clear all; clc

a = [10.1 -9.2 8.3 -7.4 6.5 -5.6 4.7 -3.8 2.9 -1.1 0.2];
%a = [a a a];

x= 0.652143518;
fprintf('numel(x): %d\n',numel(x))
f = @() pvaluev1(a,x);
tpvalue1 = timeit(f)
fh = @() phorner(a,x);
tphorner = timeit(fh)
fp = @() polyval(a,x);
tpolyval = timeit(fp)

x= rand(1000);
fprintf('numel(x): %d\n',numel(x))
f = @() pvaluev1(a,x);
tpvalue1 = timeit(f)
fh = @() phorner(a,x);
tphorner = timeit(fh)
fp = @() polyval(a,x);
tpolyval = timeit(fp)
