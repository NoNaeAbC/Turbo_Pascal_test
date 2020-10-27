program beweg;
uses crt,graph;
var
  k,treiber,modus:integer;
  faktor,x11,y11,a,thilfe,r,r1,omega,x0,x1,y0,y1,t0,t1,t2,v,v0,s0,x,t,dt:real;
  wahl1,wahl,wahl2:char;
  ortx1,ortx2,ortx3,ortx4,ortx5,ortx6,ortx7:string;

procedure menue;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(7);
  setcolor(1);
  outtextxy(250,200,'Zykloide  ->  1');
  outtextxy(150,250,'Geradlinig gleichf”rmige Bewegung  ->  2');
  outtextxy(140,300,'Gleichf”rmig beschleunigte Bewegung  ->  3');
  outtextxy(400,400,'beenden  ->  b');
end;

procedure g0;
begin
  setbkcolor(1);
  setcolor(8);
  str(s0:4:2,ortx6);
  outtextxy(245,400,ortx6);
  outtextxy(190,400,'s0 =        m');
  setcolor(15);
  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  outtextxy(117,355,'0');
  outtextxy(197,355,'1');
  outtextxy(277,355,'2');
  outtextxy(357,355,'3');
  outtextxy(437,355,'4');
  outtextxy(510,355,'5 m');
  line(120,345,520,345);
  line(120,345,120,348);
  line(200,345,200,348);
  line(280,345,280,348);
  line(360,345,360,348);
  line(440,345,440,348);
  line(520,345,520,348);
  line(80,200,250,200);
  line(380,200,550,200);
  line(80,200,80,80);
  line(380,200,380,80);
  line(377,100,380,100);
  line(377,120,380,120);
  line(377,140,380,140);
  line(377,160,380,160);
  line(377,180,380,180);
  line(77,100,80,100);
  line(77,120,80,120);
  line(77,140,80,140);
  line(77,160,80,160);
  line(77,180,80,180);
  outtextxy(362,157,'2');
  outtextxy(362,117,'4');
  outtextxy(62,157,'1');
  outtextxy(62,117,'2');
  outtextxy(60,65,'v in m/s');
  outtextxy(360,65,'s in m');
  line(120,200,120,203);
  line(160,200,160,203);
  line(200,200,200,203);
  line(240,200,240,203);
  outtextxy(117,208,'1');
  outtextxy(157,208,'2');
  outtextxy(197,208,'3');
  outtextxy(237,208,'4');
  outtextxy(257,197,'t in s');
  line(420,200,420,203);
  line(460,200,460,203);
  line(500,200,500,203);
  line(540,200,540,203);
  outtextxy(417,208,'1');
  outtextxy(457,208,'2');
  outtextxy(497,208,'3');
  outtextxy(537,208,'4');
  outtextxy(557,197,'t in s');
  str(dt:6:4,ortx4);
  outtextxy(415,465,ortx4);
  str(v:4:2,ortx1);
  outtextxy(445,380,ortx1);
  outtextxy(400,380,'v =        m/s');
  outtextxy(400,400,'t =        s');
  outtextxy(400,420,'x =        m');
  outtextxy(55,465,'dt verringern (t)   dt vergr”áern (T)   dt =        s     pause (p)');
end;

procedure graphik;
begin
  setcolor(8);
  outtextxy(40,435,'s0 verringern (x)  vergr”áern (X)');
  g0;
  outtextxy(55,455,'v verringern (v)   v vergr”áern (V)       starten (s)   beenden (b)');
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
  sector(120+round(80*x),340,0,360,3,3);
  putpixel(80+round(40*t),200-round(40*v),12);
  putpixel(380+round(40*t),200-round(20*x),12);
end;

procedure loesch;
begin
  setcolor(1);
  outtextxy(445,400,ortx2);
  outtextxy(445,420,ortx3);
  setfillstyle(1,1);
  sector(120+round(80*x),340,0,360,3,3);
end;

procedure setz1;
begin
  setcolor(15);
  str(v:4:2,ortx1);
  outtextxy(445,380,ortx1);
end;

procedure loesch1;
begin
  setcolor(1);
  outtextxy(445,380,ortx1);
end;

procedure setz11;
begin
  setcolor(8);
  str(s0:4:2,ortx6);
  outtextxy(245,400,ortx6);
end;

procedure loesch11;
begin
  setcolor(1);
  outtextxy(245,400,ortx6);
end;


procedure l0;
begin
  t:=0;
  x:=v*t;
  repeat
    t:=t+dt;
    x:=v*t+s0;
    putpixel(80+round(40*t),200-round(40*v),1);
    putpixel(380+round(40*t),200-round(20*x),1);
  until x>=5;
end;

procedure loeschlinien;
begin
      setcolor(1);
      setlinestyle(1,0,1);
      line(380+round(40*t),200-round(20*x),380+round(40*t),200);
      line(380,200-round(20*x),380+round(40*t),200-round(20*x));
      line(80+round(40*t),200-round(40*v),80+round(40*t),200);
      setlinestyle(0,0,1);
end;

procedure setzlinien;
begin
      setcolor(9);
      setlinestyle(1,0,1);
      line(380+round(40*t),200-round(20*x),380+round(40*t),200);
      line(380,200-round(20*x),380+round(40*t),200-round(20*x));
      line(80+round(40*t),200-round(40*v),80+round(40*t),200);
      setlinestyle(0,0,1);
end;

procedure setzmarke;
begin
    setcolor(7);
    line(120+round(80*s0),330,120+round(80*s0),320);
  if thilfe>=1 then
  begin
    thilfe:=0;
    setcolor(7);
    line(120+round(80*x),330,120+round(80*x),320);
      setlinestyle(1,0,1);
      line(380+round(40*t),200-round(20*x),380+round(40*t),200);
      line(380,200-round(20*x),380+round(40*t),200-round(20*x));
      setlinestyle(0,0,1);
  end;
end;

procedure loeschmarke;
begin
  t:=0;
  x:=v*t+s0;
    setcolor(1);
    line(120+round(80*s0),330,120+round(80*s0),320);
  thilfe:=t;
  repeat
    t:=t+dt;
    thilfe:=thilfe+dt;
    x:=v*t+s0;
    if thilfe>=1 then
    begin
      thilfe:=0;
      line(120+round(80*x),330,120+round(80*x),320);
      setlinestyle(1,0,1);
      line(380+round(40*t),200-round(20*x),380+round(40*t),200);
      line(380,200-round(20*x),380+round(40*t),200-round(20*x));
      setlinestyle(0,0,1);
    end;
  until x>=5;
end;

procedure auswahl;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    's':
    begin
      l0;
      loesch;
      loeschlinien;
      loeschmarke;
      t:=0;
      x:=v*t+s0;
      thilfe:=t;
      setz;
      graphik;
      delay(5000);
      wahl2:=' ';
      repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
          end;
        loesch;
        t:=t+dt;
        thilfe:=thilfe+dt;
        x:=v*t+s0;
        setz;
        setzmarke;
      until x>=5;
      setzlinien;
    wahl:=' ';
    end;
    'T':
    begin
      setcolor(1);
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
      if v>=0.2 then
      begin
        l0;
        loeschlinien;
        loesch1;
        loeschmarke;
        v:=v-0.1;
        setz1;
      end;
      wahl:=' ';
    end;
    'V':
    begin
      loesch1;
      loeschmarke;
      l0;
      loeschlinien;
      v:=v+0.1;
      setz1;
      wahl:=' ';
    end;
    'x':
    begin
      loesch11;
      loeschmarke;
      l0;
      loeschlinien;
      s0:=s0-0.1;
      setz11;
      wahl:=' ';
    end;
    'X':
    begin
      loesch11;
      loeschmarke;
      l0;
      loeschlinien;
      s0:=s0+0.1;
      setz11;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure graphik3;
begin
  setcolor(8);
  outtextxy(40,435,'s0 verringern (x)  vergr”áern (X)     v0 verringern (v)  vergr”áern (V)');
  str(v0:4:2,ortx7);
  outtextxy(245,380,ortx7);
  outtextxy(190,380,'v0 =        m/s');
  g0;
  outtextxy(185,15,'Gleichm„áig beschleunigte Bewegung ');
  outtextxy(45,455,'a verringern (a)   a vergr”áern (A)       starten (s)     beenden (b)');
  str(a:4:2,ortx5);
  outtextxy(245,420,ortx5);
  outtextxy(200,420,'a =        m/sý');
end;

procedure l3;
begin
  t:=0;
  v:=a*t+v0;
  x:=0.5*a*t*t+v0*t+s0;
  repeat
    t:=t+dt;
    v:=a*t+v0;
    x:=0.5*a*t*t+v0*t+s0;
    putpixel(80+round(40*t),200-round(40*v),1);
    putpixel(380+round(40*t),200-round(20*x),1);
  until x>=5;
end;

procedure setz4;
begin
  setcolor(15);
  str(a:4:2,ortx5);
  outtextxy(245,420,ortx5);
end;

procedure loesch4;
begin
  setcolor(1);
  outtextxy(245,420,ortx5);
end;

procedure setz13;
begin
  setcolor(8);
  str(v0:4:2,ortx7);
  outtextxy(245,380,ortx7);
end;

procedure loesch13;
begin
  setcolor(1);
  outtextxy(245,380,ortx7);
end;

procedure setzmarke3;
begin
    setcolor(7);
    line(120+round(80*s0),330,120+round(80*s0),320);
  if thilfe>=1 then
  begin
    thilfe:=0;
    setcolor(7);
    line(120+round(80*x),330,120+round(80*x),320);
      setlinestyle(1,0,1);
      line(380+round(40*t),200-round(20*x),380+round(40*t),200);
      line(380,200-round(20*x),380+round(40*t),200-round(20*x));
      line(80+round(40*t),200-round(40*v),80+round(40*t),200);
      line(80,200-round(40*v),80+round(40*t),200-round(40*v));
      setlinestyle(0,0,1);
  end;
end;

procedure loeschlinien3;
begin
      setcolor(1);
      setlinestyle(1,0,1);
      line(380+round(40*t),200-round(20*x),380+round(40*t),200);
      line(380,200-round(20*x),380+round(40*t),200-round(20*x));
      line(80+round(40*t),200-round(40*v),80+round(40*t),200);
      line(80,200-round(40*v),80+round(40*t),200-round(40*v));
       setlinestyle(0,0,1);
end;

procedure setzlinien3;
begin
      setcolor(9);
      setlinestyle(1,0,1);
      line(380+round(40*t),200-round(20*x),380+round(40*t),200);
      line(380,200-round(20*x),380+round(40*t),200-round(20*x));
      line(80+round(40*t),200-round(40*v),80+round(40*t),200);
      line(80,200-round(40*v),80+round(40*t),200-round(40*v));
       setlinestyle(0,0,1);
end;



procedure loeschmarke3;
begin
  t:=0;
  v:=a*t+v0;
  x:=0.5*a*t*t+v0*t+s0;
    setcolor(1);
    line(120+round(80*s0),330,120+round(80*s0),320);
  thilfe:=t;
  repeat
    t:=t+dt;
    thilfe:=thilfe+dt;
  v:=a*t+v0;
  x:=0.5*a*t*t+v0*t+s0;
    if thilfe>=1 then
    begin
      thilfe:=0;
      setcolor(1);
      line(120+round(80*x),330,120+round(80*x),320);
      setlinestyle(1,0,1);
      line(80+round(40*t),200-round(40*v),80+round(40*t),200);
      line(80,200-round(40*v),80+round(40*t),200-round(40*v));
      line(380+round(40*t),200-round(20*x),380+round(40*t),200);
      line(380,200-round(20*x),380+round(40*t),200-round(20*x));
      setlinestyle(0,0,1);
    end;
  until x>=5;
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
      loesch;
      loesch1;
      loeschlinien3;
      loeschmarke3;
      t:=0;
      thilfe:=t;
      v:=a*t+v0;
      x:=0.5*a*t*t+v0*t+s0;
      setz;
      setz1;
      graphik3;
      wahl2:=' ';
      delay(5000);
      repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
          end;
        loesch;
        loesch1;
        t:=t+dt;
        thilfe:=thilfe+dt;
        v:=a*t+v0;
        x:=0.5*a*t*t+v0*t+s0;
        setz1;
        setz;
        setzmarke3;
      until (x>=5) or (wahl2='b');
      setzlinien3;
    wahl:=' ';
    end;
    'T':
    begin
      setcolor(1);
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
      setcolor(1);
      outtextxy(415,465,ortx4);
      dt:=dt-0.0001;
      setcolor(15);
      str(dt:6:4,ortx4);
      outtextxy(415,465,ortx4);
    end;
    wahl:=' ';
    end;
    'x':
    begin
      loesch11;
      loeschmarke3;
      l3;
      loeschlinien3;
      s0:=s0-0.1;
      setz11;
      wahl:=' ';
    end;
    'X':
    begin
      loesch11;
      loeschmarke3;
      l3;
      loeschlinien3;
      s0:=s0+0.1;
      setz11;
      wahl:=' ';
    end;
    'v':
    begin
      loesch13;
      loeschmarke3;
      l3;
      loeschlinien3;
      v0:=v0-0.1;
      setz13;
      wahl:=' ';
    end;
    'V':
    begin
      loesch13;
      loeschmarke3;
      l3;
      loeschlinien3;
      v0:=v0+0.1;
      setz13;
      wahl:=' ';
    end;
    'a':
    begin
      if a>=0.2 then
      begin
        l3;
        loeschlinien3;
        loesch4;
        loeschmarke3;
        a:=a-0.1;
        setz4;
      end;
      wahl:=' ';
    end;
    'A':
    begin
      loesch4;
      loeschmarke3;
      l3;
      loeschlinien3;
      a:=a+0.1;
      setz4;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure bewegung;
begin
  cleardevice;
    v:=1.5;
    s0:=0;
    t:=0;
    x:=v*t+s0;
    dt:=0.002;
    graphik;
    setz;
    auswahl;
  menue;
end;


procedure b3;
begin
  cleardevice;
    v:=0;
    s0:=0;
    v0:=0;
    a:=1;
    t:=0;
    x:=0.5*a*t*t;
    v:=a*t;
    dt:=0.002;
    graphik3;
    setz;
    setz1;
    auswahl3;
  menue;
end;

procedure graphikz;
begin
  setbkcolor(1);
  setcolor(15);
  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  line(50,302,590,302);
  str(r:4:2,ortx2);
  str(v:4:2,ortx1);
  outtextxy(445,380,ortx1);
  outtextxy(445,400,ortx2);
  outtextxy(400,380,'v =        m/s');
  outtextxy(400,400,'r =        cm');
  outtextxy(205,15,'Bezugssystemwechsel: Zykloide ');
      outtextxy(35,455,'v vergr”áern (V)    v verkleinern (v)        starten (s)    beenden (b)');
  outtextxy(55,465,'r vergr”áern (R)   r verkleinern (r)               pause (p)');
end;

procedure z;
begin
  t0:=0;
  repeat
    t0:=t0+18*dt;
    x0:=100+v*t0-r*cos(omega*t0);
    y0:=300-round(r)-r*sin(omega*t0);
    x11:=100+v*t0-r1*cos(omega*t0);
    y11:=300-round(r)-r1*sin(omega*t0);
    if t0<=t1 then
     begin
      putpixel(round(x0),round(y0),14);
      putpixel(round(x11),round(y11),11);
      end
      else
      begin
      putpixel(round(x0),round(y0),9);
      putpixel(round(x11),round(y11),9);
     end;
  until x0>=540;
end;

procedure l;
begin
  t0:=0;
  repeat
    t0:=t0+18*dt;
    x0:=100+v*t0-r*cos(omega*t0);
    y0:=300-round(r)-r*sin(omega*t0);
    x11:=100+v*t0-r1*cos(omega*t0);
    y11:=300-round(r)-r1*sin(omega*t0);
    if t0<=t1 then
     begin
      putpixel(round(x0),round(y0),1);
      putpixel(round(x11),round(y11),1);
      end
      else
      begin
      putpixel(round(x0),round(y0),1);
      putpixel(round(x11),round(y11),1);
     end;
  until x0>=540;
end;

procedure setzz;
begin
  setcolor(15);
  z;
  circle(round(100+v*t1),300-round(r),round(r));
  circle(round(100+v*t1),300-round(r),2);
  circle(round(x11),round(y11),5);
  setfillstyle(1,12);
  sector(round(x11),round(y11),0,360,5,5);
  sector(round(x1),round(y1),0,360,2,2);
end;

procedure loeschz;
begin
  setcolor(1);
  circle(round(100+v*t1),300-round(r),round(r));
  circle(round(100+v*t1),300-round(r),2);
  l;
  setfillstyle(1,1);
  sector(round(x1),round(y1),0,360,2,2);
  sector(round(x11),round(y11),0,360,2,2);
end;

procedure setz1z;
begin
  setcolor(15);
  str(v:4:2,ortx1);
  outtextxy(445,380,ortx1);
end;

procedure loesch1z;
begin
  setcolor(1);
  outtextxy(445,380,ortx1);
end;

procedure setz2z;
begin
  setcolor(15);
  str(r:4:2,ortx2);
  outtextxy(445,400,ortx2);
  line(50,302,590,302);
end;

procedure loesch2z;
begin
  setcolor(1);
  outtextxy(445,400,ortx2);
end;

procedure s0z;
begin
      loeschz;
      setcolor(15);
      line(630,30,630,450);
      t1:=0;
      x1:=100+v*t1-r*cos(omega*t1);
      y1:=300-r-r*sin(omega*t1);
      x11:=100+v*t1-r1*cos(omega*t1);
      y11:=300-r-r1*sin(omega*t1);
end;


procedure auswahlz;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    's':
    begin
      setzz;
      s0z;
      wahl1:=' ';
      repeat
        if keypressed then wahl1:=readkey;
          case wahl1 of
          'p':wahl1:=readkey;
          end;
        loeschz;
        t1:=t1+dt;
        x1:=100+v*t1-r*cos(omega*t1);
        y1:=300-r-r*sin(omega*t1);
        x11:=100+v*t1-r1*cos(omega*t1);
        y11:=300-r-r1*sin(omega*t1);
        setzz;
        delay(100);
      until x1>=540;
    wahl:=' ';
    end;
    'v':
    begin
      if v>=1.6 then
      begin
        loesch1z;
        s0z;
        v:=v-0.1;
        omega:=v/r;
        setz1z;
        setzz;
      end;
      wahl:=' ';
    end;
    'V':
    begin
      loesch1z;
      s0z;
      v:=v+0.1;
      omega:=v/r;
      setzz;
      setz1z;
      wahl:=' ';
    end;
    'r':
    begin
    if r>=3 then
    begin
      loesch2z;
      s0z;
      l;
      r:=r-1;
      omega:=v/r;
      setzz;
      setz2z;
    end;
      wahl:=' ';
    end;
    'R':
    begin
      loesch2z;
      s0z;
      l;
      r:=r+1;
      omega:=v/r;
      setz2z;
      setzz;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure zykl;
begin
  cleardevice;
  faktor:=1.5;
  v:=10;
  r:=37;
  r1:=faktor*r;
  t1:=0;
  dt:=0.1;
  omega:=v/r;
  x1:=100+v*t1-r*cos(omega*t1);
  y1:=300-r-r*sin(omega*t1);
  x11:=100+v*t1-r1*cos(omega*t1);
  y11:=300-r-r1*sin(omega*t1);
  graphikz;
  setzz;
  z;
  auswahlz;
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
    '3':b3;
    '2':bewegung;
    '1':zykl;
  end;
  until wahl1='b';
end.