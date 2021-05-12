function [x1,x2] = qsolve(a,b,c)
  y = b*b-4*a*c;
  if y < 0
     msg = sprintf('Diskriminante negativ: %f',y);
     ex = MException('qsolve:DiskriminanteNegativ',msg);
     ex.throw();
     %throw(ex);
  end
  y = sqrt(y);
  x1 = 0.5*( -b + y )/a;
  x2 = 0.5*( -b - y )/a;
end

