program xhochdrei;
uses crt;
var a,x:real;
    i:integer;
begin
  clrscr;
  write('a=');
  readln(a);
  write('x1=');
  readln(x);
  i:=1;
  while abs(x*x*x-a)>0.000001 do
  begin
    x:=(2*x+a/(x*x))/3;
    i:=i+1;
    writeln('x',i,'=',x:14:9);
  end;
  readln;
end.