function [ pt ] = umwandlung( ca )
% pt ist ein n*4-CellArray
% jede Zeile enthält die Daten für einen Teilnehmer, z.B.
%   ca = {
%      {'Schmidt'},{'semester',4},{'informatik',1.7},{'cad',2.0};
%      {'Meier'},{'informatik',2.3},{'semester',7},{'cad',2.3};       
%      {'semester',2},{'Schmidt'},{'cad',1.3},{'informatik',2.7}
%   }

n = size(ca,1);
pt(n) = struct('name',[],'semester',[],... 
                     'informatik',[],'cad', [] );
for k=1:n
  for s=1:4
    % Inhalt von pt(k,s) ist ein cell-array
    content = ca{k,s}; % content ist cell-array - 1*1 oder 1*2
    if length(content) == 1
       % content ist 1*1 cell-array, enthält einen String {'Schmidt'}
       pt(k).name = content{1};
    else 
       % content ist 1*2 cell-array
       % {'semester', 4}  {'informatik', 1.7}  {'cad', 2.0}
       fieldname = content{1};      % Feldname
       value = content{2};          % Value
       if strcmp(fieldname,'semester') 
          pt(k).semester = value;
       elseif isequal(fieldname,'informatik')
          pt(k).informatik = value;
       elseif strcmp(fieldname,'cad')
          pt(k).cad = value;
       end
    end
  end
end

end