classdef mydate_v1
  properties % definiere Properties der Klasse
     year = 0;
     month = 0;
     day = 0;
  end   
  properties (GetAccess='private', SetAccess='private')
     days_of_month = [31,28,31,30,31,30,31,31,30,31,30,31];
  end   
  methods  % definiere zuerst den Konstructor der Klasse
    function obj = mydate_v1(y, m, d)
       obj.year  = y;
       obj.month = m;
       obj.day = d;
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