function ausgabe(hersteller_2_kennzeichenliste,name)
  if ~hersteller_2_kennzeichenliste.isKey(name)
     fprintf('Keine Daten für Hersteller %s\n',name)
     return
  end
  fprintf('Hersteller: %s\n',name)
  kennzeichen = hersteller_2_kennzeichenliste(name);
  if isempty(kennzeichen)
     fprintf('Keine Kennzeichen vorhanden\n')
  else
     for k=1:length(kennzeichen)
        fprintf('   %s\n',kennzeichen{k})
     end
  end
end