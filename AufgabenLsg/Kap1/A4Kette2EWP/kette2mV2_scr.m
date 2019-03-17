clear all; close all;
disp('Lineare Kette mit 2 Massen als EWP')
m = getInputData('  Masse (%d): ',1);
fk = getInputData('  Federkonstante (%d): ',2);

disp('Anfangsbedingungen ')
x0(1,1) = getInputData(' Auslenkung Masse 1 (%.2f): ',0.5);
x0(2,1) = getInputData(' Auslenkung Masse 2 (%.2f): ',0.1);

v0(1,1) = getInputData(' Geschwindigkeit Masse 1 (%.2f): ',0);
v0(2,1) = getInputData(' Geschwindigkeit Masse 2 (%.2f): ',0);

disp('Auslenkungen bei t=0 :')
disp(x0)
disp('Geschwindigkeiten t=0 :')
disp(v0)

input('Teilaufgabe a) EW und EV berechnen und ausgeben ')

% 2 gleiche Massen
massen = [m;m];
n = length(massen);

% 3 Federn mit gleicher Federkonstante
fkonst = [fk;fk;fk];

% Eigenwertproblem lösen
[V,D]=kette2m(massen,fkonst);

% Frequenzen
w = sqrt(diag(D));

% Eigenwerte und Eigenvektoren ausgeben
for k=1:n
    fprintf('  Eigenwert-%d   : %.3f\n', k, D(k,k));
    fprintf('    Eigenvektor : %.3f\n', V(:,k));
end

input('Teilaufgabe b) Eigenschwingungen darstellen ')

% Zeiten an denen die Auslenkungen berechnet werden
t = 0:0.01:20;
% statische Verschiebung der 2 Massen
xd = repmat([1;3],1,length(t));

% graphische Darstellung der 2 Eigenschwingungen
ylim([0 7]);
for k = 1:n
   xa = V(:,k)*cos(w(k)*t);
   subplot(n,1,k);
   plot(t,[xa+xd;xd],'Linewidth',1)
   % erzeuge die Ueberschrift
   if (k == 1)
      str1 = sprintf('Eigenschwingungen\nNr %d : -',k);
   else
      str1 = sprintf('Nr %d : -',k);
   end
   str2 = sprintf(' ev = [%.2f %.2f] -',V(:,k));
   str3 = sprintf(' Freq. = %.2f -',w(k));
   str4 = sprintf(' Schwg.dauer T = %.2f',2*pi/w(k));
   title(strcat(str1,str2,str3,str4))
end 

input('Teilaufgabe c) Anfangswertproblem lösen ')

clf
disp('Amplituden der cos-Terme')
a = V\x0;
disp(a)

disp('Amplituden der sin-Terme')
b = ( V\v0 ) ./w ;
disp(b)

% Auslenkungen berechnen
x=zeros(n,length(t));
for k=1:n
   x = x + a(k)*V(:,k)*cos(w(k)*t) + b(k)*V(:,k)*sin(w(k)*t);
end
subplot(4,1,1)
plot(t,x(1,:))

% Titel der Zeichnung ausgeben
str1 = sprintf('Anfangswertproblem');
str2 = sprintf('Koeff. cos-Terme: [%.2f %.2f]', a);
str3 = sprintf(' sin-Terme: [%.2f %.2f]', b);
str4 = sprintf('Auslenkung Masse 1 - x1(t=0) = %.3f',x(1,1));
title(sprintf('%s\n%s%s\n%s\n%s',str1,str2,str3,str4));

subplot(4,1,2)
plot(t,x(2,:))
title(sprintf('Auslenkung Masse 2 - x2(t=0) = %.3f',x(2,1)));

% Geschwindigkeiten berechnen
v=zeros(n,length(t));
for k=1:n
   v = v - w(k)*a(k)*V(:,k)*sin(w(k)*t) + w(k)*b(k)*V(:,k)*cos(w(k)*t);
end

subplot(4,1,3)
plot(t,v(1,:))
title(sprintf('Geschwindigkeit Masse 1 - v1(t=0) = %.3f',v(1,1)));

subplot(4,1,4)
plot(t,v(2,:))
title(sprintf('Geschwindigkeit Masse 2 - v2(t=0) = %.3f',v(2,1)));

disp('Berechnete Auslenkungen zur Zeit t=0 :')
fprintf('  x1(t=0) = %.4f\n',x(1,1));
fprintf('  x2(t=0) = %.4f\n',x(2,1));

disp('Berechnete Geschwindigkeiten zur Zeit t=0 :')

fprintf('  v1(t=0) = %.4f\n',v(1,1));
fprintf('  v2(t=0) = %.4f\n',v(2,1));

input('Teilaufgabe d) Animation einer Eigenschwingung ')
k = getInputData('Eigenschwingung Nr.: [1...2] (%d)',1);

% neues Figure-Fenster erzeugen
figure
 
disp('******************************************');
disp('**  Zum Stoppen der Animation:          **');
disp('**  Strg+C im Kommandofenster drücken!  **');
disp('******************************************');

% Titel erzeugen
str1 = sprintf('Nr. %d -',k);
str2 = sprintf(' ev = [ %.2f %.2f ] -',V(:,k));
str3 = sprintf(' Frequenz = %.2f',w(k));
 
t = 0;

x01 = 0;     % Ruhelage von Masse 1
x02 = 4;     % Ruhelage von Masse 2
while(true)
  t = t + 0.1;
  x = V(:,k) * sin(w(k) * t);    
  % aktuelle Positionen zeichnen
  plot([x(1)+x01 x(2)+x02],[0 0],'ro-','MarkerSize',30,'LINEWIDTH',3);
  hold on
  % Ruhelagen zeichnen
  plot([x01 x02],[0 0],'b.','MarkerSize',60,'LINEWIDTH',2);
  hold off
  xlim([x01-2 x02+2])
  ylim([-1 1])
        
  str4 = sprintf(' Zeit = %.2f',t);
  title(strcat(str1,str2,str3,str4));
  drawnow;
  pause(0.1);    
end