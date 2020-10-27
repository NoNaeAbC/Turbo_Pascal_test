program max;
uses crt;
var
  h,dh,E,dE:array[0..20] of integer;
  i,l:integer;

begin
clrscr;
  for i:= 0 to 20 do
  begin
    E[i]:=0;
    dE[i]:=0;
    h[i]:=0;
    dh[i]:=0;
  end;
  E[0]:=1;
  for l:=1 to 6 do
  begin
   for i:=0 to 10 do
   begin
    dh[i]:=E[i]-E[i+1];
   end;
   for i:=0 to 10 do
   begin
    h[i]:=h[i]+dh[i];
    write('h(',i,')=',h[i],' ');
   end;
   writeln;
   for i:=0 to 10 do
   begin
    dE[i+1]:=h[i]-h[i+1];
   end;
   for i:=0 to 10 do
   begin
    E[i]:=E[i]+dE[i];
    write('E(',i,')=',E[i],' ');
   end;
  writeln;
  writeln;
  end;

repeat until keypressed;
end.