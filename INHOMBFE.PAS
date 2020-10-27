program elektronenimInhomBfeld;
uses crt,graph;

var
treiber,modus:integer;
dt,t,B,Bx,vges,vges2,vx,vx2,vy2,vz2,ax2,ay2,az2,x2,y2,z2,vy,vz,ax,ay,az,x,y,z:real;
Bstart,vxstart,vx2start,vy2start,vz2start,x2start,y2start,z2start,vystart,vzstart,xstart,ystart,zstart:real;
wahl:char;

ortx,orty,ortz,geschwx,geschwy,geschwz,ortx2,orty2,ortz2:string;
geschw1,geschw2,geschwx2,geschwy2,geschwz2:string;

procedure grafik;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(1);
  setcolor(15);

  line(50,240,600,240);
  line(50,240,50,180);
  outtextxy(40,185,'y');
  line(20,270,70,220);
  outtextxy(15,255,'z');
  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  outtextxy(170,15,'Elektronen im inhomogenen Magnetfeld');
  outtextxy(135,460,'Bewegung starten (s)  Pause (p)  Beenden (b)');
  outtextxy(70,470,'Geschwindigkeit der Darstellung verdoppeln (d)  halbieren (h)');
  outtextxy(35,50,' x =');
  outtextxy(35,60,' y =');
  outtextxy(35,70,' z =');
  outtextxy(35,80,'vx =');
  outtextxy(35,90,'vy =');
  outtextxy(35,100,'vz =');
  outtextxy(35,110,' v =');
  outtextxy(610,240,'x');
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
    ax:=(vy*z-vz*y)*B/(x*x+y*y+z*z)/sqrt(x*x+y*y+z*z);   ax2:=(vy2*z2-vz2*y2)*B/(x2*x2+y2*y2+z2*z2)/sqrt(x2*x2+y2*y2+z2*z2);
    ay:=(vz*x-vx*z)*B/(x*x+y*y+z*z)/sqrt(x*x+y*y+z*z);   ay2:=(vz2*x2-vx2*z2)*B/(x2*x2+y2*y2+z2*z2)/sqrt(x2*x2+y2*y2+z2*z2);
    az:=(vx*y-vy*x)*B/(x*x+y*y+z*z)/sqrt(x*x+y*y+z*z);   az2:=(vx2*y2-vy2*x2)*B/(x2*x2+y2*y2+z2*z2)/sqrt(x2*x2+y2*y2+z2*z2);
    vx:=vx+ax*dt;  vx2:=vx2+ax2*dt;
    vy:=vy+ay*dt;  vy2:=vy2+ay2*dt;
    vz:=vz+az*dt;  vz2:=vz2+az2*dt;
    x:=x+vx*dt;    x2:=x2+vx2*dt;
    y:=y+vy*dt;    y2:=y2+vy2*dt;
    z:=z+vz*dt;    z2:=z2+vz2*dt;
    t:=t+dt;
    vges:=sqrt(vx*vx+vy*vy+vz*vz);
    vges2:=sqrt(vx2*vx2+vy2*vy2+vz2*vz2);

    setcolor(0);
    outtextxy(70,50,ortx);         outtextxy(120,50,ortx2);
    outtextxy(70,60,orty);         outtextxy(120,60,orty2);
    outtextxy(70,70,ortz);         outtextxy(120,70,ortz2);
    outtextxy(70,80,geschwx);      outtextxy(120,80,geschwx2);
    outtextxy(70,90,geschwy);      outtextxy(120,90,geschwy2);
    outtextxy(70,100,geschwz);     outtextxy(120,100,geschwz2);
    outtextxy(70,110,geschw1);     outtextxy(120,110,geschw2);

    setcolor(15);
    str(x:5:2,ortx);              str(x2:5:2,ortx2);
    outtextxy(70,50,ortx);        outtextxy(120,50,ortx2);
    str(y:5:2,orty);              str(y2:5:2,orty2);
    outtextxy(70,60,orty);        outtextxy(120,60,orty2);
    str(z:5:2,ortz);              str(z2:5:2,ortz2);
    outtextxy(70,70,ortz);        outtextxy(120,70,ortz2);
    str(vx:5:2,geschwx);          str(vx2:5:2,geschwx2);
    outtextxy(70,80,geschwx);     outtextxy(120,80,geschwx2);
    str(vy:5:2,geschwy);          str(vy2:5:2,geschwy2);
    outtextxy(70,90,geschwy);     outtextxy(120,90,geschwy2);
    str(vz:5:2,geschwz);          str(vz2:5:2,geschwz2);
    outtextxy(70,100,geschwz);    outtextxy(120,100,geschwz2);
    str(vges:5:2,geschw1);        str(vges2:5:2,geschw2);
    outtextxy(70,110,geschw1);     outtextxy(120,110,geschw2);


  {  setcolor(14);setfillstyle(1,14);
    outtextxy(50+round(50*x-0.7*70*z),240-round(70*y-0.7*70*z),'`');  }
    putpixel(50+round(50*x-0.7*70*z),240-round(70*y-0.7*70*z),14);

  {  setcolor(13);setfillstyle(1,13);
    outtextxy(50+round(50*x2-0.7*70*z2),240-round(70*y2-0.7*70*z2),'`');  }
    putpixel(50+round(50*x2-0.7*70*z2),240-round(70*y2-0.7*70*z2),13);

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
until t>=500;
wahl:=readkey;
case wahl of 'b':exit;
end;
end;

{MAIN}
begin

  vxstart:=-0.5;       vx2start:=-0.5;
  vystart:=0;          vy2start:=0;
  vzstart:=0;          vz2start:=-0.08;
  Bstart:=12;
  xstart:=10;          x2start:=10;
  ystart:=2.1;         y2start:=2.1;
  zstart:=0.7;         z2start:=0.7;

  repeat
closegraph;
farbe;
textcolor(14);


gotoxy(20,2);write('Elektronen im inhomogenen Magnetfeld');
gotoxy(4,4);writeln('Diese Simulation zeigt die RÅckstreuung von geladenen Teilchen, wie');
gotoxy(4,5);writeln('es auch im Erdfeld in der NÑhe der Pole geschieht');
gotoxy(2,7);writeln('Bsp.: vx=-0.5 (a)   vy=0 (b)   vz=0     (c)  x=10  (d)   y=2.1 (e)   z=0.7 (f)');
gotoxy(2,8);writeln('     vx2=-0.5 (A)  vy2=0 (B)  vz2=-0.08 (C)  x2=10 (D)  y2=2.1 (E)  z2=0.7 (F)');
gotoxy(2,9);writeln('       B=12 (g)');
gotoxy(4,11);writeln('Sollen einzelne der gegebenen Werte geÑndert werden, so den entsprechenden');
gotoxy(4,12);writeln('Buchstaben wÑhlen');
gotoxy(4,13);writeln('Das obige Beispiel ist unter (0) abgespeichert, weitere unter (1) und (2)');
gotoxy(4,14);writeln('Bei "Wiederholung" gelten die Werte der vorhergehenden Runde als Startwerte');
gotoxy(8,15);write('Um alle vorgeschlagenen Daten zu Ñndern: (Ñ)        ');
   readln(wahl);
    case wahl of
    '0':
    begin
      vxstart:=-0.5;       vx2start:=-0.5;
      vystart:=0;          vy2start:=0;
      vzstart:=0;          vz2start:=-0.08;
      Bstart:=12;
      xstart:=10;          x2start:=10;
      ystart:=2.1;         y2start:=2.1;
      zstart:=0.7;         z2start:=0.7;
      wahl:=' ';
    end;
    '1':
    begin
      vxstart:=-0.5;       vx2start:=-0.5;
      vystart:=-0.08;          vy2start:=0;
      vzstart:=0;          vz2start:=-0.08;
      Bstart:=12;
      xstart:=10;          x2start:=10;
      ystart:=2.1;         y2start:=2.1;
      zstart:=0.7;         z2start:=0.7;
      wahl:=' ';
    end;
    '2':
    begin
      vxstart:=-0.5;       vx2start:=-0.5;
      vystart:=0.05;          vy2start:=0;
      vzstart:=0;          vz2start:=-0.08;
      Bstart:=12;
      xstart:=10;          x2start:=10;
      ystart:=2.1;         y2start:=2.1;
      zstart:=0.7;         z2start:=0.7;
      wahl:=' ';
    end;
    '3':
    begin
      vxstart:=-2.5;       vx2start:=-2.5;
      vystart:=1;          vy2start:=0;
      vzstart:=0;          vz2start:=-1;
      Bstart:=14;
      xstart:=3;          x2start:=3;
      ystart:=0;         y2start:=0;
      zstart:=0;         z2start:=0;
      wahl:=' ';
    end;
    '4':
    begin
      vxstart:=0;       vx2start:=0;
      vystart:=1;          vy2start:=1;
      vzstart:=0;          vz2start:=-0.8;
      Bstart:=18;
      xstart:=1;          x2start:=1;
      ystart:=0;         y2start:=0;
      zstart:=0;         z2start:=0;
      wahl:=' ';
    end;
    'g':
    begin
    gotoxy(10,16);write('B= ');
    read(Bstart);
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
    'Ñ':
    begin
    gotoxy(10,16);write('B= ');
    read(Bstart);
gotoxy(10,17);write('vx = ');
read(vxstart);
gotoxy(30,17);write('vy = ');
read(vystart);
gotoxy(50,17);write('vz = ');
read(vzstart);
gotoxy(11,18);write('x = ');
read(xstart);
gotoxy(31,18);write('y = ');
read(ystart);
gotoxy(51,18);write('z = ');
read(zstart);
gotoxy(9,20);write('vx2 = ');
read(vx2start);
gotoxy(29,20);write('vy2 = ');
read(vy2start);
gotoxy(49,20);write('vz2 = ');
read(vz2start);
gotoxy(10,21);write('x2 = ');
read(x2start);
gotoxy(30,21);write('y2 = ');
read(y2start);
gotoxy(50,21);write('z2 = ');
read(z2start);
wahl:=' ';
end;
end;

vx:=vxstart;       vx2:=vx2start;
vy:=vystart;          vy2:=vy2start;
vz:=vzstart;          vz2:=vz2start;
B:=Bstart;
x:=xstart;          x2:=x2start;
y:=ystart;         y2:=y2start;
z:=zstart;         z2:=z2start;

repeat until keypressed;

  grafik;
wahl:=' ';

  rechnung;

setcolor(14);
outtextxy(130,390,'Zum Wiederholen  <w>  eingeben, zum Beenden  <b>');
repeat until keypressed;
    if keypressed then  wahl:=readkey;
until wahl='b';

end.

