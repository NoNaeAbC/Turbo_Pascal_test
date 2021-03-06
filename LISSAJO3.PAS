program lissajous3;
uses crt,graph;

var
hilfe,treiber,modus,k:integer;
dphi,phi,w1,w2,dw,t:real;
wahl1,wahl:char;
ortx,orty,ortz,ortz1,ortz2:string;

procedure grafik;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
setbkcolor(1);
  line(10,40,630,40);
  line(10,420,630,420);
  line(10,40,10,420);
  line(630,40,630,420);
  outtextxy(250,20,'Lissajous-Figuren');
  outtextxy(36,350,'dw = ');
  outtextxy(36,360,'w1 = ');
  outtextxy(36,370,'w2 = ');
  outtextxy(28,390,'phi = ');
  outtextxy(20,400,'dphi = ');
  outtextxy(300,390,'x = sin(w1*t) , y = sin(w2*t+phi) ');
  outtextxy(5,435,'Pause (p)  dw verdoppeln (d)  halbieren (h)  umkehren (u)  phi verkleinern (v)' );
  outtextxy(15,455,'Beenden (b)  Neustart/Grundeinstellungen f�r  w1 , w2  und  dw  �ndern (q)');
delay(20000);
end;

procedure ueberlagerung;
begin
    setcolor(15);
    str(phi:7:4,ortz);
    outtextxy(70,390,ortz);
    str(dphi:7:4,ortz1);
    outtextxy(70,400,ortz1);
    str(w1:7:4,ortx);
    outtextxy(70,360,ortx);
    str(w2:7:4,orty);
    outtextxy(70,370,orty);
    str(dw:7:4,ortz2);
    outtextxy(70,350,ortz2);

  for k := 1 to 2000 do
  begin
    t:=0.05*k;
    putpixel(320+trunc(150*sin(w1*t)),220+trunc(150*sin(w2*t+phi)),14)
  end;
end;

procedure aendern;
begin
    setcolor(0);
    outtextxy(70,390,ortz);
    outtextxy(70,400,ortz1);
    outtextxy(70,350,ortz2);
    outtextxy(70,360,ortx);
    outtextxy(70,370,orty);
    outtextxy(70,400,ortz1);

  for k := 1 to 2000 do
  begin
    t:=0.05*k;
    putpixel(320+trunc(150*sin(w1*t)),220+trunc(150*sin(w2*t+phi)),0)
  end;
end;

procedure farbe;
var
  m,n:integer;
  begin
    textbackground(1);
    for m:=1 to 80 do
    begin
      for n:=1 to 25 do
      begin
        gotoxy(m,n);write(' ');
      end;
    end;
  end;



{MAIN}
begin
repeat
closegraph;
farbe;
textcolor(14);
gotoxy(20,2);write('Sich drehende Lissajous - Figuren');
gotoxy(3,4);writeln('Vorgegeben sind:   x = 150*sin(w1*t) , y = 150*sin(w2*t+phi) .');
gotoxy(3,6);writeln('Verhalten sich die Frequenzen  w1  und  w2  so zueinander wie das Verh�lt-');
gotoxy(3,7);writeln('nis kleiner ganzer Zahlen, so entstehen einfache geschlossene Kurven.');
gotoxy(3,9);writeln('Erh�ht man beim Oszillographen langsam die Frequenz, so scheint sich die ');
gotoxy(3,10);writeln('Figur - falls man in der N�he eines optimalen Frequenzverh�ltnisses ist -');
gotoxy(3,11);writeln('zun�chst in die eine Richtung, dann in die andere zu drehen. Die Erkl�rung');
gotoxy(3,12);writeln('ist wieder in  phi = dw*t  zu finden. Entfernt man sich zu weit vom optimalen');
gotoxy(3,13);writeln('Frequenzverh�ltnis, so ist die durchlaufene Kurve nicht mehr geschlossen. Dh.:');
gotoxy(3,14);writeln('Auch �nderungen im Unterschied von  w1  und  w2  �u�ern sich z.T. als Drehung.');
gotoxy(3,16);writeln('Sinnvoll f�r  w1  und  w2  sind Werte zwischen  0.1  und  1  .');
gotoxy(3,17);writeln('dw sollte in der Gr��enordnung von  0.0001  oder kleiner gew�hlt werden.');
gotoxy(3,19);writeln('Geeignet sind z.B.:  w1 = 0.2 , w2 = 0.295 bzw. 0.495  und  dw = 0.0001.');
gotoxy(3,21);writeln('F�r die Simulation sind also zun�chst  w1 , w2  und  dw  einzugeben:');

      gotoxy(30,22);write('w1 = ');
      read(w1);
      gotoxy(30,23);write('w2 = ');
      read(w2);
      gotoxy(30,24);write('dw = ');
      read(dw);
repeat until keypressed;
phi:=pi/2;
dphi:=pi/8;

grafik;
setbkcolor(1);
ueberlagerung;
repeat until keypressed;
repeat
    wahl:=' ';
    if keypressed then  wahl:=readkey;

        aendern;
        w2:=w2+dw;
        ueberlagerung;
        case wahl of 'b':halt;
        'p':wahl:=readkey;
        'h':dw:=dw/2;
        'd':dw:=dw*2;
        'u':dw:=-dw;
        'v':phi:=phi-dphi;
  end;

until wahl = 'q';
setcolor(14);

outtextxy(130,50,'Zum Wiederholen  <w>  eingeben, zum Beenden  <b>');
repeat until keypressed;
    if keypressed then wahl:=readkey;
until wahl='b';

end.