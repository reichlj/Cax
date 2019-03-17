clear all; clc
global c;   % Federkonstanten
global m;   % Massen

N = input('Anzahl der Massen ');
TEnd = input('Endezeitpunkt ');
m = ones(1,N);
c = 2*ones(1,N+1);

y0 = zeros(2*N,1);
disp('Auslenkungen zur Zeit t=0')
for k=1:N
  % yk index für Auslenkung
  yk = 2*(k-1)+1;
  % Massen werden zufällig ausgelenkt
  y0(yk) = -1+2*rand(1,1);
  fprintf('  x%d = %.5f\n',k,y0(yk));
end

% Lösung der DGL
[t, y] = ode45(@fketteN,[0,TEnd],y0);

disp(sprintf('Auslenkungen zur Zeit t=%d',TEnd))
for k=1:N
  yk = 2*(k-1)+1;
  fprintf('  x%d = %.5f\n',k,y(end,yk));
  subplot(N,1,k);  
  plot(t, y(:,yk));    
  title( sprintf('Masse %d',k) );
end