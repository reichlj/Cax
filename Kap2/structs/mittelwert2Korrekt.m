clear all

pt = struct('name', [],...
            'semester', [],... 
            'informatik', [],...
            'cad', [] )

pt(1).informatik = 1;
pt(2).informatik = 2;
pt(3).informatik = [];
pt(4).informatik = 4;

summe = 0;
anzahl = 0;
for k = 1:length(pt)
    if ~isempty( pt(k).informatik )
       summe = summe + pt(k).informatik;
       anzahl = anzahl + 1;
    end
end
if anzahl == 0
    disp('keine Teilnehmer')
else
    anzahl
    schnitt = summe/anzahl 
end

schnitt1 = mean([pt(:).informatik]) 