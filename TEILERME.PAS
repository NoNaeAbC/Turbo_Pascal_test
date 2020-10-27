program teilermenge;
uses crt;
var
  z,n:integer;
  wahl:char;

procedure teiler;
begin
  clrscr;
  textbackground(7);
  textcolor(1);
  for z:=1 to 80 do
    begin
      for n:=1 to 25 do
      begin
        gotoxy(z,n);
        write(' ');
      end;
    end;
  gotoxy(20,6);
  write('Bestimmung der Teilermenge von :  ');
  read(z);
  gotoxy(10,12);
  write('T={1');
  for n:=2 to z do
    begin
      if (trunc(z/n))*n=z then
      write(',',n)
      else;
    end;
  write('}');
end;

begin
clrscr;
  teiler;
  repeat
  gotoxy(12,21);
  write('Beenden: "0"      Wiederholen: "1"     ');
  read(wahl);
  case wahl of
   '1':teiler;
  else
  end;
  until wahl='0';
end.
