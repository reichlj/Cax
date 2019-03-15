function tabelle(fun, werte)
  for k=1:length(werte)
      fprintf('x=%.4f  y=%.5f\n',werte(k),fun(werte(k)))
  end
end