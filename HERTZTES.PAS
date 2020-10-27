program kjafs  ;
uses crt;
var a:char;
    b:integer;
begin
b:=0;
readln( a);
repeat
b:=b+1;
writeln;
until b=30;
if a='a' then begin
repeat
sound(15000);
until keypressed;
nosound;
end
else
sound(30000);
readln;
nosound;
end.