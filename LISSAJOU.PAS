program lissajous;
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
  outtextxy(36,340,'dw = ');
  outtextxy(36,360,'w1 = ');
  outtextxy(36,370,'w2 = ');
  outtextxy(28,380,'phi = ');
  outtextxy(20,400,'dphi = ');
  outtextxy(220,390,'x = sin(w1*t) , y = sin(w2*t+phi) , t = 0...1550');
  outtextxy(5,430,'Beenden (b)  w2 erh”hen (w)  dw umkehren (u)  dw verdoppeln (d)  halbieren (h) ');
  outtextxy(30,450,'phi erh”hen (W)  dphi umkehren (U)  dphi verdoppeln (D)  halbieren (H)');
  outtextxy(55,470,'Neustart/Grundeinstellungen fr  w1 , w2  und  phi  „ndern (q)');
delay(20000);
end;

procedure ueberlagerung;
begin
      setcolor(15);
    str(w1:7:4,ortx);
    outtextxy(70,360,ortx);
    str(w2:7:4,orty);
    outtextxy(70,370,orty);
    str(phi:7:4,ortz);
    outtextxy(70,380,ortz);
    str(dphi:7:4,ortz1);
    outtextxy(70,400,ortz1);
    str(dw:7:4,ortz2);
    outtextxy(70,340,ortz2);

  for k := 1 to 31000 do
  begin
    t:=0.05*k;
    putpixel(320+trunc(150*sin(w1*t)),220+trunc(150*sin(w2*t+phi)),14)
  end;
end;

procedure aendern;
begin
    setcolor(0);
    outtextxy(70,360,ortx);
    outtextxy(70,370,orty);
    outtextxy(70,380,ortz);
    outtextxy(70,340,ortz2);
    outtextxy(70,400,ortz1);

  for k := 1 to 31000 do
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
wahl1:=' ';
phi:=pi/2;
dphi:=pi/4;
w1:=0.3;
w2:=0.3;
dw:=0.01;
farbe;
textcolor(14);
gotoxy(25,2);write('Lissajous - Figuren');
gotoxy(3,4);writeln('Vorgegeben sind:   x = 150*sin(w1*t) , y = 150*sin(w2*t+phi)');
gotoxy(3,6);writeln('Verhalten sich die Frequenzen  w1  und  w2  so zueinander wie das Verh„lt-');
gotoxy(3,7);writeln('nis kleiner ganzer Zahlen, so entstehen einfache geschlossene Kurven.');
gotoxy(3,9);writeln('Bsp.:  w1 = w2  und  phi = 0     ->  gerade Linie,');
gotoxy(3,10);writeln('       w1 = w2  und  phi = pi/2  ->  Kreis ,');
gotoxy(3,11);writeln('     w2 = 2*w1                   ->  liegende acht    usw.');
gotoxy(3,13);writeln('In der Simulation ist zun„chst  w1 = w2 = 0.3   und  dw = 0.01   eingestellt. ');
gotoxy(3,14);writeln('Der Wert von  w2  kann beliebig ge„ndert werden, so dass beliebige Zahlver-');
gotoxy(3,15);writeln('h„ltnisse zwischen  w1  und  w2  eingestellt werden k”nnen');
gotoxy(3,18);writeln('Der Wert fr  phi  ist zun„chst auf  phi = pi/2  eingestellt.');
gotoxy(3,19);writeln('der Wert fr  dphi     ist auf      dphi = pi/4  eingestellt.');
gotoxy(3,21);write('Sollen die Werte fr  w1 , w2  und  dw  ge„ndert werden -> („) eingeben  ');
gotoxy(3,22);write('Sollen alle Werte ge„ndert werden -> (a) eingeben  ');

read(wahl1);
case wahl1 of
    '„':
    begin
      gotoxy(20,23);write('w1 = ');
      read(w1);
      gotoxy(40,23);write('w2 = ');
      read(w2);
      gotoxy(60,23);write('dw = ');
      read(dw);
    end;
    'a':
    begin
      gotoxy(20,23);write('w1 = ');
      read(w1);
      gotoxy(40,23);write('w2 = ');
      read(w2);
      gotoxy(60,23);write('dw = ');
      read(dw);
      gotoxy(30,24);write('phi = ');
      read(phi);
      gotoxy(49,24);write('dphi = ');
      read(dphi);
    end;
end;
wahl1:=' ';
repeat until keypressed;

grafik;
setbkcolor(1);
ueberlagerung;
repeat until keypressed;
 repeat
    wahl:=' ';
    if keypressed then  wahl:=readkey;
    case wahl of
    'h':
    begin
      aendern;
      dw:=dw/2;
      w2:=w2+dw;
      ueberlagerung;
      wahl:=' ';
    end;
    'd':
    begin
      aendern;
      dw:=dw*2;
      w2:=w2+dw;
      ueberlagerung;
      wahl:=' ';
    end;
    'H':
    begin
      aendern;
      dphi:=dphi/2;
      phi:=phi+dphi;
      ueberlagerung;
      wahl:=' ';
    end;
    'D':
    begin
      aendern;
      dphi:=dphi*2;
      phi:=phi+dphi;
      ueberlagerung;
      wahl:=' ';
    end;
    'u':
    begin
      aendern;
      dw:=-dw;
      w2:=w2+dw;
      ueberlagerung;
      wahl:=' ';
    end;
    'U':
    begin
      aendern;
      dphi:=-dphi;
      phi:=phi+dphi;
      ueberlagerung;
      wahl:=' ';
    end;
    'b':exit;
    'w':
    begin
     aendern;
     w2:=w2+dw;
     ueberlagerung;
    end;
    'W':
    begin
      aendern;
      phi:=phi+dphi;
      ueberlagerung;
      wahl:=' ';
    end;
 end;
until wahl='q';
setcolor(14);

outtextxy(130,50,'Zum Wiederholen  <w>  eingeben, zum Beenden  <b>');
repeat until keypressed;
    if keypressed then wahl:=readkey;
until wahl='b';

end.