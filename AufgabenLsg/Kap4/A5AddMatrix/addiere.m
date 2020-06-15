disp('Addiere zwei 2*3-Matrizen')
A = [ 2  3  4;  
      5  6  7];
B = [20 30 40; 
     50 60 70];
C = mexMatrixAdd(A,B);
DC = C - (A+B);
diff = max(abs(DC(:)));
fprintf('Max diff=%e\n',diff) 

disp('Addiere zwei 1000*1000-Matrizen')
A = rand(1000);  B = rand(1000);
C = mexMatrixAdd(A,B);
DC = C - (A+B);
diff = max(abs(DC(:)));
fprintf('Max diff=%e\n',diff) 

