%
a = 3;
b = 4;
x = [  2  3  4 ];
y = [ 12 13 14 ];
%% Test 1 : two arguments - scalars
c = addme(a,b);
assert( c == 7 )
assert( addme(a,b) == 7 )
assert( addme(a,b) == 8, 'addme(3,4) failed')

%% Test 2 : two arguments - 1d-arrays
% assert( addme(x,y) == x+y, 'addme for 1d-arrays failed')
assert( isequal(addme(x,y), x+y), 'addme for 1d-arrays failed')
%% Test 3 : one arguments - scalar
assert( addme(a) == 6, 'addme(3) failed')
%% Test 4 : one argument - 1d-array
assert(isequal(addme(x), 2*x), 'addme(1d-array) failed')
%% Test 5 : no arguments
assert(addme() == 0, 'test using no arguments failed')