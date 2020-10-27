program primzahlen;
uses crt;
var
  wahl:char;
  a,b,n,k,l,m:longint;

procedure schleife;
  begin
      for k:=2 to n-1 do
      begin
        if (trunc(n/k))*k=n
        then
         exit
        else
      end;
      gotoxy(l,m);
      write(n,', ');
      l:=l+8;
      if l>70 then
        begin
          l:=2;
          m:=m+1;
        end;
  end;

procedure pruef;
begin
  clrscr;
  textbackground(7);
  textcolor(1);
  for a:=1 to 80 do
  begin
    for b:=1 to 25 do
    begin
      gotoxy(a,b);
      write(' ');
    end;
  end;

  gotoxy(10,4);
  write('Programm zur Bestimmung der Primzahlen zwischen ');
  read(a);
  gotoxy(30,6);
  write(' und ');
  read(b);
  l:=2;
  m:=9;
  gotoxy(l,m);
  for n:=a to b do
    begin
    schleife;
    end;
end;


begin
  clrscr;
  pruef;
  repeat
   gotoxy(16,24);
   write(' "0" fÅr Ende,  "1" fÅr Wiederholung:   ');
   read(wahl);
   case wahl of
   '1': pruef;
   else
   end;
  until wahl = '0';
end.