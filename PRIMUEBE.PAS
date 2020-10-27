program primzahlueberpruefung;
uses crt;
var
  z,n:longint;
  wahl:char;

procedure ueberpruef;
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
  gotoxy(10,8);
  write('Programm zur öberprÅfung, ob eine gegebene Zahl eine Primzahl ist');
  gotoxy(27,12);
  write('Gib eine Zahl ein :    ');
  read(z);
  for n:=2 to trunc(sqrt(z)) do
  begin
    if (trunc(z/n))*n=z
    then
     begin
     gotoxy(15,16);
     write(z,' ist KEINE Primzahl, da sie durch ',n,' teilbar ist');
     exit;
     end
    else
  end;
  gotoxy(30,20);
  write(z,'  ist eine Primzahl');
end;

begin
  clrscr;
  ueberpruef;
  repeat
   gotoxy(2,22);
   write(' "0" fÅr Ende,  "1" fÅr Wiederholung:   ');
   read(wahl);
   case wahl of
   '1': ueberpruef;
   else
   end;
  until wahl = '0';
end.