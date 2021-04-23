classdef mytime_v3    
  properties (GetAccess = 'private', SetAccess = 'private')
    seconds = 0;
  end
  
  methods
    % definiere den Konstructor der Klasse
    function obj = mytime_v3(hour, minute, second)
       n = 3600*hour + 60* minute + second;
       if 0<=n && n<86400
          obj.seconds = n;
       else
          error('mytime_v3:invalid','invalid time')
       end
    end
        
    function obj = tick(obj,anzahl)
       if nargin == 1
          anzahl = 1;
       end
       n = obj.seconds + anzahl;
       if n >= 86400
          error('mytime_v3:timeoverflow','neuer Tag')
       else
          obj.seconds = n;
       end   
    end
    function nbr = nbr_of_seconds(obj)
       nbr = obj.seconds
    end
    function h = hour(obj)
       h = floor(obj.seconds/3600);
    end
    function m = minute(obj)
       m = floor(mod(obj.seconds,3600)/60);
    end
    function s = second(obj)
       rest = mod(obj.seconds,3600);
       s = mod(rest,60);
    end    
    function result = gleich_oder_spaeter(obj,other)
       if other.seconds >= obj.seconds
          result = true; 
       else 
          result = false; 
       end
    end    
    function time_str = gettime(obj)
       h = hour(obj);
       m = minute(obj);
       s = second(obj);
       time_str = sprintf('%02d:%02d:%02d',h,m,s);
    end

  end
end