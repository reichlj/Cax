% erzeuge ein Objekt vom Typ mytime_v1
t = mytime_v1(14,30,58);
% Methode tick des Object t aufrufen
t1 = t.tick();
disp(t)
disp(t1)
% Property second von t und t1 anzeigen
t.second
t1.second