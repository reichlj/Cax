function [ nbr ] = getInputData( message, default )
  msg = sprintf(message,default);
  nbr = input(msg);
  if isempty(nbr)
     nbr = default;
  end
end