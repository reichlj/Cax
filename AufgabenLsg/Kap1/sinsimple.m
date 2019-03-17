function [ y ] = sinussimple( x , n)
  y = 0;
  for k=1:2:n
      y = y + (-1)^((k-1)/2) * x.^k / factorial(k);
  end
end