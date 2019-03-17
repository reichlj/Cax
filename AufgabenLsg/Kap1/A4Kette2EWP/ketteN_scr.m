clear all
close all
% 3 gleiche Massen
massen = [1;1;1];
n = length(massen);

% 4 Federn mit gleicher Federkonstante
fkonst = [1;1;1;1];

% verallgemeinertes Eigenwertproblem lösen
[V,D,M,C]=ketteN(massen,fkonst);

% Frequenzen
w = sqrt(diag(D));

% Matrizen des verallgemeinerten 
% Eigenwertproblems ausgeben
fprintf('Verallgemeinertes Eigenwertproblem\n');
fprintf('Massenmatrix M\n');
fprintf('%.2f %.2f %.2f\n',M');
fprintf('Matrix mit Federkonstanten\n');
fprintf('%6.2f%6.2f%6.2f\n',C');

% Eigenwerte und Eigenvektoren ausgeben
fprintf('\n*** ')
fprintf('Eigenwerte und Eigenvektoren\n')
for k=1:n
  fprintf('  Eigenwert-%d   : %.3f\n',k,D(k,k));
  fprintf('    Eigenvektor : %.3f\n',V(:,k));
end

% Zeitpunkte an denen die Auslenkung berechnet wird
t = 0:0.01:20;
% statische Verschiebung der 3 Massen
xd = repmat([1;3;5],1,length(t));

% graphische Darstellung der 3 Eigenschwingungen
for k = 1:n
   xa = V(:,k)*cos(w(k)*t);
   ylim([0 7]);
   subplot(n,1,k);
   plot(t,[xa+xd;xd],'Linewidth',1)
   % erzeuge die Ueberschrift
   if (k == 1)
      str1 = sprintf('Eigenschwingungen\nNr %d : -',k);
   else
      str1 = sprintf('Nr %d : -',k);
   end
   str2 = sprintf(' ev=[%.2f %.2f %.2f] -',V(:,k));
   str3 = sprintf(' Freq.=%.2f -',w(k));
   str4 = sprintf(' Schw.dauer T=%.2f',2*pi/w(k));
   title(strcat(str1,str2,str3,str4))
end 

input('Anfangswertproblem lösen mit Enter ')
% neues Figure-Fenster erzeugen
figure
% Anfangswertproblem lösen - Teilaufgabe 3
disp('Anfangswertproblem ')
disp('Nur Auslenkungen - Geschwindigkeit 0')
disp('Anfangsauslenkung')
x0 = [-0.4;0.6;0.3];
disp(x0)
disp('Amplituden der Eigenschwingungen')
a = V\x0;
disp(a)
x=zeros(n,length(t));
for k=1:n
   x = x+a(k)*V(:,k)*cos(w(k)*t);
end
plot(t,[xd+x;xd],'Linewidth',1)

% Titel der Zeichnung ausgeben
str1 = sprintf('Anfangswertproblem');
str2 = sprintf('Anfangsauslenkung : [%.2f %.2f %.2f]',x0);
str3 = sprintf('Amplituden der Eigenvektoren : [%.2f %.2f %.2f]',a);
title(sprintf('%s\n%s\n%s',str1,str2,str3));

% Teilaufgabe 4
k = input('Eigenschwingung Nr.: [1...3] ');
 
% k-ten Eigenwert bzw. -vektor ermitteln
omega = sqrt(w(k));        % k-te Kreisfrequenz
x0 = V(:,k);               % n-te Spalte der Matrix V

t = 0;                     % Start-Zeitpunkt
delta_t = 0.1;             % Zeitschritt für Animation
 
disp('******************************************');
disp('**  Zum Stoppen der Animation:          **');
disp('**  Strg+C im Kommandofenster drücken!  **');
disp('******************************************');

% Titel erzeugen
str1 = sprintf('Nr. %d :',k);
str2 = sprintf(' ev=[%.2f %.2f %.2f] -',V(:,k));
str3 = sprintf(' Freq.=%.2f',omega);
 
% Animation auf dem Bildschirm anzeigen
% neues Figure-Fenster erzeugen
figure
ylim([-1 1])
while(true)
    t = t + delta_t;
    x = x0 * sin(omega * t);
    plot([x(1)+1,x(2)+3,x(3)+5],[0,0,0],'ro','MarkerSize',30,'lineWidth',2);
    hold on 
    plot([1,3,5],[0,0,0],'b.','MarkerSize',60,'lineWidth',3);
    hold off 
    xlim([0 6]);
    str4 = sprintf(' Zeit=%.2f',t);
    title(strcat(str1,str2,str3,str4));
    drawnow;
    pause(0.1);    
end


