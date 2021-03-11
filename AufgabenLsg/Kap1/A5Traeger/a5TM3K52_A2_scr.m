clear all
global m c g H h
m = 5;       % Einheit kg
c = 30000;   % Einheit N/m
H = 0.3;     h = 0.1;     % Einheiten m
g = 9.81;    % m/(s*s)

anfangs_auslenkung_grad = input('Anfangsauslenkung '); 
y10 = anfangs_auslenkung_grad/180*pi;
% y10 = deg2rad(anfangs_auslenkung_grad)
y20 = 0;
zeiten = linspace(0,1,5000);

% Numerische Lösung der nichtlinearen Gleichung
[t,erg] = ode45(@a5TM3K52_A2_dgl,zeiten,[y10,y20]);
%erg_grad = erg*(180/pi);
erg_grad = rad2deg(erg);
% Num. Lösung der nichtlin. DGL, Terme bis 3-ter Ordnung
[t,erg3] = ode45(@a5TM3K52_A2_dgl3,zeiten,[y10,y20]);
erg3_grad = erg3*180/pi;  
% Lösung der linearen DGL
omega = sqrt((c*h^2-H*m*g)/(m*H^2));
linear = anfangs_auslenkung_grad*cos(omega*zeiten);

plot(t,erg_grad(:,1),t,erg3_grad(:,1),t,linear,'linewidth',1.5)
title(sprintf('Anfangsauslenkung %.1f Grad',anfangs_auslenkung_grad))
xlabel('Zeit in Sekunden');   
ylabel('Auslenkung in Grad')
legend('exakt','3-te-Ordnung','linear')

