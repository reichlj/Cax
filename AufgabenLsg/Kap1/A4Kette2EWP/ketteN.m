function [ V , D, M, C ] = ketteN( massen , fkonst)
%KETTE4M Kette mit N schwingenden Massen
%     [V, D, M, C] = ketteN(massen, fkonst)
%           massen : Vektor mit N Massen
%           fkonst : Vektor mit N+1 Federkonstanten
%           V      : Eigenvektoren
%           D      : Eigenwerte - auf Diagonalen
%           M      : Matrix mit den Massen
%           C      : Matrix mit den Federkonstanen

nm = length(massen);
nf = length(fkonst);
if ( nm ~= (nf-1) ) 
   fprintf('Anzahl der Massen und Federkonstanten passen nicht');
   fprintf('Anzahl der Massen == Anzahl der Federkonstanten - 1');
   fprintf('Anzahl der Massen = %d',nm);
   fprintf('Anzahl der Federkonstanent = %d',nf);
end

% erzeuge Diagonalmatrix aus dem Vektor massen
M = diag(massen); 

% N*N Matrix erzeugen- alle Elemente 0 
C = zeros(length(fkonst)-1);   

% Diagonalelemente belegen
for k=1:nm
    C(k,k) = fkonst(k)+fkonst(k+1);
end

% Elemente oberhalb und unterhalb der Diagonalen
for k=1:nm-1
    C(k,k+1) = -fkonst(k+1);
    C(k+1,k) = -fkonst(k+1);
end

% verallgemeinertes Eigenwertproblem lösen
[V,D] = eig(C,M);

end