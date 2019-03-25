function darst = getPolynomString(p,y,varName)

   if nargin < 3
       varName = 'x';
       if nargin < 2
           y = 'y';
           if nargin < 1
               error('Polynom required')
           end
       end
   end
   validateattributes(p, {'numeric'}, {'vector','finite'})  
   validateattributes(y, {'char'}, {'vector'})  
   validateattributes(varName, {'char'}, {'nrows',1})   

   ls = sprintf('%s%s', y, ' = ');
   n=length(p);
   if ( n == 1 )
      rs = sprintf('%.1f', p(1));
   elseif ( n == 2 )
      rs = sprintf('%.1f*%s%+.1f', p(1), varName, p(2));
   else 
      rs = '';
      for k=1:n
         if ( k == 1 )
            term = sprintf('%.1f*%s^%d', p(k),varName, n-k);
         elseif ( k == n-1 )
            term = sprintf('%+.1f*%s', p(k), varName);           
         elseif ( k == n )
            term = sprintf('%+.1f', p(k));           
         else
            term = sprintf('%+.1f*%s^%d', p(k), varName, n-k);
         end
         rs = sprintf('%s%s', rs, term);
      end
   end
   darst = sprintf('%s%s', ls, rs);
end