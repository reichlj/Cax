keys = {'M - DA 345','STA - BC 345','M - A 345',...
        'M - DA 346','STA - KK 345','M - B 346',...
        'M - DA 347','STA - CC 345','M - C 347'};
values = {'BMW','AUDI','VW','BMW','VM','AUDI','AUDI','AUDI','VW'};
% create Map:  Kennzeichen --> Namen
kennzeichen_2_hersteller = containers.Map(keys,values);
% create Map:  Hersteller --> Kennzeichenliste
hersteller_2_kennzeichenliste = hersteller(kennzeichen_2_hersteller) 
ausgabe(hersteller_2_kennzeichenliste,'BMW')
ausgabe(hersteller_2_kennzeichenliste,'AUDI')
ausgabe(hersteller_2_kennzeichenliste,'VW')
ausgabe(hersteller_2_kennzeichenliste,'OPEL')
