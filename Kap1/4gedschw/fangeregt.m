function [dy_dt] = fangeregt( t, y )
   global w0 d F w;
   dy_dt(1,1) = y(2);
   dy_dt(2,1) = -2*d*y(2)-w0*w0*y(1) + F*cos(w*t);
end
