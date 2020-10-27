program primzahl;
uses crt, u1;
var
   n:integer;
   k:integer;
begin
clrscr;
writeln ('PRIMZAHLEN BIS 10000');
deLAy(5000);
k:=1;
n:=1;
repeat
n:=n+1;
      repeat
      k:=K+1;
      until k = n-1
if (trunc(n/k))*k=n then
begin