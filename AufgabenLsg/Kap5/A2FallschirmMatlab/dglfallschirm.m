function dy_dt = dglfallschirm( t, y )
  global cw AS AFS rho m h1 g;
  % y(1) H�he h
  % y(2) Geschwindigkeit v
  dy_dt = zeros(2,1);

  dy_dt(1,1) = y(2);       % dh/dt = v(t)
  if y(1) > h1
    dy_dt(2,1) = cw*AS*rho/(2*m)*y(2)*y(2) - g;
  else
    dy_dt(2,1) = cw*AFS*rho/(2*m)*y(2)*y(2) - g;
  end
end