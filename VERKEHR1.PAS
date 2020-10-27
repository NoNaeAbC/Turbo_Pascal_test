program verkehr_klasse11;
uses crt,graph;
var
  farbe0,farbe1,farbe,farbe2,farbe3,k,treiber,modus:integer;
  s2,s3,v1,t1,s1,dv,v,v0,vaufprall,sbrems,a,a0,treaktion,tbrems,taufprall,s,x,t,dt:real;
  wahl1,wahl:char;
  ortx1,ortx2,ortx3,ortx4,ortx5,ortx6,ortx7,ortx8:string;
  d,b,c,ystart,ystart1:integer;
  tau,i,entf,da,y,t0,dt1,a1:real;
  ortx9,ortx10,ortx11,ortx12,ortx13,ortx:string;

procedure menue;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(7);
  setcolor(1);
  outtextxy(150,150,'Spiel: "Bremse frh genug"  ->  1');
  outtextxy(50,190,'Aufprallgeschwindigkeit in Abh„ngigkeit von  v0  und  s  ->  2');
  outtextxy(120,230,'Simulation dieser Situation  (Spiel)  ->  3');
  outtextxy(150,270,'Sicherheitsabstand und Halteweg  ->  4');
  outtextxy(150,310,'Der "Zwei - Sekunden - Abstand"  ->  5');
  outtextxy(200,350,'Verkehrsfluss  ->  6');
  outtextxy(400,420,'beenden  ->  b');
end;

procedure graphik1;
begin
  setbkcolor(1);
  setcolor(15);
  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  line(630,30,630,450);
  line(350,280,350,60);
  line(345,180,350,180);
  line(345,80,350,80);
  outtextxy(310,77,'100');
  outtextxy(320,177,'50');
  outtextxy(445,290,'50');
  outtextxy(540,290,'100');
  outtextxy(35,15,'Aufprallgeschwindigkeit in Abh„ngigkeit von  v0 , s  und Reaktionszeit ');
  str(v0*3.6:4:2,ortx1);
  outtextxy(155,70,ortx1);
  outtextxy(30,120,'   Anhalteweg:         m');
  outtextxy(30,140,'  Anhaltezeit:         s');
  outtextxy(60,380,'     Bremsverz”gerung  a =         m/sý   vergr”áern/verkleinern (A/a)');
  outtextxy(60,400,'    Zeit bis zum Aufprall:          s');
  setcolor(14);
  outtextxy(160,470,' Reaktionszeit vergr”áern/verkleinern (R/r)');
  outtextxy(35,15,'                                                         Reaktionszeit ');
  outtextxy(30,100,'Reaktionszeit:         s');
  setcolor(10);
  outtextxy(60,360,'Abstand bis zum Hindernis:          m     vergr”áern/verkleinern (S/s)');
  outtextxy(35,15,'                                                  s ');
  setcolor(13);
  outtextxy(30,70, '          v0 =        km/h');
  outtextxy(35,15,'                                             v0 ');
  outtextxy(510,305,'v0 in km/h');
  outtextxy(60,460,'v0 vergr”áern/verkleinern (V/v)  ');
  setcolor(12);
  outtextxy(35,15,'Aufprallgeschwindigkeit  ');
  outtextxy(310,45,'v(aufprall) in km/h');
  outtextxy(60,420,'          Aufprallgeschw.:         km/h');
  setcolor(15);
  outtextxy(60,460,'                                                     beenden (b) ');
end;

procedure setz;
begin
  tbrems:=-v0/a;
  sbrems:=1/2*a*tbrems*tbrems+v0*(tbrems+treaktion);
  s2:=s-v0*treaktion;
  if s2<=0 then
  begin
    vaufprall:=v0;
    taufprall:=s/v0-treaktion;
  end;

  if s2>0 then
  begin
    if  (tbrems*tbrems+2*s2/a>=0)  then
    begin
      taufprall:=tbrems-sqrt(tbrems*tbrems+2*s2/a);
      vaufprall:=v0+a*taufprall;
    end
    else
    begin
      taufprall:=8999.99;
      vaufprall:=0;
    end;
  end;
  setcolor(13);
  str(v0*3.6:4:2,ortx1);
  outtextxy(155,70,ortx1);
  setcolor(12);
  str(vaufprall*3.6:4:2,ortx4);
  outtextxy(280,420,ortx4);
  setcolor(14);
  str(treaktion:4:2,ortx8);
  outtextxy(155,100,ortx8);
  setcolor(10);
  str(s:4:2,ortx7);
  outtextxy(280,360,ortx7);
  setcolor(15);
  str((tbrems+treaktion):4:2,ortx2);
  outtextxy(155,140,ortx2);
  str(sbrems:4:2,ortx3);
  outtextxy(155,120,ortx3);
  str((treaktion+taufprall):4:2,ortx5);
  outtextxy(280,400,ortx5);
  str(a:4:2,ortx6);
  outtextxy(280,380,ortx6);
end;

procedure loesch;
begin
  setcolor(1);
  outtextxy(155,70,ortx1);
  outtextxy(155,140,ortx2);
  outtextxy(155,120,ortx3);
  outtextxy(280,420,ortx4);
  outtextxy(280,400,ortx5);
  outtextxy(280,380,ortx6);
  outtextxy(280,360,ortx7);
  outtextxy(155,100,ortx8);
end;


procedure k1;
begin
  tbrems:=-v0/a;
  sbrems:=1/2*a*tbrems*tbrems+v0*(tbrems+treaktion);
  s2:=s-v0*treaktion;
  if s2<=0 then vaufprall:=v0;

  if s2>0 then
  begin
    if  (tbrems*tbrems+2*s2/a>=0)  then
    begin
      taufprall:=tbrems-sqrt(tbrems*tbrems+2*s2/a);
      vaufprall:=v0+a*taufprall;
    end
    else
    begin
      vaufprall:=0;
    end;
  end;
  setcolor(farbe);
  setlinestyle(1,0,1);
  line(350+round(2*3.6*v0),280-round(2*3.6*vaufprall),350+round(2*3.6*v0),282);
  setcolor(farbe0);
  line(350+round(2*3.6*v0),280-round(2*3.6*vaufprall),352,280-round(2*3.6*vaufprall));
  setlinestyle(0,0,1);
  setcolor(farbe1);
  line(350,280,600,280);
  line(450,280,450,285);
  line(550,280,550,285);
  v:=0;
  repeat
    v:=v+dv;
      t:=-v/a;
      s1:=1/2*a*t*t+v*(t+treaktion);
      s3:=s-v*treaktion;
      if s3<=0 then v1:=v;
      if s3>0 then
      begin
        if (t*t+2*s3/a<=0)then v1:=0
        else
        begin
          t:=-v/a;
          s1:=1/2*a*t*t+v*(t+treaktion);
          t1:=t-sqrt(t*t+2*s3/a);
          v1:=v+a*t1;
        end;
      end;
    putpixel(350+round(2*3.6*v),280-round(2*3.6*v1),farbe0);
  until v>=35;
end;

procedure kurve;
begin
  farbe:=13;
  farbe0:=12;
  farbe1:=15;
  k1;
end;

procedure kurveweg;
begin
  farbe:=1;
  farbe0:=1;
  farbe1:=15;
  k1;
end;

procedure auswahl;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    'a':
    begin
      loesch;
      kurveweg;
      a:=a+0.1;
      kurve;
      setz;
    wahl:=' ';
    end;
    'A':
    begin
      loesch;
      kurveweg;
      a:=a-0.1;
      kurve;
      setz;
    wahl:=' ';
    end;
    'r':
    begin
     if treaktion>=0.01 then
     begin
      loesch;
      kurveweg;
      treaktion:=treaktion-0.01;
      kurve;
      setz;
     end;
    wahl:=' ';
    end;
    'R':
    begin
      loesch;
      kurveweg;
      treaktion:=treaktion+0.01;
      kurve;
      setz;
    wahl:=' ';
    end;
    's':
    begin
      loesch;
      kurveweg;
      s:=s-0.1;
      kurve;
      setz;
    wahl:=' ';
    end;
    'S':
    begin
      loesch;
      kurveweg;
      s:=s+0.1;
      kurve;
      setz;
    wahl:=' ';
    end;

    'v':
    begin
      if v>=0 then
      begin
        loesch;
        kurveweg;
        v0:=v0-1/3.6/4;
        setz;
        kurve;
      end;
      wahl:=' ';
    end;
    'V':
    begin
      loesch;
      kurveweg;
      v0:=v0+1/3.6/4;
      setz;
      kurve;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure bewegung;
begin
  cleardevice;
    v0:=30/3.6;
    a:=-7.5;
    s:=10;
    treaktion:=0;
    v:=0;
    dv:=0.1;
    graphik1;
    kurve;
    setz;
    auswahl;
  menue;
end;

procedure grafik;
begin
 setbkcolor(1);
    setcolor(14);
  outtextxy(30,440,'v  erh”hen (V)  verkleinern (v)  ');
  outtextxy(30,455,'a  erh”hen (A)  verkleinern (a)  ');
      outtextxy(130,380,'Start (s)        Bremsen (x)        Beenden (b)');
    str((a1/3.6):4:1,ortx);
    outtextxy(200,110,ortx);outtextxy(235,110,' m/sý');
    outtextxy(170,110,'a = ');
    str(v:4:0,ortx1);
    outtextxy(200,120,ortx1);outtextxy(235,120,' km/h');
    outtextxy(170,120,'v = ');
      setcolor(10);
      str(((entf-30)/7.2):4:0,ortx13);
      outtextxy(530,120,ortx13);
      outtextxy(360,120,'Entfernung zum Kind:       m');
      outtextxy(360,140,'  erh”hen/erniedrigen (E/e)');
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
  outtextxy(30,440,'                                       dt  verkleinern (t)  erh”hen (T)');
end;

procedure g1;
begin
  line(d,300,d+30,300);
  line(d,290,d+30,290);
  line(d,290,d,300);
  line(d+30,290,d+30,300);
  line(d+7,290,d+7,300);
  line(d+20,290,d+20,300);
  line(d+3,288,d+7,288);
  line(d+3,302,d+7,302);
  line(d+22,288,d+26,288);
  line(d+22,302,d+26,302);
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
      d:=30+round(2*v*t);
      setcolor(14);
      g1;
    end;


procedure brems;
begin
    setcolor(14);
  line(ystart+30,280,ystart+30,250);
    setcolor(12);
    ystart1:=d;
    line(ystart1+30,280,ystart1+30,250);
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
    d:=ystart1+round(y);
    setcolor(14);
    g1;
  until t>=t1;
end;

procedure spiel;
begin
  setcolor(1);
  line(ystart+30,280,ystart+30,250);
    line(ystart1+30,280,ystart1+30,250);
    outtextxy(520,415,ortx11);
    outtextxy(520,405,ortx12);
    g2;
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
    d:=30+round(2*v*t);
    setcolor(14);
    g1;
  until d>=c;
  ystart:=d;
  b:=ystart+round(entf);
  setcolor(10);
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

procedure p1;
begin
  cleardevice;
  entf:=105;
  v:=30;
  dv:=1;
  a1:=27;
  da:=0.36;
  t:=0;
  t1:=v/a1;
  d:=30+round(2*v*t);
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
    'E':
    begin
      setcolor(1);
      outtextxy(530,120,ortx13);
      entf:=entf+7.2;
      setcolor(10);
      str(((entf-30)/7.2):4:0,ortx13);
      outtextxy(530,120,ortx13);
      wahl:=' ';
    end;
    'e':
    begin
      setcolor(1);
      outtextxy(530,120,ortx13);
      entf:=entf-7.2;
      setcolor(10);
      str(((entf-30)/7.2):4:0,ortx13);
      outtextxy(530,120,ortx13);
      wahl:=' ';
    end;
    's':
    begin
      spiel;
      wahl:=' ';
    end;
    'b':menue;
   end;
until wahl='b';
end;



procedure grafik2;
begin
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
  outtextxy(30,440,'                                       dt  verkleinern (t)  erh”hen (T)');
  setcolor(14);
  outtextxy(30,440,'v  erh”hen (V)  verkleinern (v)   ');
  outtextxy(30,455,'a  erh”hen (A)  verkleinern (a)  ');
  setcolor(15);
end;



procedure weiter2;
    begin
      setcolor(1);
      g1;
      t:=t+dt;
      d:=30+round(2*v*t);
      setcolor(14);
      g1;
    end;


procedure brems2;
begin
    setcolor(14);
  line(ystart,280,ystart,250);
    setcolor(12);
    ystart1:=d;
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
    d:=ystart1+round(y);
    setcolor(14);
    g1;
  until t>=t1;
end;

procedure spiel2;
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
    d:=30+round(2*v*t);
    setcolor(14);
    g1;
  until d>=c;
  ystart:=d;
  g2;

wahl1:=' ';

 repeat
    if keypressed then  wahl1:=readkey;
    case wahl1 of
     'x':
     begin
       brems2;
       exit;
       wahl:=' ';
     end;
    end;
    weiter2;

  until wahl1='e';

end;


procedure p2;
begin
  cleardevice;
  v:=50;
  dv:=1;
  a1:=27;
  da:=0.36;
  t:=0;
  t1:=v/a1;
  a:=30+round(2*v*t);
  dt:=0.0003;
  dt1:=0.00001;

grafik2;

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
      spiel2;
      wahl:=' ';
    end;
    'b':menue;
   end;

until wahl='b';
end;

procedure graphik11;
begin
  setbkcolor(1);
  setcolor(15);
  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);

  line(100,361,600,361);
  outtextxy(540,370,'v0 in km/h');
  line(100,360,100,80);
  setcolor(12);
  outtextxy(40,60,'s[min] ');
  setcolor(14);
  outtextxy(40,60,'           H ');
  setcolor(15);
  outtextxy(40,60,'       und   in m');
  for k:=1 to 4 do
  begin
    str(50*k:2,ortx1);
    outtextxy(93+k*100,370,ortx1);
    line(100+k*100,361,100+k*100,365);
  end;
  for k:=1 to 5 do
  begin
    str(50*k:2,ortx1);
    outtextxy(65,357-k*50,ortx1);
    line(100,360-k*50,95,360-k*50);
  end;
  for k:=1 to 3 do
  begin
  line(250+k*100,60,265+k*100,60);
  line(250+k*100,64,265+k*100,64);
  line(250+k*100,60,250+k*100,64);
  line(265+k*100,60,265+k*100,64);
  line(254+k*100,60,254+k*100,64);
  line(260+k*100,60,260+k*100,64);
  end;

  outtextxy(130,420,'t[reaktion] =        ');
  outtextxy(400,420,'a =        ');

  setcolor(9);
  outtextxy(20,45,'Abstand zum Vordermann,');
  line(365,69,450,69);
  line(365,67,365,71);
  line(450,67,450,71);
  setcolor(12);
  outtextxy(85,15,'Sicherheitsabstand                s[min]  ');
  line(365,75,565,75);
  line(365,73,365,77);
  line(465,73,465,77);
  line(565,73,565,77);
  outtextxy(390,80,'s[min]');
  outtextxy(490,80,'s[min]');
  setcolor(14);
  outtextxy(85,15,'                       Halteweg                  H ');
 line(365,50,525,50);
 line(365,48,365,52);
 line(525,48,525,52);
 outtextxy(440,40,'H');
  setcolor(15);
  outtextxy(85,15,'                   und          :        = 0,5 *   + 7 m ');
  outtextxy(40,460,' a, t[reaktion]  ver„ndern (a/A/t/T)                     beenden (b)');
end;

procedure setz11;
begin
  setcolor(15);
  str(tau:4:2,ortx2);
  outtextxy(245,420,ortx2+' s');
  str(a:4:2,ortx3);
  outtextxy(435,420,ortx3+' m/sý');
end;

procedure loesch11;
begin
  setcolor(1);
  outtextxy(245,420,ortx2);
  outtextxy(435,420,ortx3);
end;

procedure s11;
begin
  v0:=0;
  repeat
    v0:=v0+dv;
    y:=v0*v0/4/a+1/2*v0*tau+7;
    if y<=260 then
    putpixel(100+round(7.2*v0),360-round(y),farbe1);
    if 360-round(v0*v0/2/a+v0*tau)>=100 then
    putpixel(100+round(7.2*v0),360-round(v0*v0/2/a+v0*tau),farbe2);
    if 360-round(v0*v0/4/a+v0*tau/2)>=100 then
    putpixel(100+round(7.2*v0),360-round(v0*v0/4/a+v0*tau/2),farbe3);
  until v0>=65;
end;

procedure s110;
begin
  farbe1:=12;
  farbe2:=14;
  farbe3:=9;
  s11;
end;

procedure l110;
begin
  farbe1:=1;
  farbe2:=1;
  farbe3:=1;
  s11;
end;

procedure auswahl11;
begin
  wahl:=' ';
  repeat
    s110;
    if keypressed then wahl:=readkey;
    case wahl of
    't':
    begin
      if tau>=0.1 then
      begin
        loesch11;
        l110;
        tau:=tau-0.05;
        setz11;
      end;
      wahl:=' ';
    end;
    'T':
    begin
      if tau<=2 then
      begin
        loesch11;
        l110;
        tau:=tau+0.05;
        setz11;
      end;
      wahl:=' ';
    end;
    'a':
    begin
      if a>=2 then
      begin
        loesch11;
        l110;
        a:=a-0.05;
        setz11;
      end;
      wahl:=' ';
    end;
    'A':
    begin
      if a<=9.9 then
      begin
        loesch11;
        l110;
        a:=a+0.05;
        setz11;
      end;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure bewegung11;
begin
  cleardevice;
    v0:=0;
    a:=5;
    tau:=0.5;
    dv:=0.1;
    graphik11;
    setz11;
    auswahl11;
  menue;
end;

procedure graphik2;
begin
  setbkcolor(1);
  setcolor(15);
  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);

  line(100,361,600,361);
  outtextxy(540,370,'v0 in km/h');
  line(100,360,100,80);
  setcolor(12);
  outtextxy(30,55,'s[min]');
  setcolor(14);
  outtextxy(30,55,'                       H');
  setcolor(9);
  outtextxy(30,55,'       , Abstand');
  setcolor(15);
  outtextxy(50,40,'Zeitlcke fr ');
  outtextxy(30,55,'       ,          und     in s');
  for k:=1 to 4 do
  begin
    str(50*k:2,ortx1);
    outtextxy(93+k*100,370,ortx1);
    line(100+k*100,361,100+k*100,365);
  end;
  for k:=1 to 5 do
  begin
    str(k:2,ortx1);
    outtextxy(65,357-k*50,ortx1);
    line(100,360-k*50,95,360-k*50);
  end;
  outtextxy(130,420,'t[reaktion] =        ');
  outtextxy(400,420,'a =       ');
  outtextxy(85,15,'"Zeitlcke" bei Minimalabstand und Halteweg: 2 s - Abstand ');
  outtextxy(40,460,' a, t[reaktion]  ver„ndern (a/A/t/T)                     beenden (b)');
end;

procedure s22;
begin
  v0:=0;
  repeat
    v0:=v0+dv;
    y:=50*(v0/4/a+1/2*tau+7/v0);
    if y<=260 then
    putpixel(100+round(7.2*v0),360-round(y),farbe1);
    if 360-round(50*(v0/2/a+tau))>=100 then
    putpixel(100+round(7.2*v0),360-round(50*(v0/2/a+tau)),farbe2);
    if 360-round(50*(v0/4/a+tau/2))>=100 then
    putpixel(100+round(7.2*v0),360-round(50*(v0/4/a+tau/2)),farbe3);
  until v0>=65;
end;

procedure s220;
begin
  farbe1:=12;
  farbe2:=14;
  farbe3:=9;
  s22;
  setcolor(10);
  line(100,260,560,260);
end;

procedure l220;
begin
  farbe1:=1;
  farbe2:=1;
  farbe3:=1;
  s22;
end;

procedure auswahl22;
begin
  wahl:=' ';
  repeat
    s220;
    if keypressed then wahl:=readkey;
    case wahl of
    't':
    begin
      if tau>=0.1 then
      begin
        loesch11;
        l220;
        tau:=tau-0.05;
        setz11;
      end;
      wahl:=' ';
    end;
    'T':
    begin
      if tau<=2 then
      begin
        loesch11;
        l220;
        tau:=tau+0.05;
        setz11;
      end;
      wahl:=' ';
    end;
    'a':
    begin
      if a>=2 then
      begin
        loesch11;
        l220;
        a:=a-0.05;
        setz11;
      end;
      wahl:=' ';
    end;
    'A':
    begin
      if a<=9.9 then
      begin
        loesch11;
        l220;
        a:=a+0.05;
        setz11;
      end;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure bewegung2;
begin
  cleardevice;
    v0:=0;
    a:=5;
    tau:=0.5;
    dv:=0.1;
    graphik2;
    setz11;
    auswahl22;
  menue;
end;

procedure graphik3;
begin
  setbkcolor(1);
  setcolor(15);
  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);

  line(100,361,600,361);
  outtextxy(540,370,'v0 in km/h');
  line(100,360,100,80);
  outtextxy(40,50,'PKW pro Stunde');
  for k:=1 to 4 do
  begin
    str(50*k:2,ortx1);
    outtextxy(93+k*100,370,ortx1);
    line(100+k*100,361,100+k*100,365);
  end;
  for k:=1 to 5 do
  begin
    str(500*k:2,ortx1);
    outtextxy(35,357-k*50,ortx1);
    line(100,360-k*50,95,360-k*50);
  end;
  outtextxy(130,420,'t[reaktion] =        ');
  outtextxy(400,420,'a =        ');
  outtextxy(285,15,'Verkehrsfluss ');
  outtextxy(40,460,' a, t[reaktion]  ver„ndern (a/A/t/T)                     beenden (b)');
  setcolor(12);
  outtextxy(160,50,'                   Minimalabstandes s[min]  ');
  setcolor(14);
  outtextxy(160,50,'                                             Halteweges H ');
  setcolor(15);
  outtextxy(160,50,'bei Einhaltung des                         / ');
end;

procedure s33;
begin
  v0:=0;
  repeat
    v0:=v0+dv;
    y:=360/(v0/4/a+1/2*tau+7/v0);
    if y<=310 then
    putpixel(100+round(7.2*v0),360-round(y),farbe1);
    if 360-round(360/(v0/2/a+tau+7/v0))>=70 then
    putpixel(100+round(7.2*v0),360-round(360/(v0/2/a+tau+7/v0)),farbe2);
  until v0>=65;
end;

procedure s30;
begin
  farbe1:=12;
  farbe2:=14;
  s33;
end;

procedure l30;
begin
  farbe1:=1;
  farbe2:=1;
  s33;
end;

procedure auswahl3;
begin
  wahl:=' ';
  repeat
    s30;
    if keypressed then wahl:=readkey;
    case wahl of
    't':
    begin
      if tau>=0.1 then
      begin
        loesch11;
        l30;
        tau:=tau-0.05;
        setz11;
      end;
      wahl:=' ';
    end;
    'T':
    begin
      if tau<=2 then
      begin
        loesch11;
        l30;
        tau:=tau+0.05;
        setz11;
      end;
      wahl:=' ';
    end;
    'a':
    begin
      if a>=2 then
      begin
        loesch11;
        l30;
        a:=a-0.05;
        setz11;
      end;
      wahl:=' ';
    end;
    'A':
    begin
      if a<=9.9 then
      begin
        loesch11;
        l30;
        a:=a+0.05;
        setz11;
      end;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure bewegung3;
begin
  cleardevice;
    v0:=0;
    a:=5;
    tau:=0.5;
    dv:=0.1;
    graphik3;
    setz11;
    auswahl3;
  menue;
end;




{MAIN}
begin
  wahl1:=' ';
  menue;
  repeat
  wahl1:=' ';
  if keypressed then wahl1:=readkey;
  case wahl1 of
    '2':bewegung;
    '3':p1;
    '1':p2;
    '4':bewegung11;
    '5':bewegung2;
    '6':bewegung3;
  end;
  until wahl1='b';
end.