function pvaluev2Test()
  x=[2.3, 3.4];
  checkPvalue([1, -4, 0, 7],x)
  checkPvalue([1; -4; 0; 7],x)
  checkPvalue([1, -4, 0, 7],[x;1.2, 1.3;3.1, 3.3])
  checkPvalue([],x)
  checkPvalue([0],x)
  checkPvalue([1, -4, 0, 7],[])
  checkPvalue([],[])  
  
end

function checkPvalue(a,x)
  disp('**************************')
  disp(strcat('a=',mat2str(a),' x=',mat2str(x)))
  pvaluev2Erg= pvaluev2(a,x)
  polyvalErg = polyval(a,x)
end