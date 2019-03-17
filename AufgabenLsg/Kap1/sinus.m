function [ y ] = sinus( x , n)
  if n == 0
      y = zeros(size(x));
      return
  end
  y = x;
  term = x;
  for k=3:2:n
      term = -term.*x.*x/((k-1)*k);
      y = y + term;
  end
end