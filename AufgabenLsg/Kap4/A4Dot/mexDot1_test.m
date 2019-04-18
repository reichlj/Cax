%shared variables
x = [2 3 4];
y = [20 30 40];
%% Test 1: 2 Zeilenvektoren
assert( mexDot(x,y) == dot(x,y), 'Fehler bei Zeilenvektoren')
%% Test 2: 2 Zeilen- und Spaltenvektor)
y1 = [20; 30; 40];
assert( mexDot(x,y) == dot(x,y), 'Fehler bei Zeilen- und Spaltenvektor')
%% Test 3: fehlender Parameter
ergc = mexDot(x)
%% Test 4: Vektoren nicht gleich lang
x1 = [2 3 4 5];
ergd = mexDot(x,x1);
%% Test 5: Vektor und Matrix
y = [20 30 40;21,22,23];
ergd = mexDot(x,y);