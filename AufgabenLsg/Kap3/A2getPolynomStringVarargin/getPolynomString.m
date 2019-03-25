function darst = getPolynomString(p,varargin)
   
   if nargin > 3
      error('Too many parameters')
   elseif nargin == 3
       y = varargin{1};
       varName = varargin{2};
   elseif nargin == 2
       y = varargin{1};
       varName = 'x';
   elseif nargin == 1
       y = 'y';
       varName = 'x';       
   else
      error('Polynom required')
   end
   
   validateattributes(p, {'numeric'}, {'vector','finite'})  
   validateattributes(y, {'char'}, {'nrows',1})  
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