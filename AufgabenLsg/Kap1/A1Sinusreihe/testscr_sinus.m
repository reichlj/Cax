clear all; clc
format_x_n = '  x=%s  n=%3d\n';
formatsinus     = '    sinus     : %17.14f\n';
formatsinsimple = '    sinsimple : %17.14f\n';

disp('*** Genauigkeit : x und n ***')
x=pi/6;   
n=3;
fprintf(format_x_n,'pi/6',n)
fprintf(formatsinsimple, sinsimple(x,n))
fprintf(formatsinus, sinus(x,n))
n=5;
fprintf(format_x_n,'pi/6',n)
fprintf(formatsinsimple, sinsimple(x,n))
fprintf(formatsinus, sinus(x,n))
n=10;
fprintf(format_x_n,'pi/6',n)
fprintf(formatsinsimple, sinsimple(x,n))
fprintf(formatsinus, sinus(x,n))
n=20;
fprintf(format_x_n,'pi/6',n)
fprintf(formatsinsimple, sinsimple(x,n))
fprintf(formatsinus, sinus(x,n))

x=4*pi+pi/6;
n=30;
fprintf(format_x_n,'4*pi+pi/6',n)
fprintf(formatsinsimple, sinsimple(x,n))
fprintf(formatsinus, sinus(x,n))
n=40;
fprintf(format_x_n,'4*pi+pi/6',n)
fprintf(formatsinsimple, sinsimple(x,n))
fprintf(formatsinus, sinus(x,n))
n=50;
fprintf(format_x_n,'4*pi+pi/6',n)
fprintf(formatsinsimple, sinsimple(x,n))
fprintf(formatsinus, sinus(x,n))
n=60;
fprintf(format_x_n,'4*pi+pi/6',n)
fprintf(formatsinsimple, sinsimple(x,n))
fprintf(formatsinus, sinus(x,n))

x=8*pi+pi/6;
n=60;
fprintf(format_x_n,'8*pi+pi/6',n)
fprintf(formatsinsimple, sinsimple(x,n))
fprintf(formatsinus, sinus(x,n))
n=70;
fprintf(format_x_n,'8*pi+pi/6',n)
fprintf(formatsinsimple, sinsimple(x,n))
fprintf(formatsinus, sinus(x,n))
n=80;
fprintf(format_x_n,'8*pi+pi/6',n)
fprintf(formatsinsimple, sinsimple(x,n))
fprintf(formatsinus, sinus(x,n))
n=90;
fprintf(format_x_n,'8*pi+pi/6',n)
fprintf(formatsinsimple, sinsimple(x,n))
fprintf(formatsinus, sinus(x,n))

disp('***  Rechenzeit mit tic und toc  ***')
x= linspace(0,1,500000);
n=50;
fprintf('Anzahl der x-Werte: %d\n',length(x))
tic
ysim=sinsimple(x,n);
t = toc;
fprintf('  sinsimple: t = %.4f\n',t)
tic
y=sinus(x,n);
t = toc;
fprintf('  sinus    : t = %.4f\n',t)
tic
yexakt=sin(x);
t = toc;
fprintf('  sin      : t = %.4f\n',t)

disp('***  Rechenzeit mit timeit  ***')
fprintf('  sinsimple: t = %.4f\n',timeit(@() sinsimple(x,n)))
fprintf('  sinus    : t = %.4f\n',timeit(@() sinus(x,n)))
fprintf('  sin      : t = %.4f\n',timeit(@() sin(x)))