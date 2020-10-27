program lissajous2;
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
    str(w1:7:4,ortx);
    outtextxy(70,360,ortx);
    str(w2:7:4,orty);
    outtextxy(70,370,orty);

  line(10,40,630,40);
  line(10,420,630,420);
  line(10,40,10,420);
  line(630,40,630,420);
  outtextxy(250,20,'Lissajous-Figuren');

  outtextxy(36,360,'w1 = ');
  outtextxy(36,370,'w2 = ');
  outtextxy(28,390,'phi = ');
  outtextxy(20,400,'dphi = ');
  outtextxy(300,390,'x = sin(w1*t) , y = sin(w2*t+phi) ');
  outtextxy(20,435,'Pause (p)  dphi verdoppeln (d)  halbieren (h)  Drehrichtung Ñndern (u)' );
  outtextxy(25,455,'Beenden (b)  Neustart/Grundeinstellungen fÅr  w1  und  w2  Ñndern (q)');
delay(20000);
end;

procedure ueberlagerung;
begin
    setcolor(15);
    str(phi:7:4,ortz);
    outtextxy(70,390,ortz);
    str(dphi:7:4,ortz1);
    outtextxy(70,400,ortz1);

  for k := 1 to 1500 do
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

  for k := 1 to 1500 do
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
gotoxy(3,4);writeln('Vorgegeben sind:   x = 150*sin(w1*t) , y = 150*sin(w2*t+phi)  .');
gotoxy(3,6);writeln('Verhalten sich die Frequenzen  w1  und  w2  so zueinander wie das VerhÑlt-');
gotoxy(3,7);writeln('nis kleiner ganzer Zahlen, so entstehen einfache geschlossene Kurven.');
gotoxy(3,9);writeln('éndert sich bei einem solchen FrequenzverhÑltnis jedoch permanent die Phase,');
gotoxy(3,10);writeln('so scheint sich die Figur zu drehen. Beim Oszillographen ist dies der Fall,');
gotoxy(3,11);writeln('wenn das FrequenzverhÑltnis ein wenig vom Optimum abweicht.ErklÑrung:');
gotoxy(3,12);writeln('w2~= w2 + dw -> w2~*t = w2*t + dw*t ; also stellt  phi = dw*t  eine linear');
gotoxy(3,13);writeln('verÑnderliche Phase dar. dw  muss klein sein, damit wÑhrend der Triggerzeit');
gotoxy(3,14);writeln('der Elektronenstrahl eine "geschlosene" Kurve durchlÑuft (dh.: w1, w2 und phi');
gotoxy(3,15);writeln('sich als quasi konstant erweisen.)');
gotoxy(3,16);writeln('In der Simulation wird daher phi in konstanten Schritten dphi erhîht.');
gotoxy(3,17);writeln('Um den Einfluss der Phase fÅr die Drehung zu zeigen, eignen sich z.B.:');
gotoxy(3,18);writeln('w1 = w2 = 0.3  (Kreis wird zur Ellipse, dann zum Strich ,...).  Oder:');
gotoxy(3,19);writeln('Eine sich drehende Krone bekommt man bei Wahl von   w1 = 0.1 , w2 = 0.4 .');
gotoxy(3,21);writeln('Sinnvoll fÅr  w1  und  w2  sind Werte zwischen  0.1  und  1  .');
gotoxy(3,22);writeln('FÅr die Simulation sind also zunÑchst  w1  und  w2  einzugeben:');

      gotoxy(30,23);write('w1 = ');
      read(w1);
      gotoxy(30,24);write('w2 = ');
      read(w2);
repeat until keypressed;
phi:=pi/2;
dphi:=pi/100;

grafik;
setbkcolor(1);
ueberlagerung;
repeat until keypressed;
repeat
    wahl:=' ';
    if keypressed then  wahl:=readkey;

        aendern;
        phi:=phi+dphi;
        ueberlagerung;
        case wahl of 'b':halt;
        'p':wahl:=readkey;
        'h':dphi:=dphi/2;
        'd':dphi:=dphi*2;
        'u':dphi:=-dphi;
  end;

until wahl = 'q';
setcolor(14);

outtextxy(130,50,'Zum Wiederholen  <w>  eingeben, zum Beenden  <b>');
repeat until keypressed;
    if keypressed then wahl:=readkey;
until wahl='b';

end.