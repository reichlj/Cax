function [ msem minfo mcad ] = auswertungOhneFor( pt )
  if ~isstruct(pt) 
      error('Parameter keine struct')
  else
      msem  = mean( [pt(:).semester] );
      mcad  = mean( [pt(:).cad] );
      minfo = mean( [pt(:).informatik] );
  end
end