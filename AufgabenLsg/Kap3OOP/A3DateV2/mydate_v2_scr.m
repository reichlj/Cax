% erzeuge ein Objekt vom Typ mydate_v2
d = mydate_v2(2021,2,25)
% Property year des Object d anzeigen
d.year
% Methode tick des Object d aufrufen
d = d.tick()
d = d.set_year(2022)
d = mydate_v2(2024,2,29)
d = d.set_year(2025)
