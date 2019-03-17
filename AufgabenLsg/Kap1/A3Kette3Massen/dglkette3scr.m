clear all; clc
global c1 c2 c3 c4;   % Federkonstanten
global m1 m2 m3;      % Massen

m = 1.0;
m1 = m;  m2 = m;  m3 = m;
c = 1;
c1 = c;  c2 = c;  c3 = c;  c4 = c;

% Anfangsbedingungen
y0 = zeros(6,1);
y0(1,1) = -0.4;  % y(1,1)   x1(t)    Auslenkung masse 1
y0(3,1) = 0.6;   % y(3,1)   x2(t)    Auslenkung masse 2
y0(5,1) = 0.3;   % y(5,1)   x3(t)    Auslenkung masse 3

% Lösung der DGL
[t, y] = ode45(@fkette3,[0:0.1:10],y0);

disp('Auslenkungen zur Zeit t=20')
fprintf('  x1 = %.5f\n',y(end,1));
fprintf('  x2 = %.5f\n',y(end,3));
fprintf('  x3 = %.5f\n',y(end,5));

subplot(3,1,1);  
plot(t, y(:,1));    
title( sprintf('Masse 1  x1(t=0) = %.2f\n',y0(1,1)) );
subplot(3,1,2);  
plot(t, y(:,3));    
title( sprintf('Masse 2  x2(t=0) = %.2f\n',y0(3,1)) );
subplot(3,1,3);  
plot(t, y(:,5));    
title( sprintf('Masse 3  x3(t=0) = %.2f\n',y0(5,1)) );

input('Animation starten mit Enter ');

% clear the plot window
clf
y01= 0; y02= 4; y03= 8;
k=1;
while(k<=length(t))
  %    (y1(t),0) (y2(t),0)  (y3(t),0) red/circle
  %        (0,0)     (4,0)      (8,0) blue/disk
  plot([y(k,1)+y01 y(k,3)+y02 y(k,5)+y03],[0 0 0],...
       'ro-','MarkerSize',30,'LINEWIDTH',3);
  hold on
  % Ruhelagen zeichnen
  plot([y01 y02 y03],[0 0 0],'b.','MarkerSize',60);
  hold off
  xlim([y01-3 y03+3])
  ylim([-1 1])
  title(sprintf('t = %.2f',t(k)));
  drawnow;
  pause(0.1);   
  k = k + 1;
end

input('Anfangswertproblem bei Eigenschwingung ');

y1(1,1) = 0.5;    % y(1,1)   x1(t)    Auslenkung masse 1
y1(3,1) =  0;     % y(3,1)   x2(t)    Auslenkung masse 2
y1(5,1) = -0.5;   % y(5,1)   x3(t)    Auslenkung masse 3
y1(2,1) =  0;     % y(2,1)   x1'(t)   Geschwindigkeit masse 1
y1(4,1) =  0;     % y(4,1)   x2'(t)   Geschwindigkeit masse 2
y1(6,1) =  0;     % y(6,1)   x3'(t)   Geschwindigkeit masse 3

% Lösung der DGL
[t, y] = ode45(@fkette3,[0:0.1:10],y1);
disp('Auslenkungen zur Zeit t=20')
fprintf('  x1 = %.5f\n',y(end,1));
fprintf('  x2 = %.5f\n',y(end,3));
fprintf('  x3 = %.5f\n',y(end,5));

subplot(3,1,1);  
plot(t, y(:,1));    
title( sprintf('Masse 1  x1(t=0) = %.2f\n',y1(1,1)) );
subplot(3,1,2);  
plot(t, y(:,3));    
title( sprintf('Masse 2  x2(t=0) = %.2f\n',y1(3,1)) );
subplot(3,1,3);  
plot(t, y(:,5));    
title( sprintf('Masse 3  x3(t=0) = %.2f\n',y1(5,1)) );

input('Animation starten mit Enter ');

% clear the plot window
clf

k=1;
while(k<=length(t))
  %    (y1(t),0) (y2(t),0)  (y3(t),0) red/circle
  %    (0,0)     (4,0)     (8,0)    blue/disk
  % aktuelle Positionen zeichnen
  plot([y(k,1)+y01 y(k,3)+y02 y(k,5)+y03],[0 0 0],...
       'ro-','MarkerSize',30,'LINEWIDTH',3);
  hold on
  % Ruhelagen zeichnen
  plot([y01 y02 y03],[0 0 0],'b.','MarkerSize',60);
  hold off
  xlim([y01-3 y03+3])
  title(sprintf('t = %.2f',t(k)));
  drawnow;
  pause(0.1);   
  k = k + 1;
end
