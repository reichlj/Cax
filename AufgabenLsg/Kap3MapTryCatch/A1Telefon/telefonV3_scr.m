clear all; clc
nummern = [30004,30012,30088,45013,45026,...
           45078,55001,55003,55005]; 
namen = {'Bauer','Huber','Schmidt','Schmidt','Meyer',...
          'Schmidt','Meier','Meyer','Maier'};      
% nummern_2_name:  Nummer (zahl) --> Name (char array)
nummern_2_name = containers.Map('KeyType','double','ValueType','char');
for k=1:length(nummern)
    nummern_2_name(nummern(k)) = namen{k};
end
ausgabeV2(nummern_2_name)

name_2_anzahl = anzahl(nummern_2_name);
ausgabeanzahl(name_2_anzahl);