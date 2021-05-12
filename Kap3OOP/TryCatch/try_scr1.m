clear all; clc
x = [10,20,30,40,50,60];
while true
  idx = input('Index eingeben: ');
  if idx == 0
     break
  end
  try
     z = x(idx);
     fprintf('Wert %d\n',z)
  catch me
     fprintf('Fehler: %s\n',me.message);
     fprintf('Index zw. 1 und %d !\n',length(x));
  end
end