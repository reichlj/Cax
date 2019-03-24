function mom = mymoment(n,varargin)
   anzahl = length(varargin);
   if anzahl == 0
       mom = [];
       return
   end
   mom = 0;
   for k=1:anzahl
       mom = mom + varargin{k}^n;
   end
   mom = mom/anzahl;
end

