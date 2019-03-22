function [ note ] = bestegesamtnote( pt )
  if ~isstruct(pt)   
     error('keine struct')
  end
  note = NaN;
  for k=1:length(pt)
     if isscalar(pt(k).cad) && isscalar(pt(k).informatik)
        n = pt(k).cad + pt(k).informatik;
        if n < note || isnan(note)
           note = n;
        end
     end
  end
  note = note/2;
end