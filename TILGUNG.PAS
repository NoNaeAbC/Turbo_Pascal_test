program tilgung;
uses crt;
var
k,k1,z,zins,r:real;
n:integer;

begin
clrscr;

k:=50000;
z:=6;
r:=562.42*12;

for n:=1 to 1 do
begin
  zins:=z/100*k;
  k:=k-r+zins;
  writeln(round(k),'  ');
end;


repeat until keypressed;

end.