clear all; clc
modelName = 'fallschirm1';
open_system(modelName,'loadonly')
hws = get_param(modelName, 'modelworkspace');
hws.DataSource = 'Model File';
vx=0;
hoben = 100;
hunten= 1;
fprintf('Iteration :\n');
while hoben - hunten > 0.1 || abs(vx-7) > 0.1
  hmitte= (hoben+hunten)/2;  
  hws.assignin('h1', hmitte);
  save_system(modelName)
  simOut = sim(modelName,...
      'SaveTime','on', 'TimeSaveName','t',...
      'SaveOutput','on', 'OutputSaveName','h_v');
  erg = [simOut.get('t'), simOut.get('h_v')];   
  % lineare Interpolation für h und v
  t1=erg(end-1,1);  t2=erg(end,1);
  h1=erg(end-1,2);  h2=erg(end,2);
  v1=erg(end-1,3);  v2=erg(end,3);
  % tx Zeitpunkt der Landung
  tx= t1 - h1*(t2-t1)/(h2-h1); 
  % vx Geschwindigkeit beim Landen
  vx = abs((v1*h2-v2*h1)/(h2-h1));
  fprintf('  hu=%5.2fm hm=%5.2fm ho=%6.2fm tx=%6.2fs vx=%6.2fm/s\n',...
          hunten,hmitte,hoben,tx,vx);
  if vx < 7           % öffnen bei hmitte : vx Geschwindigkeit beim Landen
     hoben = hmitte;  % zu langsam – neues Intervall [hunten, hmitte]
  else
     hunten = hmitte; % zu schnell – neues Intervall [hmitte, hoben]
  end   

end
fprintf('Ergebnis :\n');
fprintf('  Hoehe           = %6.2fm\n',hmitte);
fprintf('  Zeitpunkt       = %6.2fs\n',tx);
fprintf('  Geschwindigkeit = %6.2fm/s\n',vx);
close_system(modelName)
