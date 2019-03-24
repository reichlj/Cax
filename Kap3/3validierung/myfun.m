function [x,y,z] = myfun(a,b,c,varargin)
 % mindestens 4 Eingabeparameter 
 % 1 bis 3 Rückgabeparameter 
 narginchk(4,Inf);
 nargoutchk(1,3);
 validateattributes(a, {'double'}, {'positive', '2d'});
 % Werte von a müssen zwischen 10 und 50 liegen
 validateattributes(a, {'double'}, {'>=',10, '<=',50});
 validateattributes(b, {'numeric'}, {'numel',100,'ncols',10});
 validateattributes(c, {'char'}, {'nonempty'});
 if strcmp(c,'hallo')
     error('String ''hallo'' nicht erlaubt!');
 end
 x=1; y=2; z=3;
end