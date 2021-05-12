function hersteller_2_kennzeichenliste = hersteller(kennzeichen_2_hersteller)
  kennzeichen = kennzeichen_2_hersteller.keys();
  hersteller_2_kennzeichenliste = ...
         containers.Map('KeyType','char','ValueType','any')
  for k=1:length(kennzeichen_2_hersteller)
      autokennz = kennzeichen{k}  % e.g. 'M - DA 345'
      h_name = kennzeichen_2_hersteller(autokennz);  % e.g. 'BMW'
      if hersteller_2_kennzeichenliste.isKey(h_name)
          % Hersteller bereits in Map, Autokennzeichen anhängen
          hersteller_2_kennzeichenliste(h_name) = ...
            [hersteller_2_kennzeichenliste(h_name),{autokennz}];
      else
          % neuen Hersteller zur Map hinzufügen, Autokennzeichen speichern
          hersteller_2_kennzeichenliste(h_name) = {autokennz};
      end
  end
end