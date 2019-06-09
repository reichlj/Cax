clear all
hOeffnen=100;
modelName = 'fallschirm3';
open_system(modelName, 'loadonly')
%open_system(modelName)  % Simulink Modell wird angezeigt
%load_system(modelName)
% bdroot Return name of top-level Simulink system
% nach open ist bdroot='fallschirm3'
% hws = get_param(modelName, 'modelworkspace');
hws = get_param(bdroot, 'modelworkspace');
hws.DataSource = 'Model File';
hws.assignin('h0', 500);
hws.assignin('h1', hOeffnen);
save_system(modelName)
simOut = sim(modelName, 'SaveFormat','Array',...
        'SaveTime','on', 'TimeSaveName','tout1', ...
        'SaveOutput','on', 'OutputSaveName','yout1');
erg =[simOut.get('tout1'),simOut.get('yout1')];
fprintf('h1=%6.1fm tend=%6.2f vend=%6.2fm/s\n',...
        hOeffnen,erg(end,1),erg(end,3));
