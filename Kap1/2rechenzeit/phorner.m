function [ y ] = phorner( a, x )
  if ~isvector(a)|| (isvector(a) && isempty(a))
      error("No valid polynom");
  end
  y = zeros(size(x));
  nc = length(a);
  if nc > 0
     y(:) = a(1);
  end
  for k=2:nc
      y = x.*y + a(k);
  end
end
