function darst = getPolynomStringV2(a, praefix)
   darst = sprintf('%s%s',praefix,' = ');
   n=length(a);
   for k=1:n
       if ( k == 1 && n == 1 )
          term = sprintf('%.1f',a(k));
       elseif ( k == 1 && n == 2)
          term = sprintf('%.1f*x',a(k));
       elseif ( k == 1 )
          term = sprintf('%.1f*x^%d',a(k),n-k);
       elseif ( k == n-1 )
          term = sprintf('%+.1f*x',a(k));           
       elseif ( k == n )
          term = sprintf('%+.1f',a(k));           
       else
          term = sprintf('%+.1f*x^%d',a(k),n-k);           
       end
       darst = sprintf('%s%s',darst,term);
   end
end