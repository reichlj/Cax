function mytime = mytime_struct(hour,minute,second)
  mytime = struct('hour',0,'minute',0, 'second',0);
  if nargin > 0
    mytime.hour = hour;
  end
  if nargin > 1
    mytime.minute = minute;
  end
  if nargin > 2
    mytime.second = second;
  end
end