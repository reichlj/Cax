function [dy_dt] = a5TM3K52_A2_dgl3(t,y)
  global m c g H h
  dy_dt(1,1) = y(2);
  dy_dt(2,1) = -(c*h^2-g*m*H)/(m*H^2)*y(1)...
               +(4*c*h^2-g*m*H)/(6*m*H^2)*y(1)^3;
end