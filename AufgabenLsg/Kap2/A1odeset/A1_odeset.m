clear all; clc
st = odeset();
namen = fieldnames(st);

disp('Anzahl der Feldnamen : ')
disp(length(namen))

disp('Feldnamen mit for : ')
for k=1:length(namen)
    fprintf('  k=%3d : %s\n',k,namen{k})
end

disp('Feldnamen mit while : ')
k=1;
while k <= length(namen)
    fprintf('  k=%3d : %s\n',k,namen{k})
    k = k + 1;
end

minindex = 1;
maxindex = 1;
for k=2:length(namen)
    if length(namen{k}) < length(namen{minindex})
        minindex = k;
    end
    if length(namen{k}) > length(namen{maxindex})
        maxindex = k;
    end
end
fprintf('kürzester Name: %s\n',namen{minindex})
fprintf('längster Name : %s\n',namen{maxindex})
