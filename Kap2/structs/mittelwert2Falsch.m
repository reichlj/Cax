clear all

pt = struct('name', [],...
            'semester', [],... 
            'informatik', [],...
            'cad', [] );

pt(1).informatik = 1;
pt(2).informatik = 2;
pt(3).informatik = [];
pt(4).informatik = 4;

summe = 0;
for k = 1:length(pt)
    summe = summe + pt(k).informatik;
end
schnitt = summe/length(pt) 
schnitt1 = mean([pt(:).informatik]) 