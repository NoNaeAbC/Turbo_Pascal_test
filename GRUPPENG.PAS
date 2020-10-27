program gruppengeschwindigkeit;
uses crt,graph;

var
treiber,modus,k:integer;
x,l3,l4,c3,c4,l1,l2,c1,c2,dt1,dt,t:real;
wahl:char;
ortx,ortx1,ortx2,ortx3,ortx4,ortx5,ortx6,ortx7:string;

procedure grafik;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
 setbkcolor(1);
    str(l1:4:1,ortx);
    outtextxy(80,110,ortx);
  outtextxy(50,110,'l1 = ');
    str(l2:4:1,ortx1);
    outtextxy(80,120,ortx1);
  outtextxy(50,120,'l2 = ');
    str(c1:4:1,ortx2);
    outtextxy(80,130,ortx2);
  outtextxy(50,130,'c1 = ');
    str(c2:4:1,ortx3);
    outtextxy(80,140,ortx3);
  outtextxy(50,140,'c2 = ');
    str(l3:4:1,ortx4);
    outtextxy(80,280,ortx4);
  outtextxy(50,280,'l3 = ');
    str(l4:4:1,ortx5);
    outtextxy(80,290,ortx5);
  outtextxy(50,290,'l4 = ');
    str(c3:4:1,ortx6);
    outtextxy(80,300,ortx6);
  outtextxy(50,300,'c3 = ');
    str(c4:4:1,ortx7);
    outtextxy(80,310,ortx7);
  outtextxy(50,310,'c4 = ');
  line(10,40,630,40);
  line(10,420,630,420);
  line(10,40,10,420);
  line(630,40,630,420);
  outtextxy(230,20,'Gruppengeschwindigkeit');
  outtextxy(150,450,'Bewegungsdaten Ñndern / wiederholen (q)');
  outtextxy(130,430,'Bewegung starten (s)  Pause (p)  Beenden (b)');
  outtextxy(80,440,'Geschwindigkeit der Darstellung verdoppeln (d)  halbieren (h)');
  delay(17000);
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

procedure eingabe;
    begin
gotoxy(20,20);write('l1 = ');
read(l1);
gotoxy(40,20);write('l2 = ');
read(l2);
gotoxy(20,21);write('c1 = ');
read(c1);
gotoxy(40,21);write('c2 = ');
read(c2);
gotoxy(20,23);write('l3 = ');
read(l3);
gotoxy(40,23);write('l4 = ');
read(l4);
gotoxy(20,24);write('c3 = ');
read(c3);
gotoxy(40,24);write('c4 = ');
read(c4);
wahl:=' ';
end;

{Main}
begin
repeat
closegraph;
farbe;
textcolor(14);
l1:=2.5;
l2:=2.9;
c1:=1;
c2:=1;
l3:=2.5;
l4:=2.9;
c3:=1;
c4:=1.3;
gotoxy(25,2);write('Gruppen- und Phasengeschwindigkeit');
gotoxy(5,4);writeln('Nur wenn die Phasengeschwindigkeit unabhÑngig von der WellenlÑnge ist, ent-');
gotoxy(5,5);writeln('steht bei der öberlagerung von Wellen verschiedener WellenlÑnge ein');
gotoxy(5,6);writeln('Wellenpaket, dessen Ausbreitungsgeschwindigkeit (Gruppengeschwindigkeit)');
gotoxy(5,7);writeln('gleich der Phasengeschwindigkeit ist.');
gotoxy(8,8);writeln('Bsp.: l1 = 2.5 (1)   l2 = 2.9 (2)   c1 = c2 = 1 (3,4) (keine DISPERSION)');
gotoxy(5,10);writeln('Man spricht von NORMALER DISPERSION, wenn fÅr  l2 > l1  gilt: c2 > c1');
gotoxy(8,11);writeln('Bsp.: l3 = 2.5 (5)   l4 = 2.9 (6)   c3 = 1 (7)   c4 = 1.3 (8)');
gotoxy(5,13);writeln('Zur Simulation addieren wir zwei sinusfîrmige Wellen und erhalten:');
gotoxy(8,14);writeln('sin(2*pi*f1*t-2*pi/l1*x)+sin(2*pi*f2*t-2*pi/l2*x)');
gotoxy(5,15);writeln('BerÅcksichtigt man die Beziehung  f*l = c , so erhÑlt man:');
gotoxy(8,16);writeln('sin(2*pi*(c1/l1*t-1/l1*x))+sin(2*pi*(c2/l2*t-1/l2*x))');
gotoxy(5,18);write('EinzelÑnderung mit Hilfe der entsprechenden Zahl, alles Ñndern: (Ñ)   ') ;
   wahl:=' ';
   readln(wahl);
    case wahl of
    'Ñ':eingabe;
    '1':
    begin
    gotoxy(10,20);write('l1= ');
    read(l1);
    wahl:=' ';
    end;
    '2':
    begin
    gotoxy(10,20);write('l2 = ');
    read(l2);
    wahl:=' ';
    end;
    '3':
    begin
gotoxy(10,20);write('c1 = ');
read(c1);
    wahl:=' ';
    end;
    '4':
    begin
gotoxy(10,20);write('c2 = ');
read(c2);
    wahl:=' ';
    end;
    '5':
    begin
gotoxy(10,20);write('l3 = ');
read(l3);
wahl:=' ';
    end;
    '6':
    begin
gotoxy(10,20);write('l4 = ');
read(l4);
    wahl:=' ';
    end;
    '7':
    begin
gotoxy(10,20);write('c3 = ');
read(c3);
    wahl:=' ';
    end;
    '8':
    begin
gotoxy(10,20);write('c4 = ');
read(c4);
    wahl:=' ';
    end;
end;
repeat until keypressed;
          
t:=0;
dt:=1;
grafik;
repeat

 for k:=100 to 300 do
 begin
  x:=0.5*k;
  putpixel(120+k,130+trunc(30*sin(c1/l1*t-1/l1*x)+30*sin(c2/l2*t-1/l2*x)),0);
  putpixel(120+k,300+trunc(30*sin(c3/l3*t-1/l3*x)+30*sin(c4/l4*t-1/l4*x)),0);
 end;

 setbkcolor(1);

 t:=t+dt;
 for k:=100 to 300 do
  begin
  x:=0.5*k;
  putpixel(120+k,130+trunc(30*sin(c1/l1*t-1/l1*x)+30*sin(c2/l2*t-1/l2*x)),14);
  putpixel(120+k,300+trunc(30*sin(c3/l3*t-1/l3*x)+30*sin(c4/l4*t-1/l4*x)),14);
 end;
     if keypressed then  wahl:=readkey;

    case wahl of
    'h':
    begin
      dt:=dt/2;
      wahl:=' ';
    end;
    'd':
    begin
      dt:=dt*2;
      wahl:=' ';
    end;
    'p':wahl:=readkey;
    'b':exit;
   end;

until wahl='q';
setcolor(14);
outtextxy(130,390,'Zum Wiederholen  <w>  eingeben, zum Beenden  <b>');
repeat until keypressed;
    if keypressed then  wahl:=readkey;
until wahl='b';

end.