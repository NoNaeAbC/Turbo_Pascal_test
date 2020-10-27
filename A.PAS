program a;
uses crt,graph;
var
  k,treiber,modus:integer;
  v,x,t,dt:real;
  ortx1,ortx2,ortx3:string;

procedure graphik;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(1);
  setcolor(15);
  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  outtextxy(400,380,'v =        m/s');
  outtextxy(400,400,'t =        s');
  outtextxy(400,420,'x =        m');
  outtextxy(235,15,'Gleichf”rmige Bewegung ');
end;

procedure setz;
begin
  setcolor(15);
  str(t:4:2,ortx2);
  outtextxy(445,400,ortx2);
  str(x:4:2,ortx3);
  outtextxy(445,420,ortx3);
  setfillstyle(1,12);
  sector(100+round(80*x),240,0,360,3,3);
end;

procedure loesch;
begin
  setcolor(1);
  setfillstyle(1,1);
  sector(100+round(80*x),240,0,360,3,3);
  outtextxy(445,400,ortx2);
  outtextxy(445,420,ortx3);
end;

{MAIN}
begin
  graphik;

v:=1.5;
  str(v:4:2,ortx1);
  outtextxy(445,380,ortx1);
  t:=0;
dt:=0.001;
  x:=v*t;

setz;
delay(30000);
repeat
  loesch;
  t:=t+dt;
  x:=v*t;
  setz;
until x>=5;
repeat until keypressed;

end.