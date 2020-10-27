program wohnort;
uses crt, u1, graph;
var
   a1, a2, a3 : string;
   xx, yy, sp, z1, i, treiber, modus, fehler: integer;
   pfad: string;
   ch: char;

begin
     clrscr;
     writeln ('DOS/4GW Protected Mode Run-time Version 1.97');
     writeln ('Copyright (c) Schîps Chaoten - Software, Inc. 1997');
     delay(10000);
     writeln ('Loading sound efects');
     delay(10000);
     writeln ('Loading graph results');
     delay(10000);
     writeln ('Install Mouse');
     delay(6000);
     writeln ('Mouse type: serial');
     delay(4000);
     writeln ('Mouse on COM - Port 1 detected');
     delay(10000);
     sound(500);
     delay(1800);
     nosound;
     writeln ('Driver already installed');
     delay(10000);
     clrscr;
     xx := 0;
     yy := 0;
     sp := 0;
     z1 := 0;
     i := 0;
     treiber := 0;
     modus := 0;
     fehler := 0;
     pfad := '';
     treiber := Detect;
     clrscr;
     initgraph (treiber, modus, pfad);
     fehler:= graphresult;
     if fehler <> 0 then
     begin
          write ('Fehler beim Initialisieren der Grafik: ',fehler, ^G);
          ch:= Readkey;
          halt;
     end;
     setfillstyle(1,12);
     bar(1,1,getmaxx,getmaxy);
     for i:=1 to 400 do
     begin
          setfillstyle(1, random(15)+1);
          sp:= random(getmaxx);
          z1:= random(getmaxy);
          bar(sp,z1,sp + random(90)+10,z1+random(70)+10);
     end;
     setfillstyle(1,0);
     bar (getmaxx div 6+5,
          getmaxy div 6*4+5,
          getmaxx div 6*5+5,
          getmaxy div 6*5+5);
     setfillstyle(1,10);
     bar (getmaxx div 6,
         getmaxy div 6 * 4,
         getmaxx div 6 * 5,
         getmaxy div 6*5+5);
     setcolor(0);
     settextjustify(1,1);
     settextstyle(3,0,4);
     outtextxy(getmaxx div 2,
               getmaxy div 12 * 9,
               'We proudly present:');
     delay(15000);
     clearviewport;
     clrscr;
     xx := 0;
     yy := 0;
     sp := 0;
     z1 := 0;
     i := 0;
     treiber := 0;
     modus := 0;
     fehler := 0;
     pfad := '';
     clrscr;
     pfad := '';
     treiber := Detect;
     initgraph (treiber, modus, pfad);
     fehler:= graphresult;
     if fehler = 0 then
     begin
          for i:=1 to 500 do
          begin
               setcolor (random(15));
               line (getmaxx div 2, getmaxy div 2, random(getmaxx), random(getmaxy));
          end;
          delay(5000);
          setcolor(12);
          setfillstyle(1,4);
          bar (getmaxx div 9, getmaxy div 3, getmaxx div 9*8, getmaxy div 3*2);
          setcolor(15);
          settextjustify (1,1);
          settextstyle(4,0,5);
          outtextxy(getmaxx div 2, getmaxy div 2,'Schîps Chaoten-Software');
          settextstyle(2,0,8);
          delay(15000);
          clrscr;
          xx := 0;
          yy := 0;
          sp := 0;
          z1 := 0;
     i := 0;
     treiber := 0;
     modus := 0;
     fehler := 0;
     pfad := '';
     clrscr;
     pfad := '';
     treiber := Detect;
     initgraph (treiber, modus, pfad);
     fehler:= graphresult;
     if fehler = 0 then
     begin
          for i:=1 to 500 do
          begin
               setcolor (random(15));
               line (getmaxx div 2, getmaxy div 2, random(getmaxx), random(getmaxy));
          end;
          delay(5000);
          setcolor(12);
          setfillstyle(1,4);
          bar (getmaxx div 9, getmaxy div 3, getmaxx div 9*8, getmaxy div 3*2);
          setcolor(15);
          settextjustify (1,1);
          settextstyle(4,0,5);
          outtextxy(getmaxx div 2, getmaxy div 2,'und');
          settextstyle(2,0,8);
          delay(8000);
          clrscr;
          xx := 0;
     yy := 0;
     sp := 0;
     z1 := 0;
     i := 0;
     treiber := 0;
     modus := 0;
     fehler := 0;
     pfad := '';
     clrscr;
     pfad := '';
     treiber := Detect;
     initgraph (treiber, modus, pfad);
     fehler:= graphresult;
     if fehler = 0 then
     begin
          for i:=1 to 500 do
          begin
               setcolor (random(15));
               line (getmaxx div 2, getmaxy div 2, random(getmaxx), random(getmaxy));
          end;
          delay(5000);
          setcolor(12);
          setfillstyle(1,4);
          bar (getmaxx div 9, getmaxy div 3, getmaxx div 9*8, getmaxy div 3*2);
          setcolor(15);
          settextjustify (1,1);
          settextstyle(4,0,5);
          outtextxy(getmaxx div 2, getmaxy div 2,'Enjoy-Soft');
          delay(30000);
          clearviewport;
          closegraph;
     clrscr;
     wp ('Guten Tag. Ich bin ein einzigartiges Program, da· Ihren Wohnort',5,5);
     wp ('auf SchÑdliche EinflÅsse und Wirkungen untersuchen kann.',5,6);
     melodie;
     wp ('Mîchten Sie eine öberprÅfung Ihres Wohnortes ? (J/N) ',5,7);
     readln (a1);
     if (a1 = 'j') or
        (a1 = 'J') then
     begin
          clrscr;
          wp ('Na schîn, dann geben Sie doch bitte Ihre Adresse samt Post-',5,5);
          wp ('leitzahl ein.',5,6);
          wp ('Zum Beispiel so: Bespielstra·e 1, 00000 Beispielstadt',5,7);
          wp ('Bitte geben Sie jetzt hier ein:',5,9);
          gotoxy (5,11);
          readln (a2);
          if (a2 = 'Breddorfer Moor') then
          begin
               clrscr;
               wp ('Sehr schîn. Einen Moment!',5,5);
               delay (20000);
               wp ('Aha. da hab ichÔs ja. Sehr gesunde Luft, keine Schadstoffe im Boden,',5,6);
               wp ('und auch sonst nur zu empfehlen !!',5,7);
               melodie;
               pause;

          end
          else
          begin
               clrscr;
               wp ('Sehr schîn. Einen Moment!',5,5);
               delay (20000);
               wp ('Soso. Das ist aber gar nicht gut !',1,5);
               writeln ('Soll ich mal aufzÑhlen?');
               writeln ('1. Ehemaliges AtommÅllendlager unterm Haus');
               writeln ('2. Hohe Ausdunstung von GÑrgasen');
               writeln ('(Kleiner Tip: Essen Sie weniger HÅlsenfrÅchte!)');
               writeln ('und');
               writeln ('3. Hohe Elektromagnetische Felder');
               writeln ('Oh Gott! Na wenigstens Punkt drei kann ich beheben!');
               writeln ('');
               writeln ('BITTE VERLASSEN SIE DEN RAUM !!');
               WRITELN ('COMPUTER ZERSTôRT SICH IN 30 SEKUNDEN SELBST !!');
               pause;
               clrscr;
               wp ('COUNTDOWN LéUFT !! NOCH 30 SEKUNDEN !!',5,5);
               sound (1200);
               delay (10000);
               nosound;
               clrscr;
               delay (50000);
          end;
     end
     else
     begin
          clrscr;
          wp ('Na dann, auf Wiedersehen.',5,5);
          pause;
     end;
end;
end;
end;
end.