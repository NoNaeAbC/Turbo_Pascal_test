unit uzubehoe;

interface
uses crt;
procedure loesche (x1, y1, x2, y2: integer);
procedure box (x1, y1, x2, y2, zeichen: integer);
procedure melodie;
procedure wp (text: string; x1,y1: integer);
procedure WritePos(text: string; x1,y1: integer);
procedure pause;
implementation
procedure loesche (x1, y1, x2, y2: integer);
begin
     window (x1, y1, x2, y2);
     clrscr;
     window (1,1,80,25);
end;

procedure box (x1, y1, x2, y2, zeichen: integer);
var sternzaehler:integer;
begin
     for sternzaehler:= x1 to x2 do;
     begin
          gotoxy (sternzaehler, y1);
          write(chr(zeichen));
          gotoxy (sternzaehler, y2);
          write (chr(zeichen));
     end;
end;

procedure melodie;
begin
     sound (392);
     delay (2000);
     sound (440);
     delay (2000);
     sound (494);
     delay (2000);
     sound (523);
     delay (5000);
     nosound;
end;

procedure wp (text:string; x1, y1:integer);
begin
     gotoxy (x1,y1);
     write (text);
end;

procedure writepos (text:string; x1, y1:integer);
begin
     gotoxy (x1,y1);
     write (text);
end;

procedure pause;
begin
     writeln;
     writeln;
     writeln ('Weiter mit beliebiger Taste');
     repeat until keypressed;
end;
end.