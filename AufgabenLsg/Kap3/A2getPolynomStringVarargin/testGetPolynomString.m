% shared variables
a= [4.1 3.7 -2.1 0.7];
astr='y = 4.1*x^3+3.7*x^2-2.1*x+0.7';
%% Test 1: ein Parameter
assert(strcmp(getPolynomString(a),astr),'Fehler bei einem Parameter')
%% Test 2: zwei Parameter
astr(1) = 'z';
assert(strcmp(getPolynomString(a,'z'),astr),'Fehler bei zwei Parametern')
%% Test 3: drei Parameter 
astr(1) = 'z';
astr = strrep(astr,'x','t');
assert(strcmp(getPolynomString(a,'z','t'),astr),'Fehler bei drei Parametern')
%% Test 4: Test Gerade
b = [2.1 0.7];
assert(strcmp(getPolynomString(b),'y = 2.1*x+0.7'),'Fehler bei Gerade')
assert(strcmp(getPolynomString(b,'z'),'z = 2.1*x+0.7'),'Fehler bei Gerade')
assert(strcmp(getPolynomString(b,'z','t'),'z = 2.1*t+0.7'),'Fehler bei Gerade')
%% Test 5: Test Konstante
b = 0.7;
assert(strcmp(getPolynomString(b),'y = 0.7'),'Fehler bei Konstante')
assert(strcmp(getPolynomString(b,'z'),'z = 0.7'),'Fehler bei Konstante')
assert(strcmp(getPolynomString(b,'z','t'),'z = 0.7'),'Fehler bei Konstante')