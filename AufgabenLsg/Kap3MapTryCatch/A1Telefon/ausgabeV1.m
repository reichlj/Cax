function ausgabeV1(nummer_2_name)
  nummern = nummer_2_name.keys();
  fprintf('Telefonnummer    Name\n')
  for k=1:nummer_2_name.Count
     nummer = nummern{k};
     name = nummer_2_name(nummer);
     fprintf('%12s    %-6s\n',nummer,name)
  end
  fprintf('---------------------\n')
end