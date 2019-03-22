function [ msem minfo mcad ] = mittelwert( pt )
  if ~isstruct(pt)
     error('keine struct')
  else
     sumsemester = 0;
     anzahl = 0;
     for k=1:length(pt)
        if isscalar(pt(k).semester)
           sumsemester = sumsemester + pt(k).semester;
           anzahl = anzahl + 1;
        end
     end
     if anzahl ~= 0
        msem = sumsemester/anzahl;
     else
        msem = NaN;
     end
     
     suminfo = 0;
     anzahl = 0;
     for k=1:length(pt)
        if isscalar(pt(k).informatik)
           suminfo = suminfo + pt(k).informatik;
           anzahl = anzahl + 1;
        end
     end
     if anzahl ~= 0
        minfo = suminfo/anzahl;
     else
        minfo = NaN;
     end
     
     sumcad = 0;
     anzahl = 0;
     for k=1:length(pt)
        if isscalar(pt(k).cad)
           sumcad = sumcad + pt(k).cad;
           anzahl = anzahl + 1;
        end
     end
     if anzahl ~= 0
        mcad = sumcad/anzahl;
     else
        mcad = NaN;
     end
  end
end
