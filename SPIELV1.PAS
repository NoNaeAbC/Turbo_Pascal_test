
program verkehrsspiel;
uses crt,graph;
var
  treiber,modus,k:integer;
  a,b,c,ystart,ystart1:integer;
  v1,da,dv,y,t0,t,dt,dt1,t1,a1,v:real;
  wahl1,wahl:char;
  ortx9,ortx10,ortx11,ortx12,ortx7,ortx6,ortx8,ortx,ortx1,ortx2,ortx3,ortx4,ortx5:string;

procedure grafik;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
 setbkcolor(1);
    setcolor(14);
      outtextxy(130,380,'Start (s)        Bremsen (x)        Beenden (b)');
    str((a1/3.6):4:1,ortx);
    outtextxy(200,110,ortx);outtextxy(235,110,' m/sý');
    outtextxy(170,110,'a = ');
    str(v:4:0,ortx1);
    outtextxy(200,120,ortx1);outtextxy(235,120,' km/h');
    outtextxy(170,120,'v = ');

      setcolor(15);
      outtextxy(130,60,'Erfahrungswerte fr die Bremsverz”gerung  a  sind:');
      outtextxy(35,75,'trocken: 5,5 bis 7,5 m/sý  nass: 4 bis 6,5 m/sý   Schnee:  2 bis 3 m/sý');
      str(dt:9:5,ortx2);
      outtextxy(430,455,ortx2);outtextxy(505,455,' s');
      outtextxy(400,455,'dt = ');

    str(t1:4:2,ortx9);
    outtextxy(110,415,ortx9);outtextxy(145,415,' s');
    outtextxy(20,415,'Bremszeit: ');
        str(0.5*a1/3.6*t1*t1:7:1,ortx10);
    outtextxy(280,415,ortx10);outtextxy(335,415,' m');
    outtextxy(220,415,'Bremsweg: ');
    outtextxy(95,170,'Maástab fr  10 m :');
    line(270,175,342,175);
    line(270,170,270,180);
    line(342,170,342,180);
  line(10,40,630,40);
  line(10,430,630,430);
  line(10,40,10,430);
  line(630,40,630,430);
  line(10,400,630,400);
  line(30,320,610,320);
  line(30,220,610,220);
    line(40,270,70,270);
    line(100,270,130,270);
    line(160,270,190,270);
    line(220,270,250,270);
    line(280,270,310,270);
    line(340,270,370,270);
    line(400,270,430,270);
    line(460,270,490,270);
    line(520,270,550,270);
    line(580,270,610,270);
  outtextxy(250,20,'Bremse frh genug !!!');
  outtextxy(30,440,'v  erh”hen (V)  verkleinern (v)        dt  verkleinern (t)  erh”hen (T)');
  outtextxy(30,455,'a  erh”hen (A)  verkleinern (a)  ');
end;

procedure g1;
begin
  line(a,300,a+30,300);
  line(a,290,a+30,290);
  line(a,290,a,300);
  line(a+30,290,a+30,300);
  line(a+7,290,a+7,300);
  line(a+20,290,a+20,300);
  line(a+3,288,a+7,288);
  line(a+3,302,a+7,302);
  line(a+22,288,a+26,288);
  line(a+22,302,a+26,302);
end;

procedure g2;
begin
  circle(b,295,3);
  line(b,292,b-2,288);
  line(b,298,b-2,302);
end;


procedure weiter;
    begin
      setcolor(1);
      g1;
      t:=t+dt;
      a:=30+round(2*v*t);
      setcolor(14);
      g1;
    end;


procedure brems;
begin
    setcolor(14);
  line(ystart,280,ystart,250);
    setcolor(12);
    ystart1:=a;
    line(ystart1,280,ystart1,250);
    str(((ystart1-ystart)/v/2):7:2,ortx12);
    outtextxy(520,405,ortx12);outtextxy(575,405,' s');
    outtextxy(420,405,'Reaktionszeit: ');
    str(((ystart1-ystart)/7.2):7:1,ortx11);
    outtextxy(520,415,ortx11);outtextxy(575,415,' m');
    outtextxy(420,415,'Reaktionsweg: ');
  t:=0;

  repeat
    setcolor(1);
    g1;
    t:=t+dt;
    y:=2*(v*t-0.5*a1*t*t);
    a:=ystart1+round(y);
    setcolor(14);
    g1;
  until t>=t1;
end;

procedure spiel;
begin

  setcolor(1);
  line(ystart,280,ystart,250);
    line(ystart1,280,ystart1,250);
    outtextxy(520,415,ortx11);
    outtextxy(520,405,ortx12);
    g2;
  b:=250+random(300);
  c:=30+random(200);
  t:=0;
  t1:=v/a1;
  setcolor(15);
  line(630,40,630,430);
    line(40,270,70,270);
    line(100,270,130,270);
    line(160,270,190,270);
    line(220,270,250,270);
    line(280,270,310,270);
    line(340,270,370,270);
    line(400,270,430,270);
    line(460,270,490,270);
    line(520,270,550,270);
    line(580,270,610,270);
  repeat
    setcolor(1);

    g1;

    t:=t+dt;
    a:=30+round(2*v*t);
    setcolor(14);
    g1;
  until a>=c;
  ystart:=a;
  g2;

wahl1:=' ';

 repeat
    if keypressed then  wahl1:=readkey;
    case wahl1 of
     'x':
     begin
       brems;
       exit;
       wahl:=' ';
     end;
    end;
    weiter;

  until wahl1='e';

end;

{MAIN}
begin
  v:=50;
  dv:=1;
  a1:=27;
  da:=0.36;
  t:=0;
  t1:=v/a1;
  a:=30+round(2*v*t);
  dt:=0.0003;
  dt1:=0.00001;

grafik;

wahl:=' ';

repeat
    if keypressed then  wahl:=readkey;
    case wahl of
    'V':
    begin
      setcolor(1);

    outtextxy(110,415,ortx9);
    outtextxy(280,415,ortx10);
outtextxy(200,120,ortx1);
   if v<200 then
      v:=v+dv
      else
      v:=200;
      t1:=v/a1;
      setcolor(14);
      str(v:4:0,ortx1);
      outtextxy(200,120,ortx1);
      setcolor(15);
    str(t1:4:2,ortx9);
    outtextxy(110,415,ortx9);
    str(0.5*a1/3.6*t1*t1:7:1,ortx10);
    outtextxy(280,415,ortx10);
      wahl:=' ';
    end;
    'v':
    begin
      setcolor(1);

    outtextxy(110,415,ortx9);
    outtextxy(280,415,ortx10);
outtextxy(200,120,ortx1);
   if v>10 then
      v:=v-dv
      else
      v:=10;
      t1:=v/a1;
      setcolor(14);
      str(v:4:0,ortx1);
      outtextxy(200,120,ortx1);
    setcolor(15);
    str(t1:4:2,ortx9);
    outtextxy(110,415,ortx9);
    str(0.5*a1/3.6*t1*t1:7:1,ortx10);
    outtextxy(280,415,ortx10);
      wahl:=' ';
    end;
    'A':
    begin
      setcolor(1);

    outtextxy(110,415,ortx9);
    outtextxy(280,415,ortx10);
outtextxy(200,110,ortx);
  if a1<36 then
      a1:=a1+da
      else
      a1:=36;
      t1:=v/a1;
  setcolor(14);
      str((a1/3.6):4:1,ortx);
      outtextxy(200,110,ortx);
    setcolor(15);
    str(t1:4:2,ortx9);
    outtextxy(110,415,ortx9);
    str(0.5*a1/3.6*t1*t1:7:1,ortx10);
    outtextxy(280,415,ortx10);
      wahl:=' ';
    end;
    'a':
    begin
      setcolor(1);
    outtextxy(110,415,ortx9);
    outtextxy(280,415,ortx10);
      outtextxy(200,110,ortx);
   if a1>1.8 then
      a1:=a1-da
      else
      a1:=1.8;
      t1:=v/a1;
  setcolor(14);
      str((a1/3.6):4:1,ortx);
      outtextxy(200,110,ortx);
    setcolor(15);
    str(t1:4:2,ortx9);
    outtextxy(110,415,ortx9);
    str(0.5*a1/3.6*t1*t1:7:1,ortx10);
    outtextxy(280,415,ortx10);
      wahl:=' ';
    end;
    't':
    begin
      setcolor(1);
      outtextxy(430,455,ortx2);
      if dt>dt1 then
      dt:=dt-dt1
      else
      dt:=dt1;
      setcolor(15);
      str(dt:9:5,ortx2);
      outtextxy(430,455,ortx2);
      wahl:=' ';
    end;
    'T':
    begin
      setcolor(1);
      outtextxy(430,455,ortx2);
      dt:=dt+dt1;
      setcolor(15);
      str(dt:9:5,ortx2);
      outtextxy(430,455,ortx2);
      wahl:=' ';
    end;
    's':
    begin
      spiel;
      wahl:=' ';
    end;
    'b':exit;
   end;

until wahl='b';
end.