function dy_dt = fketteN( t, y )
global c m 
% y(1) x1(t)    y(2)  x1'(t)= v1(t)
N2 = length(y);
dy_dt = zeros(N2,1);
for k=1:2:N2
    dy_dt(k) = y(k+1);
end
%dy_dt(2) = -c1/m1*y(1) - c2/m1*(y(1)-y(3));
dy_dt(2) = -c(1)/m(1)*y(1) - c(2)/m(1)*(y(1)-y(3));
for k=4:2:(N2-2)
    mi=k/2;
    %dy_dt(4) = -c2/m2*(y(3)-y(1)) -c3/m2*(y(3)-y(5));
    dy_dt(k) = -c(mi)/m(mi)*( y(k-1)-y(k-3) ) ...
                 -c(mi+1)/m(mi)*( y(k-1)-y(k+1) );
end
%dy_dt(6) = -c3/m3*(y(5)-y(3)) - c4/m3*y(5);
N = N2/2;
dy_dt(N2) = -c(N)/m(N)*(y(N2-1)-y(N2-3)) - c(N+1)/m(N)*y(N2-1);
end

