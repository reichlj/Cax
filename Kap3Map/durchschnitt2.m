function [avg] = durchschnitt2(rainmap)
  myvalues = rainmap.values();
  val = 0.0;
  for k=1:rainmap.Count
      val = val + myvalues{k};
  end
  avg = val/rainmap.length();
end