clear all; clc
global w0 d F w;
w0 = 2.0;
d = 0.15;
F = 1.3;
w = 1.4*w0;
% Anfangswerte
y0(1)=2;
y0(2)=0.0;

% Aufruf von ode45
prec=0.4;
stepSize = 0.2;
opt = odeset('AbsTol',prec,'MaxStep',stepSize);
[t,y] = ode45(@fangeregt, [0:100], y0,opt);
for k=1:10
  prec = prec/2;
  stepSize = 0.7*stepSize;
  opt = odeset('AbsTol',prec,'MaxStep',stepSize);
  fprintf('RelTol=%.3e  StepSize=%.3e  ',prec,stepSize);
  tic
  [t,y] = ode45(@fangeregt, [0:100], y0,opt);
  toc
end
opt
