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
     msg = sprintf('Wert nicht zw. 1 und %d; %s',...
                   length(x),me.message);
     ex = MException('try_scr4:Indexviolation',msg);
     ex.throw()
  end
end