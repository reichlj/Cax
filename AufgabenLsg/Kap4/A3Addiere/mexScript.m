mex -output Addiere AddiereWrapper.c addiereC.c
c = Addiere(3,4)
mex -output berechne1 A3a_addiereWrapper.c A3a_addiere.c
d = berechne1(4,3,5)
mex -output berechne2 A3b_addiereWrapper.c A3b_addiere.c A3b_sub.c
[summe, diff] = berechne2(4,3)
mex -output berechne3 A3c_addiereWrapper.c A3c_add_sub.c
[summe2, diff2] = berechne3(4,3)