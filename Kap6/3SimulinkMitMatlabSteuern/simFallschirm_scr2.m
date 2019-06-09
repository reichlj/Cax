clear all
simOut = sim('fallschirm2','SaveFormat','Array',...
       'SaveTime','on', 'TimeSaveName','t',...
       'SaveOutput','on', 'OutputSaveName','h_v');
simOutVars = simOut.who
zeit = simOut.get('t');         
h_v = simOut.get('h_v');   
erg = [zeit,h_v];
fprintf('tend=%6.2f  vend=%6.2fm/s\n',...
        erg(end,1),erg(end,3));
         