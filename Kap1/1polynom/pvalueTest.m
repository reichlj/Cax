function pvalueTest()
  x=[2.3, 3.4];
  checkPvalue([1, -4, 0, 7],x)
  checkPvalue([],x)
  checkPvalue([0],x)
  checkPvalue([1, -4, 0, 7],[])
  checkPvalue([],[])  
end

function checkPvalue(a,x)
  disp('**************************')
  disp(strcat('a=',mat2str(a),' x=',mat2str(x)))
  pvalueErg= pvalue(a,x)
  polyvalErg = polyval(a,x)
end