clear all; clc

input('1: Struct erzeugen - weiter mit Enter ');
pt = struct('name', 'Huber',...
            'semester', 4,... 
            'informatik', 1.7,...
            'cad', 2.3 )
disp('whos pt')
whos pt

input('2: Lesen und Schreiben - weiter mit Enter ');
infonote = pt.informatik
pt.name
pt.cad = 2.7;
pt.name = 'Meier';
pt.semester = [];
pt

input('3: set-getfield - weiter mit Enter');
pt = setfield(pt, 'cad', 2.3)
meinname = getfield(pt, 'name')
pn = setfield(pt, 'cad', 1.3)

input('4: Nur Definition - weiter mit Enter');
pt = struct('name',[],'semester',[],... 
            'informatik',[],'cad', [] )
pt.name = 'Huber';
pt.semester = 4;
pt.informatik = 1.3;
pt

input('5: Array - weiter mit Enter');
pt(2).name  = 'Schmidt'
pt
pt(2).semester = 4;
pt(2).informatik = 1.7;
pt(2) 

input('6: Stuktur erweitern - weiter mit Enter ')
pt(2).geschlecht = 'w'
pt(1)
pt(2)

input('7: Feld löschen - weiter mit Enter')
pt = rmfield(pt, 'cad')
pt(1)
pt(2)