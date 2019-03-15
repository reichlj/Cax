function dy_dt = fkette2( t, y )
global m1 m2 c1 c2 c3;
  dy_dt(1,1) = y(2);
  dy_dt(2,1) = -c1/m1*y(1)-c2/m1*(y(1)-y(3));
  dy_dt(3,1) = y(4);
  dy_dt(4,1) = -c2/m2*(y(3)-y(1))-c3/m2*y(3);
end