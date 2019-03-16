function tabelle(fun, werte)
  for k=1:length(werte)
      x = werte(k);
      y = fun(x);
      fprintf('x=%.4f  y=%.5f\n',x,y)
      %fprintf('x=%.4f  y=%.5f\n',werte(k),fun(werte(k)))
  end
end