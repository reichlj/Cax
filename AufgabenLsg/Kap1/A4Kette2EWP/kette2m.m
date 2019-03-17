function [ V , D ] = kette2m( massen , fkonst)
%KETTE2M Kette mit 2 schwingenden Massen
%     [V, D ] = kette2m(massen, fkonst)
%         massen : Vektor mit 2 Massen
%         fkonst : Vektor mit 3 Federkonstanten

% 2*2 Matrix erzeugen- alle Elemente 0 
C = zeros(length(massen));   

% Diagonalelemente belegen
C(1,1) = ( fkonst(1) + fkonst(2) )/massen(1);
C(2,2) = ( fkonst(2) + fkonst(3) )/massen(2);

% oberes Dreieck belegen
C(1,2) = -fkonst(2)/massen(1);

% unteres Dreieck belegen
C(2,1) = C(1,2);

% spezielles Eigenwertproblem lösen
[V,D] = eig(C);

end