function [dy_dt] = a5TM3K52_A2_dgl(t,y)
  global m c g H h
  dy_dt(1,1) = y(2);
  dy_dt(2,1) = -(c*h^2)/(m*H^2)*sin(y(1))*cos(y(1))...
               +g/H*sin(y(1));
end