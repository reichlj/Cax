function [ pt ] = umwandlungnested( ca )
% pt ist ein n*4-CellArray
% jede Zeile enthält die Daten für einen Teilnehmer
%   ptCellArray = {
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
    str = ca{k,s}{1,1};  % stets ein string array
    if strcmp(str,'semester') 
        pt(k).semester = ca{k,s}{1,2};
    elseif strcmp(str,'informatik')
        pt(k).informatik = ca{k,s}{1,2};
    elseif strcmp(str,'cad')
        pt(k).cad = ca{k,s}{1,2};
    else 
        pt(k).name = str;
    end
  end
end