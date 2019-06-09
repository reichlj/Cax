clear all
simOut = sim('fallschirm1',...
             'SaveTime','on', ...
             'SaveOutput','on', ...
             'SaveFormat','Array');
t = simOut.get('tout');         
y = simOut.get('yout');   
fprintf('tend=%6.2f  vend=%6.2fm/s\n',t(end),y(end,2));

         