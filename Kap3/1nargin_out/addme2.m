function [value, absvalue] = addme2(a,b) 
  switch nargin
     case 2
        value = a + b;
     case 1
        value = a + a;
     otherwise
        value = 0;
  end
  
  disp('nargout')
  disp(nargout)
  if nargout > 1
     absvalue = abs(value);
  end
end