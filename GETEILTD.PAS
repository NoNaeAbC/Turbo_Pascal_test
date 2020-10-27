program geteiltdurch7;
uses crt, u1;
var
   a: integer;
   b: integer;
begin
clrscr;
a:=0;
b:=0;
for a:=0 to 10 do
begin
if (frac(a/7)=0) then
begin
     writeln(a);
     a:=a+1;
end
else
begin
    a:=a+1;
end;
end;
end.