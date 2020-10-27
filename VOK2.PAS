program vok2;
{V-}
uses crt;
type
  buch=record
    vokabel:string[20];
    formen:string[20];
    deutsch:string[20];
  end;
var
  vokabeldatei:file of buch;
  datensatz:buch;
  wahl:char;

procedure anhaengen;
begin
  clrscr;
  {$I-}
  reset(vokabeldatei);
  {$I+}
  with datensatz do
  begin
    gotoxy(28,3);
    write('Vokabeln eingeben: ');
    vokabel:='B';
    while vokabel<>'' do
    begin
    gotoxy(10,7);
    write('Datensatznummer: ');
    write(filesize(vokabeldatei)+1);
    gotoxy(10,11);
    write('Vokabel: ');
    readln(vokabel);
    if vokabel<>'' then
    begin
      gotoxy(10,13);
      write('Formen:   ');
      readln(formen);
      gotoxy(10,15);
      write('deutsch:   ');
      readln(deutsch);
      seek(vokabeldatei,filesize(vokabeldatei));
      write(vokabeldatei,datensatz);
    end;
  end;
  close(vokabeldatei);
end;
end;

{MAIN}

begin
  wahl:=' ';
  while upcase(wahl)<>'E' do
  begin
  assign(vokabeldatei,'LEKTION.DTA');
  clrscr;
  gotoxy(20,11);write('A -> Anh„ngen von Vokabeln');
  gotoxy(20,17);write('E -> Ende');
  gotoxy(20,20);write('W„hle: ');
  repeat
    gotoxy(32,20);
    wahl:=readkey;
  until upcase(wahl) in ['A','E'];
  case upcase(wahl) of
    'A': anhaengen;
    'E':;
  end;
end;
end.


