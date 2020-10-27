program elektronenimhomBfeld;
uses crt,graph;

var
treiber,modus:integer;
vges,vges2,dt,t,Bx,vx,vx2,vy2,vz2,ax2,ay2,az2,x2,y2,z2,vy,vz,ax,ay,az,x,y,z:real;
Bxstart,vxstart,vx2start,vy2start,vz2start,x2start,y2start,z2start,vystart,vzstart,xstart,ystart,zstart:real;
wahl:char;
geschwx,geschwy,geschwz,geschwx2,geschwy2,geschwz2,geschw2,geschw,ortx,orty,ortz,ortx2,orty2,ortz2:string;

procedure grafik;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(1);
  setcolor(15);

  line(50,240,600,240);
  outtextxy(610,240,'x');
  line(50,240,50,180);
  outtextxy(40,185,'y');
  line(70,220,20,270);
  outtextxy(15,255,'z');

  outtextxy(50,50,'x');
  outtextxy(50,60,'y');
  outtextxy(50,70,'z');
    outtextxy(50,380,'vx');
    outtextxy(50,390,'vy');
    outtextxy(50,400,'vz');
    outtextxy(50,410,'v');

  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  outtextxy(170,15,'Elektronen im homogenen Magnetfeld');
  outtextxy(135,460,'Bewegung starten (s)  Pause (p)  Beenden (b)');
  outtextxy(70,470,'Geschwindigkeit der Darstellung verdoppeln (d)  halbieren (h)');
delay(20000);

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

procedure rechnung;
begin

  t:=0;
  dt:=0.001;

  wahl:=' ';

  repeat

    ay:=vz*Bx;     ay2:=vz2*Bx;
    az:=-vy*Bx;    az2:=-vy2*Bx;
    vy:=vy+ay*dt;  vy2:=vy2+ay2*dt;
    vz:=vz+az*dt;  vz2:=vz2+az2*dt;
    x:=x+vx*dt;    x2:=x2+vx2*dt;
    y:=y+vy*dt;    y2:=y2+vy2*dt;
    z:=z+vz*dt;    z2:=z2+vz2*dt;
    t:=t+dt;
    vges:=sqrt(vx*vx+vy*vy+vz*vz);
    vges2:=sqrt(vx2*vx2+vy2*vy2+vz2*vz2);

    setcolor(14);setfillstyle(1,14);
    outtextxy(100+round(10*x-0.7*50*z),240-round(50*y-0.7*50*z),'`');

    setcolor(13);setfillstyle(1,13);
    outtextxy(100+round(10*x2-0.7*50*z2),240-round(50*y2-0.7*50*z2),'`');


    setcolor(0);
    outtextxy(70,50,ortx);
    outtextxy(70,60,orty);
    outtextxy(70,70,ortz);
    outtextxy(120,50,ortx2);
    outtextxy(120,60,orty2);
    outtextxy(120,70,ortz2);
    outtextxy(70,380,geschwx);
    outtextxy(70,390,geschwy);
    outtextxy(70,400,geschwz);
    outtextxy(70,410,geschw);
    outtextxy(120,380,geschwx2);
    outtextxy(120,390,geschwy2);
    outtextxy(120,400,geschwz2);
    outtextxy(120,410,geschw2);

    setcolor(15);
    str(x:5:2,ortx);
    outtextxy(70,50,ortx);
    str(y:5:2,orty);
    outtextxy(70,60,orty);
    str(z:5:2,ortz);
    outtextxy(70,70,ortz);
    str(x2:5:2,ortx2);
    outtextxy(120,50,ortx2);
    str(y2:5:2,orty2);
    outtextxy(120,60,orty2);
    str(z2:5:2,ortz2);
    outtextxy(120,70,ortz2);
    str(vx:5:2,geschwx);
    outtextxy(70,380,geschwx);
    str(vy:5:2,geschwy);
    outtextxy(70,390,geschwy);
    str(vz:5:2,geschwz);
    outtextxy(70,400,geschwz);
    str(vges:5:2,geschw);
    outtextxy(70,410,geschw);
    str(vx2:5:2,geschwx2);
    outtextxy(120,380,geschwx2);
    str(vy2:5:2,geschwy2);
    outtextxy(120,390,geschwy2);
    str(vz2:5:2,geschwz2);
    outtextxy(120,400,geschwz2);
    str(vges2:5:2,geschw2);
    outtextxy(120,410,geschw2);

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
until t>=50;
wahl:=readkey;
case wahl of 'b':exit;
end;
end;

{MAIN}
begin
  vxstart:=1;      vx2start:=1;
  vystart:=1;      vy2start:=1.5;
  vzstart:=0;      vz2start:=0;
  Bxstart:=1;
  xstart:=1;       x2start:=1;
  ystart:=0;       y2start:=0;
  zstart:=0;       z2start:=0;

repeat
closegraph;
farbe;
textcolor(14);

gotoxy(20,2);write('Elektronen im homogenen Magnetfeld');
gotoxy(4,4);writeln('Elektronen, die im gleichen Punkt starten und die gleiche Geschwindigkeit');
gotoxy(4,5);writeln('in Feldlinienrichtung aufweisen, treffen sich nach einem Umlauf wieder im');
gotoxy(4,6);writeln('gleichen Punkt. (Prinzip einer magnetischen Linse.)');
gotoxy(2,8);writeln('Bsp.: vx=1 (a)   vy=1   (b)  vz=0 (c)   x=1 (d)   y=0 (e)   z=0 (f)   Bx=1 (g)');
gotoxy(2,9);writeln('     vx2=1 (A)  vy2=1.5 (B) vz2=0 (C)  x2=1 (D)  y2=0 (E)  z2=0 (F)');
gotoxy(4,11);writeln('Sollen einzelne der gegebenen Werte ge„ndert werden, so den entsprechenden');
gotoxy(4,12);writeln('Buchstaben w„hlen.');
gotoxy(4,13);writeln('Das obige Beispiel ist unter (0) abgespeichert, weitere unter (1) bis (4).');
gotoxy(4,14);writeln('Bei "Wiederholung" gelten die Werte der vorhergehenden Runde als Startwerte.');
gotoxy(8,15);write('Um alle vorgeschlagenen Daten zu „ndern: („)        ');

   readln(wahl);
    case wahl of
    '0':
    begin
  vxstart:=1;      vx2start:=1;
  vystart:=1;      vy2start:=1.5;
  vzstart:=0;      vz2start:=0;
  Bxstart:=1;
  xstart:=1;       x2start:=1;
  ystart:=0;       y2start:=0;
  zstart:=0;       z2start:=0;
      wahl:=' ';
    end;
    '1':
    begin
      vxstart:=1.5;       vx2start:=1.5;
      vystart:=1.8;          vy2start:=1.1;
      vzstart:=0;          vz2start:=-0.5;
      Bxstart:=2;
      xstart:=1;          x2start:=1;
      ystart:=-1;         y2start:=-1;
      zstart:=0;         z2start:=0;
      wahl:=' ';
    end;
    '2':
    begin
      vxstart:=1.5;       vx2start:=1.5;
      vystart:=0.5;          vy2start:=0;
      vzstart:=2;          vz2start:=-1.5;
      Bxstart:=2;
      xstart:=1;          x2start:=1;
      ystart:=-0.1;         y2start:=-0.1;
      zstart:=-0.7;         z2start:=-0.7;
      wahl:=' ';
    end;
    '3':
    begin
      vxstart:=0.9;       vx2start:=0.9;
      vystart:=-2.5;          vy2start:=0.5;
      vzstart:=2;          vz2start:=-0.5;
      Bxstart:=2;
      xstart:=5;          x2start:=5;
      ystart:=0;         y2start:=0;
      zstart:=0;         z2start:=0;
      wahl:=' ';
    end;
    '4':
    begin
      vxstart:=10.5;       vx2start:=10.5;
      vystart:=0.5;          vy2start:=-0.5;
      vzstart:=2;          vz2start:=-1.5;
      Bxstart:=2;
      xstart:=1;          x2start:=1;
      ystart:=0;         y2start:=0;
      zstart:=0;         z2start:=0;
      wahl:=' ';
    end;
    'g':
    begin
    gotoxy(10,16);write('Bx= ');
    read(Bxstart);
    wahl:=' ';
    end;
    'a':
    begin
    gotoxy(10,17);write('vx = ');
    read(vxstart);
    wahl:=' ';
    end;
    'b':
    begin
gotoxy(30,17);write('vy = ');
read(vystart);
    wahl:=' ';
    end;
    'c':
    begin
gotoxy(50,17);write('vz = ');
read(vzstart);
    wahl:=' ';
    end;
    'd':
    begin
gotoxy(11,18);write('x = ');
read(xstart);
wahl:=' ';
    end;
    'e':
    begin
gotoxy(31,18);write('y = ');
read(ystart);
    wahl:=' ';
    end;
    'f':
    begin
gotoxy(51,18);write('z = ');
read(zstart);
    wahl:=' ';
    end;
    'A':
    begin
gotoxy(9,20);write('vx2 = ');
read(vx2start);
    wahl:=' ';
    end;
    'B':
    begin
gotoxy(29,20);write('vy2 = ');
read(vy2start);
    wahl:=' ';
    end;
    'C':
    begin
gotoxy(49,20);write('vz2 = ');
read(vz2start);
    wahl:=' ';
    end;
    'D':
    begin
gotoxy(10,21);write('x2 = ');
read(x2start);
    wahl:=' ';
    end;
    'E':
    begin
gotoxy(30,21);write('y2 = ');
read(y2start);
    wahl:=' ';
    end;
    'F':
    begin
gotoxy(50,21);write('z2 = ');
read(z2start);
    wahl:=' ';
    end;
    '„':
    begin
    gotoxy(10,14);write('Bx= ');
    read(Bx);
gotoxy(10,15);write('vx = ');
read(vx);
gotoxy(30,15);write('vy = ');
read(vy);
gotoxy(50,15);write('vz = ');
read(vz);
gotoxy(11,16);write('x = ');
read(x);
gotoxy(31,16);write('y = ');
read(y);
gotoxy(51,16);write('z = ');
read(z);
gotoxy(9,18);write('vx2 = ');
read(vx2);
gotoxy(29,18);write('vy2 = ');
read(vy2);
gotoxy(49,18);write('vz2 = ');
read(vz2);
gotoxy(10,19);write('x2 = ');
read(x2);
gotoxy(30,19);write('y2 = ');
read(y2);
gotoxy(50,19);write('z2 = ');
read(z2);
wahl:=' ';
end;
end;

vx:=vxstart;       vx2:=vx2start;
vy:=vystart;          vy2:=vy2start;
vz:=vzstart;          vz2:=vz2start;
Bx:=Bxstart;
x:=xstart;          x2:=x2start;
y:=ystart;         y2:=y2start;
z:=zstart;         z2:=z2start;

repeat until keypressed;

  grafik;
wahl:=' ';
  rechnung;

setcolor(14);
outtextxy(120,425,'Zum Wiederholen  <w>  eingeben, zum Beenden  <b>');
repeat until keypressed;
    if keypressed then  wahl:=readkey;
until wahl='b';

end.

