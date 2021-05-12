clear all; clc
nummern = [30004,30012,30088,45013,45026,...
        45078,55001,55003,55005]; 
namen = {'Bauer','Huber','Schmidt','Schmidt','Meyer',...
          'Schmidt','Meier','Meyer','Maier'};    
% create Map:  Nummer --> Namen
nummer_2_name = containers.Map(nummern,namen);
ausgabeV2(nummer_2_name)