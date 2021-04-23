% erzeuge ein Objekt vom Typ mytime_v1
t = mytime_v1(14,30,58)
% Property second des Object t anzeigen
t.second
% Methode tick des Object t aufrufen - Variante 1
t = t.tick()
% Methode tick des Object t aufrufen - Variante 2
t = tick(t)
t = mytime_v1(14,30,0);
for k=1:100
    t = t.tick();
end
disp(t)
n1 = t.nbr_of_seconds()
n2 = nbr_of_seconds(t)
t.second = 100
