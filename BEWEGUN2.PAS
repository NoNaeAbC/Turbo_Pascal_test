program beweg1;
uses crt,graph;
var
  farbe1,farbe2,farbe3,k,treiber,modus:integer;
  b,vx,vy,vy0,alpha,h1,a,thilfe,r,omega,x0,x1,y0,y1,t0,t1,t2,v,v0,s0,x,t,dt,y,g,h:real;
  l,c,d,vfluss,x2,x3,x4,x5,x6,x7,y2,y3,y4,y5,y6,y7:real;
  wahl1,wahl,wahl2:char;
  ortx1,ortx2,ortx3,ortx4,ortx5,ortx6,ortx7,ortx8,ortx9:string;

procedure menue;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(15);
  setcolor(1);
  outtextxy(250,75,'šberlagerung von Bewegungen');
  outtextxy(250,150,'Flussberquerung  ->  1');
  outtextxy(250,200,'Freier Fall  ->  2');
  outtextxy(250,250,'Senkrechter Wurf  ->  3');
  outtextxy(250,300,'Waagerechter Wurf  ->  4');
  outtextxy(250,350,'Schiefer Wurf  ->  5');
  outtextxy(400,400,'beenden  ->  b');
end;

procedure g00;
begin
  setbkcolor(1);
  setcolor(15);
  line(85,40,75,40);
  line(85,120,75,120);
  line(85,200,75,200);
  line(85,280,75,280);
  line(85,360,75,360);
  line(85,440,75,440);
  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);

  outtextxy(40,437,'0 m');
  outtextxy(40,357,'1 m');
  outtextxy(40,277,'2 m');
  outtextxy(40,197,'3 m');
  outtextxy(40,117,'4 m');
  outtextxy(40,37,'5 m');
  line(80,40,80,440);
end;

procedure g0;
begin
  g00;

  line(200,100,200,300);
  line(200,300,300,300);
  line(250,300,250,305);
  line(195,260,200,260);
  line(195,220,200,220);
  line(195,180,200,180);
  line(195,140,200,140);

  line(350,100,350,300);
  line(350,300,450,300);
  line(400,300,400,305);
  line(345,260,350,260);
  line(345,220,350,220);
  line(345,180,350,180);
  line(345,140,350,140);

  line(500,100,500,300);
  line(500,300,600,300);
  line(550,300,550,305);
  line(495,260,500,260);
  line(495,220,500,220);
  line(495,180,500,180);
  line(495,140,500,140);
  str(dt:6:4,ortx4);
  outtextxy(415,465,ortx4);
  outtextxy(400,370,'t =        s');
  outtextxy(400,390,'v =        m/s');
  outtextxy(400,410,'s =        m');
  outtextxy(400,430,'h =        m');
  outtextxy(170,70,'v in m/s');
  outtextxy(330,70,'s in m');
  outtextxy(480,70,'h in m');

  outtextxy(270,320,'t in s');
  outtextxy(420,320,'t in s');
  outtextxy(570,320,'t in s');

end;

procedure graphik2;
begin
  g0;
  outtextxy(240,310,'0,5');
  outtextxy(180,217,'4 ');
  outtextxy(180,137,'8 ');

  outtextxy(390,310,'0,5 ');
  outtextxy(330,217,'2 ');
  outtextxy(330,137,'4 ');

  outtextxy(540,310,'0,5');
  outtextxy(480,217,'2 ');
  outtextxy(480,137,'4 ');

  outtextxy(55,465,'dt verringern (t)   dt vergr”áern (T)   dt =        s     pause (p)');
  outtextxy(35,455,'starten (s)        h verringern (h)  h vergr”áern (H)         beenden (b)');
  outtextxy(290,15,'Freier Fall ');
end;

procedure setz2;
begin
  setcolor(15);
  str(t:4:2,ortx2);
  str(y:4:2,ortx3);
  str((h-y):4:2,ortx5);
  str(v:4:2,ortx1);
  outtextxy(445,390,ortx1);
  outtextxy(445,370,ortx2);
  outtextxy(445,410,ortx3);
  outtextxy(445,430,ortx5);
  setfillstyle(1,12);
  sector(100,440+round(80*(y-h)),0,360,3,3);
  putpixel(200+round(100*t),300-round(20*v),12);
  putpixel(350+round(100*t),300-round(40*y),12);
  putpixel(500+round(100*t),300+round(40*(y-h)),12);
end;

procedure loesch2;
begin
  setcolor(1);
  outtextxy(445,390,ortx1);
  outtextxy(445,370,ortx2);
  outtextxy(445,410,ortx3);
  outtextxy(445,430,ortx5);
  setfillstyle(1,1);
  sector(100,440+round(80*(y-h)),0,360,3,3);
end;

procedure l0;
begin
  t:=0;
  v:=g*t;
  y:=0.5*g*t*t;
  repeat
    t:=t+dt;
    y:=0.5*g*t*t;
    v:=g*t;
    putpixel(200+round(100*t),300-round(20*v),1);
    putpixel(350+round(100*t),300-round(40*y),1);
    putpixel(500+round(100*t),300+round(40*(y-h)),1);
  until y>=h;
end;

procedure loe2;
begin
      setlinestyle(1,0,1);
      line(350+round(100*t),300-round(40*y),350+round(100*t),300);
      line(350,300-round(40*y),350+round(100*t),300-round(40*y));
      line(200+round(100*t),300-round(20*v),200+round(100*t),300);
      line(200,300-round(20*v),200+round(100*t),300-round(20*v));
      line(500+round(100*t),300+round(40*(y-h)),500+round(100*t),300);
      line(500,300+round(40*(y-h)),500+round(100*t),300+round(40*(y-h)));
      setlinestyle(0,0,1);
end;

procedure loeschlinien2;
begin
      setcolor(1);
      loe2;
end;

procedure setzlinien2;
begin
      setcolor(9);
      loe2;
end;

procedure setzmarke2;
begin
    setcolor(7);         
    line(85,440+round(80*(0-h)),90,440+round(80*(0-h)));
  if thilfe>=0.1 then
  begin
    thilfe:=0;
    setcolor(7);
    line(85,440+round(80*(y-h)),90,440+round(80*(y-h)));
      loe2;
  end;
end;

procedure loeschmarke2;
begin
  t:=0;
  y:=0.5*g*t*t;
  v:=g*t;
    setcolor(1);
    line(85,440+round(80*(y-h)),90,440+round(80*(y-h)));
  thilfe:=t;
  repeat
    t:=t+dt;
    thilfe:=thilfe+dt;
    y:=0.5*g*t*t;
    v:=g*t;
    if thilfe>=0.1 then
    begin
      thilfe:=0;
    line(85,440+round(80*(y-h)),90,440+round(80*(y-h)));
      loe2;
    end;
  until y>=h;
end;

procedure auswahl2;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    's':
    begin
      l0;
      loesch2;
      loeschlinien2;
      loeschmarke2;
      t:=0;
      v:=g*t;
      y:=0.5*g*t*t;
      thilfe:=t;
      setz2;
      graphik2;
      delay(5000);
      wahl2:=' ';
      repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
          end;
        loesch2;
        t:=t+dt;
        thilfe:=thilfe+dt;
        y:=0.5*g*t*t;
        v:=g*t;
        setz2;
        setzmarke2;
        delay(10);
      until y>=h;
      setzlinien2;
    wahl:=' ';
    end;
    'T':
    begin
      setcolor(1);
        l0;
        loeschlinien2;
        loeschmarke2;
      outtextxy(415,465,ortx4);
      dt:=dt+0.0001;
      setcolor(15);
      str(dt:6:4,ortx4);
      outtextxy(415,465,ortx4);
      wahl:=' ';
    end;
    't':
    begin
    if dt>=0.0002 then
      begin
        l0;
        loeschlinien2;
        loeschmarke2;
        setcolor(1);
        outtextxy(415,465,ortx4);
        dt:=dt-0.0001;
        setcolor(15);
        str(dt:6:4,ortx4);
        outtextxy(415,465,ortx4);
      end;
    wahl:=' ';
    end;
    'h':
    begin
    if h>=0.1 then
      begin
        l0;
        loesch2;
       sector(100,440+round(80*(0-h)),0,360,3,3);
        loeschlinien2;
        loeschmarke2;
        h:=h-0.05;
        setcolor(15);
       str(h:4:2,ortx5);
       outtextxy(445,430,ortx5);
       setfillstyle(1,12);
       sector(100,440+round(80*(0-h)),0,360,3,3);
      end;
    wahl:=' ';
    end;
    'H':
    begin
    if h<=5 then
      begin
        l0;
        loesch2;
       sector(100,440+round(80*(0-h)),0,360,3,3);
        loeschlinien2;
        loeschmarke2;
        h:=h+0.05;
        setcolor(15);
       str(h:4:2,ortx5);
       outtextxy(445,430,ortx5);
       setfillstyle(1,12);
       sector(100,440+round(80*(0-h)),0,360,3,3);
      end;
    wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure p2;
begin
  cleardevice;
    h:=5;
    g:=9.81;
    t:=0;
    y:=0.5*g*t*t;
    v:=g*t;
    dt:=0.002;
    graphik2;
    setz2;
    auswahl2;
  menue;
end;

procedure graphik3;
begin
  g0;
  line(200,400,200,300);
  line(200,340,195,340);
  line(200,380,195,380);

  outtextxy(240,310,'1,0');
  outtextxy(180,257,'4 ');
  outtextxy(180,217,'8 ');
  outtextxy(170,177,'12 ');
  outtextxy(170,337,'-4 ');
  outtextxy(170,377,'-8 ');

  outtextxy(390,310,'1,0 ');
  outtextxy(330,217,'4 ');
  outtextxy(330,137,'8 ');


  outtextxy(540,310,'1,0');
  outtextxy(480,217,'4 ');
  outtextxy(480,137,'8 ');

  outtextxy(55,465,'dt verringern (t)   dt vergr”áern (T)   dt =        s     pause (p)');
  outtextxy(35,455,'starten (s)        v verringern (v)  v vergr”áern (V)         beenden (b)');
  outtextxy(260,15,'Senkrechter Wurf ');
end;

procedure setz3;
begin
  setcolor(15);
  str(t:4:2,ortx2);
  str(y:4:2,ortx3);
  str(h:4:2,ortx5);
  str(v:4:2,ortx1);
  outtextxy(445,390,ortx1);
  outtextxy(445,370,ortx2);
  outtextxy(445,410,ortx3);
  outtextxy(445,430,ortx5);
  setfillstyle(1,12);
  sector(100,440-round(80*h),0,360,3,3);
  putpixel(200+round(50*t),300-round(10*v),12);
  putpixel(350+round(50*t),300-round(20*y),12);
  putpixel(500+round(50*t),300-round(20*h),12);
end;

procedure loesch3;
begin
  setcolor(1);
  outtextxy(445,390,ortx1);
  outtextxy(445,370,ortx2);
  outtextxy(445,410,ortx3);
  outtextxy(445,430,ortx5);
  setfillstyle(1,1);
  sector(100,440-round(80*h),0,360,3,3);
end;

procedure l3;
begin
  t:=0;
  v:=v0+g*t;
    h:=v0*v0/g/2-0.5*g*(t+v0/g)*(t+v0/g);
  if v<=0 then y:=h else y:=v0*v0/g/2+0.5*g*(t+v0/g)*(t+v0/g);
  repeat
    t:=t+dt;
    h:=v0*v0/g/2-0.5*g*(t+v0/g)*(t+v0/g);
    v:=v0+g*t;
  if v<=0 then y:=h else y:=v0*v0/g/2+0.5*g*(t+v0/g)*(t+v0/g);
    putpixel(200+round(50*t),300-round(10*v),1);
    putpixel(350+round(50*t),300-round(20*y),1);
    putpixel(500+round(50*t),300-round(20*h),1);
  until v>=-v0;
end;

procedure loe3;
begin
      setlinestyle(1,0,1);
      line(350+round(50*t),300-round(20*y),350+round(50*t),300);
      line(350,300-round(20*y),350+round(50*t),300-round(20*y));
      line(200+round(50*t),300-round(10*v),200+round(50*t),300);
      line(200,300-round(10*v),200+round(50*t),300-round(10*v));
      line(500+round(50*t),300-round(20*h),500+round(50*t),300);
      line(500,300-round(20*h),500+round(50*t),300-round(20*h));
      setlinestyle(0,0,1);
end;

procedure loeschlinien3;
begin
      setcolor(1);
      loe3;
end;

procedure setzlinien3;
begin
      setcolor(9);
      loe3;
end;

procedure setzmarke3;
begin
    setcolor(7);         
    line(85,440,90,440);
  if thilfe>=0.2 then
  begin
    thilfe:=0;
    setcolor(7);
    line(85,440-round(80*h),90,440-round(80*h));
      loe3;
  end;
end;

procedure loeschmarke3;
begin
  t:=0;
    h:=v0*v0/g/2-0.5*g*(t+v0/g)*(t+v0/g);
  v:=v0+g*t;
  if v<=0 then y:=h else y:=v0*v0/g/2+0.5*g*(t+v0/g)*(t+v0/g);
    setcolor(1);
    line(85,440-round(80*h),90,440-round(80*h));
  thilfe:=t;
  repeat
    t:=t+dt;
    thilfe:=thilfe+dt;
    h:=v0*v0/g/2-0.5*g*(t+v0/g)*(t+v0/g);
    v:=v0+g*t;
  if v<=0 then y:=h else y:=v0*v0/g/2+0.5*g*(t+v0/g)*(t+v0/g);
    if thilfe>=0.2 then
    begin
      thilfe:=0;
    line(85,440-round(80*h),90,440-round(80*h));
      loe3;
    end;
  until v>=-v0;
end;

procedure auswahl3;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    's':
    begin
      l3;
      loesch3;
      loeschlinien3;
      loeschmarke3;
      t:=0;
      v:=v0+g*t;
      h:=v0*v0/g/2-0.5*g*(t+v0/g)*(t+v0/g);
      if v<=0 then y:=h else y:=v0*v0/g/2+0.5*g*(t+v0/g)*(t+v0/g);
      thilfe:=t;
      setz3;
      graphik3;
      delay(5000);
      wahl2:=' ';
      repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
          end;
        loesch3;
        t:=t+dt;
        thilfe:=thilfe+dt;
        h:=v0*v0/g/2-0.5*g*(t+v0/g)*(t+v0/g);
        v:=v0+g*t;
        if v<=0 then y:=h else y:=v0*v0/g/2+0.5*g*(t+v0/g)*(t+v0/g);
        setz3;
        setzmarke3;
        delay(10);
      until v>=-v0;
      setzlinien3;
    wahl:=' ';
    end;
    'T':
    begin
      setcolor(1);
        l0;
        loeschlinien3;
        loeschmarke3;
      outtextxy(415,465,ortx4);
      dt:=dt+0.0001;
      setcolor(15);
      str(dt:6:4,ortx4);
      outtextxy(415,465,ortx4);
      wahl:=' ';
    end;
    't':
    begin
    if dt>=0.0002 then
      begin
        l0;
        loeschlinien3;
        loeschmarke3;
        setcolor(1);
        outtextxy(415,465,ortx4);
        dt:=dt-0.0001;
        setcolor(15);
        str(dt:6:4,ortx4);
        outtextxy(415,465,ortx4);
      end;
    wahl:=' ';
    end;
    'v':
    begin
    if v0>=-9.95 then
      begin
        loesch3;
        l3;
        loeschlinien3;
        loeschmarke3;
        v0:=v0-0.05;
        setcolor(15);
       str(v0:4:2,ortx1);
       outtextxy(445,390,ortx1);
       setfillstyle(1,12);
       sector(100,440+round(80*(0-h)),0,360,3,3);
      end;
    wahl:=' ';
    end;
    'V':
    begin
    if v0<=-1 then
      begin
        loesch3;
        l3;
        loeschlinien3;
        loeschmarke3;
        v0:=v0+0.05;
        setcolor(15);
       str(v0:4:2,ortx1);
       outtextxy(445,390,ortx1);
       setfillstyle(1,12);
       sector(100,440+round(80*(0-h)),0,360,3,3);
      end;
    wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure p3;
begin
  cleardevice;
    h:=0;
    v0:=-5;
    g:=9.81;
    t:=0;
    h:=v0*t+0.5*g*t*t;
    v:=v0+g*t;
    dt:=0.002;
    graphik3;
    setz3;
    auswahl3;
  menue;
end;

procedure g40;
begin
  g00;
  line(200,60,200,200);
  line(200,200,300,200);
  line(250,200,250,205);
  line(195,160,200,160);
  line(195,120,200,120);
  line(195,80,200,80);

  line(350,60,350,200);
  line(350,200,450,200);
  line(400,200,400,205);
  line(345,160,350,160);
  line(345,120,350,120);
  line(345,80,350,80);

  line(500,60,500,200);
  line(500,200,600,200);
  line(550,200,550,205);
  line(495,160,500,160);
  line(495,120,500,120);
  line(495,80,500,80);

  str(dt:6:4,ortx4);
  if h1=0 then
  outtextxy(365,465,ortx4)
  else
  outtextxy(390,465,ortx4);
  outtextxy(170,45,'        in m/s');
  outtextxy(510,370,'t =       s');

  setcolor(14);
  outtextxy(510,390,'v =       m/s');
  outtextxy(170,45,'      v ');

  setcolor(10);
  outtextxy(390,410,'x =       m');
  outtextxy(330,45,'x');
  outtextxy(170,45,'vx');
  outtextxy(500,410,'vx =       m/s');

  setcolor(12);
  outtextxy(500,430,'vy =       m/s');
  outtextxy(375,430,'h/y =       m');
  outtextxy(170,45,'   vy   ');
  outtextxy(330,45,'  y ');

  setcolor(15);
  outtextxy(330,45,'    in m');
  outtextxy(480,45,'y in m');

  outtextxy(270,220,'t in s');
  outtextxy(420,220,'t in s');

  outtextxy(570,220,'x in m');

  outtextxy(240,210,'0,5');
  outtextxy(180,157,'4 ');
  outtextxy(180,117,'8 ');
  outtextxy(170,77,'12 ');

  outtextxy(390,210,'0,5 ');
  outtextxy(330,157,'2 ');
  outtextxy(330,117,'4 ');
  outtextxy(330,77,'6 ');


  outtextxy(540,210,'3,0');
  outtextxy(480,157,'2 ');
  outtextxy(480,117,'4 ');
  outtextxy(480,77,'6 ');
end;

procedure graphik4;
begin
  g40;
  outtextxy(5,465,'dt verringern (t)   dt vergr”áern (T)   dt =        s    pause (p)  beenden (b)');
  outtextxy(5,455,'starten (s)   v verringern / vergr”áern (v/V)   h verringern / vergr”áern (h/H) ');
  outtextxy(250,10,'Waagerechter Wurf ');
end;

procedure setz4;
begin
  setcolor(10);
  str(vx:4:2,ortx3);
  outtextxy(545,410,ortx3);
  str(x:4:2,ortx6);
  outtextxy(425,410,ortx6);
  setcolor(12);
  str(vy:4:2,ortx5);
  outtextxy(545,430,ortx5);
  str(y:4:2,ortx7);
  outtextxy(425,430,ortx7);
  setcolor(14);
  str(v:4:2,ortx1);
  outtextxy(545,390,ortx1);
  setcolor(15);
  str(t:4:2,ortx2);
  if h1=1 then
  begin
    str((alpha/pi*180):4:2,ortx8);
    outtextxy(425,390,ortx8);
  end;
  outtextxy(545,370,ortx2);
  setfillstyle(1,12);
  sector(100,440-round(80*y),0,360,3,3);
  sector(100+round(80*x),440-round(80*y),0,360,3,3);
  setcolor(14);
  line(100+round(80*x),440-round(80*y),100+round(80*x+5*vx),440-round(80*y-5*vy));
  a:=pi/6+arctan(vy/vx);
  b:=-pi/6+arctan(vy/vx);
  line(100+round(80*x+5*vx),440-round(80*y-5*vy),100+round(80*x+5*vx-5*cos(a)),440-round(80*y-5*vy+5*sin(a)));
  line(100+round(80*x+5*vx),440-round(80*y-5*vy),100+round(80*x+5*vx-5*cos(b)),440-round(80*y-5*vy+5*sin(b)));
  setcolor(10);
  line(100+round(80*x),440-round(80*y),100+round(80*x+5*vx),440-round(80*y));
  line(100+round(80*x+5*vx),440-round(80*y),97+round(80*x+5*vx),443-round(80*y));
  line(100+round(80*x+5*vx),440-round(80*y),97+round(80*x+5*vx),437-round(80*y));
  setcolor(12);
  line(100+round(80*x),440-round(80*y),100+round(80*x),440-round(80*y-5*vy));
  if vy>=0 then begin
  line(100+round(80*x),440-round(80*y-5*vy),97+round(80*x),437-round(80*y-5*vy));
  line(100+round(80*x),440-round(80*y-5*vy),103+round(80*x),437-round(80*y-5*vy));
  end
  else
  begin
  line(100+round(80*x),440-round(80*y-5*vy),97+round(80*x),443-round(80*y-5*vy));
  line(100+round(80*x),440-round(80*y-5*vy),103+round(80*x),443-round(80*y-5*vy));
  end;

  putpixel(200+round(100*t),200-round(10*v),14);
  putpixel(200+round(100*t),200-round(10*vx),10);
  putpixel(200+round(100*t),200-round(10*vy),12);
  putpixel(350+round(100*t),200-round(20*x),10);
  putpixel(350+round(100*t),200-round(20*y),12);
  putpixel(500+round(20*x),200-round(20*y),11);
end;

procedure loesch4;
begin
  setcolor(1);
  outtextxy(545,390,ortx1);
  outtextxy(545,370,ortx2);
  outtextxy(545,410,ortx3);
  outtextxy(545,430,ortx5);
  outtextxy(425,410,ortx6);
  outtextxy(425,430,ortx7);
  if h1=1 then
  begin
    outtextxy(425,390,ortx8);
  end;
  setfillstyle(1,1);
  sector(100,440-round(80*y),0,360,3,3);
  sector(100+round(80*x),440-round(80*y),0,360,3,3);
  line(100+round(80*x),440-round(80*y),100+round(80*x+5*vx),440-round(80*y));
  line(100+round(80*x+5*vx),440-round(80*y),97+round(80*x+5*vx),443-round(80*y));
  line(100+round(80*x+5*vx),440-round(80*y),97+round(80*x+5*vx),437-round(80*y));

  line(100+round(80*x),440-round(80*y),100+round(80*x),440-round(80*y-5*vy));
  if vy>=0 then begin
  line(100+round(80*x),440-round(80*y-5*vy),97+round(80*x),437-round(80*y-5*vy));
  line(100+round(80*x),440-round(80*y-5*vy),103+round(80*x),437-round(80*y-5*vy));
  end
  else
  begin
  line(100+round(80*x),440-round(80*y-5*vy),97+round(80*x),443-round(80*y-5*vy));
  line(100+round(80*x),440-round(80*y-5*vy),103+round(80*x),443-round(80*y-5*vy));
  end;
  line(100+round(80*x),440-round(80*y),100+round(80*x+5*vx),440-round(80*y-5*vy));
  a:=pi/6+arctan(vy/vx);
  b:=-pi/6+arctan(vy/vx);
  line(100+round(80*x+5*vx),440-round(80*y-5*vy),100+round(80*x+5*vx-5*cos(a)),440-round(80*y-5*vy+5*sin(a)));
  line(100+round(80*x+5*vx),440-round(80*y-5*vy),100+round(80*x+5*vx-5*cos(b)),440-round(80*y-5*vy+5*sin(b)));
end;

procedure l4;
begin
  t:=0;
  vy:=vy0+g*t;
  x:=vx*t;
  y:=h+vy0*vy0/2/g-0.5*g*(t+vy0/g)*(t+vy0/g);
  v:=sqrt(vx*vx+vy*vy);
  repeat
    t:=t+dt;
  vy:=vy0+g*t;
   x:=vx*t;
   y:=h+vy0*vy0/2/g-0.5*g*(t+vy0/g)*(t+vy0/g);
   v:=sqrt(vx*vx+vy*vy);
   putpixel(200+round(100*t),200-round(10*v),1);
   putpixel(200+round(100*t),200-round(10*vx),1);
   putpixel(200+round(100*t),200-round(10*vy),1);
   putpixel(350+round(100*t),200-round(20*x),1);
   putpixel(350+round(100*t),200-round(20*y),1);
   putpixel(500+round(20*x),200-round(20*y),1);
  until y<=0;
end;

procedure loe4;
begin
      setlinestyle(1,0,1);
      line(350+round(100*t),200-round(20*x),350+round(100*t),200);
      line(350+round(100*t),200-round(20*y),350+round(100*t),200);
      line(200+round(100*t),200-round(10*v),200+round(100*t),200);
      line(500+round(20*x),200-round(20*y),500+round(20*x),200);
      line(500,200-round(20*y),500+round(20*x),200-round(20*y));
      setlinestyle(0,0,1);
end;

procedure loeschlinien4;
begin
      setcolor(1);
      loe4;
end;

procedure setzlinien4;
begin
      setcolor(9);
      loe4;
end;

procedure setzmarke4;
begin
    setcolor(7);         
    line(85,440-round(80*h),90,440-round(80*h));
  if thilfe>=0.2 then
  begin
    thilfe:=0;
    setcolor(7);
    line(85,440-round(80*y),90,440-round(80*y));
      loe4;
  end;
end;

procedure loeschmarke4;
begin
  t:=0;
  vy:=vy0+g*t;
  x:=vx*t;
  y:=h+vy0*vy0/2/g-0.5*g*(t+vy0/g)*(t+vy0/g);
  v:=sqrt(vx*vx+vy*vy);
    setcolor(1);
    line(85,440-round(80*h),90,440-round(80*h));
  thilfe:=t;
  repeat
    t:=t+dt;
    thilfe:=thilfe+dt;
    vy:=vy0+g*t;
    x:=vx*t;
    y:=h+vy0*vy0/2/g-0.5*g*(t+vy0/g)*(t+vy0/g);
    v:=sqrt(vx*vx+vy*vy);
    if thilfe>=0.2 then
    begin
      thilfe:=0;
      line(85,440-round(80*y),90,440-round(80*y));
      loe4;
    end;
  until y<=0;
end;

procedure graphik5;
begin
  g40;
  line(200,260,200,200);
  line(195,240,200,240);
  outtextxy(175,237,'-4');
  outtextxy(357,390,'alpha =       ø');
  outtextxy(7,465,'alpha ver„ndern (a/A)  dt ver„ndern (t/T)  dt =        s    pause (p)  beenden (b)');
  outtextxy(5,455,'starten (s)   v verringern / vergr”áern (v/V)   h verringern / vergr”áern (h/H) ');
  outtextxy(280,10,'Schr„ger Wurf ');
end;

procedure auswahl4;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    's':
    begin
      l4;
      loesch4;
      loeschlinien4;
      loeschmarke4;
      t:=0;
      v:=v0;
      vx:=v0*cos(alpha);
      vy0:=-v0*sin(alpha);
      vy:=vy0+g*t;
      x:=vx*t;
      y:=h+vy0*vy0/2/g-0.5*g*(t+vy0/g)*(t+vy0/g);
      v:=sqrt(vx*vx+vy*vy);
      thilfe:=t;
      setz4;
      if h1=0 then graphik4 else graphik5;
      delay(5000);
      wahl2:=' ';
      repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
          end;
        loesch4;
        t:=t+dt;
        thilfe:=thilfe+dt;
        vy:=vy0+g*t;
        x:=vx*t;
        y:=h+vy0*vy0/2/g-0.5*g*(t+vy0/g)*(t+vy0/g);
        v:=sqrt(vx*vx+vy*vy);
        setz4;
        setzmarke4;
        delay(10);
      until y<=0;
      setzlinien4;
    wahl:=' ';
    end;
    'T':
    begin
      setcolor(1);
        l0;
        loeschlinien4;
        loeschmarke4;
  if h1=0 then
  outtextxy(365,465,ortx4)
  else
  outtextxy(390,465,ortx4);
      dt:=dt+0.0001;
      setcolor(15);
      str(dt:6:4,ortx4);
  if h1=0 then
  outtextxy(365,465,ortx4)
  else
  outtextxy(390,465,ortx4);
      wahl:=' ';
    end;
    't':
    begin
    if dt>=0.0002 then
      begin
        l0;
        loeschlinien4;
        loeschmarke4;
        setcolor(1);
  if h1=0 then
  outtextxy(365,465,ortx4)
  else
  outtextxy(390,465,ortx4);
        dt:=dt-0.0001;
        setcolor(15);
        str(dt:6:4,ortx4);
  if h1=0 then
  outtextxy(365,465,ortx4)
  else
  outtextxy(390,465,ortx4);
      end;
    wahl:=' ';
    end;
    'v':
    begin
    if v0>=0.05 then
      begin
        loesch4;
        l4;
        loeschlinien4;
        loeschmarke4;
        v0:=v0-0.05;
        setcolor(15);
       str(v0:4:2,ortx1);
       outtextxy(545,390,ortx1);
       setfillstyle(1,12);
       sector(100,440+round(80*(0-h)),0,360,3,3);
      end;
    wahl:=' ';
    end;
    'V':
    begin
    if v0<=10 then
      begin
        loesch4;
        l4;
        loeschlinien4;
        loeschmarke4;
        v0:=v0+0.05;
        setcolor(15);
       str(v0:4:2,ortx1);
       outtextxy(545,390,ortx1);
       setfillstyle(1,12);
       sector(100,440+round(80*(0-h)),0,360,3,3);
      end;
    wahl:=' ';
    end;
    'a':
    begin
    if alpha>=-89*pi/180 then
    begin
        loesch4;
        l4;
        loeschlinien4;
        loeschmarke4;
        sector(100,440+round(80*(0-h)),0,360,3,3);
        alpha:=alpha-pi/180;
        setcolor(15);
    str((alpha/pi*180):4:2,ortx8);
    outtextxy(425,390,ortx8);
       setfillstyle(1,12);
       sector(100,440+round(80*(0-h)),0,360,3,3);
      end;
    wahl:=' ';
    end;
    'A':
    begin
    if alpha<=89*pi/180 then
    begin
        loesch4;
        l4;
        loeschlinien4;
        loeschmarke4;
        sector(100,440+round(80*(0-h)),0,360,3,3);
        alpha:=alpha+pi/180;
        setcolor(15);
    str((alpha/pi*180):4:2,ortx8);
    outtextxy(425,390,ortx8);
       setfillstyle(1,12);
       sector(100,440+round(80*(0-h)),0,360,3,3);
      end;
    wahl:=' ';
    end;

    'h':
    begin
    if h>=0.5 then
      begin
        loesch4;
        l4;
        loeschlinien4;
        loeschmarke4;
        sector(100,440+round(80*(0-h)),0,360,3,3);
        h:=h-0.05;
        setcolor(15);
       str(h:4:2,ortx7);
       outtextxy(425,430,ortx7);
       setfillstyle(1,12);
       sector(100,440+round(80*(0-h)),0,360,3,3);
      end;
    wahl:=' ';
    end;
    'H':
    begin
    if h<=5 then
      begin
        loesch4;
        l4;
        loeschlinien4;
        loeschmarke4;
        sector(100,440+round(80*(0-h)),0,360,3,3);
        h:=h+0.05;
        setcolor(15);
       str(h:4:2,ortx7);
       outtextxy(425,430,ortx7);
       setfillstyle(1,12);
       sector(100,440+round(80*(0-h)),0,360,3,3);
      end;
    wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure p4;
begin
  cleardevice;
    h1:=0;
    h:=3;
    v0:=4;
    v:=v0;
    alpha:=0;
    g:=9.81;
    t:=0;
    vx:=v0*cos(alpha);
    vy0:=-v0*sin(alpha);
    vy:=vy0;
    x:=vx*t;
    y:=h+vy*vy/2/g-0.5*g*(t+vy/g)*(t+vy/g);
    v:=sqrt(vx*vx+vy*vy);
    dt:=0.002;
    graphik4;
    setz4;
    auswahl4;
  menue;
end;

procedure p5;
begin
  cleardevice;
  h1:=1;
    h:=1;
    v0:=4;
    v:=v0;
    alpha:=pi/6;
    g:=9.81;
    t:=0;
    vx:=v0*cos(alpha);
    vy0:=-v0*sin(alpha);
    vy:=vy0;
    x:=vx*t;
    y:=h+vy*vy/2/g-0.5*g*(t+vy/g)*(t+vy/g);
    v:=sqrt(vx*vx+vy*vy);
    dt:=0.002;
    graphik5;
    setz4;
    auswahl4;
  menue;
end;



procedure graphik1;
begin
  setbkcolor(1);
  setcolor(15);
  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  line(70,160,570,160);
  line(70,327,570,327);
  outtextxy(180,10,'Flussberquerung ( Flussbreite: 150 m )');
  outtextxy(148,145,'B');
  outtextxy(148,337,'A');
  circle(150,160,2);
  circle(150,327,2);
  setcolor(12);
  outtextxy(436,370,'v(Boot) =       m/s');
  str(v0:4:2,ortx1);
  outtextxy(520,370,ortx1);
  setcolor(10);
  outtextxy(429,390,'v(Fluss) =       m/s');
  str(vfluss:4:2,ortx3);
  outtextxy(520,390,ortx3);
  setcolor(14);
  outtextxy(270,380,'v(res) =       m/s');
  str((sqrt(vx*vx+vy*vy)):4:2,ortx9);
  outtextxy(350,380,ortx9);
  setcolor(15);
  outtextxy(477,410,'vx =       m/s');
  outtextxy(477,430,'vy =       m/s');
  outtextxy(337,410,'t =       s');
  outtextxy(307,430,'alpha =       ø');
  str(vx:4:2,ortx4);
  outtextxy(520,410,ortx4);
  str(vy:4:2,ortx5);
  outtextxy(520,430,ortx5);
  str(((pi/2+alpha)/pi*180):4:2,ortx8);
  outtextxy(370,430,ortx8);
  str(dt:6:4,ortx6);
  outtextxy(430,465,ortx6);
  outtextxy(12,465,'alpha ver„ndern (a/A)    dt ver„ndern (t/T)    dt =        s      beenden (b)');
  outtextxy(5,455,'starten (s)    v(Boot) ver„ndern (v/V)    v(Fluss) ver„ndern (f/F)    pause (p)');
end;

procedure boot;
begin
  x1:=x0+3*cos(alpha)-3*sin(alpha);
  y1:=y0+3*sin(alpha)+3*cos(alpha);
  x2:=x0+3*cos(alpha)+3*sin(alpha);
  y2:=y0+3*sin(alpha)-3*cos(alpha);
  x3:=x0+11*cos(alpha)-3*sin(alpha);
  y3:=y0+11*sin(alpha)+3*cos(alpha);
  x4:=x0+11*cos(alpha)+3*sin(alpha);
  y4:=y0+11*sin(alpha)-3*cos(alpha);
  x5:=x0+15*cos(alpha);
  y5:=y0+15*sin(alpha);
  x6:=x0+3*cos(alpha);
  y6:=y0+3*sin(alpha);
  line(round(x1),round(y1),round(x3),round(y3));
  line(round(x2),round(y2),round(x4),round(y4));
  line(round(x3),round(y3),round(x5),round(y5));
  line(round(x4),round(y4),round(x5),round(y5));
  circle(round(x6),round(y6),3);
end;

procedure welle;
begin
  setlinestyle(3,0,1);
  for k:=1 to 10 do
  begin
    line(round(20+50*k+vfluss*t1),180,round(20+50*k+vfluss*t1),307);
  end;
  setlinestyle(0,0,1);
end;

procedure setz11;
begin
  setcolor(15);
  str(t:4:2,ortx2);
  outtextxy(370,410,ortx2);
  setcolor(14);
  str((sqrt(vx*vx+vy*vy)):4:2,ortx9);
  outtextxy(350,380,ortx9);
  setcolor(12);
  str(v0:4:2,ortx1);
  outtextxy(520,370,ortx1);
  setcolor(10);
  str(vfluss:4:2,ortx3);
  outtextxy(520,390,ortx3);
  setcolor(15);
  str(vx:4:2,ortx4);
  outtextxy(520,410,ortx4);
  str(vy:4:2,ortx5);
  outtextxy(520,430,ortx5);
  str(((pi/2+alpha)/pi*180):4:2,ortx8);
  outtextxy(370,430,ortx8);
  boot;
  setcolor(9);
  welle;
end;

procedure setz1;
begin
  setcolor(15);
  str(t:4:2,ortx2);
  outtextxy(370,410,ortx2);
  boot;
  setcolor(9);
  welle;
end;

procedure loesch1;
begin
  setcolor(1);
  outtextxy(370,410,ortx2);
  boot;
  welle;
end;


procedure loesch11;
begin
  setcolor(1);
  outtextxy(370,410,ortx2);
  outtextxy(520,370,ortx1);
  outtextxy(520,390,ortx3);
  outtextxy(520,410,ortx4);
  outtextxy(520,430,ortx5);
  outtextxy(370,430,ortx8);
  outtextxy(350,380,ortx9);
  boot;
end;

procedure setz120;
begin
  setcolor(farbe1);
  line(round(x1),round(y1),round(x1+l*vfluss),round(y1));
  line(round(x1+l*vfluss),round(y1),round(x1-3+l*vfluss),round(y1+3));
  line(round(x1+l*vfluss),round(y1),round(x1-3+l*vfluss),round(y1-3));

  setcolor(farbe2);
  c:=pi/2+alpha;
  a:=4*pi/6+pi/2+alpha;
  b:=-4*pi/6+pi/2+alpha;
  line(round(x1),round(y1),round(x1+l*v0*sin(c)),round(y1-l*v0*cos(c)));
  line(round(x1+l*v0*sin(c)),round(y1-l*v0*cos(c)),round(x1+l*v0*sin(c)+5*cos(a)),round(y1-l*v0*cos(c)+5*sin(a)));
  line(round(x1+l*v0*sin(c)),round(y1-l*v0*cos(c)),round(x1+l*v0*sin(c)-5*cos(b)),round(y1-l*v0*cos(c)-5*sin(b)));

  setcolor(farbe3);
  a:=l*vfluss+l*v0*sin(c);
  b:=l*v0*cos(c);
  line(round(x1),round(y1),round(x1+a),round(y1-b));
  line(round(x1+a),round(y1-b),round(x1+a-5*sin(arctan(a/b)+pi/6)),round(y1-b+5*cos(arctan(a/b)+pi/6)));
  line(round(x1+a),round(y1-b),round(x1+a-5*sin(arctan(a/b)-pi/6)),round(y1-b+5*cos(arctan(a/b)-pi/6)));
end;

procedure setz12;
begin
  farbe1:=10;
  farbe2:=12;
  farbe3:=14;
  l:=5;
  x1:=550;
  y1:=100;
  setz120;
end;

procedure loesch12;
begin
  farbe1:=1;
  farbe2:=1;
  farbe3:=1;
  l:=5;
  x1:=550;
  y1:=100;
  setz120;
end;

procedure setz13;
begin
  farbe1:=10;
  farbe2:=12;
  farbe3:=14;
  l:=15;
  x1:=x7;
  y1:=y7;
  setz120;
end;

procedure loesch13;
begin
  farbe1:=1;
  farbe2:=1;
  farbe3:=1;
  l:=15;
  x1:=x7;
  y1:=y7;
  setz120;
end;

procedure auswahl1;
begin
   t1:=16;
  wahl:=' ';
  repeat
    setcolor(1);
    line(round(19+50),180,round(19+50),307);
    welle;
      if (vfluss*t1>=50) then t1:=0;
      t1:=t1+dt;
    setcolor(15);
    boot;
    setcolor(9);
    welle;
    if y0<=190 then
    setz13;
    delay(20);
    if keypressed then wahl:=readkey;
    case wahl of
    's':
    begin
      loesch11;
      welle;
      loesch13;
    outtextxy(50,120,'Das Boot ist im Abstand von         m  bzgl. B gelandet.');
    outtextxy(275,120,ortx7);
      t:=0;
      x0:=x7;
      y0:=y7;
      delay(50);
        vy:=v0*cos(pi/2+alpha);
        vx:=vfluss+v0*sin(pi/2+alpha);
      graphik1;
      setz12;
      wahl1:=' ';
      repeat
        if keypressed then wahl1:=readkey;
          case wahl1 of
          'p':wahl1:=readkey;
           chr(77):
    begin
        loesch12;
        loesch13;
        loesch11;
        outtextxy(370,430,ortx8);
        alpha:=alpha+5*pi/180;
        if (vfluss*t1>=50) then t1:=0;
        t:=t+dt;
        t1:=t1+dt;
        vy:=v0*cos(pi/2+alpha);
        vx:=vfluss+v0*sin(pi/2+alpha);
        x0:=x0+vx*dt;
        y0:=y0-vy*dt;
        setz11;
        delay(10);
        setz12;
        setcolor(15);
        str(((pi/2+alpha)/pi*180):4:2,ortx8);
        outtextxy(370,430,ortx8);
        boot;
  line(70,327,570,327);
  outtextxy(148,337,'A');
  circle(150,327,2);
    wahl1:=' ';
    end;
           chr(75):
    begin
        loesch12;
        loesch13;
        loesch11;
        outtextxy(370,430,ortx8);
        alpha:=alpha-5*pi/180;
        if (vfluss*t1>=50) then t1:=0;
        t:=t+dt;
        t1:=t1+dt;
        vy:=v0*cos(pi/2+alpha);
        vx:=vfluss+v0*sin(pi/2+alpha);
        x0:=x0+vx*dt;
        y0:=y0-vy*dt;
        setz11;
        delay(10);
        setz12;
        setcolor(15);
        str(((pi/2+alpha)/pi*180):4:2,ortx8);
        outtextxy(370,430,ortx8);
        boot;
  line(70,327,570,327);
  outtextxy(148,337,'A');
  circle(150,327,2);
    wahl1:=' ';
    end;
           chr(72):
    begin
        loesch12;
        loesch13;
        loesch11;
        outtextxy(520,370,ortx1);
        v0:=v0+0.1;
        if (vfluss*t1>=50) then t1:=0;
        t:=t+dt;
        t1:=t1+dt;
        vy:=v0*cos(pi/2+alpha);
        vx:=vfluss+v0*sin(pi/2+alpha);
        x0:=x0+vx*dt;
        y0:=y0-vy*dt;
        setz11;
        delay(10);
        setz12;
        setcolor(12);
        str(v0:4:2,ortx1);
        outtextxy(520,370,ortx1);
        boot;
  setcolor(15);
  line(70,327,570,327);
  outtextxy(148,337,'A');
  circle(150,327,2);
    wahl1:=' ';
    end;
           chr(80):
    begin
        loesch12;
        loesch13;
        loesch11;
        outtextxy(520,370,ortx1);
        v0:=v0-0.1;
        if (vfluss*t1>=50) then t1:=0;
        t:=t+dt;
        t1:=t1+dt;
        vy:=v0*cos(pi/2+alpha);
        vx:=vfluss+v0*sin(pi/2+alpha);
        x0:=x0+vx*dt;
        y0:=y0-vy*dt;
        setz11;
        delay(10);
        setz12;
        setcolor(12);
        str(v0:4:2,ortx1);
        outtextxy(520,370,ortx1);
        boot;
  setcolor(15);
  line(70,327,570,327);
  outtextxy(148,337,'A');
  circle(150,327,2);
    wahl1:=' ';
    end;
          end;
        loesch1;
        if (vfluss*t1>=50) then t1:=0;
        t:=t+dt;
        t1:=t1+dt;
        vy:=v0*cos(pi/2+alpha);
        vx:=vfluss+v0*sin(pi/2+alpha);
        x0:=x0+vx*dt;
        y0:=y0-vy*dt;
        setz1;
        delay(10);
      until (y0<=175) or (wahl1='b');
    setz13;
    outtextxy(50,120,'Das Boot ist im Abstand von         m  bzgl. B gelandet.');
    str((x0-x7):6:1,ortx7);
    outtextxy(275,120,ortx7);
    wahl:=' ';
    end;
    'T':
    begin
      setcolor(1);
        outtextxy(430,465,ortx6);
      dt:=dt+0.0005;
      setcolor(15);
      str(dt:6:4,ortx6);
      outtextxy(430,465,ortx6);
      wahl:=' ';
    end;
    't':
    begin
    if dt>=0.0002 then
      begin
        setcolor(1);
        outtextxy(430,465,ortx6);
        dt:=dt-0.0005;
        setcolor(15);
        str(dt:6:4,ortx6);
        outtextxy(430,465,ortx6);
      end;
    wahl:=' ';
    end;
    'v':
    begin
    if v0>=0.05 then
      begin
        loesch11;
        loesch12;
        loesch13;
        outtextxy(520,370,ortx1);
  x0:=x7;
  y0:=y7;
        boot;
        v0:=v0-0.05;
        setz12;
        setcolor(12);
        str(v0:4:2,ortx1);
        outtextxy(520,370,ortx1);
      end;
    wahl:=' ';
    end;
    'V':
    begin
    if v0<=10 then
      begin
        loesch12;
        loesch13;
        loesch11;
        outtextxy(520,370,ortx1);
  x0:=x7;
  y0:=y7;
        boot;
        v0:=v0+0.05;
        setz12;
        setcolor(12);
        str(v0:4:2,ortx1);
        outtextxy(520,370,ortx1);
      end;
    wahl:=' ';
    end;
    'f':
    begin
    if vfluss>=0.05 then
      begin
        loesch12;
        loesch13;
        loesch11;
        outtextxy(520,390,ortx3);
  x0:=x7;
  y0:=y7;
        boot;
        vfluss:=vfluss-0.05;
        setz12;
        setcolor(10);
        str(vfluss:4:2,ortx3);
        outtextxy(520,390,ortx3);
      end;
    wahl:=' ';
    end;
    'F':
    begin
    if vfluss<=10 then
      begin
        loesch12;
        loesch13;
        loesch11;
        outtextxy(520,390,ortx3);
  x0:=x7;
  y0:=y7;
        boot;
        vfluss:=vfluss+0.05;
        setz12;
        setcolor(10);
        str(vfluss:4:2,ortx3);
        outtextxy(520,390,ortx3);
      end;
    wahl:=' ';
    end;
    'a':
    begin
        loesch12;
        loesch13;
        loesch11;
        outtextxy(370,430,ortx8);
  x0:=x7;
  y0:=y7;
        boot;
        alpha:=alpha-pi/180;
        setz12;
        setcolor(15);
        str(((pi/2+alpha)/pi*180):4:2,ortx8);
        outtextxy(370,430,ortx8);
        boot;
    wahl:=' ';
    end;
    'A':
    begin
        loesch12;
        loesch13;
        loesch11;
        outtextxy(370,430,ortx8);
  x0:=x7;
  y0:=y7;
        boot;
        alpha:=alpha+pi/180;
        setz12;
        setcolor(15);
        str(((pi/2+alpha)/pi*180):4:2,ortx8);
        outtextxy(370,430,ortx8);
        boot;
    wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure p1;
begin
  cleardevice;
  x0:=150;
  y0:=325;
  x7:=x0;
  y7:=y0;
    v0:=4;
    alpha:=-pi/2;
    g:=9.81;
    t:=0;
    vfluss:=3;
    vy0:=-v0*sin(alpha);
    vy:=v0;
    vx:=vfluss;
    dt:=0.025;
    graphik1;
    setz1;
    setz12;
    setz11;
    auswahl1;
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
    '1':p1;
    '2':p2;
    '3':p3;
    '4':p4;
    '5':p5;
  end;
  until wahl1='b';
end.