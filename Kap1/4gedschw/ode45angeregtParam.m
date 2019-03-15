clear all; clc
w0 = 2.0;
d = 0.15;
F = 1.3;
w = 1.4*w0;
% Anfangswerte
y0(1)=2;
y0(2)=0.0;

[t,y] = ode45(@fparameter, [0:0.05:50], y0,[], w0, d, F, w);
% Ergebnis graphisch darstellen
plot(t,y(:,1),t,y(:,2),'LineWidth',1.5);
txt = sprintf('y0=%.2f v0=%.2f w0=%.2f d=%.2f F=%.2f w=%.2f',...
              y0(1),y0(2),w0,d,F,w);
title(txt);