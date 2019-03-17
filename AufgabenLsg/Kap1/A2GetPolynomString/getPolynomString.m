function darst = getPolynomString(a, praefix)
   ls = sprintf('%s%s', praefix,' = ');
   n=length(a);
   if ( n == 1 )
      rs = sprintf('%.1f', a(1));
   elseif ( n == 2 )
      rs = sprintf('%.1f*x%+.1f',a(1),a(2));
   else 
      rs = '';
      for k=1:n
         if ( k == 1 )
            term = sprintf('%.1f*x^%d', a(k), n-k);
         elseif ( k == n-1 )
            term = sprintf('%+.1f*x', a(k));           
         elseif ( k == n )
            term = sprintf('%+.1f', a(k));           
         else
            term = sprintf('%+.1f*x^%d', a(k), n-k);
         end
         rs = sprintf('%s%s', rs, term);
      end
   end
   darst = sprintf('%s%s', ls, rs);
end
