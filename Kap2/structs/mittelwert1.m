clear all; clc

pt = struct('name', [],...
            'semester', [],... 
            'informatik', [],...
            'cad', [] );

pt(1).informatik = 1;
pt(2).informatik = 2;
pt(3).informatik = 3;
summe = 0;
for k = 1:length(pt)
    summe = summe + pt(k).informatik;
end
notenschnitt1 = summe/length(pt)
% notenschnitt = mean(pt(:).informatik)  ist falsch !
notenschnitt2 = mean([pt(:).informatik]) 

disp('Bedeutung von pt(:).informatik')
% Loop über alle Elemente
pt(:).informatik          
% erstes Element in eine Variable
erstenote = pt(:).informatik   
% die ersten zwei Elemente in zwei Variablen
[n1,n2] = pt(:).informatik  
% alle Elemente in ein Array
noten = [pt(:).informatik]   