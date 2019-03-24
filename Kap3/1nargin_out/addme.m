function c = addme(a,b)
  n = nargin();  % n = nargin 
  switch n
     case 2
        c = a + b;
     case 1
        c = a + a;
     otherwise
        c = 0;
  end
end