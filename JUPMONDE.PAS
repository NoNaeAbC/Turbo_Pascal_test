program Jupitermonde;
uses crt,graph;
var
  treiber,modus:integer;
  r1,r2,r3,r4,r5,t1,t2,t3,t4,t5,std,t,dt,phi1,phi2,phi3,phi4,phi5,
  x1,x2,x3,x4,x5,y1,y2,y3,y4,y5:real;
  wahl:char;
  Zeit1,Zeit2:string;

procedure graphik;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(1);
  setcolor(15);
  outtextxy(120,30,'Bewegung der Galileischen Monde um den Jupiter');
  outtextxy(470,430,'pause -> p');
  outtextxy(465,440,'weiter -> w');
  outtextxy(400,450,'doppelte Geschwindigkeit -> d');
  outtextxy(420,460,'halbe Geschwindigkeit -> h');
  outtextxy(460,470,'beenden -> b');
  outtextxy(10,450,'Tage:');
  outtextxy(10,460,'Stunden:');
end;


procedure umlauf;
begin
  r1:=42.2;
  r2:=67.1;
  r3:=107.1;
  r4:=188.3;

  t1:=1.769;
  t2:=3.551;
  t3:=7.155;
  t4:=16.69;

  t:=0;
  dt:=0.001;
  wahl:=' ';
  x1:=0;x2:=0;x3:=0;x4:=0;
  y1:=r1;y2:=r2;y3:=r3;y4:=r4;
  setcolor(15);
  circle(320,240,7);circle(320,240,6);circle(320,240,5);circle(320,240,4);
  circle(320,240,3);circle(320,240,2);circle(320,240,1);
  circle(320+round(x1),240-round(y1),1);
  circle(320+round(x2),240-round(y2),2);
  circle(320+round(x3),240-round(y3),2);
  circle(320+round(x4),240-round(y4),1);

  repeat until keypressed;
  repeat
    phi1:=2*pi/t1*t;phi2:=2*pi/t2*t;phi3:=2*pi/t3*t;phi4:=2*pi/t4*t;
    setcolor(0);
    circle(320+round(x1),240-round(y1),1);
    circle(320+round(x2),240-round(y2),2);
    circle(320+round(x3),240-round(y3),2);
    circle(320+round(x4),240-round(y4),1);

    setcolor(15);
    x1:=r1*sin(phi1);x2:=r2*sin(phi2);x3:=r3*sin(phi3);x4:=r4*sin(phi4);
    y1:=r1*cos(phi1);y2:=r2*cos(phi2);y3:=r3*cos(phi3);y4:=r4*cos(phi4);

    circle(320+round(x1),240-round(y1),1);
    circle(320+round(x2),240-round(y2),2);
    circle(320+round(x3),240-round(y3),2);
    circle(320+round(x4),240-round(y4),1);

    circle(320,240,5);
    t:=t+dt;
    std:=frac(t)*24;
    setcolor(0);
    outtextxy(50,450,Zeit1);
    outtextxy(70,460,Zeit2);
    setcolor(15);
    str(t:5:0,Zeit1);
    str(std:5:0,Zeit2);
    outtextxy(50,450,Zeit1);
    outtextxy(70,460,Zeit2);
    if keypressed then wahl:=readkey;
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
  end;
  until wahl='b';
end;

{Main}
begin
  graphik;
  umlauf;
end.