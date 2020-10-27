program kreisbahn;
uses crt,graph;
var
  treiber,modus:integer;
  r,rmond,t,dt,phi,alpha,xmond,ymond,x,y:real;
  wahl:char;
  Zeit:string;

procedure graphik;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(1);
  setcolor(15);
  outtextxy(220,30,'Erde-Mond-Bewegung um die Sonne');
  outtextxy(470,430,'pause -> p');
  outtextxy(465,440,'weiter -> w');
  outtextxy(400,450,'doppelte Geschwindigkeit -> d');
  outtextxy(420,460,'halbe Geschwindigkeit -> h');
  outtextxy(460,470,'beenden -> b');
  outtextxy(10,450,'Tage:');
end;

procedure umlauf;
begin
  r:=150;
  rmond:=10;
  t:=0;
  dt:=0.01;
  wahl:=' ';
  x:=0;
  xmond:=0;
  ymond:=rmond;
  y:=r;

  setcolor(14);setfillstyle(1,14);
  sector(320,240,0,360,7,7);

  setcolor(11);setfillstyle(1,11);
  sector(320+round(x),240-round(y),0,360,3,3);

  setcolor(15);setfillstyle(1,15);
  sector(320+round(x+xmond),240-round(y+ymond),0,360,2,2);

  repeat until keypressed;
  repeat
    phi:=2*pi/365*t;
    alpha:=2*pi/28*t;
    setcolor(0);
    sector(320+round(x),240-round(y),0,360,3,3);
    sector(320+round(x+xmond),240-round(y+ymond),0,360,2,2);

    
    setcolor(11);setfillstyle(1,11);
    x:=r*sin(phi);
    y:=r*cos(phi);
    xmond:=rmond*sin(alpha);
    ymond:=rmond*cos(alpha);
    sector(320+round(x),240-round(y),0,360,3,3);

    setcolor(15);setfillstyle(1,15);
    sector(320+round(x+xmond),240-round(y+ymond),0,360,2,2);

    setcolor(14);setfillstyle(1,14);
    sector(320,240,0,360,7,7);
    t:=t+dt;
    setcolor(0);
    outtextxy(50,450,Zeit);
    setcolor(15);
    str(t:5:0,Zeit);
    outtextxy(50,450,Zeit);
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