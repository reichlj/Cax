clear all
N=15
m = 2*ones(N,1);
c = ones(N+1,1);

x0 = ones(N,1);
x0(2)=0;
v0 = zeros(N,1);
F = zeros(N,N);
% Diagonalelemente belegen
for k=1:N
    F(k,k) = -(c(k)+c(k+1))/m(k);
end
% Elemente oberhalb und unterhalb der Diagonalen
for k=1:N-1
    F(k,k+1) = c(k+1)/m(k);
    F(k+1,k) = c(k+1)/m(k+1);
end
disp('Anfangsauslenkungen')
disp(num2str(x0,'%7.3f'))
disp('Matrix')
disp(num2str(F,'%6.2f'))