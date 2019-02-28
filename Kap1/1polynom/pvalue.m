function y = pvalue( a, x )
   n = length(a);
   y = 0;
   for k=1:n
      y = y + a(k)*x.^(n-k);
   end
end