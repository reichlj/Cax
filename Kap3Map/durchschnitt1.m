function [avg] = durchschnitt1(rainmap)
  mykeys = rainmap.keys();
  val = 0.0;
  for k=1:rainmap.Count
      key = mykeys{k};
      val = val + rainmap( key );
      %val = val + rainmap( mykeys{k} );
  end
  avg = val/rainmap.length();
end