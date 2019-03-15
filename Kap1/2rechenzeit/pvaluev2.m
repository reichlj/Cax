function y = pvaluev2( a, x )
   if ~ ( isempty(a) || isvector(a) )
      error("No valid polynom");
   end
   y = zeros(size(x));
   n = length(a);
   for k=1:n
      y = y + a(k)*x.^(n-k);
   end
end