clear all
global m c g H h
m = 5;       % Einheit kg
c = 30000;   % Einheit N/m
H = 0.3;     h = 0.1;     % Einheiten m
g = 9.81;    % m/(s*s)

w0 = input('Anfangsauslenkung '); 
y10 = deg2rad(w0);
y20 = 0;
zeiten = linspace(0,2,400);

% Numerische Lösung der nichtlinearen Gleichung
[t,erg] = ode45(@a5TM3K52_A2_dgl,zeiten,[y10,y20]);
% Num. Lösung der nichtlin. DGL, Terme bis 3-ter Ordnung
[t,erg3] = ode45(@a5TM3K52_A2_dgl3,zeiten,[y10,y20]);
% Frequenz der linearen DGL
omega = sqrt((c*h^2-H*m*g)/(m*H^2));

% Winkel bezogen zur y-Achse
wlin = 90 - w0*cos(omega*t);
w = 90 - rad2deg(erg(:,1));
w3 = 90 - rad2deg(erg3(:,1));
close all
dt = t(2)-t(1);
k = 1;
while k <= length(t)
    % neue Zeichnung erstellen: aktuelle Lage - exakt
    plot([0,H*cosd(w(k,1))],[0,H*sind(w(k,1))],'b-','linewidth',3)
    hold on
    % in bestehenden Zeichnung: aktuelle Lage - 3-te-Ordnung und linear
    plot([0,0.9*H*cosd(w3(k,1))],[0,0.9*H*sind(w3(k,1))],'r-','linewidth',3)
    plot([0,0.8*H*cosd(wlin(k))],[0,0.8*H*sind(wlin(k))],'g','linewidth',3)
    % Ruhelagen zeichnen
    plot([0,0],[0,H],'k--','linewidth',1)
    % Maximale Auslenkungen zeichnen
    plot([0,H*cosd(wlin(1))],[0,H*sind(wlin(1))],'k--','linewidth',1)
    plot([0,-H*cosd(wlin(1))],[0,H*sind(wlin(1))],'k--','linewidth',1)
    hold off
    xlim([-0.3 0.3]);   ylim([0 0.35])
    xlabel('x');   ylabel('y');   legend('exakt','3-te-Ordnung','linear')
    title(sprintf('Anfangsauslenkung %.1f Grad  t=%.2f',w0,t(k)))
    drawnow;    % Zeichnung darstellen
    pause(0.05) % Wartezeit zwischen 2 Zeichnungen
    if k == 1
       input('Press enter to start the animation')
    end
    k = k + 1;
end



