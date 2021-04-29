% erzeuge ein Objekt vom Typ mydate_v1
d = mydate_v1(2021,2,25)
% Property year des Object d anzeigen
d.year
% Methode tick des Object d aufrufen
d = d.tick()
d = mydate_v1(2021,2,28);
d = tick(d)
d = mydate_v1(2021,12,31);
d = tick(d)
d = mydate_v1(2021,1,1);
for k = 1:365
    d = d.tick();
end
d