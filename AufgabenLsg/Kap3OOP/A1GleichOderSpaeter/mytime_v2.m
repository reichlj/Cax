classdef mytime_v2    
  properties (GetAccess = 'public', SetAccess = 'private')
    second = 0;
    minute = 0;
    hour = 0;
  end
    
  methods
    function obj = mytime_v2(hour, minute, second)
       obj = set_hour(obj, hour);
       obj = set_minute(obj, minute);
       obj = set_second(obj, second);
    end
    
    function obj = set_hour(obj, hour)
       if hour < 0 || hour > 23
          error('mytime_v2:houroverflow','hour ungültig')
       else
          obj.hour = hour;
       end
    end
    
    function obj = set_minute(obj, minute)
       if minute < 0 || minute > 59
          error('mytime_v2:minuteoverflow','minute ungültig')
       else
          obj.minute = minute;
       end
    end
    
    function obj = set_second(obj, second)
       if second < 0 || second > 59
          error('mytime_v2:secondoverflow','second ungültig')
       else
          obj.second = second;
       end
    end
    
    function obj = tick(obj)
       if obj.second == 59
          % obj.second = 0;
          obj = set_second(obj, 0);
          if obj.minute == 59
             obj = set_minute(obj, 0);           
             if obj.hour == 23
                error('mytime_v2:timeoverflow','neuer Tag')
             else
                obj = set_hour(obj, obj.hour + 1);                            
             end
          else 
             obj = set_minute(obj, obj.minute + 1);           
          end
       else
          obj = set_second(obj, obj.second + 1);                      
       end   
    end
    
    function nbr = nbr_of_seconds(obj)
       nbr = 3600*obj.hour + 60*obj.minute + obj.second;
    end
    
    function result = gleich_oder_spaeter(obj,other)
       obj_n = nbr_of_seconds(obj);
       other_n = nbr_of_seconds(other);
       if other_n >= obj_n
          result = true; 
       else
          result = false;
       end
    end

  end
end