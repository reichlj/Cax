clear all
hoben = 100;
hunten= 1;
modelName = 'b_fallschirmTransferBlock';
open_system(modelName,'loadonly');
hws = get_param(bdroot, 'modelworkspace');
hws.DataSource = 'Model File';
vx=0;
while hoben - hunten > 0.1 || abs(vx-7) > 0.1
  hmitte= (hoben+hunten)/2;  
  hws.assignin('h1', hmitte);
  save_system(modelName)
  simOut = sim(modelName,...
         'SaveTime','on', 'TimeSaveName','tout',...
         'SaveOutput','on', 'OutputSaveName','yout');
  tout=simOut.get('tout');         
  yout=simOut.get('yout');   
  % lineare Interpolation
  t1=tout(end-1);    t2=tout(end);
  h1=yout(end-1,1);  h2=yout(end,1);
  v1=yout(end-1,2);  v2=yout(end,2);
  % tx Zeitpunkt der Landung
  tx= t1 - h1*(t2-t1)/(h2-h1); 
  % vx Geschwindigkeit beim Landen
  vx = abs((v1*h2-v2*h1)/(h2-h1));
  fprintf('hu=%5.2fm hm=%5.2fm ho=%6.2fm tx=%6.2fs vx=%6.2fm/s\n',...
          hunten,hmitte,hoben,tx,vx);
  if vx < 7
     hoben = hmitte;
  else
     hunten = hmitte;
  end   
end
fprintf('Hoehe           = %6.2fm\n',hmitte);
fprintf('Zeitpunkt       = %6.2fs\n',tx);
fprintf('Geschwindigkeit = %6.2fm/s\n',vx);
close_system(modelName)
