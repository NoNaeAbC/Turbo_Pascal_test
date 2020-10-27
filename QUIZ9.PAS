PROGRAM Quiz9;
USES Crt, uzubehoe, Graph;
VAR Antwort: String;
    Ch, Wahl : Char;
    Alt, Nummer, XX, YY, I, Treiber, Modus,
    Fehler: Integer;
    Pfad : String;
PROCEDURE Menue;
BEGIN
     Loesche (2,7,79,23);
     Wp ('Bitte w„hlen Sie aus !',32,4);
     wp ('1 -> Geschichte',20,8);
     wp ('2 -> Geographie',20,10);
     wp ('3 -> Sport',20,12);
     wp ('0 -> Ende',20,14);
     wp ('W„hlen Sie nun: ',20,16);
     ReadLn (Wahl);
END;
PROCEDURE Geschichte;
BEGIN
     REPEAT
         REPEAT
               Alt:=Nummer;
               Nummer := Random (2)+1;
         UNTIL Alt <> Nummer;
         CASE Nummer OF
            1: BEGIN
                  Loesche(2,2,79,23);
                  Wp ('Geschichte',35,2);
                  Wp ('Wann wurde Amerika entdeckt? ',10,12);
                  ReadLn (Antwort);
                  IF Antwort = '1492' THEN
                  BEGIN
                       Delay (30000);
                       Wp ('RICHTIG !!',10,20);
                       Melodie;
                  END
                  ELSE
                  BEGIN
                  IF Antwort <> '' THEN
                    Delay (30000);
                    WritePos ('FALSCH !!',50,20);
                    Loesche(2,2,79,23);
                    WritePos ('Geschichte',35,2);
                    WritePos ('Von wem wurde Amerika entdeckt? ',10,12);
                    ReadLn (Antwort);
                    IF (Antwort='Kolumbus') OR
                       (Antwort='KOLUMBUS') OR
                       (Antwort='Columbus') THEN
                        BEGIN
                             Delay (30000);
                             WritePos ('RICHTIG !!',10,20);
                             Melodie;
                             END
                        ELSE
                        BEGIN
                             IF Antwort <> '' THEN
                               Delay (30000);
                               WritePos ('FALSCH !!',50,20);
                        END;
                        IF Antwort <> '' THEN
                          Delay (50000);
                          Loesche(2,2,79,23);
                    END;
            END;(* Ende der CASE-Anweisung *)
            until antwort = ''
         END;
     PROCEDURE Geographie;
     BEGIN
        REPEAT
            REPEAT
            Alt:=Nummer;
            Nummer := Random (2)+1;
        UNTIL Alt <> Nummer;
        CASE Nummer OF
           1: BEGIN
               Loesche(2,2,79,23);
               WritePos('Geographie',35,2);
               WritePos('Wie heiát die Hauptstadt von Frankreich? ',10,12);
               ReadLn (Antwort);
               IF (Antwort = 'Paris') OR
                  (Antwort = 'PARIS') THEN
               BEGIN
                    Delay (30000);
                    WritePos ('RICHTIG !!',10,20);
                    Melodie;
               END
               ELSE
               BEGIN
                    IF Antwort <> '' THEN
                      Delay (30000);
                      WritePos ('FALSCH !!',50,20);
               END;
               IF Antwort <> '' THEN
                  Delay (50000);
               Loesche(2,2,79,23);
             END;
          2: BEGIN
                Loesche(2,2,79,23);
                WritePos ('Geographie',35,2);
                WritePos ('Wie wird die Pyren„enhalbinsel noch genannt? ',10,12);
                ReadLn (Antwort);
                IF (Antwort = 'Spanien') OR
                   (Antwort = 'SPANIEN') OR
                   (Antwort = 'Die ostfriesischen Inseln') OR
                   (Antwort = 'Die Ostfriesischen Inseln') THEN
                BEGIN
                    Delay (30000);
                    WritePos ('RICHTIG',10,20);
                    Melodie;
                END
                ELSE
                BEGIN
                     IF Antwort <> '' THEN
                       Delay (30000);
                       WritePos ('FALSCH !!',50,20);
                END;
                IF Antwort <> '' THEN
                  Delay (50000);
                Loesche(2,2,79,23);
             END;
       END;(* Ende der CASE-Anweisung *)
   UNTIL Antwort = '';
END;
PROCEDURE Sport;
BEGIN
   REPEAT
       REPEAT
            Alt:=Nummer
            Nummer := Random (2)+1;
       UNTIL Alt <> Nummer;
       CASE Nummer OF
          1: BEGIN
                Loesche(2,2,79,23);
                WritePos ('Sport',35,2);
                WritePos ('Welche Nation wurde 1990 Fuáballweltmeister? ',10,12);
                ReadLn (Antwort);
                IF (Antwort='Deutschland') OR
                   (Antwort='DEUTSCHLAND') OR
                   (Antwort= 'BRD') THEN
                BEGIN
                   Delay (30000);
                   WritePos ('RICHTIG',10,20);
                   Melodie;
                END
                ELSE
                BEGIN
                    IF Antwort <> '' THEN
                      Delay (30000);
                      WritePos ('FALSCH !!',50,20);
                END;
                IF Antwort <> '' THEN
                  Delay (50000);
                Loesche(2,2,79,23);
             END;
          2: BEGIN
                 Loesche(2,2,79,23);
                 WritePos ('Sport',35,2);
                 WritePos ('Auf welcher Automarke errang Niki Lauda seinen letzten WM-Titel? ',5,12);
                 ReadLn (Antwort);
                 IF (Antwort = 'Mc Laren') OR
                    (Antwort = 'MC LAREN') THEN
                 BEGIN
                      Delay (30000);
                      WritePos ('RICHRIG !!',10,20);
                      Melodie;
                 END
                 ELSE
                 BEGIN
                      IF Antwort <> '' THEN
                         Delay (30000);
                         WritePos ('FALSCH !!',50,20);
                 END;
                 IF Antwort <> '' THEN
                   Delay (50000);
                 Loesche(2,2,79,23);
             END;
       END; (* Ende der CASE-Anweisung *)
   UNTIL Antwort = '';
END;
{MAIN}
BEGIN
   ClrScr;
   Randomize;
   Pfad:= '';
   Treiber := Detect;
   InitGraph (Treiber, Modus, Pfad);
   Fehler := GraphResult;
   IF Fehler = 0 THEN
   BEGIN
      FOR i:=1 TO 500 DO
      BEGIN
           SetColor (Random(15));
           Line (GetMaxX DIV 2, GetMaxY DIV 2, Random(GetMaxX), Random(GetMaxY));
      END;
      Delay(5000);
      SetColor(12);
      SetFillStyle(1,4);
      Bar (GetMaxX DIV 9, GetmaxY DIV 3, GetMaxX DIV 9 * 8, GetmaxY DIV 3 * 2);
      SetColor(15);
      SetTextJustify (1,1);
      SetTextStyle(4,0,5);
      OutTextXY(GetMaxX DIV 2, GetMaxY DIV 2,'Willkommen beim Quiz');
      SetTextStyle(2,0,8);
      OutTextXY(GetMaxX DIV 2, GetMaxY DIV 4*3,'Weiter mit Taste');
      Ch:= ReadKey;
      CloseGraph;
   END;
   REPEAT
       Box (1,1,80,24,219);
       Menue;
       Loesche(2,2,79,23);
       CASE Wahl OF
          '1': Geschichte;
          '2': Geographie;
          '3': Sport;
          '0':;
          ELSE
          BEGIN
              WritePos ('Falsche Taste !!',30,12);
              Delay (10000);
          END;
       END; (* Ende der CASE-Anweisung *)
   UNTIL Wahl = '0';
END.