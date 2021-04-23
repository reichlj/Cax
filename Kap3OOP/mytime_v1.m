classdef mytime_v1
  properties % definiere Properties der Klasse
     second = 0;
     minute = 0;
     hour = 0;
  end   
  methods  % definiere zuerst den Konstructor der Klasse
     function obj = mytime_v1(h, m, s)
       obj.hour   = h;
       obj.minute = m;
       obj.second = s;
     end    
     function obj = tick(obj)   
       obj.second = obj.second + 1;
       if obj.second > 59
          obj.second = 0;
          obj.minute = obj.minute + 1;
          if obj.minute > 59
             obj.minute = 0;
             obj.hour = obj.hour + 1;
             if obj.hour > 23
                error('mytime_v1:timeoverflow','neuer Tag')
             end
          end
       end   
     end
     function nbr = nbr_of_seconds(obj)  % Methode
       nbr = 3600*obj.hour + 60*obj.minute + obj.second;
     end
  end
end