clear all
h1Vektor=[100,75,50,30,20,10,5,1];
modelName = 'fallschirm1';
for k= 1:length(h1Vektor)
  h1=h1Vektor(k);
  load_system(modelName)
  hws = get_param(modelName, 'modelworkspace');
  hws.DataSource = 'Model File';
  hws.assignin('h0', 500);
  hws.assignin('h1', h1);
  save_system(modelName)
  close_system(modelName)
  simOut = sim(modelName, 'SaveFormat','Array',...
         'SaveTime','on', 'TimeSaveName','t', ...
         'SaveOutput','on', 'OutputSaveName','h_v');
  erg = [simOut.get('t'),simOut.get('h_v')];   
  fprintf('h1=%6.1fm t_end=%6.2f v_end=%6.2fm/s\n',...
           h1, erg(end,1), erg(end,3)); 
end