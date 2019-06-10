AF = 0.5;
AFS = 30;
t = 0:0.1:60;

t1 = 10;
DT1 = 15;
DT2 = 30;
y1 = gerade(t,DT1,t1,AF,AFS);
y2 = gerade(t,DT2,t1,AF,AFS);
y3 = exponential(t,0.2*DT1,t1,AF,AFS);
y4 = exponential(t,0.2*DT2,t1,AF,AFS);

plot(t,y1, t,y2,t,y3, t,y4,'LINEWIDTH',2)
ylim([0,AFS+10])

function y = gerade(t,dt,t1,AF,AFS)
  y = zeros(length(t),1)
  for k= 1:length(t)
     if t(k) < t1
        y(k) = AF;
     elseif t(k) < t1+dt
        y(k) = AF + (AFS-AF)*(t(k)-t1)/dt;
     else
        y(k) = AFS;
     end
  end
end

function y = exponential(t,dt,t1,AF,AFS)
  y = zeros(length(t),1)
  for k= 1:length(t)
     if t(k) < t1
        y(k) = AF;
     else 
        y(k) = AF + (AFS-AF)*( 1 - exp( -(t(k)-t1)/dt ) );
     end
  end
end