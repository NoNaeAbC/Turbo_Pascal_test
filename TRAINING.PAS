program training;


uses crt;

var
z,k,z1,z2,ergeb,loesung,wahl1,wahl2,wahl3,hilfe,rest:integer;
zeichen:char;



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
      write(' ');
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
    write(' ');
    end;
  end;
end;

procedure kadd;
begin
textbackground(1);
textcolor(4);
gotoxy(6,3);write('AA');
gotoxy(5,4);write('AAAA');
gotoxy(4,5);write('AAAAAA');
gotoxy(4,6);write('AA');
gotoxy(8,6);write('AA');
gotoxy(3,7);write('AA');
gotoxy(9,7);write('AA');
textbackground(7);
end;

procedure ksub;
begin
textbackground(1);
textcolor(4);
gotoxy(12,3);write('SSSSS');
gotoxy(12,4);write('S');
gotoxy(12,5);write('SSSSS');
gotoxy(16,6);write('S');
gotoxy(12,7);write('SSSSS');
textbackground(7);
end;

procedure kmult;
begin
textbackground(1);
textcolor(4);
gotoxy(64,3);write('MM');
gotoxy(68,3);write('MM');
gotoxy(64,4);write('MMMMMM');
gotoxy(64,5);write('M');
gotoxy(66,5);write('MM');
gotoxy(69,5);write('M');
gotoxy(64,6);write('M');
gotoxy(69,6);write('M');
gotoxy(64,7);write('M');
gotoxy(69,7);write('M');
textbackground(7);
end;

procedure kdiv;
begin
textbackground(1);
textcolor(4);
gotoxy(71,3);write('DDDD');
gotoxy(71,4);write('D');
gotoxy(74,4);write('DD');
gotoxy(71,5);write('D');
gotoxy(75,5);write('D');
gotoxy(71,6);write('D');
gotoxy(74,6);write('DD');
gotoxy(71,7);write('DDDD');
textbackground(7);
end;


procedure eingabe;
begin
  gotoxy(25,8);
  write('Erste Zahl eingeben: ');
  read(z1);
  gotoxy(24,10);
  write('Zweite Zahl eingeben: ');
  read(z2);
end;

procedure ergebnis(zeichen:char);
begin
  gotoxy(25,z);
  write('Gib die L”sung an: ',z1,' ', zeichen,' ',z2,' = ');







  read(loesung);
end;

procedure schleifeA;
begin
z:=13;
k:=1;
ergebnis(zeichen);
  while (loesung<>ergeb) and (k<3) do
  begin
    gotoxy(60,z);
    write('FALSCH ! ');
    z:=z+2;
    k:=k+1;
    gotoxy(10,z);
    write(k,' ter Versuch: ');
    ergebnis(zeichen);
  end;
end;

procedure schleifeB;
begin
  if loesung=ergeb then
  begin
    gotoxy(60,z);
    write('RICHTIG !');
  end
  else
  begin
    gotoxy(60,z);
    write('FALSCH !');
    gotoxy(18,20);
    write('Die richtige L”sung lautet: ',z1,' ', zeichen,' ',z2,' = ',ergeb,' !!!');
    end;
    for k:= 6 to 74 do
    begin
    gotoxy(k,21);
    write(zeichen);
    end;
    gotoxy(15,23);
    write('Mit Taste "1" beenden, mit Taste "0" gehts weiter  ');


    read(wahl1);
end;

procedure ergebnis1;
begin
  gotoxy(20,z);
  write('Gib die L”sung an:     :     =     Rest       ');
  gotoxy(40,z);write(z1);gotoxy(46,z);write(z2);
  gotoxy(52,z);
  read(loesung); gotoxy(61,z);
  read(rest);
end;

procedure schleife1;
begin
z:=13;
k:=1;
ergebnis1;
  while ((loesung<>ergeb) or (rest<>hilfe)) and (k<3) do
  begin
    z:=z+2;
    k:=k+1;
    if loesung=ergeb then
    begin
      gotoxy(65,z-2);
      write('falscher Rest! ');
    end;
    if loesung<>ergeb then
    begin
      gotoxy(65,z-2);
      write('FALSCH! ');
    end;
    gotoxy(5,z);
    write(k,' ter Versuch: ');
    ergebnis1;
  end;
  if (loesung=ergeb) and (rest=hilfe) then
  begin
    gotoxy(65,z);
    write('RICHTIG !');
  end
  else
  begin
    gotoxy(65,z);
    write('FALSCH !');
    gotoxy(13,20);
    write('Die richtige L”sung lautet: ',z1,' : ',z2,' = ',ergeb,' Rest ',hilfe,' !!!');
    end;
    for k:=6 to 74 do
    begin
    gotoxy(k,21);
    write(':');
    end;
    gotoxy(15,23);
    write('Mit Taste "1" beenden, mit Taste "0" gehts weiter ');
    read(wahl1);
end;

procedure add;
begin
  repeat
    clrscr;
    farbe(7,4);
    gotoxy(32,4);
    write('ADDITION');
    gotoxy(31,5);
    write('++++++++++');
    kadd;
    eingabe;
    ergeb:=z1+z2;
    zeichen:='+';
    schleifeA;
    schleifeB;
  until wahl1 = 1;
end;

procedure zaddkopf;
begin
    clrscr;
    farbe(7,4);
    gotoxy(32,3);write('ADDITION');
    gotoxy(31,4);write('++++++++++');
    kadd;
    farb(17,5,77,11,1,7);farb(3,10,17,11,1,7);
    gotoxy(20,6);write('W„hle einen der Zahlbereiche aus:');
    gotoxy(20,8);write('1 -> Zahlbereich bis   10 ;  ');
    write('2 -> Zahlbereich bis   20');
    gotoxy(20,9);write('3 -> Zahlbereich bis  100 ;  ');
    write('4 -> Zahlbereich bis 1000');
    gotoxy(30,11);write('5 -> Addition beenden ');
    for k:=3 to 77 do
      begin
      gotoxy(k,12);
      write('z');
      end;

end;

procedure zadd;
begin
  repeat
    zaddkopf;gotoxy(66,11);write('Wahl:  ');
    read(wahl3);
    textbackground(7);
    textcolor(4);
    case wahl3 of
      1:  begin
            repeat
            zaddkopf;
            gotoxy(24,8);
            textbackground(7);
            textcolor(1);
            write(' Zahlbereich bis   10 ');
              z1:=random(9)+1;hilfe:=10-z1;
              z2:=random(hilfe)+1;
              farb(1,13,80,25,7,4);
              ergeb:=z1+z2;
              zeichen:='+';
              schleifeA;
              schleifeB;
            until wahl1=1;
          end;
      2:  begin
            repeat
              zaddkopf;
              gotoxy(53,8);
              textbackground(7);
              textcolor(1);
              write(' Zahlbereich bis   20 ');
              z1:=random(19)+1;hilfe:=20-z1;
              z2:=random(hilfe)+1;
              farb(1,13,80,25,7,4);
              ergeb:=z1+z2;
              zeichen:='+';
              schleifeA;
              schleifeB;
            until wahl1=1;
          end;
      3:  begin
            repeat
              zaddkopf;
              gotoxy(24,9);
              textbackground(7);
              textcolor(1);
              write(' Zahlbereich bis  100 ');
              z1:=random(80)+10;hilfe:=89-z1;
              z2:=random(hilfe)+10;
              farb(1,13,80,25,7,4);
              ergeb:=z1+z2;
              zeichen:='+';
              schleifeA;
              schleifeB;
            until wahl1=1;
          end;
      4:  begin
            repeat
              zaddkopf;
              gotoxy(53,9);
              textbackground(7);
              textcolor(1);
              write(' Zahlbereich bis 1000 ');
              z1:=random(800)+100;hilfe:=900-z1;
              z2:=random(hilfe)+100;
              farb(1,13,80,25,7,4);
              ergeb:=z1+z2;
              zeichen:='+';
              schleifeA;
              schleifeB;
            until wahl1=1;
          end;
      5: wahl1:=1;
      else
      begin
      gotoxy(20,18);write('Falsche Taste !!!!!');
      delay(50000);
      end;
    end;
  until wahl3=5;
end;

procedure mult;
begin
  repeat
    clrscr;
    farbe(7,4);
    gotoxy(32,4);
    write('MULTIPLIKATION');
    gotoxy(31,5);
    write('****************');
    kmult;
    eingabe;
    ergeb:=z1*z2;
    zeichen:='*';
    schleifeA;
    schleifeB;
  until wahl1=1;
end;

procedure zmultkopf;
begin
  clrscr;
  farbe(7,4);
  gotoxy(32,3);write('MULTIPLIKATION');
  gotoxy(31,4);write('****************');
  kmult;
  farb(3,5,60,11,1,7);farb(61,10,77,11,1,7);
  gotoxy(18,6);write('W„hle einen der Zahlbereiche aus: ');
  gotoxy(8,8);write('1 -> Kleines Einmaleins  ;  Groáes Einmaleins <- 2');
  gotoxy(8,9);write('3 -> Zahlbereich  11 x 11  bis  21 x 21');
  gotoxy(18,11);write('5 -> Multiplikation beenden');
  for k:=3 to 77 do
  begin
  gotoxy(k,12);write('z');
  end;
end;

procedure zmult;
begin
  repeat
    zmultkopf;
    gotoxy(63,11);write('Wahl: ');
    read(wahl3);
    textbackground(7);
    textcolor(4);
    case wahl3 of
     1: begin
         repeat
         zmultkopf;
         gotoxy(12,8);
         textbackground(7);
         textcolor(1);
         write(' Kleines Einmaleins ');
         z1:=random(10)+1;
         z2:=random(10)+1;
         farb(1,13,80,25,7,4);
         ergeb:=z1*z2;
         zeichen:='*';
         schleifeA;schleifeB;
       until wahl1=1;
     end;
     2: begin
         repeat
           zmultkopf;
           gotoxy(35,8);
           textbackground(7);
           textcolor(1);
           write(' Groáes Einmaleins ');
           z1:=random(10)+1;
           z2:=random(90)+11;
           farb(1,13,80,25,7,4);
           ergeb:=z1*z2;
           zeichen:='*';
           schleifeA;schleifeB;
         until wahl1 = 1;
       end;
     3: begin
         repeat
           zmultkopf;
           gotoxy(12,9);
           textbackground(7);
           textcolor(1);
           write(' Zahlbereich  11 x 11  bis  21 x 21 ');
           z1:=random(11)+11;
           z2:=random(11)+11;
           farb(1,13,80,25,7,4);
           ergeb:=z1*z2;
           zeichen:='*';
           schleifeA;schleifeB;
         until wahl1=1;
       end;
     5:wahl1:=1;
     else
     begin
     gotoxy(20,18);write('Falsche Taste !!!');
     delay(50000);
     end;
   end;
   until wahl3=5;
 end;


procedure sub;
begin
  repeat
    clrscr;
    farbe(7,4);
    gotoxy(32,4);
    write('SUBTRAKTION');
    gotoxy(31,5);
    write('-------------');
    ksub;
    eingabe;
    if (z1-z2<0) then
    begin
      gotoxy(5,13);
      write('Neue Aufgabe: ');
      hilfe:=z1;
      z1:=z2;
      z2:=hilfe;
    end
    else
    begin
    end;
    ergeb:=z1-z2;
    zeichen:='-';
    schleifeA;
    schleifeB;
  until wahl1 = 1;
end;

procedure zsubkopf;
begin
  clrscr;
  farbe(7,4);
  gotoxy(32,3);
  write('SUBTRAKTION');
  gotoxy(31,4);
  write('-------------');
  ksub;
  farb(19,5,77,11,1,7);farb(3,10,19,11,1,7);
  gotoxy(27,6);write('W„hle einen der Zahlbereiche aus:');
  gotoxy(21,8);write('1 -> Zahlbereich bis   10 ;  2 -> Zahlbereich bis   20');
  gotoxy(21,9);write('3 -> Zahlbereich bis  100 ;  4 -> Zahlbereich bis 1000');
  gotoxy(30,11);write('5 -> Subtraktion beenden');
  for k:=3 to 77 do
    begin
    gotoxy(k,12);write('z');
    end;
end;

procedure zsub;
begin
  repeat
    zsubkopf;
    gotoxy(68,11);write('Wahl: ');
    read(wahl3);
    textbackground(7);
    textcolor(4);

    case wahl3 of
      1: begin
        repeat
          zsubkopf;
          gotoxy(25,8);
          textbackground(7);
          textcolor(1);
          write(' Zahlbereich bis   10 ');
          z2:=random(10)+1;
          ergeb:=random(11-z2);
          z1:=ergeb+z2;
          farb(1,13,80,25,7,4);
          zeichen:='-';
          schleifeA;schleifeB;
        until wahl1 = 1;
      end;
      2: begin
          repeat
            zsubkopf;
            gotoxy(54,8);
            textbackground(7);
            textcolor(1);
            write(' Zahlbereich bis   20 ');
            z2:=random(20)+1;
            ergeb:=random(21-z2);
            z1:=ergeb+z2;
            farb(1,13,80,25,7,4);
            zeichen:='-';
            schleifeA;schleifeB;
          until wahl1=1;
        end;
      3: begin
          repeat
            zsubkopf;
            gotoxy(25,9);
            textbackground(7);
            textcolor(1);
            write(' Zahlbereich bis  100 ');
            z2:=random(80)+11;
            ergeb:=random(101-z2);
            z1:=ergeb+z2;
            farb(1,13,80,25,7,4);
            zeichen:='-';
            schleifeA;schleifeB;
          until wahl1=1;
        end;
      4: begin
          repeat
            zsubkopf;
            gotoxy(54,9);
            textbackground(7);
            textcolor(1);
            write(' Zahlbereich bis 1000 ');
            z2:=random(880)+111;
            ergeb:=random(1001-z2);
            z1:=ergeb+z2;
            farb(1,13,80,25,7,4);
            zeichen:='-';
            schleifeA;schleifeB;
          until wahl1=1;
        end;
     5:wahl1:=1;
     else
     begin
     gotoxy(20,18);write('Falsche Taste !!!');
     delay(50000);
     end;
   end;
   until wahl3=5;
 end;


procedure ddiv;
begin
  repeat
    clrscr;
    farbe(7,4);
    gotoxy(32,4);
    write('DIVISION');
    gotoxy(31,5);
    write('::::::::::');
    kdiv;
    eingabe;
    if ((trunc(z1/z2))/(z1/z2)<>1) then
      begin
      gotoxy(5,13);
      write('Neue Aufgabe: ');
      z1:=z2*(trunc(z1/z2));
      end
      else
      begin
      end;
    ergeb:=trunc(z1/z2);
    zeichen:=':';
    schleifeA;
    schleifeB;
  until wahl1 = 1;
end;

procedure zdivkopf;
begin
  clrscr;
  farbe(7,4);
  gotoxy(32,3);write('DIVISION');
  gotoxy(31,4);write('::::::::::');
  kdiv;
  farb(3,5,58,11,1,7);farb(59,10,77,11,1,7);
  gotoxy(20,6);write('W„hle einen der Zahlbereiche aus:');
  gotoxy(10,8);write('1 -> Kleines Einmaleins  /  mit Rest <- 3');
  gotoxy(10,9);write('2 -> Groáes Einmaleins   /  mit Rest <- 4');
  gotoxy(30,11);write('5 -> Division beenden');
  for k:=3 to 77 do
  begin
    gotoxy(k,12);write('z');
  end;
end;

procedure zdiv;
begin
  repeat
    zdivkopf;
    gotoxy(60,11);write('Wahl: ');
    read(wahl3);
    textbackground(7);
    textcolor(4);
    case wahl3 of
     1: begin
         repeat
           zdivkopf;
           gotoxy(14,8);textbackground(7);
           textcolor(1);
           write(' Kleines Einmaleins ');
           z2:=random(10)+1;
           ergeb:=random(10)+1;
           z1:=z2*ergeb;
           farb(1,13,80,25,7,4);
           zeichen:=':';
           schleifeA;schleifeB;
         until wahl1=1;
       end;
      2: begin
          repeat
            zdivkopf;
            gotoxy(14,9);textbackground(7);
            textcolor(1);
            write(' Groáes Einmaleins ');
            z2:=random(10)+10;
            ergeb:=random(20)+11;
            z1:=z2*ergeb;
            farb(1,13,80,25,7,4);
            zeichen:=':';
            schleifeA;schleifeB;
          until wahl1=1;
        end;
       3: begin
           repeat
             zdivkopf;
             gotoxy(14,8);textbackground(7);
             textcolor(1);
             write('   Kleines Einmaleins mit Rest   ');
             z2:=random(10)+1;
             ergeb:=random(10)+1;
             hilfe:=random(z2);
             z1:=ergeb*z2+hilfe;
             farb(1,13,80,25,7,4);
             zeichen:=':';
             schleife1;
           until wahl1=1;
         end;
        4: begin
            repeat
              zdivkopf;
              gotoxy(14,9);textbackground(7);
              textcolor(1);
              write('    Groáes Einmaleins mit Rest   ');
              z2:=random(10)+10;
              ergeb:=random(20)+11;
              hilfe:=random(z2);
              z1:=ergeb*z2+hilfe;
              farb(1,13,80,25,7,4);
              zeichen:=':';
              schleife1;
            until wahl1=1;
          end;
         5: wahl1:=1;
         else
         begin
         gotoxy(20,18);write('Falsche Taste !!!');
         delay(50000);
         end;
       end;
       until wahl3=5;
     end;

procedure menue;
begin
  clrscr;
  farbe(7,4);
  gotoxy(32,4);
  write('MATHETRAINING');
  gotoxy(31,5);
  write('+-*:+-*:+-*:+-*');
  kadd;
  ksub;
  kmult;
  kdiv;
  gotoxy(20,8);
  write('W„hle aus den acht Bereichen einen aus:  ');
  gotoxy(15,12);
  write('1 ->  Addition       +       Zufallsaddition <- 5');
  gotoxy(15,14);
  write('2 ->  Subtraktion    -    Zufallssubtraktion <- 6');
  gotoxy(15,16);
  write('3 ->  Multiplikation * Zufallsmultiplikation <- 7');
  gotoxy(15,18);
  write('4 ->  Division       :       Zufallsdivision <- 8');
  gotoxy(32,21);
  write('9 ->  Programmende     ');
  read(wahl2);
end;

   {MAIN}

begin
  repeat
    menue;
    case wahl2 of
    1: add;
    2: sub;
    3: mult;
    4: ddiv;
    5: zadd;
    6: zsub;
    7: zmult;
    8: zdiv;
    9:;
    else
    begin
    gotoxy(20,23);
    write('Falsche Taste ');
    delay(50000);
    end;
  end;
  until wahl2=9;
end.
