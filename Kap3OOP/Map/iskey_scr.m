clear all; clc
keys = {'Jan', 'Feb', 'Mar', 'May'};
values = { 372.2 368.2 197.6 178.4 };
rain = containers.Map(keys,values);

while true
   month = input('Monat eingeben: ','s');
   if startsWith(month,'end','IgnoreCase',true)
      break
   end
   try
      value = rain(month);
      fprintf('Regen im Monat %s %.2f\n',month,value)
   catch me
      fprintf('Keine Daten für Monat %s\n',month)        
   end
end