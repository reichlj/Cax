function y = pvaluev1( a, x )
   n = length(a);
   y = 0;
   for k=1:n
      y = y + a(k)*x.^(n-k);
   end
end