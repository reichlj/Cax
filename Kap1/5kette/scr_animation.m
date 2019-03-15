clear all
clc
global m1 m2 c1 c2 c3;
m1 = 2; m2 = 2;
c1 = 3; c2 = 3; c3 = 3;
% Anfangsbedingungen
x10 = 3.0;   v10 = 0;
x20 = -2.0;  v20 = 0;
% Lösung berechnen
dt=0.1;
[t, x] = ode45(@fkette2,[0:dt:10],[x10,v10, x20,v20]);
k=1;
r1 = 0;      % Ruhelage von Masse 1
r2 = 10;     % Ruhelage von Masse 2
% Lösung zeichnen
while(k<=length(t))
  % Ruhelagen zeichnen
  plot([r1 r2],[0 0],'k.','MarkerSize',60);
  % aktuelle Positionen zeichnen
  hold on
  plot([r1+x(k,1) r2+x(k,3)],[0 0],'ro-','MarkerSize',30,'LINEWIDTH',3);
  hold off
  xlim([r1-5 r2+5])
  ylim([-1 1])
  title(sprintf('t=%.2f:   x1(t)= %.2f  x2(t)= %.2f',t(k),x(k,1),x(k,3)));
  drawnow;
  pause(dt); % warten  
  k = k + 1;
end