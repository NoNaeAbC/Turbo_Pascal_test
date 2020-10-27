program eingabe;
uses crt;
type
  irgendjemand=record
    name:string[20];
    geschlecht:char;
  end;
var
  pdatei:file of irgendjemand;
  pdatensatz:irgendjemand;
begin
  clrscr;
  assign(pdatei, 'PERSONEN.DTA');
  {$I-}
  reset(pdatei);
  {$I+}
  while pdatensatz.name<>'' do
  begin
    clrscr;
    gotoxy(20,5);
    writeln ('Daten eingeben');
    writeln;
    writeln('Beenden mit "Leereingabe" fÅr Name');
    writeln;
    writeln('Satznummer: ',filesize(pdatei)+1);
    write('Name: ');
    readln(pdatensatz.name);
    write('Geschlecht: ');
    readln(pdatensatz.geschlecht);write(pdatei,pdatensatz);
  end;
  close(pdatei);
end.