program hintergr;
uses crt, u1, u2, u3, graph;
var
   a,b:integer;
begin
clrscr;
a:=0;
b:=0;
for a:=0 to 15 do
begin
for b:=0 to 16 do
begin
farbe(a,b);
writeln ('Dies ist die Hintergrundfarbe ',a,' und die Textfarbe ',b,'.');
delay (10000);
pause;
end;
end;
end.