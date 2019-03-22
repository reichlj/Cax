function [ nliste ] = namensliste( pt, note )

  if ~isstruct(pt)
     error('keine struct')
  end
  nliste = {};   % leeres Cell-Array
  for k=1:length(pt)
    if isscalar(pt(k).cad) && isscalar(pt(k).informatik)
       n = (pt(k).cad + pt(k).informatik)/2 ;
       if (note-1.0e-5 <= n) && (n <= note + 1.0e-5)
          % Notenschnitt fällt in Notenbereich
          % addiere den namen - vermeide n == note
          nliste(end+1) = { pt(k).name };
       end
    end
  end
end