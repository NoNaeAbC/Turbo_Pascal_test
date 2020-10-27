program naeherungPi;
uses crt;

var
i,nmax,n:integer;
an,bn:real;
begin
  clrscr;
  n:=4;
  an:=2;
  bn:=4;
  nmax:=12;
  writeln(n:10,an:10:6,bn:10:6);
  for i:=1 to nmax do
  begin
    n:=2*n;
    an:=sqrt(an*bn);
    bn:=2/(1/an+1/bn);
    writeln(n:10,an:10:6,bn:10:6);
  end;
  readln;
end.