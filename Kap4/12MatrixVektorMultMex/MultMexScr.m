disp('2*3')
x =[2;4;6];
A = [1,2,3; 10,20,30];
y = MultMex(A,x)
difmax=max(abs(y-A*x))

disp('2*4')
B = [1,2,3,4; 10,20,30,40];
x4=[2;4;6;8];
y = MultMex(B,x4)
difmax=max(abs(y-B*x4))

disp('10*5')
C = rand(10,5);
x = rand(5,1);
y = MultMex(C,x)
difmax=max(abs(y-C*x))
