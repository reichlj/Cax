function sinusTest()
  clear all; clc
  disp('*** Genauigkeit: x und n ***')
  sinsimple_sinusTest(pi/6,'pi/6',3)
  sinsimple_sinusTest(pi/6,'pi/6',5)
  sinsimple_sinusTest(pi/6,'pi/6',10)
  sinsimple_sinusTest(pi/6,'pi/6',20)

  sinsimple_sinusTest(4*pi+pi/6,'4*pi+pi/6',30)
  sinsimple_sinusTest(4*pi+pi/6,'4*pi+pi/6',40)
  sinsimple_sinusTest(4*pi+pi/6,'4*pi+pi/6',50)
  sinsimple_sinusTest(4*pi+pi/6,'4*pi+pi/6',60)

  sinsimple_sinusTest(8*pi+pi/6,'8*pi+pi/6',60)
  sinsimple_sinusTest(8*pi+pi/6,'8*pi+pi/6',70)
  sinsimple_sinusTest(8*pi+pi/6,'8*pi+pi/6',80)
  sinsimple_sinusTest(8*pi+pi/6,'8*pi+pi/6',90)

  disp('***  Rechenzeit mit tic und toc  ***')
  x= linspace(0,1,500000);
  n=50;
  fprintf('Anzahl der x-Werte: %d\n',length(x))
  tic
  ysim=sinsimple(x,n);
  t = toc;
  fprintf('  sinsimple: t=%.4f\n',t)
  tic
  y=sinus(x,n);
  t = toc;
  fprintf('  sinus    : t=%.4f\n',t)
  tic
  yexakt=sin(x);
  t = toc;
  fprintf('  sin      : t=%.4f\n',t)
  
  disp('***  Rechenzeit mit timeit  ***')
  fprintf('  sinsimple: t= %.4f\n',timeit(@() sinsimple(x,n)))
  fprintf('  sinus    : t= %.4f\n',timeit(@() sinus(x,n)))
  fprintf('  sin      : t= %.4f\n',timeit(@() sin(x)))
end

function sinsimple_sinusTest(x,xstr,n)
  fprintf('  x=%s  n=%3d\n',xstr,n)
  fprintf('    sinsimple   : %17.14f\n', sinsimple(x,n))
  fprintf('    sinus       : %17.14f\n', sinus(x,n))
end