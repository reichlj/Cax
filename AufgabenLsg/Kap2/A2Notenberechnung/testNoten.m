clear all; clc
pt = struct('name',[],'semester',[],... 
            'informatik',[],'cad', [] );

disp('Test-1 : keine Teilnehmer')
[sem info cad] = mittelwert(pt)
[sem info cad] = mittelwertOhneFor(pt)
[note] = bestegesamtnote(pt)
[nliste] = namensliste(pt,2.0)
[nliste2] = namensliste2(pt,2.0)

disp('Test-2 : genau ein Teilnehmer')
pt.name = 'Meier'; 
pt.semester = 4; 
pt.cad = 1.7; 
pt.informatik = 2.3;

[sem info cad] = mittelwert(pt)
[sem info cad] = mittelwertOhneFor(pt)
[note] = bestegesamtnote(pt)
[nliste] = namensliste(pt,2.0)
[nliste] = namensliste(pt,2.1)
[nliste2] = namensliste2(pt,2.0)
[nliste2] = namensliste2(pt,2.1)

disp('Test-3 : genau zwei Teilnehmer')
pt(2).name = 'Schmidt'; 
pt(2).semester = 6; 
pt(2).cad = 3.7; 
pt(2).informatik = 4.3;

%  zwei Teilnehmer        
[sem info cad] = mittelwert(pt)
[sem info cad] = mittelwertOhneFor(pt)
[note] = bestegesamtnote(pt)
[nliste] = namensliste(pt,2.0)
[nliste] = namensliste(pt,4.0)
[nliste2] = namensliste2(pt,2.0)
[nliste2] = namensliste2(pt,4.0)

disp('Test-4 : genau ein Teilnehmer, fehlende CAD-Note')
pt = struct('name',[],'semester',[],... 
            'informatik',[],'cad', [] );
pt.name = 'Meier'; 
pt.semester = 4; 
pt.cad = []; 
pt.informatik = 2.3;

[sem info cad] = mittelwert(pt)
[sem info cad] = mittelwertOhneFor(pt)
[note] = bestegesamtnote(pt)
[nliste] = namensliste(pt,2.0)
[nliste] = namensliste(pt,2.1)
[nliste2] = namensliste2(pt,2.0)
[nliste2] = namensliste2(pt,2.1)
