program probe;
uses crt;
var
  n,k:integer;

procedure schleife;
begin
  for k:=2 to n-1 do
  begin
    if (trunc(n/k))*k=n
    then
     exit
    else
  end;
  write(n,',');
end;

begin
for n:=3 to 100 do
  begin
    schleife;
  end;
repeat until keypressed;
end.