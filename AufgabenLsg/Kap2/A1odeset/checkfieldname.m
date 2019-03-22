function [ found ] = checkfieldname( structVar, expected )
   found = false;
   if ~isstruct(structVar)
      return
   end
   namen = fieldnames(structVar);
   for k=1:length(namen)
       % use case-insensitive text comparison
       % if strcmpi(namen{k}, namestr)
       equal = strcmpi(namen{k}, expected);
       if equal
          found = true;
          return
       end
   end
end