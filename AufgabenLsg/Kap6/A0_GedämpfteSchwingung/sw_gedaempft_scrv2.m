clear all
simOut = sim('swGedaempft')
t = simOut.get('tout');         
y = simOut.get('yout');  
vsum = 0.0;
index = 1;
while t(index) < 5.0
    vsum = vsum + y(index,2);
    index = index + 1;
end
vd= vsum/index
fprintf('Durchschnittsgeschwindigkeit vd=%8.4f\n',vd);

         