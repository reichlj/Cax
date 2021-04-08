function roots = quadraticSolver(a,b,c)
 if ~isa(a,'numeric') || ~isa(b,'numeric') || ~isa(c,'numeric')
  error('quadraticSolver:InputMustBeNumeric','Coefficients must be numeric.');
 end
 if a == 0.0
  error('quadraticSolver:aMustNotBeZero','a must not be zero.');
 end
 roots(1) = (-b + sqrt(b^2 - 4*a*c)) / (2*a);
 roots(2) = (-b - sqrt(b^2 - 4*a*c)) / (2*a);
end

