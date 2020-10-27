program vokabelverwaltung;
{$V-}
uses crt,printer;

type
  buch=record
       vokabel:string[20];
       formen :string[20];
       deutsch:string[40];
  end;

var
  vokabeldatei,hilfedatei: file of buch;
  datensatz: buch;
  kriterium,entscheidung,taste,wahl: char;
  zl,nr,nummer,i:integer;
  wort,vok: string[40];
  datnam,suchwort,such,eingabe:string;
  gefunden:boolean;

procedure farb(sp1,ze1,sp2,ze2,textf,f:integer);
var
  m,n:integer;
  begin
    textbackground(textf);
    textcolor(f);
    for m:=sp1 to sp2 do
    begin
      for n:=ze1 to ze2 do
      begin
        gotoxy(m,n);
        write('');
      end;
    end;
  end;

procedure farbe(textf,f:integer);
var
  m,n:integer;
begin
  textbackground(textf);
  textcolor(f);
  for m:=1 to 80 do
  begin
    for n:=1 to 25 do
    begin
      gotoxy(m,n);
      write('');
    end;
  end;
end;

procedure existiert_nicht;
begin
  gotoxy(5,3);write('Die Datei konnte nicht gefunden werden!');
  gotoxy(28,24);write('Mit "Leertaste" zurÅck ins MenÅ!');
  repeat
    taste:=readkey;
  until taste=#32;
end;

procedure anhaengen;
begin
  clrscr;farbe(7,4);
  {$I-}
  reset(vokabeldatei);
  {$I+}
  if IOresult<>0 then
  begin
    existiert_nicht;
    exit;
  end;
  with datensatz do
  begin
    vokabel:='B';
    while vokabel<>'' do
    begin
      gotoxy(5,7);
      write('Vokabelnummer: ');write(filesize(vokabeldatei)+1);
      gotoxy(5,8);write('Vokabel: ');read(vokabel);
      if vokabel<>'' then
      begin
        gotoxy(5,10);write('Formen:  ');read(formen);
        gotoxy(5,12);write('deutsch: ');read(deutsch);
        seek(vokabeldatei,filesize(vokabeldatei));
        write(vokabeldatei,datensatz);
        farb(5,8,80,12,7,4);
      end;
    end;
    close(vokabeldatei);
  end;
end;

procedure anhaengen9;
begin
  clrscr;
  farbe(7,4);
  gotoxy(5,3);
  write('Gib die Lektion / Datei an, in die die fehlenden Vokabeln eingefÅgt');
  gotoxy(5,4);write('werden sollen :');read(datnam);
  assign(Vokabeldatei,datnam);
  {$I-}
  reset(vokabeldatei);
  {$I+}
  if IOresult<>0 then
  begin
    existiert_nicht;
    exit;
  end;
  anhaengen9;
end;

procedure neu;
begin
  clrscr;
  farbe(7,4);
  gotoxy(5,3);write('Soll die folgende Datei neu angelegt werden?(j/n)');
  gotoxy(55,12);
  repeat
    taste:=readkey;
  until upcase(taste) in ['j','n'];
  if upcase(taste)='j' then
  begin
    rewrite(vokabeldatei);
    anhaengen;
  end;
end;

procedure neu1;
begin
  clrscr;
  farbe(7,4);
  gotoxy(5,3);write('Gib den Namen der neuen Lektion/Datei an:  ');
  read(datnam);
  assign(vokabeldatei,datnam);
  {$I-}
  reset(vokabeldatei);
  {$I+}
  if IOresult<>0 then
  begin
    rewrite(vokabeldatei);
    anhaengen9;
  end
  else
  begin
    gotoxy(5,5);write('Diese Datei ist schon vorhanden! Soll sie wirklich ');
    gotoxy(5,6);write('gelîscht/Åberschrieben werden?  ( J / N )  ');
    gotoxy(15,15);
    repeat
      taste:=readkey;
    until upcase(taste) in ['j','n'];
    if upcase(taste)='j' then
    begin
      rewrite(vokabeldatei);
      {$I-}
      reset(vokabeldatei);
      {$I+}
      if IOresult<>0 then
      begin
        existiert_nicht;
        exit;
      end;
      anhaengen9;
    end;
  end;
end;

procedure daten_loeschen;
begin
  clrscr;
  farbe(7,4);
  assign(hilfedatei,'HILFE');
  gotoxy(5,3);write('Gib die Lektion/Datei an, in der Vokabeln gelîscht');
  gotoxy(5,4);write('werden sollen: ');
  read(datnam);
  assign(vokabeldatei,datnam);
  {$I-}
  reset(vokabeldatei);
  rewrite(hilfedatei);
  {$I+}
  if IOresult<>0 then
  begin
    existiert_nicht;
    exit;
  end;
  entscheidung:='N';
  gotoxy(5,8);
  write('Bei folgender Vokabel sollen alle Angaben gelîscht werden: ');
  gotoxy(5,9);read(vok);
  gefunden:=false;
  while (not gefunden) and (not eof(vokabeldatei)) do
  begin
    read(vokabeldatei,datensatz);
    with datensatz do
    begin
      if vokabel=vok then
      begin
        gefunden:=true;
        gotoxy(10,11);write('Vokabel: '+vokabel);
        gotoxy(10,12);write('Formen:  '+formen);
        gotoxy(10,13);write('deutsch: '+deutsch);
        gotoxy(10,15);write('TatsÑchlich lîschen?  ( J / N )');
        gotoxy(15,20);
        repeat
          entscheidung:=readkey
        until upcase(entscheidung) in ['J','N'];
        if upcase(entscheidung)='J' then
        begin
          nummer:=filepos(vokabeldatei);
          reset(vokabeldatei);
          nr:=1;
          while not eof(vokabeldatei) do
          begin
            read(vokabeldatei,datensatz);
            if nr<>nummer then
            write(hilfedatei,datensatz);
            inc(nr);
          end;
        end;
      end;
    end;
  end;
  if not gefunden then
  begin
    gotoxy(10,23);write('Vokabel wurde nicht gefunden!');
    delay(50000);
  end;
  close(vokabeldatei);
  close(hilfedatei);
  if upcase(entscheidung)='J' then
  begin
    erase(vokabeldatei);
    rename(hilfedatei,datnam);
  end;
end;

procedure liste;
begin
  clrscr;
  farbe(7,4);
  gotoxy(5,2);write('Gib den Namen der Lektion/Datei an, die aufgelistet ');
  gotoxy(5,3);write('werden soll: ');read(datnam);
  assign(vokabeldatei,datnam);
  {$I-}
  reset(vokabeldatei);
  {$I+}
  if IOresult<>0 then
  begin
    existiert_nicht;
    exit;
  end;
  while not eof(vokabeldatei) do
  begin
    i:=filepos(Vokabeldatei);
    zl:=(i mod 20)+5;
    with datensatz do
    begin
      read(vokabeldatei,datensatz);
      gotoxy(2,zl);write(vokabel);
      gotoxy(22,zl);write(formen);
      gotoxy(42,zl);writeln(deutsch);
      if zl>20 then
      begin
        gotoxy(10,25);write('Mit "return" weiter');
        repeat
          taste:=readkey;
        until taste=#13;
        farb(1,5,80,25,7,4);
      end;
    end;
  end;
  close(vokabeldatei);
  gotoxy(2,25);write('Mit "Leertaste" zurÅck ins MenÅ');
  repeat
    taste:=readkey;
  until taste=#32;
end;

procedure liste_drucken;
begin
  clrscr;
  farbe(7,4);
  gotoxy(5,2);write('Gib den Namen der Lektion/Datei an, die ausgedruckt');
  gotoxy(5,3);write('werden soll: ');read(datnam);
  assign(vokabeldatei,datnam);
  {$I-}
  reset(vokabeldatei);
  {$I+}
  if IOresult<>0 then
  begin
    existiert_nicht;
    exit;
  end;
  writeln(lst,datnam);
  while not eof(vokabeldatei) do
  begin
    i:=filepos(vokabeldatei);
    zl:=(i mod 63)+5;
    with datensatz do
    begin
      read(vokabeldatei,datensatz);
      write(lst,vokabel,'   ');
      write(lst,formen,'   ');
      writeln(lst,deutsch);
      if zl>66 then
      begin
        gotoxy(10,12);write('Zum Weiterdrucken eine beliebige Taste drÅcken!');
        taste:=readkey;
        clrscr;
        farbe(7,4);
      end;
    end;
  end;
  close(vokabeldatei);
end;

procedure aendern;
begin
  clrscr;
  farbe(7,4);
  gotoxy(5,2);write('Gib den Namen der Lektion/Datei an, die geÑndert');
  gotoxy(5,3);write('werden soll: ');read(datnam);
  assign(vokabeldatei,datnam);
  {$I-}
  reset(vokabeldatei);
  {$I+}
  if IOresult<>0 then
  begin
    existiert_nicht;
    exit;
  end;
  gotoxy(5,8);write('Gib die Vokabel an, die geÑndert werden soll:');
  gotoxy(5,9);read(vok);
  gefunden:=false;
  while (not gefunden) and (not eof(vokabeldatei)) do
  begin
    read(vokabeldatei,datensatz);
    with datensatz do
    begin
      if vokabel=vok then
      begin
        gefunden:=true;
        eingabe:='';
        gotoxy(10,11);write('Vokabel: '+vokabel);
        gotoxy(10,12);write('Ñndern in: ');read(eingabe);
        if eingabe<>'' then
          vokabel:=eingabe;
        eingabe:='';
        gotoxy(10,14);write('Formen: '+formen);
        gotoxy(10,15);write('Ñndern in: ');read(eingabe);
        if eingabe<>'' then
          formen:=eingabe;
        eingabe:='';
        gotoxy(10,17);write('deutsch: '+deutsch);
        gotoxy(10,18);write('Ñndern in: ');read(eingabe);
        if eingabe<>'' then
          deutsch:=eingabe;
        eingabe:='';
        gotoxy(10,21);write('énderung speichern? ( J / N )');
        gotoxy(15,23);
        entscheidung:='N';
        repeat
          entscheidung:=readkey;
        until upcase(entscheidung) in ['J','N'];
        if upcase(entscheidung) = 'J' then
        begin
          seek(vokabeldatei,filepos(vokabeldatei)-1);
          write(vokabeldatei,datensatz);
        end;
      end;
    end;
  end;
  if not gefunden then
  begin
    gotoxy(10,25);write('Vokabel wurde nicht gefunden');
    delay(50000);
  end;
  close(vokabeldatei);
end;

procedure zusammenfuegen;
begin
  clrscr;
  farbe(7,4);
  gotoxy(5,3);
  write('Gib die Lektion / Datei an, die "angehÑngt" werden soll: ');
  gotoxy(5,4);read(datnam);
  assign(vokabeldatei,datnam);
  {$I-}
  reset(vokabeldatei);
  {$I+}
  if IOresult<>0 then
  begin
    existiert_nicht;
    exit;
  end;
  gotoxy(5,6);
  write('Gib die Lektion / Datei an, an die "angehÑngt" werden soll: ');
  gotoxy(5,7);read(datnam);
  assign(hilfedatei,datnam);
  {$I-}
  reset(hilfedatei);
  {$I+}
  if IOresult<>0 then
  begin
    existiert_nicht;
    exit;
  end;
  while not eof(vokabeldatei) do
  begin
    read(vokabeldatei,datensatz);
    with datensatz do
    begin
      seek(hilfedatei,filesize(hilfedatei));
      write(hilfedatei,datensatz);
    end;
  end;
  close(hilfedatei);
  close(vokabeldatei);
  gotoxy(20,25);
  write('Fertig');
end;

procedure uebensprache1;
begin
 clrscr;
 farbe(7,4);
 gotoxy(5,3);write('Gib die Lektion / Datei an, aus der geÅbt werden soll:');
 gotoxy(5,4);read(datnam);
 assign(vokabeldatei,datnam);
 {$I-}
 reset(vokabeldatei);
 {$I+}
 if IOresult<>0 then
 begin
   existiert_nicht;
   exit;
 end;
 repeat
   farb(1,6,80,25,7,4);
   with datensatz do
   begin
   seek(vokabeldatei,random(filesize(vokabeldatei)));
   gotoxy(15,8);write('Vokabel: '+ vokabel);
   gotoxy(5,9);write('öbersetzungsvorschlag: ');read(vok);
   gotoxy(5,13);write('Gespeichert sind: ');
   gotoxy(15,16);write('Formen:  '+formen);
   gotoxy(15,18);write('deutsch: '+deutsch);
   gotoxy(10,25);write('Mit Taste "1" beenden, mit Taste "0" gehts weiter: ');
   read(wahl);
   end;
   until wahl='1';
 close(vokabeldatei);
 end;

procedure uebensprache2;
begin
  clrscr;
  farbe(7,4);
  gotoxy(5,3);
  write('Gib die Lektion / Datei an, aus der geÅbt werden soll: ');
  gotoxy(5,4);read(datnam);
  assign(vokabeldatei,datnam);
  {$I-}
  reset(vokabeldatei);
  {$I+}
  if IOresult<>0 then
  begin
    existiert_nicht;
    exit;
  end;
  repeat
    farb(1,6,80,25,7,4);
    with datensatz do
    begin
      seek(vokabeldatei,random(filesize(vokabeldatei)));
      gotoxy(15,8);write('deutsch: '+deutsch);
      gotoxy(5,9);write('öbersetzungsvorschlag: ');
      read(vok);
      gotoxy(5,13);write('Gespeichert sind: ');
      gotoxy(15,16);write('Vokabel: '+vokabel);
      gotoxy(15,18);write('Formen:  '+formen);
      gotoxy(10,25);write('Mit Taste "1" beenden, mit Taste "0" gehts weiter');
      read(wahl);
    end;
    until wahl='1';
    close(vokabeldatei);
  end;

procedure lexikon;
begin
  clrscr;
  farbe(7,4);
  gotoxy(5,2);
  write('Gib den Namen der Lektion / Datei an, in der die Begriffe gesucht');
  gotoxy(5,3);write('werden sollen: ');read(datnam);
  assign(vokabeldatei,datnam);
  {$I-}
  reset(vokabeldatei);
  {$I+}
  if IOresult<>0 then
  begin
    existiert_nicht;
    exit;
  end;
  gotoxy(5,5);write('WÑhle aus:  "1" , falls   sprache -> deutsch');
  gotoxy(5,6);write('            "2" , falls   deutsch -> sprache');
  gotoxy(15,8);write('Wahl: ');
  repeat
    gotoxy(25,8);
    kriterium:=readkey;
  until kriterium in ['1','2'];
  farbe(7,4);
  case kriterium of
  '1': wort:='die Vokabel';
  '2': wort:='den deutschen Begriff';
  end;
  gotoxy(10,5);write('Gib '+wort+' ein: ');read(such);
  while not eof(vokabeldatei) do
  begin
    read(vokabeldatei,datensatz);
    with datensatz do
    begin
      case kriterium of
      '1': suchwort:=datensatz.vokabel;
      '2': suchwort:=datensatz.deutsch;
     end;
     if copy(suchwort,1,6)=such then
     begin
       eingabe:='';
       gotoxy(5,8);write('Vokabel: '+vokabel);
       gotoxy(5,10);write('Formen:  '+formen);
       gotoxy(5,12);write('deutsch: '+deutsch);
       gotoxy(10,20);write('Mit beliebiger Taste gehts weiter');
       wahl:=readkey;
       farb(5,8,80,22,7,4);
     end;
   end;
 end;
 gotoxy(10,25);write('Es wurde kein passender Eintrag gefunden');
 wahl:=readkey;
 close(vokabeldatei);
end;

(*Hauptprogramm*)

begin
  wahl:=' ';
  while upcase(wahl)<>'E' do
  begin
    assign(vokabeldatei,'vokabel.dat');
    clrscr;
    farbe(7,4);
    gotoxy(25,4);write('VOKABEL-verwaltung');
    gotoxy(10,8);write('1 -> Vokabeltraining: Sprache -> deutsch');
    gotoxy(10,9);write('2 -> Vokabeltraining: deutsch -> Sprache');
    gotoxy(15,11);write('N -> Neue Lektion / Datei grÅnden');
    gotoxy(15,12);write('A -> AnhÑngen von Vokabeln an eine bestehende Datei');
    gotoxy(15,13);write('é -> éndern von Vokabeln in einer bestehenden Datei');
    gotoxy(15,14);write('ô -> Lîschen von Vokabeln aus einer bestehenden Datei');
    gotoxy(15,15);write('V -> VerknÅpfen von Lektionen');
    gotoxy(15,17);write('L -> LEXIKON  Sprache <-> deutsch');
    gotoxy(15,19);write('R -> Auflisten der Vokabeln einer bestehenden Datei');
    gotoxy(15,20);write('D -> Drucken von ganzen Dateien');
    gotoxy(10,22);write('E -> Ende');
    gotoxy(10,24);write('gewÑhlt wird: ');
    repeat
      gotoxy(30,24);
      wahl:=readkey;
    until upcase(wahl) in ['1','2','N','A','é','ô','V','L','R','D','E'];
    case upcase(wahl) of
      '1': uebensprache1;
      '2': uebensprache2;
      'N': neu;
      'A': anhaengen;
      'é': aendern;
      'ô': daten_loeschen;
      'V': zusammenfuegen;
      'L': lexikon;
      'R': liste;
      'D': Liste_drucken;
      'E':;
    end;
  end;
end.





