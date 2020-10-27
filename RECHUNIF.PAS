program Rechnungsbetrag;
var Betrag, Netto:real;
var Tage, Prozent:integer;

begin
write ('Betrag in DM ');readln(Betrag);
write ('Tage nach Rechnungsstellung ');readln(Tage);
if Tage>30 then prozent:=0              ;
if (Tage>14) and (Tage<31) then prozent:=2   ;
if (Tage>1) and (Tage<15) then prozent:=3     ;
if (Tage>-1) and (Tage<2) then prozent:=4      ;
Netto:= Betrag-(Betrag/100*Prozent);
writeln ('Der Gesamtbetrag bel„uft sich auf DM ',Netto:8:2);
writeln ('Skonto: ',Prozent);
readln;
end.
