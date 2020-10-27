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
  outtextxy(120,15,'Bewegung der Galileischen Monde um den Jupiter');
  outtextxy(420,430,'pause -> p');
  outtextxy(415,440,'weiter -> w');
  outtextxy(350,450,'doppelte Geschwindigkeit -> d');
  outtextxy(370,460,'halbe Geschwindigkeit -> h');
  outtextxy(410,470,'beenden -> b');
  outtextxy(60,450,'Tage:');
  outtextxy(60,460,'Stunden:');
  setcolor(14);
  outtextxy(90,320,'(1) : Io');
  setcolor(12);
  outtextxy(90,330,'(2) : Europa');
  setcolor(11);
  outtextxy(90,340,'(3) : Ganymed');
  setcolor(9);
  outtextxy(90,350,'(4) : Kallisto');
  setcolor(15);
  line(70,30,570,30);
  line(70,420,570,420);
  line(70,30,70,420);
  line(570,30,570,420);
  line(70,380,570,380);
end;


procedure umlauf;
begin
  r1:=42.2/1.2;
  r2:=67.1/1.2;
  r3:=107.1/1.2;
  r4:=188.3/1.2;

  t1:=1.769;
  t2:=3.551;
  t3:=7.155;
  t4:=16.69;

  t:=0;
  dt:=0.001;
  wahl:=' ';
  x1:=0;x2:=0;x3:=0;x4:=0;
  y1:=r1;y2:=r2;y3:=r3;y4:=r4;
  setcolor(15);setfillstyle(1,15);
  sector(320,200,0,360,7,7);
  sector(320,400,0,360,7,7);

  setcolor(14);setfillstyle(1,14);
  sector(320+round(x1),200-round(y1),0,360,2,2);
  sector(320+round(x1),400,0,360,2,2);

  setcolor(12);setfillstyle(1,12);
  sector(320+round(x2),200-round(y2),0,360,2,2);
  sector(320+round(x2),400,0,360,2,2);

  setcolor(11);setfillstyle(1,11);
  sector(320+round(x3),200-round(y3),0,360,2,2);
  sector(320+round(x3),400,0,360,2,2);

  setcolor(9);setfillstyle(1,9);
  sector(320+round(x4),200-round(y4),0,360,2,2);
  sector(320+round(x4),400,0,360,2,2);

  repeat until keypressed;

  repeat
    phi1:=2*pi/t1*t;phi2:=2*pi/t2*t;phi3:=2*pi/t3*t;phi4:=2*pi/t4*t;
    setcolor(0);setfillstyle(1,0);
    sector(320+round(x1),200-round(y1),0,360,2,2);
    sector(320+round(x2),200-round(y2),0,360,2,2);
    sector(320+round(x3),200-round(y3),0,360,2,2);
    sector(320+round(x4),200-round(y4),0,360,2,2);

    sector(320+round(x1),400,0,360,2,2);
    sector(320+round(x2),400,0,360,2,2);
    sector(320+round(x3),400,0,360,2,2);
    sector(320+round(x4),400,0,360,2,2);

    setcolor(15);

    line(313,400,327,400);

    x1:=r1*sin(phi1);x2:=r2*sin(phi2);x3:=r3*sin(phi3);x4:=r4*sin(phi4);
    y1:=r1*cos(phi1);y2:=r2*cos(phi2);y3:=r3*cos(phi3);y4:=r4*cos(phi4);
    setcolor(14);setfillstyle(1,14);
    sector(320+round(x1),200-round(y1),0,360,2,2);
    sector(320+round(x1),400,0,360,2,2);

    setcolor(12);setfillstyle(1,12);
    sector(320+round(x2),200-round(y2),0,360,2,2);
    sector(320+round(x2),400,0,360,2,2);

    setcolor(11);setfillstyle(1,11);
    sector(320+round(x3),200-round(y3),0,360,2,2);
    sector(320+round(x3),400,0,360,2,2);

    setcolor(9);setfillstyle(1,9);
    sector(320+round(x4),200-round(y4),0,360,2,2);
    sector(320+round(x4),400,0,360,2,2);

    setcolor(15);

    t:=t+dt;
    std:=frac(t)*24;
    setcolor(0);
    outtextxy(100,450,Zeit1);
    outtextxy(120,460,Zeit2);
    setcolor(15);
    str(t:5:0,Zeit1);
    str(std:5:0,Zeit2);
    outtextxy(100,450,Zeit1);
    outtextxy(120,460,Zeit2);
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