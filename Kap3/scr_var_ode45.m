clear all; clc

odeset()
st  = odeset()
st1 = odeset('abstol', 0.01, 'initialstep',0.002)
st2 = odeset(st1, 'reltol', 0.003)

[t, x] = ode45(@fdgl,  [0,10], x0);
[t, y] = ode45(@fdgl,  [0,10], y0, st1);
[t, z] = ode45(@fdgl2, [0,10], z0, st1, m1,m2,c1,c2,c3);


