function dy_dt = fkette3( t, y )

  global c1 c2 c3 c4;
  global m1 m2 m3;

  % y(1) x1(t)    y(2)  x1'(t)= v1(t)
  % y(3) x2(t)    y(4)  x2'(t)= v2(t)
  % y(5) x3(t)    y(6)  x3'(t)= v3(t)
  dy_dt = zeros(6,1);
  
  dy_dt(1,1) = y(2);       % dx1/dt = x1'(t) = v1(t)
  dy_dt(2,1) = -c1/m1*y(1) - c2/m1*(y(1)-y(3));
  
  dy_dt(3,1) = y(4);       % dx2/dt = x2'(t) = v2(t)
  dy_dt(4,1) = -c2/m2*(y(3)-y(1)) -c3/m2*(y(3)-y(5));
  
  dy_dt(5,1) = y(6);       % dx3/dt = x3'(t) = v3(t)
  dy_dt(6,1) = -c3/m3*(y(5)-y(3)) - c4/m3*y(5);
end