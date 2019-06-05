%shared variables
x = [2 3 4];
y = [20 30 40];
%% Test 1: 2 Zeilenvektoren
assert( mexDot(x,y) == dot(x,y), 'Fehler bei Zeilenvektoren')
%% Test 2: 2 Zeilen- und Spaltenvektor)
y1 = [20; 30; 40];
assert( mexDot(x,y) == dot(x,y), 'Fehler bei Zeilen- und Spaltenvektor')
%% Test 3: fehlender Parameter
try 
    ergc = mexDot(x)
catch E
end
assert(isobject(E),'Check Anzahl Aufrufparameter falsch')
%% Test 4: Vektoren nicht gleich lang
x1 = [2 3 4 5];
try 
    ergd = mexDot(x,x1);
catch E
end
assert(isobject(E),'Check Vektorlänge falsch')
%% Test 5: Vektor und Matrix
y = [20 30 40;21,22,23];
try 
    ergd = mexDot(x,y);
catch E
end
assert(isobject(E),'Check Vektor falsch')
