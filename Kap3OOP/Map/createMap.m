mymap = containers.Map()
mymap('A') = 100;
mymap
mymap.keys()
mymap.values()
%mymap(25) = 120; % Fehler
mymap1 = containers.Map('a',34)

months = {'Jan','Feb','Mar','Apr'};  % cell array - kein Vektor
rainfall = [327.2 368.2 197.6 178.4];
M = containers.Map(months,rainfall)
M.keys()
M.values()

months = {'Jan','Feb','Mar','Apr'};  % cell array - kein Vektor
rainfall = {327.2, 368.2, 197.6, 'otto'};
MA = containers.Map(months,rainfall)
MA.keys()
MA.values()

months = {'Jan','Feb','Mar','Apr','May'};
rainfall = {327.2, 368.2, 197.6, 178.4,'otto'};
MM1 = containers.Map('KeyType','char','ValueType','any')
%MM = containers.Map(months,rainfall)
MM1(months) = rainfall
MM1.keys()