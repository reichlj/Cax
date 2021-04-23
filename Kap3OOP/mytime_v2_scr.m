t = mytime_v2(14,30,58);
disp(t)
disp(t.second)
t = t.tick(); % Aufruf Variante 1
disp(t)
t = tick(t);  % Aufruf Variante 2
disp(t)
t = mytime_v2(14,30,0);
for k=1:100
    t = t.tick();
end
disp(t)
% t.second = 50;
t = t.set_second(50)
t = t.set_second(100)
disp(t)
n1 = t.nbr_of_seconds()
n2 = nbr_of_seconds(t)

t = mytime_v2(14,30,58);
t1 = mytime_v2(14,33,27);
t.gleich_oder_spaeter(t1)