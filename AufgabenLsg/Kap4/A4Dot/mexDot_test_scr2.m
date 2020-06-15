clear; clc
% besseres primitives Testskript - Test bricht bei T3 nicht ab
disp('*** T1: Zwei Zeilenvektoren')
x = [2 3 4];
y = [20 30 40];
assert( mexDot(x,y) == dot(x,y), 'Fehler bei Zeilenvektoren')

disp('*** T2: Zeilen- und Spaltenvektoren')
y1 = [20; 30; 40];
assert( mexDot(x,y) == dot(x,y), 'Fehler bei Zeilen- und Spaltenvektor')

disp('*** T3: Anzahl der Argumente falsch')
try 
    ergc = mexDot(x)
    assert(False,'Fehler bei einem Aufrufparameter nicht gefunden')
catch E
end

disp('*** T4: Vektoren unterschiedlicher Laenge')
x1 = [2 3 4 5];
try 
    ergd = mexDot(x,x1);
    assert(False,'Fehler bei Vektoren unterschiedlicher Länge nicht gefunden')
catch E
end

disp('*** T5: Vektor und Matrix')
y = [20 30 40;21,22,23];
try 
    ergd = mexDot(x,y);
    assert(False,'Fehler bei Vektor und Matrix nicht gefunden')
catch E
end

