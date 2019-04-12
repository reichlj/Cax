clear; clc
disp('*** T1: Zwei Zeilenvektoren')
x = [2 3 4];
y = [20 30 40];
assert( mexDot(x,y) == dot(x,y), 'Fehler bei Zeilenvektoren')

disp('*** T2: Zeilen- und Spaltenvektoren')
y1 = [20; 30; 40];
assert( mexDot(x,y) == dot(x,y), 'Fehler bei Zeilen- und Spaltenvektor')

disp('*** T3: Anzahl der Argumente falsch')
ergc = mexDot(x)

disp('*** T4: Vektoren unterschiedlicher Laenge')
x1 = [2 3 4 5];
ergd = mexDot(x,x1);

disp('*** T5: Vektor und Matrix')
y = [20 30 40;21,22,23];
ergd = mexDot(x,y);