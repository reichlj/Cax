clear all; clc
strnamen = string(fieldnames(odeset()));

disp('Anzahl der Feldnamen : ')
disp(length(strnamen))

disp('Feldnamen mit for - string arrays')
for k=1:length(strnamen)
    fprintf('  k=%3d : %s\n',k,strnamen(k))
end

disp('Feldnamen mit while - string arrays')
k=1;
while k <= length(strnamen)
    fprintf('  k=%3d : %s\n',k,strnamen(k))
    k = k + 1;
end

disp('Verwende strings:')
minindex = 1;
maxindex = 1;
for k=2:length(strnamen)
    if strlength(strnamen(k)) < strlength(strnamen(minindex))
        minindex = k;
    end
    if strlength(strnamen(k)) > strlength(strnamen(maxindex))
        maxindex = k;
    end
end
fprintf('  kürzester Name: %s\n',strnamen(minindex))
fprintf('  längster Name : %s\n',strnamen(maxindex))

[nmin2,minindex2] = min(strlength(strnamen))
fprintf('  kürzester Name: %s\n',strnamen(minindex2))
[nmax2,maxindex2] = max(strlength(strnamen))
fprintf('  längster Name : %s\n',strnamen(maxindex2))

