function [ found ] = checkfieldname2( structVar, expected )
   found = false;
   if ~isstruct(structVar)
      return
   end
   namen = string(fieldnames(structVar));
   for k=1:length(namen)
       if strcmpi(namen(k), expected)
          found = true;
          return
       end
   end
end