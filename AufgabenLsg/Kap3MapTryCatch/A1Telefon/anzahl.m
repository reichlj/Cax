function name_2_anzahl = anzahl(nummer_2_name)

name_2_anzahl = containers.Map(...
         'KeyType','char','ValueType','double');
values = nummer_2_name.values();
for k=1:length(values)
    name = values{k};
    if name_2_anzahl.isKey(name)
        name_2_anzahl(name) = name_2_anzahl(name) + 1;
    else
        name_2_anzahl(name) = 1;
    end    
end
end