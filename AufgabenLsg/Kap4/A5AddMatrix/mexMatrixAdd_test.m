%% Test 1: Addiere 2*3 Matrizenn
A = [ 2  3  4;  5  6  7];
B = [20 30 40; 50 60 70];
C = mexMatrixAdd(A,B);
DC = C - (A+B);
assert( max(abs(DC(:))) < 1e-10, '2*3 Matrix Addition falsch')
%% Test 2: Addiere 1000*1000 Matrizen
A = rand(1000);  B = rand(1000);
C = mexMatrixAdd(A,B);
DC = C - (A+B);
assert(max(abs(DC(:))) < 1.0e-8, '1000*1000-Matrix Addition falsch')
%% Test 3: Addiere Matrizen unterschiedlicher Größen
try 
   A = rand(100);  B = rand(200);
   C = mexMatrixAdd(A,B);
   assert(false, '2d-Arrays unterschiedlicher Größe: Fehler nicht erkannt')
catch 
end
%% Test 3: Addiere 2d und 3d Matrizen
try 
   A = rand(10);  B = rand(20,20,30);
   C = mexMatrixAdd(A,B);
   assert(false, 'Fehler bei Addition von 1d und 3d nicht erkannt')
catch 
end
%% Test 4: fehlender Aufrufparameter
try 
   A = rand(10);
   C = mexMatrixAdd(A);
   assert('Fehlender Aufrufparameter nicht erkannt')
catch 
end