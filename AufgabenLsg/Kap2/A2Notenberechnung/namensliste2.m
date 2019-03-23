function [ nliste ] = namensliste2( pt, note )
  if ~isstruct(pt)
     error('keine struct')
  end
  nliste = string();   % 1*1 string array mit ""
  for k=1:length(pt)
    if isscalar(pt(k).cad) && isscalar(pt(k).informatik)
       n = (pt(k).cad + pt(k).informatik)/2 ;
       if (note-1.0e-5 <= n) && (n <= note + 1.0e-5)
          if length(nliste) == 1
             nliste(1) = pt(k).name; 
          else
             nliste(end+1) = pt(k).name ;
          end
       end
    end
  end
end