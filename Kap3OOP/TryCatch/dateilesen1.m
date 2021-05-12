clear all; clc
while true
   try
      name = input('Dateiname ','s');
      fid = fopen(name);
      mydata = fread(fid);
      fclose(fid);
      disp(mydata)
   catch me
      fprintf('Datei nicht gefunden\n')
   end
end