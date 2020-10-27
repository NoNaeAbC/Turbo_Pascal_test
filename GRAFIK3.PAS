program grafikdemo_3;
uses crt, uzubehoe,graph;
var
   xx, yy, sp, z1, I, treiber, modus, fehler: integer;
   pfad : string;
   ch: char;
begin
     clrscr;
     pfad:='';
     treiber:= detect;
     intgraph (treiber, modus pfad);
     fehler:= graphresult;
     if fehler <> 0 then
     begin
       write ('Fehler beim Initialisieren der Grafik: 'fehler, ^g);
       ch:= readkey;
       halt;
     end;
     setfillstyle(1, random(15)+1);
     sp:=random (getmaxx