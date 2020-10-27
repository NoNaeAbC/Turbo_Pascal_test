program planetenbewegung;
uses crt,graph;
var
  treiber,modus:integer;
  r1,r2,r3,r4,r5,t1,t2,t3,t4,t5,t,dt,phi1,phi2,phi3,phi4,phi5,
  x1,x2,x3,x4,x5,y1,y2,y3,y4,y5:real;
  wahl:char;
  Zeit:string;

procedure graphik;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(1);
  setcolor(15);
  outtextxy(180,30,'Bewegung der Planeten um die Sonne');
  outtextxy(470,430,'pause -> p');
  outtextxy(465,440,'weiter -> w');
  outtextxy(400,450,'doppelte Geschwindigkeit -> d');
  outtextxy(420,460,'halbe Geschwindigkeit -> h');
  outtextxy(460,470,'beenden -> b');
  outtextxy(10,450,'Tage:');
end;

procedure umlauf;
begin
  r1:=57.94/3;
  r2:=108.27/3;
  r3:=149.68/3;
  r4:=228.06/3;
  r5:=414.20/3;
  t1:=87.95;
  t2:=224.71;
  t3:=365.26;
  t4:=686.97;
  t5:=4332.61;
  t:=0;
  dt:=0.01;
  wahl:=' ';
  x1:=0;x2:=0;x3:=0;x4:=0;x5:=0;
  y1:=r1;y2:=r2;y3:=r3;y4:=r4;y5:=r5;
  setcolor(15);setfillstyle(1,15);
  sector(320,240,0,360,5,5);
  setcolor(14);setfillstyle(1,14);
  outtextxy(20,410,'Merkur');
  sector(320+round(x1),240-round(y1),0,360,1,1);
  setcolor(9);setfillstyle(1,9);
  outtextxy(120,410,'Venus');
  sector(320+round(x2),240-round(y2),0,360,2,2);
  setcolor(6); setfillstyle(1,6);
  outtextxy(220,410,'Erde');

  sector(320+round(x3),240-round(y3),0,360,2,2);
  setcolor(12);setfillstyle(1,12);
  outtextxy(320,410,'Mars');
  sector(320+round(x4),240-round(y4),0,360,1,1);
  setcolor(11); setfillstyle(1,11);
  outtextxy(420,410,'Jupiter');
  sector(320+round(x5),240-round(y5),0,360,3,3);
  repeat until keypressed;
  repeat
    phi1:=2*pi/t1*t;phi2:=2*pi/t2*t;phi3:=2*pi/t3*t;phi4:=2*pi/t4*t;phi5:=2*pi/t5*t;
    setcolor(0);setfillstyle(1,0);
    sector(320+round(x1),240-round(y1),0,360,1,1);
    sector(320+round(x2),240-round(y2),0,360,2,2);
    sector(320+round(x3),240-round(y3),0,360,2,2);
    sector(320+round(x4),240-round(y4),0,360,1,1);
    sector(320+round(x5),240-round(y5),0,360,3,3);

    x1:=r1*sin(phi1);x2:=r2*sin(phi2);x3:=r3*sin(phi3);x4:=r4*sin(phi4);x5:=r5*sin(phi5);
    y1:=r1*cos(phi1);y2:=r2*cos(phi2);y3:=r3*cos(phi3);y4:=r4*cos(phi4);y5:=r5*cos(phi5);
  setcolor(14);setfillstyle(1,14);
  sector(320+round(x1),240-round(y1),0,360,1,1);
  setcolor(9);setfillstyle(1,9);
  sector(320+round(x2),240-round(y2),0,360,2,2);
  setcolor(6);setfillstyle(1,6);
  sector(320+round(x3),240-round(y3),0,360,2,2);
  setcolor(12);setfillstyle(1,12);
  sector(320+round(x4),240-round(y4),0,360,1,1);
  setcolor(11); setfillstyle(1,11);
  sector(320+round(x5),240-round(y5),0,360,3,3);
  setcolor(15); setfillstyle(1,15);
    sector(320,240,0,360,5,5);
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