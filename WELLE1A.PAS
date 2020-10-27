program welle1;
uses crt,graph;
var
  zeit,vorder,hinter,farbe1,farbe2,farbe4,farbe5,hilfe,n1,farbe,l1,l,n,m,k,treiber,modus:integer;
  alpha,y1,y2,a1,a2,a,t0,omega,c,x,y,t,dt:real;
  wahl1,wahl2,wahl:char;
  ortzeit,ortx7,ortx1,ortx2,ortx3,ortx4,ortx5,ortx6:string;

procedure menue;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(hinter);
  setcolor(vorder);
  outtextxy(100,100,'Reflexion einer St”rung  ->  0');
  outtextxy(100,150,'Entstehung sinusf”rmiger Wellen  ->  1');
  outtextxy(100,200,'Reflexion am festen und am losen Ennde  ->  2');
  outtextxy(100,250,'šberlagerung gegenl„ufiger Wellen  ->  3');
  outtextxy(100,300,'Stehende Wellen   ->  4');
  outtextxy(100,350,'šberlagerung gleichl„ufiger Wellen  ->  5');
  outtextxy(400,400,'beenden  ->  b');
end;

procedure g0;
begin
  setcolor(farbe1);
  outtextxy(150,435,'Ausgangssituation wiederherstellen  (w)');
  outtextxy(50,420,'Aufl”sung  a =      ver„ndern  (a/A)');
  str(a:3:1,ortx4);
  outtextxy(170,420,ortx4);
  outtextxy(400,40,'delay =        „ndern (d/D)');
  str(zeit:4,ortzeit);
  outtextxy(470,40,ortzeit);
  setcolor(vorder);
  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  str(c:4:2,ortx1);
  outtextxy(445,380,ortx1);
  outtextxy(400,380,'c =        m/s');
  outtextxy(400,400,'f =        1/s');
  outtextxy(35,455,'c vergr”áern (C)    c verkleinern (c)        starten (s)    beenden (b)');
  outtextxy(25,465,'f vergr”áern (F)    f verringern (f)      Pause (p)    Programm beenden (x)');
end;

procedure graphik;
begin
  setbkcolor(hinter);
  setcolor(vorder);
  line(46,210,46,270);
  g0;
  str(omega/0.2/pi:4:2,ortx2);
  outtextxy(445,400,ortx2);
  outtextxy(200,15,'Sinusf”rmige Wellenausbreitung ');
end;

procedure s1;
begin
   line(50,340,50,360);
   line(50+round(2*pi/omega*c),340,50+round(2*pi/omega*c),360);
   line(50,350,50+round(2*pi/omega*c),350);
   outtextxy(25+round(pi/omega*c),370,ortx3);
   outtextxy(75+round(pi/omega*c),370,'m');
end;

procedure setz;
begin
  if (t>=50) and (t<=56) then
  begin
   setcolor(vorder);
    str(c*0.2*pi/omega:4:2,ortx3);
   s1;
  end;
  x:=0;
  y:=30*sin(omega*t);
  setcolor(farbe2);
  setfillstyle(1,hinter);
  sector(50,240-round(y),0,360,2,2);
  repeat
    x:=x+a;
    y:=30*sin(omega*t-omega/c*x);
    if x<=c*t then
      putpixel(50+round(x),240-round(y),farbe2)
    else
    putpixel(50+round(x),240,farbe2);
  until x>=540;
end;

procedure loesch;
begin
  setcolor(hinter);
  x:=0;
  y:=30*sin(omega*t);
  setfillstyle(1,hinter);
  sector(50+round(80*x),240-round(y),0,360,2,2);
  repeat
    x:=x+a;
    y:=30*sin(omega*t-omega/c*x);
    if x<=c*t then
      putpixel(50+round(x),240-round(y),hinter)
    else
    putpixel(50+round(x),240,hinter);
  until x>=540;
end;

procedure setzzeit;
begin
  setcolor(farbe1);
  str(zeit:4,ortzeit);
  outtextxy(470,40,ortzeit);
end;

procedure loeschzeit;
begin
  setcolor(hinter);
  outtextxy(470,40,ortzeit);
end;

procedure setz4;
begin
  setcolor(farbe1);
  str(a:3:1,ortx4);
  outtextxy(170,420,ortx4);
end;

procedure loesch4;
begin
  setcolor(hinter);
  outtextxy(170,420,ortx4);
end;

procedure setz1;
begin
  setcolor(vorder);
  str(c:4:2,ortx1);
  outtextxy(445,380,ortx1);
end;

procedure loesch1;
begin
  setcolor(hinter);
  outtextxy(445,380,ortx1);
end;

procedure setz2;
begin
  setcolor(vorder);
  str(10*omega/2/pi:4:2,ortx2);
  outtextxy(445,400,ortx2);
end;

procedure loesch2;
begin
  setcolor(hinter);
  outtextxy(445,400,ortx2);
end;

procedure setz3;
begin
  setcolor(farbe1);
  str(dt:4:2,ortx3);
  outtextxy(445,420,ortx3);
end;

procedure loesch3;
begin
  setcolor(hinter);
  outtextxy(445,420,ortx3);
end;

procedure auswahl;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    's':
    begin
      loesch;
      s1;
      t:=0;
      setz;
      wahl2:=' ';
      repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
          end;
        loesch;
        t:=t+dt;
        setz;
        delay(zeit);
      until wahl2='b';
    wahl:=' ';
    end;
    'c':
    begin
      if c>=0.6 then
      begin
        loesch;
        loesch1;
        s1;
        c:=c-0.1;
        setz1;
        setz;
      end;
      wahl:=' ';
    end;
    'C':
    begin
      loesch;
      loesch1;
      s1;
      c:=c+0.1;
      setz1;
      setz;
      wahl:=' ';
    end;
    'f':
    begin
      if omega>=0.02*pi/5 then
      begin
        loesch;
        loesch2;
        S1;
        omega:=omega-0.01*pi/5;
        setz2;
        setz;
      end;
      wahl:=' ';
    end;
    'F':
    begin
      loesch;
      loesch2;
      S1;
      omega:=omega+0.01*pi/5;
      setz2;
      setz;
      wahl:=' ';
    end;
    'a':
    begin
      if a>=0.2 then
      begin
        loesch;
        loesch4;
        a:=a-0.1;
        setz4;
        setz;
        wahl:=' ';
      end;
    end;
    'A':
    begin
      if a<=5 then
      begin
        loesch;
        loesch4;
        a:=a+0.1;
        setz4;
        setz;
        wahl:=' ';
      end;
    end;
    'd':
    begin
      if zeit>=100 then
      begin
        loeschzeit;
        zeit:=zeit-100;
        setzzeit;
        wahl:=' ';
      end;
    end;
    'D':
    begin
        loeschzeit;
        zeit:=zeit+100;
        setzzeit;
        wahl:=' ';
    end;
    'w':
    begin
      loesch;
      loesch1;
      loesch2;
      loesch3;
      s1;
      a:=1;
      c:=2.5;
      t:=0;
      dt:=1;
      omega:=0.05*2*pi;
      setz;
      setz1;
      setz2;
      setz3;
    wahl:=' ';
    end;
    't':
    begin
      if dt>=0.06 then
      begin
        loesch3;
        dt:=dt-0.01;
        setz3;
        wahl:=' ';
      end;
    end;
    'T':
    begin
    if dt<=4.5 then
    begin
      loesch3;
      dt:=dt+0.01;
      setz3;
      wahl:=' ';
    end;
    end;
  end;
  until wahl='x';
end;

procedure graphik2;
begin
  setbkcolor(hinter);
  setcolor(farbe1);
  str(dt:4:2,ortx3);
  outtextxy(445,420,ortx3);
  outtextxy(395,420,'dt =        ms     (t/T)');
  setcolor(farbe4);
  outtextxy(130,60,'Hilfslinien zeichnen (3)  ');
  setcolor(farbe2);
  outtextxy(80,80,'                               Reflexion am festen Ende (2)');
  setcolor(vorder);
  outtextxy(130,60,'                          nicht zeichnenen (0)');
  outtextxy(80,80,'Reflexion am losen Ende (1)');
  outtextxy(235,15,'Reflexion einer Welle ');
  str(5*omega:4:2,ortx2);
  outtextxy(445,400,ortx2);
  g0;
end;

procedure graphik0;
begin
  setbkcolor(hinter);
  setcolor(farbe1);
  str(dt:4:2,ortx3);
  outtextxy(445,420,ortx3);
  outtextxy(395,420,'dt =        ms     (t/T)');
  setcolor(farbe4);
  outtextxy(130,60,'Hilfslinien zeichnen (3)  ');
  setcolor(farbe2);
  outtextxy(80,80,'                               Reflexion am festen Ende (2)');
  setcolor(vorder);
  outtextxy(130,60,'                          nicht zeichnenen (0)');
  outtextxy(80,80,'Reflexion am losen Ende (1)');
  outtextxy(225,15,'Reflexion einer St”rung ');
  str(5*omega:4:2,ortx2);
  outtextxy(445,400,ortx2);
  g0;
end;

procedure setz02;
begin
if hilfe=0 then
begin
if t<=540/c then
begin
  x:=0;
  y:=30*sin(omega*t);
  setcolor(farbe);
  setfillstyle(1,hinter);
  sector(50+round(80*x),240-round(y),0,360,2,2);
  repeat
    x:=x+a;
      y:=30*sin(omega*t-omega/c*x);
      if x<=c*t then
        putpixel(50+round(x),240-round(y),farbe)
      else
      putpixel(50+round(x),240,farbe);
  until x>=540;
end
else
begin
  x:=0;
  y:=30*sin(omega*t);
  setcolor(farbe);
  setfillstyle(1,hinter);
  sector(50+round(80*x),240-round(y),0,360,2,2);
  repeat
    x:=x+a;
    y:=30*sin(omega*t-omega/c*x);
    putpixel(50+round(x),240-round(y),farbe);
  until x>=540-c*(t-540/c);
  repeat
    x:=x+a;
   putpixel(50+round(x),240-round(y),farbe);
    if m=1 then
    begin
      y:=30*sin(omega*t-omega/c*(1080-x))+30*sin(omega*t-omega/c*x);
      if n=3 then
      begin
      putpixel(50+round(x),240-round(30*sin(omega*t-omega/c*x)),l1);
      putpixel(50+round(x),240-round(30*sin(omega*t-omega/c*(1080-x))),l);
      end;
    end;
    if m=2 then
    begin
      y:=-30*sin(omega*t-omega/c*(1080-x))+30*sin(omega*t-omega/c*x);
      if n=3 then
      begin
      putpixel(50+round(x),240-round(30*sin(omega*t-omega/c*x)),l1);
      putpixel(50+round(x),240-round(-30*sin(omega*t-omega/c*(1080-x))),l);
      end;
    end;
  until x>=540;
end;
end;
if hilfe=1 then
  begin
  if t<=540/c then
    begin
    x:=0;
    y:=30*sin(omega*t);
    setcolor(farbe);
    setfillstyle(1,hinter);
    if (x<=c*t) and (x>=c*t-c*pi/omega) then
      sector(50+round(80*x),240-round(y),0,360,2,2)
      else
      sector(50,240,0,360,2,2);
    repeat
      x:=x+a;
      y:=30*sin(omega*t-omega/c*x);
      if (x<=c*t) and (x>=c*t-c*pi/omega) then
        putpixel(50+round(x),240-round(y),farbe)
      else
        putpixel(50+round(x),240,farbe);
    until x>=540;
  end;
if (t>=540/c) and (t<=540/c+pi/omega) then
begin
    setcolor(farbe);
    setfillstyle(1,hinter);
  sector(50,240,0,360,2,2);
  x:=0;
  repeat
    x:=x+a;
    if (x<=c*t) and (x>=c*t-c*pi/omega) then
    begin
      y1:=30*sin(omega*t-omega/c*x);
      if n=3 then
      putpixel(50+round(x),240-round(y1),l1);
    end
    else
    y1:=0;
    if (1080-x<=c*t) and (1080-x>=c*t-c*pi/omega) then
    begin
    if m=1 then
        y2:=30*sin(omega*t-omega/c*(1080-x));
    if m=2 then
        y2:=-30*sin(omega*t-omega/c*(1080-x));
        if n=3 then
        putpixel(50+round(x),240-round(y2),l);
      end
    else
    y2:=0;
    y:=y1+y2;
    putpixel(50+round(x),240-round(y),farbe);
  until x>=540;
end;
if t>=540/c+pi/omega then
begin
    setcolor(farbe);
    setfillstyle(1,hinter);
  sector(50,240,0,360,2,2);
  x:=0;
  repeat
    x:=x+a;
    if m=1 then
    y:=30*sin(omega*t-omega/c*(1080-x));
    if m=2 then
    y:=-30*sin(omega*t-omega/c*(1080-x));
    if (1080-x<=c*t) and (1080-x>=c*t-c*pi/omega) then
        putpixel(50+round(x),240-round(y),farbe)
    else
        putpixel(50+round(x),240,farbe);
  until x>=540;
end;

end;
end;

procedure setz22;
begin
  farbe:=farbe2;
  l:=farbe5;
  l1:=farbe4;
  setz02;
end;

procedure loesch22;
begin
  farbe:=hinter;
  l:=hinter;
  l1:=hinter;
  setz02;
end;

procedure setz12;
begin
  setcolor(vorder);
  str(c:4:2,ortx1);
  outtextxy(445,380,ortx1);
end;

procedure loesch12;
begin
  setcolor(hinter);
  outtextxy(445,380,ortx1);
end;

procedure setz20;
begin
  setcolor(vorder);
  str(5*omega:4:2,ortx2);
  outtextxy(445,400,ortx2);
end;

procedure loesch20;
begin
  setcolor(hinter);
  outtextxy(445,400,ortx2);
end;


procedure auswahl2;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    '1':
    begin
      loesch22;
      t:=0;
      setz22;
      m:=1;
      setcolor(farbe2);
      outtextxy(80,80,'Reflexion am losen Ende (1)');
      setcolor(vorder);
      outtextxy(80,80,'                               Reflexion am festen Ende (2)');
      wahl:=' ';
    end;
    '2':
    begin
      loesch22;
      t:=0;
      setz22;
      m:=2;
      setcolor(vorder);
      outtextxy(80,80,'Reflexion am losen Ende (1)');
      setcolor(farbe2);
      outtextxy(80,80,'                               Reflexion am festen Ende (2)');
      wahl:=' ';
    end;
    '0':
    begin
      loesch22;
      n:=0;
      setz22;
      setcolor(vorder);
      outtextxy(130,60,'Hilfslinien zeichnen (3)  ');
      setcolor(farbe4);
      outtextxy(130,60,'                          nicht zeichnenen (0)');
      wahl:=' ';
    end;
    '3':
    begin
      loesch22;
      n:=3;
      setz22;
      setcolor(farbe4);
      outtextxy(130,60,'Hilfslinien zeichnen (3)  ');
      setcolor(vorder);
      outtextxy(130,60,'                          nicht zeichnenen (0)');
      wahl:=' ';
    end;
    's':
    begin
      loesch22;
      t:=0;
      setz22;
      wahl2:=' ';
      repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
          end;
        loesch22;
        t:=t+dt;
        setz22;
        delay(zeit);
      until (wahl2='b') or (t>=1080/c);
    wahl:=' ';
    end;
    'd':
    begin
      if zeit>=100 then
      begin
        loeschzeit;
        zeit:=zeit-100;
        setzzeit;
        wahl:=' ';
      end;
    end;
    'D':
    begin
        loeschzeit;
        zeit:=zeit+100;
        setzzeit;
        wahl:=' ';
    end;
    'w':
    begin
      loesch22;
      loesch12;
      loesch3;
      loesch4;
      loesch20;
      a:=1;
      c:=5.4/2;
      m:=2;
      n:=3;
      t:=0;
      dt:=1;
      omega:=0.04*pi;
      setz22;
      setz12;
      setz20;
      setz3;
      setz4;
    wahl:=' ';
    end;
    't':
    begin
      if dt>=0.06 then
      begin
        loesch3;
        dt:=dt-0.01;
        setz3;
        wahl:=' ';
      end;
    end;
    'T':
    begin
    if dt<=4.5 then
    begin
      loesch3;
      dt:=dt+0.01;
      setz3;
      wahl:=' ';
    end;
    end;
    'c':
    begin
      if c>=0.2 then
      begin
        loesch22;
        loesch12;
        c:=c-0.1;
        setz12;
        setz22;
      end;
      wahl:=' ';
    end;
    'C':
    begin
      loesch22;
      loesch12;
      c:=c+0.1;
      setz12;
      setz22;
      wahl:=' ';
    end;
    'a':
    begin
      if a>=0.2 then
      begin
        loesch22;
        loesch4;
        a:=a-0.1;
        setz4;
        setz22;
        wahl:=' ';
      end;
    end;
    'A':
    begin
      if a<=5 then
      begin
        loesch22;
        loesch4;
        a:=a+0.1;
        setz4;
        setz22;
        wahl:=' ';
      end;
    end;
    'f':
    begin
      if omega>=0.02 then
      begin
        loesch22;
        loesch20;
        omega:=omega-0.01;
        setz20;
        setz22;
      end;
      wahl:=' ';
    end;
    'F':
    begin
      loesch22;
      loesch20;
      omega:=omega+0.01;
      setz20;
      setz22;
      wahl:=' ';
    end;
  end;
  until wahl='x';
end;

procedure graphik3;
begin
  setbkcolor(hinter);
  setcolor(farbe1);
  str(a1:3:0,ortx5);
  outtextxy(170,380,ortx5);
  str(a2:3:0,ortx6);
  outtextxy(170,400,ortx6);
  outtextxy(140,380,'A1 =     ver„ndern  (k/g)');
  outtextxy(140,400,'A2 =     ver„ndern  (K/G)');
  str(dt:4:2,ortx3);
  outtextxy(445,420,ortx3);
  outtextxy(395,420,'dt =        ms     (t/T)');
  setcolor(farbe4);
  outtextxy(130,60,'');
  setcolor(farbe2);
  outtextxy(80,80,'');
  setcolor(vorder);
  outtextxy(130,60,'');
  outtextxy(80,80,'');
  outtextxy(195,15,'šberlagerung gegenl„ufiger Wellen ');
  str(5*omega:4:2,ortx2);
  outtextxy(445,400,ortx2);
  g0;
end;

procedure setz03;
begin
  x:=0;
  setcolor(farbe);
  repeat
    x:=x+a;
      y:=a2*sin(omega*t-omega/c*(1080-x))+a1*sin(omega*t-omega/c*x);
        putpixel(50+round(x),240-round(y),farbe);
        putpixel(50+round(x),240-round(a1*sin(omega*t-omega/c*x)),l1);
        putpixel(50+round(x),240-round(a2*sin(omega*t-omega/c*(1080-x))),l);
    until x>=540;
end;

procedure setz32;
begin
  farbe:=12;
  l:=farbe4;
  l1:=farbe5;
  setz03;
end;

procedure loesch32;
begin
  farbe:=hinter;
  l:=hinter;
  l1:=hinter;
  setz03;
end;

procedure setz5;
begin
  setcolor(farbe1);
  str(a1:3:0,ortx5);
  outtextxy(170,380,ortx5);
end;


procedure loesch5;
begin
  outtextxy(170,380,ortx5);
end;

procedure setz6;
begin
  setcolor(farbe1);
  str(a2:3:0,ortx6);
  outtextxy(170,400,ortx6);
end;

procedure loesch6;
begin
  outtextxy(170,400,ortx6);
end;


procedure auswahl3;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    's':
    begin
      loesch32;
      t:=0;
      setz32;
      wahl2:=' ';
      repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
          end;
        loesch32;
        t:=t+dt;
        setz32;
        delay(zeit)
      until wahl2='b';
    wahl:=' ';
    end;
    'd':
    begin
      if zeit>=100 then
      begin
        loeschzeit;
        zeit:=zeit-100;
        setzzeit;
        wahl:=' ';
      end;
    end;
    'D':
    begin
        loeschzeit;
        zeit:=zeit+100;
        setzzeit;
        wahl:=' ';
    end;
    't':
    begin
      if dt>=0.06 then
      begin
        loesch3;
        dt:=dt-0.01;
        setz3;
        wahl:=' ';
      end;
    end;
    'T':
    begin
    if dt<=4.5 then
    begin
      loesch3;
      dt:=dt+0.01;
      setz3;
      wahl:=' ';
    end;
    end;
    'c':
    begin
      if c>=0.2 then
      begin
        loesch32;
        loesch12;
        c:=c-0.1;
        setz12;
        setz32;
      end;
      wahl:=' ';
    end;
    'C':
    begin
      loesch32;
      loesch12;
      c:=c+0.1;
      setz12;
      setz32;
      wahl:=' ';
    end;
    'k':
    begin
      if a1>=6 then
      begin
        loesch32;
        loesch5;
        a1:=a1-1;
        setz5;
        setz32;
        wahl:=' ';
      end;
    end;
    'g':
    begin
      if a1<=59 then
      begin
        loesch32;
        loesch5;
        a1:=a1+1;
        setz5;
        setz32;
        wahl:=' ';
      end;
    end;
    'K':
    begin
      if a2>=6 then
      begin
        loesch32;
        loesch6;
        a2:=a2-1;
        setz6;
        setz32;
        wahl:=' ';
      end;
    end;
    'G':
    begin
      if a2<=59 then
      begin
        loesch32;
        loesch6;
        a2:=a2+1;
        setz6;
        setz32;
        wahl:=' ';
      end;
    end;
    'a':
    begin
      if a>=0.2 then
      begin
        loesch32;
        loesch4;
        a:=a-0.1;
        setz4;
        setz32;
        wahl:=' ';
      end;
    end;
    'A':
    begin
      if a<=5 then
      begin
        loesch32;
        loesch4;
        a:=a+0.1;
        setz4;
        setz32;
        wahl:=' ';
      end;
    end;
    'f':
    begin
      if omega>=0.02 then
      begin
        loesch32;
        loesch20;
        omega:=omega-0.01;
        setz20;
        setz32;
      end;
      wahl:=' ';
    end;
    'F':
    begin
      loesch32;
      loesch20;
      omega:=omega+0.01;
      setz20;
      setz32;
      wahl:=' ';
    end;
    'w':
    begin
      loesch32;
      loesch12;
      loesch20;
      loesch3;
      loesch4;
      loesch5;
      loesch6;
      a:=2;
      a1:=30;
      a2:=30;
      c:=5.4/2;
      m:=2;
      n:=3;
      t:=0;
      dt:=1;
      omega:=0.04*pi;
      setz32;
      setz12;
      setz20;
      setz3;
      setz4;
      setz5;
      setz6;
    wahl:=' ';
    end;
  end;
  until wahl='x';
end;

procedure graphik4;
begin
  setbkcolor(hinter);
  setcolor(farbe1);
  str(dt:4:2,ortx3);
  outtextxy(445,420,ortx3);
  outtextxy(395,420,'dt =        ms     (t/T)');
  outtextxy(50,360,'Anzahl der beteiligten Wellen „ndern (n/N)');
  str(l1:2,ortx7);
  outtextxy(80,380,ortx7);
  outtextxy(50,380,'n = ');
  setcolor(farbe4);
  outtextxy(130,60,'');
  setcolor(farbe2);
  outtextxy(80,80,'                              Reflexion am festen Ende (2)');
  setcolor(vorder);
  outtextxy(50,400,'Ordnung vergr”áern/verkleinern (o/O)');
  outtextxy(130,60,'');
  outtextxy(80,80,'Reflexion am losen Ende (1)');
  outtextxy(120,100,'Reflexion an einem festen und einem losen Ende (3)');
  outtextxy(250,15,'Stehende Wellen ');
  str(5*omega:4:2,ortx2);
  outtextxy(445,400,ortx2);
  g0;
end;

procedure rechnung1;
begin
  y:=sin(omega*t-omega/c*x);
  for l:=1 to l1 do
  begin
    y:=y+sin(omega*t-omega/c*(l*1080+x));
  end;
  y:=a1/(l1+1)*y;
  y1:=0;
  for l:=1 to l1 do
  begin
    y1:=y1+sin(omega*t-omega/c*(l*1080-x));
  end;
  y:=y+a2/l1*y1;
end;

procedure rechnung2;
begin
  y:=sin(omega*t-omega/c*x);
  for l:=1 to l1 do
  begin
    y:=y+sin(omega*t-omega/c*(l*1080+x));
  end;
  y:=a1/(l1+1)*y;
  y1:=0;
  for l:=1 to l1 do
  begin
    y1:=y1-sin(omega*t-omega/c*(l*1080-x));
  end;
  y:=y+a2/l1*y1;
end;

procedure rechnung3;
begin
  y:=sin(omega*t-omega/c*x);
  for l:=1 to l1 do
  begin
    y:=y+sin(omega*t-omega/c*(l*alpha+x));
  end;
  y:=a1/(l1+1)*y;
end;

procedure rechnung4;
begin
  y:=sin(omega*t-omega/c*x);
  for l:=1 to l1 do
  begin
    y:=y+sin(omega*t-omega/c*(l*2160+x));
  end;
  y:=a1/(l1+1)*y;
  y1:=0;
  for l:=1 to l1 do
  begin
    y1:=y1-sin(omega*t-omega/c*(l*2160-x));
  end;
  y:=y+a2/l1*y1;
end;


procedure setz04;
begin
  x:=0;
  setcolor(farbe);
  repeat
    x:=x+a;
    if m=1 then
      rechnung1;
    if m=2 then
      rechnung2;
    if m=3 then
      rechnung3;
    if m=4 then
      rechnung4;
    putpixel(50+round(x),240-round(y),farbe);
    until x>=540;
end;

procedure setz42;
begin
  farbe:=farbe2;
  setz04;
end;

procedure loesch42;
begin
  farbe:=hinter;
  setz04;
end;

procedure setz43;
begin
  setcolor(farbe1);
  str(l1:2,ortx7);
  outtextxy(80,380,ortx7);
end;

procedure loesch43;
begin
  setcolor(hinter);
  outtextxy(80,380,ortx7);
end;

procedure setz44;
begin
  setcolor(farbe2);
  outtextxy(80,80,'Reflexion am losen Ende (1)');
  setcolor(vorder);
  outtextxy(80,80,'                              Reflexion am festen Ende (2)');
  outtextxy(120,100,'Reflexion an einem festen und einem losen Ende (3)');
end;

procedure setz45;
begin
  setcolor(vorder);
  outtextxy(80,80,'Reflexion am losen Ende (1)');
  outtextxy(120,100,'Reflexion an einem festen und einem losen Ende (3)');
  setcolor(farbe2);
  outtextxy(80,80,'                              Reflexion am festen Ende (2)');
end;

procedure setz46;
begin
  setcolor(vorder);
  outtextxy(80,80,'Reflexion am losen Ende (1)');
  outtextxy(80,80,'                              Reflexion am festen Ende (2)');
  setcolor(farbe2);
  outtextxy(120,100,'Reflexion an einem festen und einem losen Ende (3)');
end;

procedure auswahl4;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    's':
    begin
      loesch42;
      t:=0;
      setz42;
      wahl2:=' ';
      repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
          end;
        loesch42;
        t:=t+dt;
        setz42;
        delay(zeit);
      until wahl2='b';
    wahl:=' ';
    end;
    '1':
    begin
      loesch20;
      loesch42;
      m:=1;
  omega:=c*pi/540;
      setz44;
      setz42;
      setz20;
      wahl:=' ';
    end;
    '2':
    begin
      loesch42;
      loesch20;
      m:=2;
  omega:=c*pi/540;
      setz45;
      setz42;
      setz20;
      wahl:=' ';
    end;
    '3':
    begin
      loesch42;
      loesch20;
      m:=4;
  omega:=c*pi/1080;
      setz46;
      setz42;
      setz20;
      wahl:=' ';
    end;
    'd':
    begin
      if zeit>=100 then
      begin
        loeschzeit;
        zeit:=zeit-100;
        setzzeit;
        wahl:=' ';
      end;
    end;
    'D':
    begin
        loeschzeit;
        zeit:=zeit+100;
        setzzeit;
        wahl:=' ';
    end;
    't':
    begin
      if dt>=0.06 then
      begin
        loesch3;
        dt:=dt-0.01;
        setz3;
        wahl:=' ';
      end;
    end;
    'T':
    begin
    if dt<=4.5 then
    begin
      loesch3;
      dt:=dt+0.01;
      setz3;
      wahl:=' ';
    end;
    end;
    'c':
    begin
      if c>=0.2 then
      begin
        loesch42;
        loesch12;
        c:=c-0.1;
        setz12;
        setz42;
      end;
      wahl:=' ';
    end;
    'C':
    begin
      loesch42;
      loesch12;
      c:=c+0.1;
      setz12;
      setz42;
      wahl:=' ';
    end;
    'k':
    begin
      if a1>=6 then
      begin
        loesch42;
        loesch5;
        a1:=a1-1;
        setz5;
        setz42;
        wahl:=' ';
      end;
    end;
    'g':
    begin
      if a1<=59 then
      begin
        loesch42;
        loesch5;
        a1:=a1+1;
        setz5;
        setz42;
        wahl:=' ';
      end;
    end;
    'K':
    begin
      if a2>=6 then
      begin
        loesch42;
        loesch6;
        a2:=a2-1;
        setz6;
        setz42;
        wahl:=' ';
      end;
    end;
    'G':
    begin
      if a2<=59 then
      begin
        loesch42;
        loesch6;
        a2:=a2+1;
        setz6;
        setz42;
        wahl:=' ';
      end;
    end;
    'a':
    begin
      if a>=0.2 then
      begin
        loesch42;
        loesch4;
        a:=a-0.1;
        setz4;
        setz42;
        wahl:=' ';
      end;
    end;
    'A':
    begin
      if a<=5 then
      begin
        loesch42;
        loesch4;
        a:=a+0.1;
        setz4;
        setz42;
        wahl:=' ';
      end;
    end;
    'O':
    begin
        loesch42;
        loesch20;
        omega:=omega+c*pi/540;
        setz42;
        setz20;
        wahl:=' ';
    end;
    'o':
    begin
      if omega>=2*c*pi/540 then
      begin
        loesch42;
        loesch20;
        omega:=omega-c*pi/540;
        setz42;
        setz20;
        wahl:=' ';
      end;
    end;
    'N':
    begin
      if l1<=20 then
      begin
        loesch42;
        loesch43;
        l1:=l1+1;
        setz42;
        setz43;
        wahl:=' ';
      end;
    end;
    'n':
    begin
      if l1>=2 then
      begin
        loesch42;
        loesch43;
        l1:=l1-1;
        setz42;
        setz43;
        wahl:=' ';
      end;
    end;
    'f':
    begin
      if omega>=0.02 then
      begin
        loesch42;
        loesch20;
        omega:=omega-0.01;
        setz20;
        setz42;
      end;
      wahl:=' ';
    end;
    'F':
    begin
      loesch42;
      loesch20;
      omega:=omega+0.01;
      setz20;
      setz42;
      wahl:=' ';
    end;
    'w':
    begin
      loesch42;
      loesch43;
      loesch12;
      loesch20;
      loesch3;
      loesch4;
      loesch5;
      loesch6;
      if m=3 then
      begin
  a:=3;
  l1:=5;
  a1:=30;
  c:=5;
  m:=3;
  t:=0;
  dt:=1;
  omega:=0.1*pi;
  alpha:=2*pi*c/omega/22;
      end
      else
      begin
        a:=2;
        l1:=5;
        a1:=30;
        a2:=30;
        c:=27;
        m:=2;
        t:=0;
        dt:=1;
        omega:=c*pi/540;
      setz45;
      end;
      setz42;
      setz43;
      setz12;
      setz20;
      setz3;
      setz4;
    wahl:=' ';
    end;
  end;
  until wahl='x';
end;

procedure graphik5;
begin
  setbkcolor(hinter);
  setcolor(farbe1);
  str(dt:4:2,ortx3);
  outtextxy(445,420,ortx3);
  outtextxy(395,420,'dt =        ms     (t/T)');
  outtextxy(50,360,'Anzahl der beteiligten Wellen „ndern (n/N)');
  str(l1:2,ortx7);
  outtextxy(80,380,ortx7);
  outtextxy(50,380,'n = ');
  setcolor(farbe4);
  outtextxy(130,60,'');
  setcolor(farbe2);
  outtextxy(80,80,'');
  setcolor(vorder);
  outtextxy(50,400,'');
  outtextxy(130,60,'');
  outtextxy(50,80,'Gangunterschied benachbarter Wellen:  delta = ( 1 : 22 ) * lambda ');
  outtextxy(180,15,'šberlagerung gleichl„ufiger Wellen ');
  str(5*omega:4:2,ortx2);
  outtextxy(445,400,ortx2);
  g0;
end;

procedure w3;
begin
  cleardevice;
  a:=2;
  a1:=30;
  a2:=30;
  c:=5.4/2;
  m:=2;
  n:=3;
  t:=0;
  dt:=1;
  omega:=0.04*pi;
  graphik3;
  setz32;
  auswahl3;
  menue;
end;

procedure w4;
begin
  cleardevice;
  a:=2;
  l1:=5;
  a1:=30;
  a2:=30;
  c:=27;
  m:=2;
  t:=0;
  dt:=1;
  omega:=c*pi/540;
  graphik4;
  setz42;
  auswahl4;
  menue;
end;

procedure w2;
begin
cleardevice;
  a:=1;
  hilfe:=0;
  c:=5.4/2;
  m:=2;
  n:=3;
  t:=0;
  dt:=1;
  omega:=0.04*pi;
  graphik2;
  setz22;
  auswahl2;
  menue;
end;

procedure w0;
begin
cleardevice;
  a:=1;
  hilfe:=1;
  c:=5.4/2;
  m:=2;
  n:=3;
  t:=0;
  dt:=1;
  omega:=0.04*pi;
  graphik0;
  setz22;
  auswahl2;
  menue;
end;

procedure w1;
begin
  cleardevice;
    a:=1;
    c:=2.5;
    t:=0;
    dt:=1;
    omega:=0.05*2*pi;
    graphik;
    setz;
    auswahl;
  menue;
end;

procedure w5;
begin
  cleardevice;
  a:=3;
  l1:=5;
  a1:=30;
  c:=5;
  m:=3;
  t:=0;
  dt:=1;
  omega:=0.1*pi;
  alpha:=2*pi*c/omega/22;
  graphik5;
  setz42;
  auswahl4;
  menue;
end;

{MAIN}
begin
  wahl1:=' ';
  farbe4:=9;
  farbe5:=7;
  farbe2:=12;
  farbe1:=7;
  hinter:=15;
  vorder:=8;
  zeit:=1000;
  menue;
  repeat
  wahl1:=' ';
  if keypressed then wahl1:=readkey;
  case wahl1 of
    '0':w0;
    '1':w1;
    '2':w2;
    '3':w3;
    '4':w4;
    '5':w5;
  end;
  until wahl1='b';
end.
