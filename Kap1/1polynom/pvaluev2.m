function y = pvaluev2( a, x )
   if ~isvector(a)|| (isvector(a) && isempty(a))
      error("No valid polynom");
   end
   y = zeros(size(x));
   n = length(a);
   for k=1:n
      y = y + a(k)*x.^(n-k);
   end
end