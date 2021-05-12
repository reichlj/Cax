clear all; clc
keys = {'Jan', 'Feb', 'Mar', 'May'};
values = { 372.2 368.2 197.6 178.4 };
% create Map
rain = containers.Map(keys,values);
rain1 = containers.Map(keys,values,'UniformValues',false);
fprintf('Regen im Februar %.2f\n',rain('Feb'))
myKeyType    = rain.KeyType       % char
myValueType  = rain.ValueType     % double
myValueType1 = rain1.ValueType    % any
avg = durchschnitt1(rain)
avg1 = durchschnitt2(rain1)
%rain('Mar') = 'unbekannt'         
rain1('Mar') = 'unbekannt'         
avg = durchschnitt1(rain)
avg1 = durchschnitt2(rain1)
