clear all
global cw AS AFS rho m g h1;

cw = 1.3;  AS = 0.5;  AFS = 30;
g = 9.81;  rho = 1.2; m = 85;
h1 = 1500;
h0 =3000; v0 = 0;
% Lösung der DGL
[t, y] = ode45(@dglfallschirm,[0,300],[h0,v0]);
erg = [ t, y];  % erg ist eine Hilfsgroesse mit 3 Spalten
subplot(2,1,1)
plot(t,y(:,1),'LineWidth',1);
subplot(2,1,2)
plot(t,y(:,2),'LineWidth',1);
fprintf('Fallschirm öffnet sich bei h=%.0fm\n',h1)
for k=1:length(t)
    if (erg(k,2) > h1) && (erg(k+1,2) <= h1)
       fprintf('Fallschirm öffnet sich nach %.2fs\n',erg(k,1))
       fprintf('Geschwindigkeit beim Öffnen %.2fm/s\n\n',erg(k,3))
       break
    end
end
for k=1:length(t)
    if (erg(k,2) > 0.0) && (erg(k+1,2) <= 0.0) 
       fprintf('Landung nach %.2fs\n',erg(k,1))
       fprintf('Geschwindigkeit beim Landen %.2fm/s\n',erg(k,3))
       break
    end
end