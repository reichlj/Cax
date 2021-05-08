clear all; clc
keys = {'Jan', 'Feb', 'Mar', 'May'};
values = [ 372.2 368.2 197.6 178.4 ];
% create Map
rain = containers.Map('KeyType', 'char', 'ValueType', 'double')
for k = 1:length(keys)
    key = keys{k};
    value = values(k);
    rain(key) = value;
    % rain(keys{k}) = values(k);
end
fprintf('Regen im Februar %.2f\n',rain('Feb'))
myKeyType    = rain.KeyType       % char
myValueType  = rain.ValueType     % double
avg = durchschnitt1(rain)
rain('Mar') = 'unbekannt'         
