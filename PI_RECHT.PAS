program PiRechteck;
uses crt;
var
  i,n,s:longint;
  hoehe,summe,u,o:real;

procedure eingabe;
begin
  clrscr;
  s:=4;
  write('Gib die maximale Unterteilung ein: n <= ');
  readln(n);
end;

procedure ausgabe;
begin
  write('Unterteilung n= ',s:10);
  writeln(4*u:15:10,' < pi < ',4*o:15:10);
end;

{main}
begin
  eingabe;
  repeat
    hoehe:=0;
    summe:=0;
    for i:=1 to (s-1) do
    begin
      hoehe:=sqrt(1-sqr(i/s));
      summe:=summe+hoehe;
    end;
    u:=summe/s;
    o:=u+1/s;
    ausgabe;
    s:=s*2;
  until s>n;
  repeat until keypressed;
end.