clear all; clc
[x1,x2] = qsolve(2,5,3);
disp([x1,x2])
try
   [x1,x2] = qsolve(2,1,3);
   disp([x1,x2])
catch me
   fprintf('%s\n',me.message)
end
disp('Ohne try-catch: ')
[x1,x2] = qsolve(2,1,3);
disp([x1,x2])


