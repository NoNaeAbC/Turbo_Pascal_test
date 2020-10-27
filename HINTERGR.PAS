program hintergrund;
uses crt, uzubehoe;
var
   zaehler: byte;
begin
     for zaehler:= 0 to 7 do
     begin
     clrscr;
     begin
          textbackground(zaehler);
          gotoxy (20,10);
          write (' Hintergrundfarbe - Nummer: ',zaehler);
     end;
     delay (15000);
     textbackground (0);
end;
end.