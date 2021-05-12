function ausgabe(rainmap)
  mykeys = rainmap.keys();
  fprintf(' Month    Rain\n')
  fprintf('---------------\n')
  for k=1:rainmap.Count
      key = mykeys{k};
      value = rainmap(key);
      fprintf('%5s  %7.2f\n',key,value)
  end
  fprintf('---------------\n')
end