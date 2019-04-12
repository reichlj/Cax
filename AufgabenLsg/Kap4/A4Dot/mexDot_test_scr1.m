clear; clc
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
    fprintf('Fehler bei einem Aufrufparameter gefunden\n')
    disp(E.message)
end

disp('*** T4: Vektoren unterschiedlicher Laenge')
x1 = [2 3 4 5];
try 
    ergd = mexDot(x,x1);
    assert(False,'Fehler bei Vektoren unterschiedlicher L�nge nicht gefunden')
catch E
    fprintf('Fehler bei Vektoren unterschiedlicher L�nge gefunden\n')
    disp(E.message)
end

disp('*** T5: Vektor und Matrix')
y = [20 30 40;21,22,23];
try 
    ergd = mexDot(x,y);
    assert(False,'Fehler bei Vektor und Matrix nicht gefunden')
catch E
    fprintf('Fehler bei Vektor und Matrix gefunden\n')
    disp(E.message)
end

