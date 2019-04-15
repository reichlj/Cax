mex  -output AddScalar  AddScalarWrapper.c  myAdd.lib
mex  -output AddMatrix  AddMatrixWrapper.c  myUtility.c  myAdd.lib  
mex  -output MyDot  DotWrapper.c  myUtility.c  myProduct.lib 
mex  -output MatrixMult  MatrixMultWrapper.c  myUtility.c  myProduct.lib  
