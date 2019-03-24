function [s, varargout] = mysize(a)
   nout = nargout();
   if nout <= 1
       % varargout = {};
       varargout = cell(0,0);
   else
       varargout = cell(1,nout-1);
   end
   s = size(a);
   for k=1:min(length(s),nout)
       varargout{k} = s(k);
   end
end