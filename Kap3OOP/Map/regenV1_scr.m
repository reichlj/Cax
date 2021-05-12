clear all; clc
% create empty Map
rain = containers.Map();
% add entries - add key-value-pairs
rain('Jan') = 372.2; 
rain('Feb') = 368.2;
rain('Mar') = 197.6;  
rain('May') = 178.4;
fprintf('Regen im Februar %.2f\n',rain('Feb'))
rain
myKeyType= rain.KeyType         % char
myValueType =rain.ValueType     % any
mycount = rain.Count            % uint64
mylength = rain.length          % double
rain('Apr') = 'unbekannt'
rain('Apr') = struct()
rain.remove('Apr') %alternativ remove(rain,'Apr')
%rain_v1(6) = 341
s = rain('Jan') + rain('Feb') 
    + rain('Mar') + rain('May');
avg = s/4
avg1 = durchschnitt1(rain)
avg2 = durchschnitt2(rain)
ausgabe(rain)