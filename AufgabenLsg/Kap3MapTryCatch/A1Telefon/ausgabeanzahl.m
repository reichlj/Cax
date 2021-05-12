function ausgabeanzahl(name_2_anzahl_map)

fprintf('     Name       Anzahl\n')

namen = name_2_anzahl_map.keys();
for k=1:length(namen)
    name = namen{k};
    count = name_2_anzahl_map(name);
    fprintf('  %-10s %8d\n',name,count)
end
fprintf('---------------------\n')

end

