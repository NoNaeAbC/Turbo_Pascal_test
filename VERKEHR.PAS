
program verkehrserziehung;
uses crt,graph;
var
  treiber,modus,k,l,m:integer;
  antwort,z,n,h1,h2,h3,s1,s2,s3,v:integer;
  wahl,wahl1:char;
  r,s,t0,y2,t2,t3,dt,t1,b,b1,h,h4,reaktion,da,x,y,y1,dv,a,a4,v2,v1,a1,a2,a3,t:real;
  ortx7,ortx6,ortx8,ortx,ortx1,ortx2,ortx3,ortx4,ortx5:string;

procedure grafik;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
 setbkcolor(1);
    str(a:4:1,ortx);
    outtextxy(200,210,ortx);outtextxy(235,210,' m/s˝');
  outtextxy(170,210,'a = ');
    str(v2:4:0,ortx1);
    outtextxy(200,220,ortx1);outtextxy(235,220,' km/h');
    outtextxy(170,220,'v = ');
  line(10,40,630,40);
  line(10,430,630,430);
  line(10,40,10,430);
  line(630,40,630,430);
  outtextxy(60,20,'Anhalteweg in AbhÑngigkeit von Geschwindigkeit und Bremsverzîgerung');
  outtextxy(20,60,'Erfahrungswerte fÅr die Bremsverzîgerung');
  outtextxy(50,80,'trockene Fahrbahn:');
  outtextxy(50,90,'6,5 bis 7,5 m/s˝');
  outtextxy(50,110,'nasse Fahrbahn');
  outtextxy(50,120,'Beton:    4 bis 5,5 m/s˝');
  outtextxy(50,130,'Asphalt:  5 bis 6,5 m/s˝');
  outtextxy(50,150,'Neuschnee');
  outtextxy(50,160,'2 bis 3 m/s˝');
  outtextxy(70,190,'eingestellte Werte:');
  outtextxy(20,210,'Bremsverzîgerung: ');
  outtextxy(20,220,'Geschwindigkeit:  ');
  outtextxy(125,250,'Bremsweg');
  outtextxy(80,260,'Optimum     jetzt');
  outtextxy(115,320,'Anhalteweg');
  outtextxy(80,330,'Optimum     jetzt');
  outtextxy(40,390,'Es wurde eine Reaktionszeit');
  outtextxy(60,400,'von  1 s  angenommen.');
  line(300,400,300,100);
  line(300,400,605,400);
  outtextxy(395,410,'50');
  line(400,400,400,405);
  outtextxy(490,410,'100');
  line(500,400,500,405);
  outtextxy(590,410,'150');
  line(600,400,600,405);
  outtextxy(614,395,'v');
  outtextxy(305,100,'Anhalteweg in m');
  line(300,300,305,300);
  outtextxy(310,295,'50');
  line(300,200,305,200);
  outtextxy(310,195,'100');
  line(15,180,280,180);
  line(15,180,15,370);
  line(15,370,280,370);
  line(280,180,280,370);

  outtextxy(90,440,'Bremsverzîgerung erhîhen (A)  verringern (a)  Beenden (z)');
  outtextxy(120,450,'Geschwindigkeit erhîhen (V)  verringern (v)');
  delay(1000);
end;

procedure graphik1;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
 setbkcolor(1);
    t1:=7.1;
    str(t1:4:1,ortx);

    outtextxy(100,390,ortx);outtextxy(135,390,' s');
  outtextxy(70,390,'t = ');
    str((360/t1):4:0,ortx1);

    outtextxy(100,400,ortx1);outtextxy(135,400,' km/h');
    outtextxy(70,400,'v = ');
  line(10,40,630,40);
  line(10,430,630,430);
  line(10,40,10,430);
  line(630,40,630,430);
  line(99,100,99,351);
  line(99,351,500,351);
  outtextxy(105,105,'Geschwindigkeit in km/h');
  outtextxy(510,346,'Zeit in s');
  outtextxy(100,20,'Bestimmung der Geschwindigkeit aus gemessenen Zeitwerten');
  outtextxy(70,297,'50');
  line(94,302,99,302);
  line(94,252,99,252);
  outtextxy(60,247,'100');
  line(94,202,99,202);
  outtextxy(60,197,'150');
  line(94,152,99,152);
  outtextxy(60,147,'200');
  line(200,351,200,355);
  outtextxy(198,360,'5');
  line(300,351,300,355);
  outtextxy(295,360,'10');
  line(400,351,400,355);
  outtextxy(395,360,'15');
  line(500,351,500,355);
  outtextxy(495,360,'20');
  line(450,351,450,355);
  line(350,351,350,355);
  line(250,351,250,355);
  line(94,177,99,177);
  line(94,227,99,227);
  line(94,277,99,277);
  line(94,327,99,327);
  line(150,351,150,355);
  outtextxy(90,360,'0');

  outtextxy(90,440,'grî·erer Zeitwert (1)  kleinerer Zeitwert (2)  Beenden (z)');
  delay(1000);
end;

procedure graphik4;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
 setbkcolor(1);
    a1:=7.5;
    v1:=50/3.6;
    a2:=7.5;
    t2:=v1/a2;
    t:=0;
    t1:=v1/a1;
    y:=0;
setcolor(12);
    str(t:4:1,ortx8);
    outtextxy(350,380,ortx8);outtextxy(385,380,' s');
setcolor(15);
    outtextxy(230,60,'Zum Vergleich in wei· die Werte fÅr die optimale');
    outtextxy(300,70,'Bremsverzîgerung a = 7,5 m/s˝');
    outtextxy(20,380,'seit Bremsbeginn vergangene Zeit: ');
    str(t1:4:1,ortx);
    outtextxy(300,390,ortx);outtextxy(335,390,' s');
    outtextxy(20,390,'Bremsdauer bis zum Stillstand = ');

    str(((v1-a1*t)*3.6):4:0,ortx1);
    outtextxy(300,400,ortx1);outtextxy(335,400,' km/h');
    outtextxy(20,400,'momentane Geschwindigkeit = ');

    str(y:4:1,ortx2);
    outtextxy(300,410,ortx2);outtextxy(335,410,' m');
    outtextxy(20,410,'bisher zurÅckgelegter Bremsweg = ');

    setcolor(12);
    str((v1*3.6):4:0,ortx3);
    outtextxy(400,120,ortx3);outtextxy(435,120,' km/h');
    outtextxy(320,110,'anfÑngliche Geschwindigkeit : ');
    str(t2:4:1,ortx4);
    outtextxy(400,390,ortx4);outtextxy(435,390,' s');
    str(((v1-a2*t)*3.6):4:0,ortx5);
    outtextxy(400,400,ortx5);outtextxy(435,400,' km/h');
    str(y2:4:1,ortx6);
    outtextxy(400,410,ortx6);outtextxy(435,410,' m');
    str(a2:4:1,ortx7);
    outtextxy(400,150,ortx7);outtextxy(435,150,' m/s˝');
    outtextxy(370,140,'Bremsbeschleunigung : ');
    setcolor(15);

  line(10,40,630,40);
  line(10,430,630,430);
  line(10,40,10,430);
  line(630,40,630,430);
  line(99,100,99,351);
  line(99,351,500,351);
  outtextxy(55,85,'Geschwindigkeit ');
  outtextxy(120,100,'in km/h');
  outtextxy(510,346,'Zeit in s');
  outtextxy(150,20,'Geschwindigkeitsabnahme beim Bremsvorgang');
  outtextxy(70,297,'50');
  line(94,302,99,302);
  line(94,252,99,252);
  outtextxy(60,247,'100');
  line(94,202,99,202);
  outtextxy(60,197,'150');
  line(94,152,99,152);
  outtextxy(60,147,'200');
  line(200,351,200,355);
  outtextxy(198,360,'5');
  line(300,351,300,355);
  outtextxy(295,360,'10');
  line(400,351,400,355);
  outtextxy(395,360,'15');
  line(500,351,500,355);
  outtextxy(495,360,'20');
  line(450,351,450,355);
  line(350,351,350,355);
  line(250,351,250,355);
  line(94,177,99,177);
  line(94,227,99,227);
  line(94,277,99,277);
  line(94,327,99,327);
  line(150,351,150,355);
  outtextxy(90,360,'0');

  outtextxy(30,440,'Bremsen (b)  grî·ere Geschwindigkeit (V)  kleinere Geschwindigkeit (v)  ');
  outtextxy(20,450,'grî·ere Bremsverzîgerung (A)  kleinere Bremsverzîgerung (a)   Beenden (z)');
  delay(1000);
end;

procedure l3;
begin
    setcolor(1);
    line(100,round(350-3.6*v1),round(100+20*t1),350);
    line(round(100+20*t),350,round(100+20*t),350-round(3.6*trunc((v1-a1*t))));
    line(100,round(350-3.6*v1),round(100+20*t2),350);
    line(round(100+20*t),350,round(100+20*t),350-round(3.6*trunc((v1-a2*t))));
    outtextxy(400,120,ortx3);
    outtextxy(300,390,ortx);
    outtextxy(300,400,ortx1);
    outtextxy(300,410,ortx2);
    outtextxy(350,380,ortx8);

    outtextxy(400,390,ortx4);
    outtextxy(400,400,ortx5);
    outtextxy(400,410,ortx6);
    outtextxy(400,150,ortx7);
end;

procedure e3;
begin
    y:=v1*t-0.5*a1*t*t;
    y2:=v2*t-0.5*a2*t*t;
    t1:=v1/a1;
    t2:=v1/a2;
    setcolor(12);
    line(100,round(350-3.6*v1),round(100+20*t2),350);
    line(round(100+20*t),350,round(100+20*t),350-round(3.6*trunc((v1-a2*t))));
    str(t2:4:1,ortx4);
    outtextxy(400,390,ortx4);
    str(((v1-a2*t)*3.6):4:0,ortx5);
    outtextxy(400,400,ortx5);
    str(y2:4:1,ortx6);
    outtextxy(400,410,ortx6);
    str(a2:4:1,ortx7);
    outtextxy(400,150,ortx7);
    str(t:4:1,ortx8);
    outtextxy(350,380,ortx8);
    str((v1*3.6):4:0,ortx3);
    outtextxy(400,120,ortx3);

    setcolor(15);
    str(t1:4:1,ortx);
    outtextxy(300,390,ortx);

    str(((v1-a1*t)*3.6):4:0,ortx1);
    outtextxy(300,400,ortx1);

    str(y:4:1,ortx2);
    outtextxy(300,410,ortx2);
    line(100,round(350-3.6*v1),round(100+20*t1),350);
    line(round(100+20*t),350,round(100+20*t),350-round(3.6*trunc((v1-a1*t))));
end;

procedure bild4;
begin
  graphik4;
  setcolor(15);
  dv:=1;
  dt:=0.1;
  v1:=50/3.6;
  a1:=7.5;
  t:=0;
  t1:=v1/a1;
  a2:=7.4;
  t2:=v1/a2;
  da:=0.1;
  line(100,round(350-3.6*v1),round(100+20*t1),350);
  line(round(100+20*t),350,round(100+20*t),350-round(3.6*trunc((v1-a1*t))));
  repeat

  case wahl of 'b':
  begin
    setcolor(1);
    if t<=t1-dt then
    begin
    outtextxy(300,390,ortx);
    outtextxy(300,400,ortx1);
    outtextxy(300,410,ortx2);
    line(round(100+20*t),350,round(100+20*t),350-round(3.6*trunc((v1-a1*t))));
    end;
    if t<=t2-dt then
    begin
    outtextxy(400,390,ortx4);
    outtextxy(400,400,ortx5);
    outtextxy(400,410,ortx6);
    line(round(102+20*t),350,round(102+20*t),351-round(3.6*trunc((v1-a2*t))));
    end;


    if ((t<=t1-dt) or (t<=t2-dt)) then
    begin
    outtextxy(350,380,ortx8);
      t:=t+dt;
      y:=v1*t-0.5*a1*t*t;
    y2:=v1*t-0.5*a2*t*t;
    t2:=v1/a2;
    setcolor(12);
    str(t:4:1,ortx8);
    outtextxy(350,380,ortx8);

    if t<=t2-dt then
    begin
      setcolor(15);
      line(100,round(350-3.6*v1),round(100+20*t1),350);

      setcolor(12);
      line(round(102+20*t),350,round(102+20*t),351-round(3.6*trunc((v1-a2*t))));
      line(100,round(350-3.6*v1),round(100+20*t2),350);
      str(t2:4:1,ortx4);
      outtextxy(400,390,ortx4);
      str(((v1-a2*t)*3.6):4:0,ortx5);
      outtextxy(400,400,ortx5);
      str(y2:4:1,ortx6);
      outtextxy(400,410,ortx6);
      str(a2:4:1,ortx7);
      outtextxy(400,150,ortx7);
    end
    else
    begin

    setcolor(12);
      str(t2:4:1,ortx4);
      outtextxy(400,390,ortx4);

      str(0.00:4:0,ortx5);
      outtextxy(400,400,ortx5);

      str((0.5*v1*v1/a2):4:1,ortx6);
      outtextxy(400,410,ortx6);
   end;
    if t<=t1-dt then
    begin
      setcolor(12);
      line(100,round(350-3.6*v1),round(100+20*t2),350);
      setcolor(15);
      str(t1:4:1,ortx);
      outtextxy(300,390,ortx);

      str(((v1-a1*t)*3.6):4:0,ortx1);
      outtextxy(300,400,ortx1);

      str(y:4:1,ortx2);
      outtextxy(300,410,ortx2);
      line(round(100+20*t),350,round(100+20*t),350-round(3.6*trunc((v1-a1*t))));
      line(100,round(350-3.6*v1),round(100+20*t1),350);
    end
    else
    begin

    setcolor(15);
      str(t1:4:1,ortx);
      outtextxy(300,390,ortx);

      str(0.00:4:0,ortx1);
      outtextxy(300,400,ortx1);

      str((0.5*v1*v1/a1):4:1,ortx2);
      outtextxy(300,410,ortx2);
    
    end;
    end;
    wahl:=' ';
  end;
  'V':
  begin
    l3;
    t:=0;
    if v1<=225/3.6 then
    begin
    v1:=v1+dv;
    e3;
    end
    else
    begin
    v1:=225/3.6;
    end;
    wahl:=' ';
  end;

  'v':
  begin
    l3;
    t:=0;
    if v1>=dv then
    begin
    v1:=v1-dv;
    e3;
    end
    else
    begin
    v1:=dv;
    end;
    wahl:=' ';
  end;
  'A':
  begin
    l3;
    t:=0;
    if a2<=12 then
    begin
    a2:=a2+da;
    e3;
   end
    else
    begin
    a2:=12;
    end;
    wahl:=' ';
  end;

  'a':
  begin
    l3;
    t:=0;
    if a2>=2 then
    begin
    a2:=a2-da;
    e3;
   end
    else
    begin
    a2:=2;
    end;
    wahl:=' ';
  end;

    'z':
    begin
      exit;
    end;
end;
     repeat until keypressed;
     if keypressed then  wahl:=readkey;

until wahl='z';
end;

procedure graphik5;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
 setbkcolor(1);

setcolor(12);
    str(t:4:1,ortx8);
    outtextxy(120,240,ortx8);outtextxy(155,240,' s');
setcolor(15);
    outtextxy(30,100,'Zum Vergleich in wei· die Werte fÅr');
    outtextxy(55,110,'die optimale Bremsverzîgerung');
    outtextxy(120,120,'a = 7,5 m/s˝');
    outtextxy(40,220,'seit Bremsbeginn vergangene Zeit: ');

    str(t1:4:1,ortx);
    outtextxy(70,280,ortx);outtextxy(105,280,' s');
    outtextxy(40,260,'Bremsdauer bis zum Stillstand : ');

    str(((v1-a1*t)*3.6):4:0,ortx1);
    outtextxy(70,320,ortx1);outtextxy(105,320,' km/h');
    outtextxy(40,300,'momentane Geschwindigkeit : ');

    str(y:4:1,ortx2);
    outtextxy(70,360,ortx2);outtextxy(105,360,' m');
    outtextxy(40,340,'bisher zurÅckgelegter Bremsweg : ');

    setcolor(12);
    str((v1*3.6):4:0,ortx3);
    outtextxy(120,160,ortx3);outtextxy(155,160,' km/h');
    outtextxy(50,150,'anfÑngliche Geschwindigkeit : ');

    str(t2:4:1,ortx4);
    outtextxy(170,280,ortx4);outtextxy(205,280,' s');
    str(((v1-a2*t)*3.6):4:0,ortx5);
    outtextxy(170,320,ortx5);outtextxy(205,320,' km/h');
    str(y2:4:1,ortx6);
    outtextxy(170,360,ortx6);outtextxy(205,360,' m');
    str(a2:4:1,ortx7);
    outtextxy(120,190,ortx7);outtextxy(155,190,' m/s˝');
    outtextxy(80,180,'Bremsbeschleunigung : ');
    setcolor(15);

  line(10,40,630,40);
  line(10,430,630,430);
  line(10,40,10,430);
  line(630,40,630,430);
  line(399,70,399,391);
  line(399,391,600,391);
  outtextxy(355,55,'zurÅckgelegter Bremsweg in m');
  outtextxy(605,386,'s');
  line(30,210,30,380);
  line(310,210,310,380);
  line(30,210,310,210);
  line(30,380,310,380);
  outtextxy(120,20,'Der wÑhrend des Bremsvorganges zurÅckgelegte Weg');
  outtextxy(370,337,'50');
  line(394,342,399,342);
  line(394,292,399,292);
  outtextxy(360,287,'100');
  line(394,242,399,242);
  outtextxy(360,237,'150');
  line(394,192,399,192);
  outtextxy(360,187,'200');
  line(394,142,399,142);
  outtextxy(360,137,'250');
  line(394,92,399,92);
  outtextxy(360,87,'300');

  line(450,391,450,395);
  outtextxy(448,400,'5');
  line(500,391,500,395);
  outtextxy(495,400,'10');
  line(550,391,550,395);
  outtextxy(545,400,'15');
  line(600,391,600,395);
  outtextxy(595,400,'20');
  outtextxy(390,400,'0');

  outtextxy(30,440,'Bremsen (b)  grî·ere Geschwindigkeit (V)  kleinere Geschwindigkeit (v)  ');
  outtextxy(20,450,'grî·ere Bremsverzîgerung (A)  kleinere Bremsverzîgerung (a)   Beenden (z)');
  delay(1000);
end;

procedure g1;
begin
  t0:=0;
  repeat
  t0:=t0+dt/4;
  putpixel(400+round(10*t0),390-round(v1*t0-0.5*a2*t0*t0),12);
  until t0>=t2;
end;

procedure g2;
begin
  t0:=0;
  repeat
  t0:=t0+dt/4;
  putpixel(400+round(10*t0),390-round(v1*t0-0.5*a1*t0*t0),15);
  until t0>=t1;
end;

procedure g3;
begin
  t0:=0;
  repeat
  t0:=t0+dt/4;
  putpixel(400+round(10*t0),390-round(v1*t0-0.5*a2*t0*t0),1);
  until t0>=t2;
  t0:=0;
  repeat
  t0:=t0+dt/4;
  putpixel(400+round(10*t0),390-round(v1*t0-0.5*a1*t0*t0),1);
  until t0>=t1;
end;

procedure l1;
begin
    setcolor(1);
  line(round(399+10*t1),390,round(399+10*t1),391-round(v1*t1-0.5*a1*t1*t1));
  line(round(400+10*t2),390,round(400+10*t2),391-round(v1*t2-0.5*a2*t2*t2));
  line(round(400+10*t),390,round(400+10*t),391-round(v1*t-0.5*a1*t*t));
  line(round(400+10*t),390,round(400+10*t),391-round(v1*t-0.5*a2*t*t));
    g3;
    outtextxy(120,160,ortx3);
    outtextxy(70,280,ortx);
    outtextxy(70,320,ortx1);
    outtextxy(70,360,ortx2);
    outtextxy(120,240,ortx8);
    outtextxy(170,280,ortx4);
    outtextxy(170,320,ortx5);
    outtextxy(170,360,ortx6);
    outtextxy(120,190,ortx7);
end;

procedure e1;
begin
    y:=v1*t-0.5*a1*t*t;
    y2:=v2*t-0.5*a2*t*t;
    t1:=v1/a1;
    t2:=v1/a2;
    setcolor(12);
    g1;
    g2;
    str(t2:4:1,ortx4);
    outtextxy(170,280,ortx4);
    str(((v1-a2*t)*3.6):4:0,ortx5);
    outtextxy(170,320,ortx5);
    str(y2:4:1,ortx6);
    outtextxy(170,360,ortx6);
    str(a2:4:1,ortx7);
    outtextxy(120,190,ortx7);
    str(t:4:1,ortx8);
    outtextxy(120,240,ortx8);
    str((v1*3.6):4:0,ortx3);
    outtextxy(120,160,ortx3);

    setcolor(15);
    str(t1:4:1,ortx);
    outtextxy(70,280,ortx);

    str(((v1-a1*t)*3.6):4:0,ortx1);
    outtextxy(70,320,ortx1);

    str(y:4:1,ortx2);
    outtextxy(70,360,ortx2);
end;

procedure bild5;
begin
  graphik5;
  setcolor(15);
  dv:=1;
  dt:=0.1;
  v1:=50/3.6;
  a1:=7.5;
  t:=0;
  t1:=v1/a1;
  a2:=7.6;
  t2:=v1/a2;
  da:=0.1;
       g2;
  repeat
  case wahl of 'b':
  begin
    setcolor(1);
    if t<t1-dt then
    begin
    outtextxy(70,280,ortx);
    outtextxy(70,320,ortx1);
    outtextxy(70,360,ortx2);
  line(round(400+10*t),390,round(400+10*t),391-round(v1*t-0.5*a1*t*t));
    end;
    if t<t2-dt then
    begin
    outtextxy(170,280,ortx4);
    outtextxy(170,320,ortx5);
    outtextxy(170,360,ortx6);
    end;
  line(round(402+10*t),390,round(402+10*t),391-round(v1*t-0.5*a2*t*t));


    if ((t<=t1-dt) or (t<=t2-dt)) then
    begin
    outtextxy(120,240,ortx8);
      t:=t+dt;
      y:=v1*t-0.5*a1*t*t;
    y2:=v1*t-0.5*a2*t*t;
    t2:=v1/a2;
    setcolor(12);
    str(t:4:1,ortx8);
    outtextxy(120,240,ortx8);

    if t<=t2-dt then
    begin
      setcolor(12);
  line(round(402+10*t),390,round(402+10*t),391-round(v1*t-0.5*a2*t*t));
      str(t2:4:1,ortx4);
      outtextxy(170,280,ortx4);
      str(((v1-a2*t)*3.6):4:0,ortx5);
      outtextxy(170,320,ortx5);
      str(y2:4:1,ortx6);
      outtextxy(170,360,ortx6);
      str(a2:4:1,ortx7);
      outtextxy(120,190,ortx7);
    end
    else
    begin

    setcolor(12);
  line(round(400+10*t2),390,round(400+10*t2),391-round(v1*t2-0.5*a2*t2*t2));
      str(t2:4:1,ortx4);
      outtextxy(170,280,ortx4);

      str(0.00:4:0,ortx5);
      outtextxy(170,320,ortx5);

      str((0.5*v1*v1/a2):4:1,ortx6);
      outtextxy(170,360,ortx6);
   end;
    if t<=t1-dt then
    begin
      setcolor(15);
      str(t1:4:1,ortx);
      outtextxy(70,280,ortx);

      str(((v1-a1*t)*3.6):4:0,ortx1);
      outtextxy(70,320,ortx1);

      str(y:4:1,ortx2);
      outtextxy(70,360,ortx2);
  line(round(400+10*t),390,round(400+10*t),391-round(v1*t-0.5*a1*t*t));
    end
    else
    begin

    setcolor(15);
  line(round(399+10*t1),390,round(399+10*t1),391-round(v1*t1-0.5*a1*t1*t1));
      str(t1:4:1,ortx);
      outtextxy(70,280,ortx);

      str(0.00:4:0,ortx1);
      outtextxy(70,320,ortx1);

      str((0.5*v1*v1/a1):4:1,ortx2);
      outtextxy(70,360,ortx2);

    end;
    g1;
    g2;
    end;
    wahl:=' ';
  end;
  'V':
  begin
    l1;
    t:=0;
    if v1<=225/3.6 then
    begin
    v1:=v1+dv;
    e1;
    end
    else
    begin
    v1:=225/3.6;
    end;
    wahl:=' ';
  end;

  'v':
  begin
    l1;
    t:=0;
    if v1>=dv then
    begin
    v1:=v1-dv;
    e1;
    end
    else
    begin
    v1:=dv;
    end;
    wahl:=' ';
  end;
  'A':
  begin
    l1;
    t:=0;
    if a2<=12 then
    begin
    a2:=a2+da;
    e1;
   end
    else
    begin
    a2:=12;
    end;
    wahl:=' ';
  end;

  'a':
  begin
    l1;
    t:=0;
    if a2>=2 then
    begin
    a2:=a2-da;
    e1;
   end
    else
    begin
    a2:=2;
    end;
    wahl:=' ';
  end;

    'z':
    begin
      exit;
    end;
end;
     repeat until keypressed;
     if keypressed then  wahl:=readkey;

until wahl='z';
end;

procedure graphik6;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
 setbkcolor(1);
    a1:=7.5;
    v1:=50/3.6;
    a2:=7.5;
    t2:=v1/a2;
    t:=0;
    t1:=v1/a1;
    y:=0;
setcolor(15);
    outtextxy(60,390,'In wei· die Linien fÅr die optimale Bremsverzîgerung a = 7,5 m/s˝');
    setcolor(12);
    str(a2:4:1,ortx7);
    outtextxy(400,410,ortx7);outtextxy(435,410,' m/s˝');
    outtextxy(140,410,'eingestellte Bremsverzîgerung : ');
    setcolor(15);

  line(10,40,630,40);
  line(10,430,630,430);
  line(10,40,10,430);
  line(630,40,630,430);
  line(99,100,99,351);
  line(99,351,300,351);
  line(399,100,399,351);
  line(399,351,600,351);
  outtextxy(55,75,'Geschwindigkeit ');
  outtextxy(120,90,'in km/h');
  outtextxy(385,75,'Bremsweg ');
  outtextxy(420,90,'in m');
  outtextxy(305,346,'s');
  outtextxy(605,346,'s');

  outtextxy(50,20,'Geschwindigkeitsabnahme / zurÅckgelegter Bremsweg beim Bremsvorgang');
  outtextxy(70,297,'50');
  line(94,302,99,302);
  line(94,252,99,252);
  outtextxy(370,297,'50');
  line(394,302,399,302);
  line(394,252,399,252);
  outtextxy(60,247,'100');
  line(94,202,99,202);
  outtextxy(60,197,'150');
  line(94,152,99,152);
  outtextxy(60,147,'200');
  outtextxy(360,247,'100');
  line(394,202,399,202);
  outtextxy(360,197,'150');
  line(394,152,399,152);
  outtextxy(360,147,'200');
  line(394,102,399,102);
  outtextxy(360,97,'250');
  line(150,351,150,355);
  outtextxy(148,360,'5');
  line(450,351,450,355);
  outtextxy(448,360,'5');
  line(200,351,200,355);
  outtextxy(195,360,'10');
  line(500,351,500,355);
  outtextxy(495,360,'10');
  line(250,351,250,355);
  outtextxy(245,360,'15');
  line(550,351,550,355);
  outtextxy(545,360,'15');
  line(300,351,300,355);
  outtextxy(295,360,'20');
  line(600,351,600,355);
  outtextxy(595,360,'20');
  outtextxy(90,360,'0');
  outtextxy(390,360,'0');

  outtextxy(30,440,'Bremsen (b)  grî·ere Geschwindigkeit (V)  kleinere Geschwindigkeit (v)  ');
  outtextxy(20,450,'grî·ere Bremsverzîgerung (A)  kleinere Bremsverzîgerung (a)   Beenden (z)');
  delay(1000);
end;

procedure g4;
begin
  t0:=0;
  repeat
  t0:=t0+dt/4;
  putpixel(400+round(10*t0),350-round(v1*t0-0.5*a2*t0*t0),12);
  until t0>=t2;
  t0:=0;
  repeat
  t0:=t0+dt/4;
  putpixel(400+round(10*t0),350-round(v1*t0-0.5*a1*t0*t0),15);
  until t0>=t1;
end;

procedure g5;
begin
  t0:=0;
  repeat
  t0:=t0+dt/4;
  putpixel(400+round(10*t0),350-round(v1*t0-0.5*a2*t0*t0),1);
  until t0>=t2;
  t0:=0;
  repeat
  t0:=t0+dt/4;
  putpixel(400+round(10*t0),350-round(v1*t0-0.5*a1*t0*t0),1);
  until t0>=t1;
end;

procedure l2;
begin
    setcolor(1);
    line(100,round(350-3.6*v1),round(100+10*t1),350);
    line(round(100+10*t),350,round(100+10*t),350-round(3.6*trunc((v1-a1*t))));
    line(100,round(350-3.6*v1),round(100+10*t2),350);
    line(round(100+10*t),350,round(100+10*t),350-round(3.6*trunc((v1-a2*t))));
  line(round(400+10*t),350,round(400+10*t),351-round(v1*t-0.5*a1*t*t));
  line(round(400+10*t),350,round(400+10*t),351-round(v1*t-0.5*a2*t*t));
  line(round(399+10*t1),350,round(399+10*t1),351-round(v1*t1-0.5*a1*t1*t1));
  line(round(400+10*t2),350,round(400+10*t2),351-round(v1*t2-0.5*a2*t2*t2));
    g5;
    outtextxy(400,410,ortx7);
end;

procedure e2;
begin
    y:=v1*t-0.5*a1*t*t;
    y2:=v2*t-0.5*a2*t*t;
    t1:=v1/a1;
    t2:=v1/a2;
    setcolor(12);
    line(100,round(350-3.6*v1),round(100+10*t2),350);
    line(round(100+10*t),350,round(100+10*t),350-round(3.6*trunc((v1-a2*t))));
    g4;
    str(a2:4:1,ortx7);
    outtextxy(400,410,ortx7);
    setcolor(15);
    line(100,round(350-3.6*v1),round(100+10*t1),350);
    line(round(100+10*t),350,round(100+10*t),350-round(3.6*trunc((v1-a1*t))));
end;

procedure bild6;
begin
  graphik6;
  setcolor(15);
  dv:=1;
  dt:=0.1;
  v1:=50/3.6;
  a1:=7.5;
  t:=0;
  t1:=v1/a1;
  a2:=7.5;
  t2:=v1/a2;
  da:=0.1;

  line(100,round(350-3.6*v1),round(100+10*t1),350);
  line(round(100+10*t),350,round(100+10*t),350-round(3.6*trunc((v1-a1*t))));
  setcolor(13);
  line(round(400+10*t),350,round(400+10*t),351-round(v1*t-0.5*a2*t*t));
  setcolor(15);
  line(round(400+10*t),350,round(400+10*t),351-round(v1*t-0.5*a1*t*t));
   g4;

  repeat
  case wahl of 'b':
  begin
    setcolor(1);
    if t<=t1-dt then
    begin
    line(round(100+10*t),350,round(100+10*t),350-round(3.6*trunc((v1-a1*t))));
  line(round(400+10*t),350,round(400+10*t),351-round(v1*t-0.5*a1*t*t));
    end;
    if t<=t2-dt then
    begin
    line(round(102+10*t),350,round(102+10*t),350-round(3.6*trunc((v1-a2*t))));
    end;
  line(round(402+10*t),350,round(402+10*t),351-round(v1*t-0.5*a2*t*t));

    if ((t<=t1-dt) or (t<=t2-dt)) then
    begin
      t:=t+dt;
      y:=v1*t-0.5*a1*t*t;
    y2:=v1*t-0.5*a2*t*t;
    t2:=v1/a2;
    if t<=t2-dt then
    begin
      setcolor(12);
      line(100,round(350-3.6*v1),round(100+10*t2),350);
      line(round(102+10*t),350,round(102+10*t),350-round(3.6*trunc((v1-a2*t))));
  line(round(402+10*t),350,round(402+10*t),351-round(v1*t-0.5*a2*t*t));
      str(a2:4:1,ortx7);
      outtextxy(400,410,ortx7);
    end
    else
    begin

    setcolor(12);
  line(round(400+10*t2),350,round(400+10*t2),351-round(v1*t2-0.5*a2*t2*t2));
   end;
    if t<=t1-dt then
    begin
      setcolor(15);
      line(100,round(350-3.6*v1),round(100+10*t1),350);
      line(round(100+10*t),350,round(100+10*t),350-round(3.6*trunc((v1-a1*t))));
  line(round(400+10*t),350,round(400+10*t),351-round(v1*t-0.5*a1*t*t));
    end
    else
    begin

    setcolor(15);
  line(round(399+10*t1),350,round(399+10*t1),351-round(v1*t1-0.5*a1*t1*t1));
    end;
  g4;
    end;
    wahl:=' ';
  end;
  'V':
  begin
    l2;
    t:=0;
    if v1<=225/3.6 then
    begin
    v1:=v1+dv;
    e2;
    end
    else
    begin
    v1:=225/3.6;
    end;
    wahl:=' ';
  end;

  'v':
  begin
    l2;
    t:=0;
    if v1>=dv then
    begin
    v1:=v1-dv;
    e2;
    end
    else
    begin
    v1:=dv;
    end;
    wahl:=' ';
  end;
  'A':
  begin
    l2;
    t:=0;
    if a2<=12 then
    begin
    a2:=a2+da;
    e2;
   end
    else
    begin
    a2:=12;
    end;
    wahl:=' ';
  end;

  'a':
  begin
    l2;
    t:=0;
    if a2>=2 then
    begin
    a2:=a2-da;
    e2;
   end
    else
    begin
    a2:=2;
    end;
    wahl:=' ';
  end;

    'z':
    begin
      exit;
    end;
end;
     repeat until keypressed;
     if keypressed then  wahl:=readkey;

until wahl='z';
end;


procedure geschw_zeit;
begin
  graphik1;
  setcolor(15);
  t1:=7.1;
  t:=1.59;
  dt:=0.01;
  repeat
    t:=t+dt;
    putpixel(round(100+20*t),round(350-360/t),14);
  until t>=20;
setcolor(15);
  line(100+round(20*t1),348,100+round(20*t1),352-round(360/t1));
  line(98+round(20*t1),352-round(360/t1),102,352-round(360/t1));
     dt:=0.1;
repeat
    case wahl of
    '1':
    begin
      setcolor(1);
  line(100+round(20*t1),348,100+round(20*t1),352-round(360/t1));
  line(98+round(20*t1),352-round(360/t1),102,352-round(360/t1));
    str(t1:4:1,ortx);
    outtextxy(100,390,ortx);outtextxy(135,390,' s');
  outtextxy(70,390,'t = ');
    str((360/t1):4:0,ortx1);
    outtextxy(100,400,ortx1);outtextxy(135,400,' km/h');
if t1<=20 then
begin
      t1:=t1+dt;
      setcolor(15);
  line(100+round(20*t1),348,100+round(20*t1),352-round(360/t1));
  line(98+round(20*t1),352-round(360/t1),102,352-round(360/t1));
    str(t1:4:1,ortx);
    outtextxy(100,390,ortx);outtextxy(135,390,' s');
  outtextxy(70,390,'t = ');
    str((360/t1):4:0,ortx1);
    outtextxy(100,400,ortx1);outtextxy(135,400,' km/h');
end
else
begin
  t1:=20;
end;
      wahl:=' ';
    end;
    '2':
    begin
      setcolor(1);
  line(100+round(20*t1),348,100+round(20*t1),352-round(360/t1));
  line(98+round(20*t1),352-round(360/t1),102,352-round(360/t1));
    str(t1:4:1,ortx);
    outtextxy(100,390,ortx);outtextxy(135,390,' s');
  outtextxy(70,390,'t = ');
    str((360/t1):4:0,ortx1);
    outtextxy(100,400,ortx1);outtextxy(135,400,' km/h');
if t1>=1.7 then
begin
      t1:=t1-dt;
      setcolor(15);
  line(100+round(20*t1),348,100+round(20*t1),352-round(360/t1));
  line(98+round(20*t1),352-round(360/t1),102,352-round(360/t1));
    str(t1:4:1,ortx);
    outtextxy(100,390,ortx);outtextxy(135,390,' s');
  outtextxy(70,390,'t = ');
    str((360/t1):4:0,ortx1);
    outtextxy(100,400,ortx1);outtextxy(135,400,' km/h');
end
else
begin
  t1:=1.7;
end;
      wahl:=' ';
    end;
    'z':
    begin

      exit;
    end;
  end;
     repeat until keypressed;
     if keypressed then  wahl:=readkey;

until wahl='z';
end;

procedure graphik2;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
 setbkcolor(1);
    t1:=10;
  str(t1:4:1,ortx);
    outtextxy(100,390,ortx);outtextxy(135,390,' m/s');
    outtextxy(70,390,'v = ');
  str((3.6*t1):4:1,ortx1);
    outtextxy(100,400,ortx1);outtextxy(135,400,' km/h');
    outtextxy(70,400,'v = ');
  line(10,40,630,40);
  line(10,430,630,430);
  line(10,40,10,430);
  line(630,40,630,430);
  line(99,100,99,351);
  line(99,351,500,351);
  outtextxy(105,105,'Geschwindigkeit in km/h');
  outtextxy(480,336,'Geschwindigkeit');
  outtextxy(510,346,'in m/s');
  outtextxy(140,20,'Umrechnung von  m/s  in  km/h  und umgekehrt');
  outtextxy(70,297,'50');
  line(94,300,99,300);
  line(94,250,99,250);
  outtextxy(60,247,'100');
  line(94,200,99,200);
  outtextxy(60,197,'150');
  line(94,150,99,150);
  outtextxy(60,147,'200');
  line(175,351,175,355);
  outtextxy(170,360,'10');
  line(250,351,250,355);
  outtextxy(245,360,'20');
  line(325,351,325,355);
  outtextxy(320,360,'30');
  line(400,351,400,355);
  outtextxy(395,360,'40');
  line(475,351,475,355);
  outtextxy(470,360,'50');

  line(94,177,99,177);
  line(94,227,99,227);
  line(94,277,99,277);
  line(94,327,99,327);
  outtextxy(90,360,'0');

  outtextxy(90,440,'grî·erer m/s-Wert (1)  kleinerer m/s-Wert (2)  Beenden (z)');
  delay(1000);
end;

procedure geschw_umr;
begin
  graphik2;
  setcolor(15);
  t1:=10.1;
  t:=0;
  dt:=0.01;
  repeat
    t:=t+dt;
    putpixel(round(100+7.5*t),round(350-3.6*t),14);
  until t>=50;
setcolor(15);
  line(100+round(7.5*t1),348,100+round(7.5*t1),352-round(3.6*t1));
  line(98+round(7.5*t1),350-round(3.6*t1),102,350-round(3.6*t1));
     dt:=0.1;
repeat
    case wahl of
    '1':
    begin
      setcolor(1);
  line(100+round(7.5*t1),348,100+round(7.5*t1),352-round(3.6*t1));
  line(98+round(7.5*t1),350-round(3.6*t1),102,350-round(3.6*t1));
    str(t1:4:1,ortx);
    outtextxy(100,390,ortx);outtextxy(135,390,' m/s');
  outtextxy(70,390,'v = ');
    str((3.6*t1):4:1,ortx1);
    outtextxy(100,400,ortx1);outtextxy(135,400,' km/h');
if t1<=50 then
begin
  t1:=t1+dt;
  setcolor(15);
  line(100+round(7.5*t1),348,100+round(7.5*t1),352-round(3.6*t1));
  line(98+round(7.5*t1),350-round(3.6*t1),102,350-round(3.6*t1));
  str(t1:4:1,ortx);
  outtextxy(100,390,ortx);outtextxy(135,390,' m/s');
  outtextxy(70,390,'v = ');
  str((3.6*t1):4:1,ortx1);
  outtextxy(100,400,ortx1);outtextxy(135,400,' km/h');
end
else
begin
  t1:=50.1;
end;
      wahl:=' ';
    end;
    '2':
    begin
      setcolor(1);
  line(100+round(7.5*t1),348,100+round(7.5*t1),352-round(3.6*t1));
  line(98+round(7.5*t1),350-round(3.6*t1),102,350-round(3.6*t1));
    str(t1:4:1,ortx);
    outtextxy(100,390,ortx);outtextxy(135,390,' m/s');
  outtextxy(70,390,'v = ');
    str((3.6*t1):4:1,ortx1);
    outtextxy(100,400,ortx1);outtextxy(135,400,' km/h');
  if t1>=0.2 then
  begin
      t1:=t1-dt;
      setcolor(15);
      str(t1:4:1,ortx);
      outtextxy(100,390,ortx);outtextxy(135,390,' m/s');
      outtextxy(70,390,'v = ');
      str((3.6*t1):4:1,ortx1);
      outtextxy(100,400,ortx1);outtextxy(135,400,' km/h');

  line(100+round(7.5*t1),348,100+round(7.5*t1),352-round(3.6*t1));
  line(98+round(7.5*t1),350-round(3.6*t1),102,350-round(3.6*t1));
  end
  else
  begin
    t1:=0.1;
  end;
      wahl:=' ';
    end;
    'z':
    begin

      exit;
    end;
  end;
     repeat until keypressed;
     if keypressed then  wahl:=readkey;

until wahl='z';
end;

procedure rechnung;
begin
  clrscr;
  textbackground(7);
  textcolor(1);
  for z:=1 to 80 do
    begin
      for n:=1 to 25 do
      begin
        gotoxy(z,n);
        write(' ');
      end;
    end;
  gotoxy(17,3);write('Geschwindigkeit, Bremsweg und Anhalteweg');
  gotoxy(17,4);write('****************************************');
  gotoxy(17,6);write('Gib den gemessenen Zeitwert ein:   ');
  read(t);
  gotoxy(55,6);write(' s');
  v:=round(360/t);
  v1:=v/3.6;
  s1:=round(1/2*v1*v1/a1);
  s2:=round(1/2*v1*v1/a2);
  s3:=round(1/2*v1*v1/a3);
  h3:=round(v/3.6)+s3;
  h1:=round(v/3.6)+s1;
  h2:=round(v/3.6)+s2;
  gotoxy(13,8);write('Die Geschwindigkeit des Fahrzeuges betrug  ',v:4,' km/h');
  gotoxy(22,9);write('( Die Messstrecke betrug  100 m )');
  gotoxy(13,11);write('Der Bremsweg des Fahrzeuges hÑtte betragen ');
  gotoxy(15,12);write('bei trockener Fahrbahn:                   ',s1:4,' m');
  gotoxy(15,13);write('bei nasser Fahrbahn:                      ',s2:4,' m');
  gotoxy(15,14);write('bei Schnee:                               ',s3:4,' m');
  gotoxy(13,16);write('Der Anhalteweg hÑtte betragen              ');
  gotoxy(15,17);write('bei trockener Fahrbahn:                   ',h1:4,' m');
  gotoxy(15,18);write('bei nasser Fahrbahn:                      ',h2:4,' m');
  gotoxy(15,19);write('bei Schnee:                               ',h3:4,' m');
end;

procedure rechnung1;
begin
  clrscr;
  textbackground(7);
  textcolor(1);
  for z:=1 to 80 do
    begin
      for n:=1 to 25 do
      begin
        gotoxy(z,n);
        write(' ');
      end;
    end;
  gotoxy(12,3);write('Geschwindigkeit, Bremsweg, Anhalteweg und Zeitdauer');
  gotoxy(12,4);write('***************************************************');
  gotoxy(11,6);write('Gib einen Geschwindigkeitswert in  km/h  ein:   ');
  read(v);
  gotoxy(63,6);write(' km/h');

  v1:=v/3.6;
  s1:=round(1/2*v1*v1/a1);
  s2:=round(1/2*v1*v1/a2);
  s3:=round(1/2*v1*v1/a3);
  h3:=round(v/3.6)+s3;
  h1:=round(v/3.6)+s1;
  h2:=round(v/3.6)+s2;
  if v>0 then
  begin
  t1:=v1/a1+1;
  t2:=v1/a2+1;
  t3:=v1/a3+1;
  end
  else
  begin
  t1:=0;
  t2:=0;
  t3:=0;
  end;

  gotoxy(13,9);write('Der Bremsweg des Fahrzeuges wÅrde betragen ');
  gotoxy(15,10);write('bei trockener Fahrbahn:                   ',s1:4,' m');
  gotoxy(15,11);write('bei nasser Fahrbahn:                      ',s2:4,' m');
  gotoxy(15,12);write('bei Schnee:                               ',s3:4,' m');
  gotoxy(13,14);write('Der Anhalteweg wÅrde betragen              ');
  gotoxy(15,15);write('bei trockener Fahrbahn:                   ',h1:4,' m');
  gotoxy(15,16);write('bei nasser Fahrbahn:                      ',h2:4,' m');
  gotoxy(15,17);write('bei Schnee:                               ',h3:4,' m');
  gotoxy(13,19);write('Die Anhaltezeit wÅrde betragen');
  gotoxy(15,20);write('bei trockener Fahrbahn:                   ',t1:4:1,' s');
  gotoxy(15,21);write('bei nasser Fahrbahn:                      ',t2:4:1,' s');
  gotoxy(15,22);write('bei Schnee:                               ',t3:4:1,' s');
end;

procedure bild1;
begin
       y:=0;
       y1:=0;
       x:=299;
       b:=v2*v2/(2*a*3.6*3.6);
       b1:=v2*v2/(2*a4*3.6*3.6);
       h:=b+v2/3.6*reaktion;
       h4:=b1+v2/3.6*reaktion;
       str(b1:4:0,ortx2);
       outtextxy(80,280,ortx2);outtextxy(115,280,' m');
       str(h4:4:0,ortx4);
       outtextxy(80,350,ortx4);outtextxy(115,350,' m');
    outtextxy(170,220,'v = ');
       setcolor(12);
       str(h:4:0,ortx5);
       outtextxy(160,350,ortx5);outtextxy(195,350,' m');
       str(b:4:0,ortx3);
       outtextxy(160,280,ortx3);outtextxy(195,280,' m');
    str(a:4:1,ortx);
    outtextxy(200,210,ortx);outtextxy(235,210,' m/s˝');
    str(v2:4:0,ortx1);
    outtextxy(200,220,ortx1);outtextxy(235,220,' km/h');
    setcolor(12);
    if v2<=155 then
    begin
    if h<150 then
       line(round(300+v2*2),399,round(300+v2*2),round(400-2*h))
       else
       line(round(300+v2*2),399,round(300+v2*2),100);
    setcolor(15);
     if h4<150 then
       line(round(302+v2*2),399,round(302+v2*2),round(400-2*h4))
       else
       line(round(300+v2*2),399,round(300+v2*2),100);
    end;


       repeat
         x:=x+1;

         if y<150 then
         begin
           y:=(x-300)*(x-300)/(8*a*3.6*3.6)+(x-300)/7.2;
           putpixel(round(x),400-round(2*y),12);
         end;

         if y1<150 then
         begin
         y1:=(x-300)*(x-300)/(8*a4*3.6*3.6)+(x-300)/7.2;
         putpixel(round(x),400-round(2*y1),15);
         end;
       until x=600;
end;

procedure bild;
   begin
     a:=7.5;
     a4:=7.5;
     da:=0.1;
     v2:=50;
     dv:=1;
     reaktion:=1;
     grafik;
     bild1;
     repeat until keypressed;
     if keypressed then  wahl:=readkey;
repeat

       y:=0;
       y1:=0;
       x:=299;
       setcolor(1);
       outtextxy(80,280,ortx2);outtextxy(115,280,' m');
       outtextxy(160,280,ortx3);outtextxy(195,280,' m');
       outtextxy(80,350,ortx4);outtextxy(115,350,' m');
       outtextxy(160,350,ortx5);outtextxy(195,350,' m');
    outtextxy(200,210,ortx);outtextxy(235,210,' m/s˝');
    outtextxy(200,220,ortx1);outtextxy(235,220,' km/h');

    if v2<=155 then
    begin

   if h<150 then
       line(round(300+v2*2),399,round(300+v2*2),round(400-2*h))
       else
       line(round(300+v2*2),399,round(300+v2*2),100);
     if h4<150 then
       line(round(302+v2*2),399,round(302+v2*2),round(400-2*h4))
       else
       line(round(300+v2*2),399,round(300+v2*2),100);
   end;

       setcolor(15);
       repeat
         x:=x+1;

         if y<150 then
         begin
           y:=(x-300)*(x-300)/(8*a*3.6*3.6)+(x-300)/7.2;
           putpixel(round(x),400-round(2*y),1);
         end;

         if y1<150 then
         begin
         y1:=(x-300)*(x-300)/(8*a4*3.6*3.6)+(x-300)/7.2;
         putpixel(round(x),400-round(2*y1),1);
         end;
       until x=600;

    case wahl of
    'A':
    begin
      a:=a+da;
      bild1;
      wahl:=' ';
    end;
    'a':
    begin
      if a>=0.2 then
      begin
       a:=a-da;
      end
      else
      begin
       a:=0.1;
       end;
      bild1;
      wahl:=' ';

    end;
    'V':
    begin
      v2:=v2+dv;
      bild1;
      wahl:=' ';
    end;
    'v':
    begin
      if v2>=1 then
      begin
      v2:=v2-dv;
      end
      else
      v2:=0;
      bild1;
      wahl:=' ';
    end;
    'z':
    begin

      exit;
    end;
   end;


     repeat until keypressed;
     if keypressed then  wahl:=readkey;


until wahl='z';
end;

procedure bild2;
begin
clrscr;
  a1:=7.5;
  a2:=5;
  a3:=2.5;
  rechnung;
  repeat
  gotoxy(17,23);
  write('Beenden: "z"        Wiederholen: "w"   ');
  wahl:=' ';
  read(wahl);
  case wahl of
   'w':rechnung;
   'z':exit;
   end;
  until wahl='z';
end;

procedure bild3;
begin
clrscr;
  a1:=7.5;
  a2:=5;
  a3:=2.5;
  rechnung1;
  repeat
  gotoxy(17,24);
  write('Beenden: "z"        Wiederholen: "w"   ');
  wahl:=' ';
  read(wahl);
  case wahl of
   'w':rechnung1;
   'z':exit;
   end;
  until wahl='z';
end;


procedure farbe;
begin
  textbackground(7);
  textcolor(7);
  for m:=1 to 80 do
  begin
    for n:=1 to 25 do
    begin
      gotoxy(m,n);write(' ');
    end;
  end;
end;

procedure loesung;
begin
    if (antwort+5<=s) or (antwort-5>=s) then
    begin
      gotoxy(60,12);write('Falsch !');
      gotoxy(10,14);write('Zweiter Versuch:               m');
      gotoxy(35,14);read(antwort);
      if (antwort+5<=s) or (antwort-5>=s) then
      begin
        gotoxy(60,14);write('Falsch !');
        gotoxy(10,16);write('Dritter Versuch:               m');
        gotoxy(35,16);read(antwort);
            if (antwort+5<=s) or (antwort-5>=s) then
            begin
              gotoxy(60,16);write('Falsch !');
            end
            else
            begin
              gotoxy(60,16);write('RICHTIG');
            end;
      end
      else
      begin
        gotoxy(60,14);write('RICHTIG');
      end;
    end
    else
    begin
      gotoxy(60,12);write('RICHTIG');
    end;
    gotoxy(19,19);write('Der Anhalteweg betrÑgt theoretisch  ',round(s),' m');
end;

procedure frage;
begin
repeat
  farbe;
  textcolor(1);
  k:=random(3);
  l:=25+random(56);
  if k=0 then
  begin
    gotoxy(17,5);write('Wie gro· ist der Anhalteweg eines Fahrzeuges');
    textcolor(4);
    gotoxy(27,7);write(' bei NASSER Fahrbahn,');
    textcolor(1);
    gotoxy(17,9);write('wenn seine Geschwindigkeit ',l,' km/h betrÑgt ?');
    gotoxy(10,12);write('Erster Versuch:                m');
    gotoxy(35,12);read(antwort);
    s:=0.5*l*l/3.6/3.6/5+l/3.6;
      loesung;
  end;

  if k=1 then
  begin
    gotoxy(17,5);write('Wie gro· ist der Anhalteweg eines Fahrzeuges ');
    textcolor(4);
    gotoxy(27,7);write('bei TROCKENER Fahrbahn,');
    textcolor(1);
    gotoxy(17,9);write('wenn seine Geschwindigkeit ',l,' km/h betrÑgt ?');
    gotoxy(10,12);write('Erster Versuch:                m');
    gotoxy(35,12);read(antwort);
    s:=0.5*l*l/3.6/3.6/7.5+l/3.6;
      loesung;
  end;

  if k=2 then
  begin
    gotoxy(17,5);write('Wie gro· ist der Anhalteweg eines Fahrzeuges ');
    textcolor(4);
    gotoxy(25,7);write('bei VERSCHNEITER Fahrbahn,');
    textcolor(1);
    gotoxy(17,9);write('wenn seine Geschwindigkeit ',l,' km/h betrÑgt ?');
    gotoxy(10,12);write('Erster Versuch:                m');
    gotoxy(35,12);read(antwort);
    s:=0.5*l*l/3.6/3.6/2.5+l/3.6;
      loesung;
  end;
  gotoxy(24,23);write('Wiederholen (w)    Beenden (z)    ');
  repeat until keypressed;
  if keypressed then  wahl:=readkey;
until wahl='z';
end;

procedure quiz;
begin
 clrscr;
 frage;
end;

procedure menue;
begin
repeat
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(7);
  setcolor(1);
  outtextxy(200,100,'Graphische Darstellung von :');
  outtextxy(120,160,'Geschwindigkeitsberechnung aus Zeitmesswerten -> 1');
  outtextxy(170,200,'Umrechnung von  km/h  in  m/s   -> 2');
  outtextxy(50,240,'Anhaltewege in AbhÑngigkeit von den Stra·enverhÑltnissen  -> 3');
  outtextxy(170,280,'Bremsvorgang: v - t - Diagramm  -> 4');
  outtextxy(170,320,'Bremsvorgang: s - t - Diagramm  -> 5');
  outtextxy(170,360,'Bremsvorgang: beide  Diagramme  -> 6');
  outtextxy(220,410,'Programm beenden -> b');
wahl:=' ';

  read(wahl);
  case wahl of
   '1':geschw_zeit;
   '2':geschw_umr;
   '3':bild;
   '4':bild4;
   '5':bild5;
   '6':bild6;
   'b':
   begin
   closegraph;
   exit;
   end;
   end;
  until wahl='b';
end;

{MAIN}
begin
  repeat
  textbackground(7);
  textcolor(1);
  for z:=1 to 80 do
    begin
      for n:=1 to 25 do
      begin
        gotoxy(z,n);
        write(' ');
      end;
    end;
  gotoxy(17,3);write('Messen von Geschwindigkeiten / Anhalteweg');
  gotoxy(3,5);write('Zum Messen der Geschwindigkeit von Fahrzeugen wurde eine Strecke von 100 m');
  gotoxy(3,6);write('ausgemessen und die Zeit gemessen, die die Fahrzeuge fÅr diese Strecke');
  gotoxy(3,7);write('benîtigten. Die Geschwindigkeit berechnet sich dann als Quotient aus');
  gotoxy(3,8);write('Strecke und Zeit.');
  gotoxy(3,10);write('Der Anhalteweg eines Fahrzeuges ergibt sich als Summe des reinen Bremsweges');
  gotoxy(3,11);write('und der Strecke, die das Fahrzeug mit unverminderter Geschwindigkeit in der');
  gotoxy(3,12);write('sogenannten Schrecksekunde zurÅcklegt. Es wurde stets mit  1 s  gerechnet.');
  gotoxy(3,14);write('Die Bremsverzîgerung (z.B. 7,5 m/s˝) besagt, dass die Geschwindigkeit des');
  gotoxy(3,15);write('Fahrzeuges in jeder Sekunde um  7,5 m/s  abnimmt. Die Anhaltezeit ist die');
  gotoxy(3,16);write('Summe aus der hieraus resultierenden Bremszeit und der Reaktionszeit ( 1 s ).');
  gotoxy(15,18);write('Geschwindigkeitsberechnung       -> g');
  gotoxy(15,19);write('Geschwindigkeit und Anhaltezeit  -> h');
  gotoxy(15,20);write('Quiz (Anhaltewege erraten)       -> q');
  gotoxy(15,22);write('Graphische Darstellungen         -> a');
  gotoxy(15,24);write('Programm beenden                 -> b           ');

wahl:=' ';
  read(wahl);
  case wahl of
   'g':bild2;
   'h':bild3;
   'q':quiz;
   'a':menue;

   'b':exit;
   end;
  until wahl='b';
end.