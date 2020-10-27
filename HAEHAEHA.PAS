program haehaehae;
uses crt, uzubehoe;
var
   antwort, wahl: string;

begin
     clrscr;
     wp ('Mohohoin !!',5,6);
     melodie;
     clrscr;
     wp ('Ich bin ein Virus !! Aber was fÅr einer !',5,6);
     wp ('Aber es gibt eine Mîglichkeit mir zu entkommen !',5,8);
     wp ('Du mu·t mir nur eine Frage beantworten.',5,10);
     pause;
     clrscr;
     wp ('Willst du es versuchen ? Denk dran antwortest du mit "nein", dann ...',2,6);
     gotoxy (6,8);
     readln (Wahl);
     if (wahl = 'ja') or
        (wahl = 'JA') or
        (wahl = 'j')  then
     begin
          clrscr;
          wp ('Na gut dann sag mir wann Che Guevara ermordet worden ist !',5,6);
          wp ('(Aber nicht nur das Jahr oder so, sondern das genaue Datum !)',5,8);
          gotoxy (5,10);
          readln (Antwort);
          if (antwort = '8.10.1967') or
             (antwort = '8.10.67') then
          begin
               wp ('Wow !! Richtig gar nicht mal so schlecht !!',5,14);
               melodie;
               pause;
          end
          else
          begin
               clrscr;
               wp ('Falsch !! So ein Pech, jetzt gehts wohl rund !',5,14);
               melodie;
               wp ('Schei·e wa !',5,16);
               pause;
               clrscr;
               wp ('exit',5,6);
               wp ('format c:',5,8);
               delay (50000);
               clrscr;
          end;
     end
     else
     begin
          clrscr;
          wp ('Nicht ? So ein Pech, jetzt gehts wohl rund',5,14);
          melodie;
          wp ('Schei·e wa !',5,16);
               pause;
               clrscr;
               wp ('exit',5,6);
               wp ('format c:',5,8);
               delay (50000);
               clrscr;

     end;
end.