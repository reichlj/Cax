% Regen
% Jan -> 372.2
% Feb -> 368.2
% Mar -> 197.6
% May -> 178.4
rain_array = [327.2 368.2 197.6 178.4];
fprintf('rain in Februar %.2f\n',rain_array(2))


months = {'Jan','Feb','Mar','May'};  % cell array - kein Vektor
rainfall = [327.2 368.2 197.6 178.4];
rain_map = containers.Map(months,rainfall);
fprintf('rain in Februar %.2f\n',rain_map('Feb'))
