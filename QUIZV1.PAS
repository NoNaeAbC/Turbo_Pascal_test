program verkehrsquiz;

uses crt;
var
antwort,k,l,m,n:integer;
r,s,t:real;
wahl,wahl1:char;

procedure farbe;
begin
  textbackground(7);
  textcolor(7);
  for m:=1 to 80 do
  begin
    for n:=1 to 25 do
    begin
      gotoxy(m,n);write(' ');
    end;
  end;
end;

procedure loesung;
begin
    if (antwort+5<=s) or (antwort-5>=s) then
    begin
      gotoxy(60,12);write('Falsch !');
      gotoxy(10,14);write('Zweiter Versuch:               m');
      gotoxy(35,14);read(antwort);
      if (antwort+5<=s) or (antwort-5>=s) then
      begin
        gotoxy(60,14);write('Falsch !');
        gotoxy(10,16);write('Dritter Versuch:               m');
        gotoxy(35,16);read(antwort);
            if (antwort+5<=s) or (antwort-5>=s) then
            begin
              gotoxy(60,16);write('Falsch !');
            end
            else
            begin
              gotoxy(60,16);write('RICHTIG');
            end;
      end
      else
      begin
        gotoxy(60,14);write('RICHTIG');
      end;
    end
    else
    begin
      gotoxy(60,12);write('RICHTIG');
    end;
    gotoxy(19,19);write('Der Anhalteweg betr„gt theoretisch  ',round(s),' m');
end;

procedure frage;
begin
repeat
  farbe;
  textcolor(1);
  k:=random(3);
  l:=25+random(56);
  if k=0 then
  begin
    gotoxy(17,5);write('Wie groá ist der Anhalteweg eines Fahrzeuges');
    textcolor(4);
    gotoxy(27,7);write(' bei NASSER Fahrbahn,');
    textcolor(1);
    gotoxy(17,9);write('wenn seine Geschwindigkeit ',l,' km/h betr„gt ?');
    gotoxy(10,12);write('Erster Versuch:                m');
    gotoxy(35,12);read(antwort);
    s:=0.5*l*l/3.6/3.6/5+l/3.6;
      loesung;
  end;

  if k=1 then
  begin
    gotoxy(17,5);write('Wie groá ist der Anhalteweg eines Fahrzeuges ');
    textcolor(4);
    gotoxy(27,7);write('bei TROCKENER Fahrbahn,');
    textcolor(1);
    gotoxy(17,9);write('wenn seine Geschwindigkeit ',l,' km/h betr„gt ?');
    gotoxy(10,12);write('Erster Versuch:                m');
    gotoxy(35,12);read(antwort);
    s:=0.5*l*l/3.6/3.6/7.5+l/3.6;
      loesung;
  end;

  if k=2 then
  begin
    gotoxy(17,5);write('Wie groá ist der Anhalteweg eines Fahrzeuges ');
    textcolor(4);
    gotoxy(25,7);write('bei VERSCHNEITER Fahrbahn,');
    textcolor(1);
    gotoxy(17,9);write('wenn seine Geschwindigkeit ',l,' km/h betr„gt ?');
    gotoxy(10,12);write('Erster Versuch:                m');
    gotoxy(35,12);read(antwort);
    s:=0.5*l*l/3.6/3.6/2.5+l/3.6;
      loesung;
  end;
  gotoxy(24,23);write('Wiederholen (w)    Beenden (b)    ');
  repeat until keypressed;
  if keypressed then  wahl:=readkey;
until wahl='b';
end;

{MAIN}
begin
frage;
end.