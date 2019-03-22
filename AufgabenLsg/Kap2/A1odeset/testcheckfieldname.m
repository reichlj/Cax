clear all; clc
st = odeset();

if checkfieldname(st,'RelTol') 
    disp('RelTol found')
else
    disp('RelTol not found')
end

if checkfieldname(st,'reltol') 
    disp('reltol found')
else
    disp('reltol not found')
end

if checkfieldname(st,'RelToleranz') 
    disp('RelToleranz found')
else
    disp('RelToleranz not found')
end

val = checkfieldname(3.14,'RelToleranz');
if val 
    disp('3.14 found')
else  
    disp('3.14 not found')
end