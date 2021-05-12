clear all; clc
% create Map:  Nummer (char array) --> Namen (char array)
nummer_2_name = containers.Map();
% add entries - add key-value-pairs
nummer_2_name('30004')='Bauer';   nummer_2_name('30012')='Huber'; 
nummer_2_name('30088')='Schmidt'; nummer_2_name('45013')='Schmidt'; 
nummer_2_name('45026')='Meyer';   nummer_2_name('45078')='Schmidt'; 
nummer_2_name('55001')='Meier';   nummer_2_name('55003')='Meyer'; 
nummer_2_name('55005')='Maier'; 
ausgabeV1(nummer_2_name)