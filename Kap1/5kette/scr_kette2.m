clear all; clc
% globale Parameter der DGL
global m1 m2 c1 c2 c3;

m1 = 2; m2 = 2;
c1 = 3; c2 = 3; c3 = 3;
% Anfangsbedingungen
x10 = 3.0;  v10 = 0;
x20 = -2.0; v20 = 0;

% DGL lösen
[t, y] = ode45(@fkette2,[0,25],[x10,v10,x20,v20]);

plot(t,y(:,1),t,y(:,3),'LINEWIDTH',2);   % Auslenkungen
txt = sprintf('x10=%.2f  v10=%.2f  x20=%.2f  v20=%.2f',...
              x10,v10,x20,v20);
title(txt);
