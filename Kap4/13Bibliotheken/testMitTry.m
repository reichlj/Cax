try
   z = MyDot(rand(5,1),rand(6,1));
   disp('Kein Fehler beim Aufruf von MyDot aufgetreten!');
catch E
   disp(sprintf('1 Fehlermeldung von MyDot: %s', E.message))
   disp(sprintf('  Datei: %s', E.stack.file)) 
   disp(sprintf('  Dateiname: %s', E.stack.name)) 
   disp(sprintf('  Zeile: %d', E.stack.line)) 
end
disp('Ende')