classdef mydate_v2
  properties (GetAccess='public', SetAccess='private')
     year = 0;
     month = 0;
     day = 0;
  end   
  properties (GetAccess='private', SetAccess='private')
     days_of_month = [31,28,31,30,31,30,31,31,30,31,30,31];
  end   
  methods  % definiere zuerst den Konstructor der Klasse
    function obj = mydate_v2(y, m, d)
       obj.year  = y;
       if m<1 || m>12
           error('mydate_v2:invalidmonth','Invalid month')
       else
           obj.month = m;       
       end
       days = obj.get_days_of_month();      
       if d<1 || d>days
           error('mydate_v2:invalidday','Invalid day')
       else
           obj.day = d;       
       end
    end    
    function obj = set_year(obj,year)
        obj.year = year; 
        days = obj.get_days_of_month();
        if obj.day > days
           error('mydate_v2:set_year','Invalid day for new year')        
        end
    end
    function obj = set_month(obj,month)
        if month<1 || month> 12
           error('mydate_v2:set_month','Invalid month')        
        end
        obj.month = month; 
        days = obj.get_days_of_month();
        if obj.day > days
           error('mydate_v2:set_month','Invalid day for new month')        
        end
    end
    function obj = set_day(obj,day)
        days = obj.get_days_of_month();
        if day<0 || day>days
           error('mydate_v2:set_day','Invalid new day')
        else
            obj.day = day;
        end
    end
    function obj = tick(obj)   
       next_day = obj.day + 1;
       day_max = obj.get_days_of_month();
       if next_day > day_max  % Überlauf Monat
          next_month = obj.month + 1;
          if next_month > 12  % Überlauf Jahr
             obj.day = 1;    % 1.1. nächstes Jahr
             obj.month = 1;
             obj.year = obj.year + 1;
          else
             obj.day = 1;    % erster im nächsten Monat
             obj.month = next_month;
          end
       else
          obj.day = next_day; % nächster Tag, gleicher Monat
       end   
    end
  end
  methods (Access='private')   % private Hilfsmethoden
    function days = get_days_of_month(obj)
       if obj.month == 2
          days = obj.days_of_month(2);
          if obj.is_leap_year()
             days = days + 1;
          end
       else
          days = obj.days_of_month(obj.month);
       end
    end
    function result = is_leap_year(obj)
       if mod(obj.year,400)==0
          result = true;
       elseif mod(obj.year,100)==0
          result = false;
       elseif mod(obj.year,4)==0
          result = true;
       else
          result = false;
       end
    end
  end   
end