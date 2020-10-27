program kepler;
uses crt,graph;
var
  zeit,f1,f2,f3,k,treiber,modus:integer;
  umlauf,a1,b1,thilfe,v,phi,phi0,h,h0,r0,m0,m1,F,vx,vy,a0,ax,ay,z,s,e,a,b,r,y,l,v0,x,t,dt:real;
  a01,a02,a03,a04,a05,ax1,ax2,ax3,ax4,ax5,ay1,ay2,ay3,ay4,ay5,vx1,vx2,vx3,vx4,vx5:real;
  vy1,vy2,vy3,vy4,vy5,x1,x2,x3,x4,x5,y1,y2,y3,y4,y5,v01,v02,v03,v04,v05:real;
  entf,vy100,vy200,m000,m100,vy10,vy20,m00,m10,vx10,vx20:real;
  wahl2,wahl1,wahl:char;
  ortx1,ortx2,ortx3,ortx4,ortx5,ortx6,ortx7,ortx8,ortx9,ortx10,ortx11:string;

procedure menue;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(7);
  setcolor(1);
  outtextxy(120,200,'Ellipsen  ->  1');
  outtextxy(120,250,'Kepler - Ellipsen ( Satelliten im Erdfeld )  ->  2');
  outtextxy(120,300,'Kepler - Ellipsen ( Planetenbahnen)  -> 3');
  outtextxy(120,350,'Doppelsterne und ihre Bewegung um den Schwerpunkt -> 4');
  outtextxy(400,400,'beenden  ->  b');
end;

procedure graphik;
begin
  setbkcolor(1);
  setcolor(14);
  outtextxy(60,50,'Halbachsen etc. darstellen / l”schen (h/H)    Punkt bewegen (r/l)');
  setcolor(15);
  line(10,30,630,30);
  line(10,440,630,440);
  line(10,30,10,440);
  line(630,30,630,440);
  str((e/a):6:4,ortx1);
  outtextxy(545,380,ortx1);
  outtextxy(485,380,'e/a =');
  str(a:4:2,ortx2);
  outtextxy(545,400,ortx2);
  outtextxy(500,400,'a = ');
  outtextxy(500,420,'b = ');
  outtextxy(300,15,'Ellipsen ');
  outtextxy(40,460,'wiederherstellen (w)  Planeten (m/v/t/M/j/s/u/n/p/x/X)    beenden (b) ');
  outtextxy(40,450,'e ver„ndern (e/E)   a ver„ndern (a/A)    neu zeichnen / l”schen (S/L) ');
end;

procedure setz2;
begin
  setcolor(15);
  str((e/a):6:4,ortx1);
  outtextxy(545,380,ortx1);
  str(a:4:2,ortx2);
  outtextxy(545,400,ortx2);
  str(b:4:2,ortx3);
  outtextxy(545,420,ortx3);
end;

procedure loesch2;
begin
  setcolor(1);
  outtextxy(545,380,ortx1);
  outtextxy(545,400,ortx2);
  outtextxy(545,420,ortx3);
end;

procedure setz1;
begin
  setcolor(15);
  str((e/a):6:4,ortx1);
  outtextxy(545,380,ortx1);
  str(b:4:2,ortx3);
  outtextxy(545,420,ortx3);
end;

procedure loesch1;
begin
  setcolor(1);
  outtextxy(545,380,ortx1);
  outtextxy(545,420,ortx3);
end;

procedure s0;
begin
  setcolor(10);
  circle(400,240,2);
  b:=sqrt(a*a-e*e);
  setcolor(f1);
  circle(400-round(2*e),240,2);
  x:=-(a-e);
  repeat
    x:=x+0.2;
    r:=a+e/a*x-e*e/a;
    y:=sqrt(r*r-x*x);
    putpixel(400-round(x),240+round(y),f1);
    putpixel(400-round(x),240-round(y),f1);
  until x>=a+e-0.2;
end;

procedure setz;
begin
  b:=sqrt(a*a-e*e);
  setcolor(10);
  circle(400,240,2);
  circle(400-round(2*e),240,2);
  x:=-(a-e);
  repeat
    x:=x+0.1;
    r:=a+e/a*x-e*e/a;
    y:=sqrt(r*r-x*x);
    putpixel(400-round(x),240+round(y),f1);
    putpixel(400-round(x),240-round(y),f1);
  until x>=a+e-0.1;
  if l=1 then
  begin
    setcolor(15);
    outtextxy(400+round(a/2-e),250,'a');
    outtextxy(410-round(e),240+round(b/2),'b');
    setlinestyle(1,0,1);
    line(400-round(e),240,400-round(e-a),240);
    line(400-round(e),240+round(b),400-round(e),240);
    setcolor(14);
    x:=3*e/2;
    r:=a+e/a*x-e*e/a;
    y:=sqrt(r*r-x*x);
    line(400-round(2*e),240,400-round(x),240-round(y));
    line(400,240,400-round(x),240-round(y));
    setlinestyle(0,0,1);
  end;
end;

procedure loesch0;
begin
  setfillstyle(0,1);
  bar(11,31,629,439);
end;

procedure loesch00;
begin
  setfillstyle(0,1);
  bar(544,379,629,449);
  bar(0,0,50,480);
end;


procedure loesch;
begin
  b:=sqrt(a*a-e*e);
  setcolor(1);
  circle(400-round(2*e),240,2);
  x:=-(a-e);
  repeat
    x:=x+0.1;
    r:=a+e/a*x-e*e/a;
    y:=sqrt(r*r-x*x);
    putpixel(400-round(x),240+round(y),1);
    putpixel(400-round(x),240-round(y),1);
  until x>=a+e-0.1;
  if l=1 then
  begin
    outtextxy(400+round(a/2-e),250,'a');
    outtextxy(410-round(e),240+round(b/2),'b');
    setlinestyle(1,0,1);
    line(400-round(e),240,400-round(e-a),240);
    line(400-round(e),240+round(b),400-round(e),240);
    x:=3*e/2;
    r:=a+e/a*x-e*e/a;
    y:=sqrt(r*r-x*x);
    line(400-round(2*e),240,400-round(x),240-round(y));
    line(400,240,400-round(x),240-round(y));
    setlinestyle(0,0,1);
  end;
end;

procedure loesch000;
  begin
    setcolor(1);
    outtextxy(400+round(a/2-e),250,'a');
    outtextxy(410-round(e),240+round(b/2),'b');
    setlinestyle(1,0,1);
    line(400-round(e),240,400-round(e-a),240);
    line(400-round(e),240+round(b),400-round(e),240);
    x:=3*e/2;
    r:=a+e/a*x-e*e/a;
    y:=sqrt(r*r-x*x);
    line(400-round(2*e),240,400-round(x),240-round(y));
    line(400,240,400-round(x),240-round(y));
    setlinestyle(0,0,1);
  end;

procedure setz00;
begin
    setlinestyle(1,0,1);
    r:=a+e/a*x-e*e/a;
    y:=sqrt(r*r-x*x);
    setcolor(f2);
    line(400-round(e),240,400-round(e-a),240);
    setcolor(f3);
    line(400-round(2*e),240,400-round(x),240-round(y));
    line(400,240,400-round(x),240-round(y));
    setlinestyle(0,0,1);
end;

procedure auswahl;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    'r':
    begin
      if x>=-(a-e)+0.4 then
      begin
      f2:=1;
      f3:=1;
      setz00;
      x:=x-1;
      f3:=14;
      f2:=15;
      setz00;
      end;
      wahl:=' ';
    end;
    'l':
    begin
      if x<=a+e-0.4 then
      begin
      f2:=1;
      f3:=1;
      setz00;
      x:=x+1;
      f3:=14;
      f2:=15;
      setz00;
      end;
      wahl:=' ';
    end;
    'S':
    begin
      setcolor(1);
      outtextxy(420,400,ortx5);
      outtextxy(420,380,ortx4);
      outtextxy(50,407,'Farbe');
      setcolor(14);
      outtextxy(80,407,'e/a eingeben');
      read(s);
      str(s:6:4,ortx4);
      outtextxy(420,380,ortx4);
      setcolor(1);
      outtextxy(80,407,'e/a');
      setcolor(14);
      outtextxy(80,407,'a');
      read(a);
      str(a:6:0,ortx5);
      outtextxy(420,400,ortx5);
      setcolor(1);
      outtextxy(80,407,'a');
      setcolor(14);
      outtextxy(50,407,'Farbe');
      read(f1);
      e:=s*a;
      setcolor(1);
      outtextxy(80,407,'e/a eingeben');
      outtextxy(50,407,'Farbe');
      loesch00;
      graphik;
      setz1;
      setz2;
      s0;
      f1:=12;
      wahl:=' ';
    end;
    'w':
    begin
      a:=120;
      e:=60;
      l:=0;
      cleardevice;
      graphik;
      setz;
      setz1;
      wahl:=' ';
    end;
    'm':
    begin
      a:=57.91;
      e:=a*0.206;
      l:=0;
      cleardevice;
      graphik;
      setz;
      setz1;
      outtextxy(300,400,'Merkurbahn');
      wahl:=' ';
    end;
    'v':
    begin
      a:=108.21;
      e:=a*0.007;
      l:=0;
      cleardevice;
      graphik;
      setz;
      setz1;
      outtextxy(300,400,'Venusbahn');
      wahl:=' ';
    end;
    't':
    begin
      a:=149.6;
      e:=a*0.017;
      l:=0;
      cleardevice;
      graphik;
      setz;
      setz1;
      outtextxy(300,400,'Erdbahn');
      wahl:=' ';
    end;
    'M':
    begin
      a:=227.04;
      e:=a*0.093;
      l:=0;
      cleardevice;
      graphik;
      setz;
      setz1;
      outtextxy(300,400,'Marsbahn');
      wahl:=' ';
    end;
    'j':
    begin
      a:=77.834;
      e:=a*0.048;
      l:=0;
      cleardevice;
      graphik;
      setz;
      loesch1;
      loesch2;
  a:=a*10;
  e:=a*0.048;
  b:=sqrt(a*a-e*e);
      setz2;
      setz1;
      outtextxy(300,400,'Jupiterbahn');
      wahl:=' ';
    end;
    's':
    begin
      a:=142.701;
      e:=a*0.056;
      l:=0;
      cleardevice;
      graphik;
      setz;
      loesch1;
      loesch2;
  a:=a*10;
  e:=a*0.056;
  b:=sqrt(a*a-e*e);
      setz1;
      setz2;
      outtextxy(300,400,'Saturnbahn');
      wahl:=' ';
    end;
    'u':
    begin
      a:=28.696*3;
      e:=a*0.047;
      l:=0;
      cleardevice;
      graphik;
      setz;
      loesch1;
      loesch2;
  a:=a*100/3;
  e:=a*0.047;
  b:=sqrt(a*a-e*e);
      setz2;
      setz1;
      outtextxy(300,400,'Uranusbahn');
      wahl:=' ';
    end;
    'n':
    begin
      a:=44.967*3;
      e:=a*0.009;
      l:=0;
      cleardevice;
      graphik;
      setz;
      loesch1;
      loesch2;
  a:=a*100/3;
  e:=a*0.009;
  b:=sqrt(a*a-e*e);
      setz2;
      setz1;
      outtextxy(300,400,'Neptunbahn');
      wahl:=' ';
    end;
    'p':
    begin
      a:=58.99*3;
      e:=a*0.249;
      l:=0;
      cleardevice;
      graphik;
      setz;
      loesch1;
      loesch2;
  a:=a*100/3;
  e:=a*0.249;
  b:=sqrt(a*a-e*e);
      setz2;
      setz1;
      outtextxy(300,400,'Plutobahn');
      wahl:=' ';
    end;
    'x':
    begin
      a:=227.04;
      e:=a*0.093;
      cleardevice;
      f1:=12;
      setcolor(f1);
      s0;
      outtextxy(350,400,'Mars');
      a:=57.91;
      e:=a*0.206;
      f1:=14;
      setcolor(f1);
      s0;
      outtextxy(50,400,'Merkur');
      a:=108.21;
      e:=a*0.007;
      f1:=13;
      setcolor(f1);
      s0;
      outtextxy(150,400,'Venus');
      a:=149.6;
      e:=a*0.017;
      f1:=6;
      setcolor(f1);
      s0;
      outtextxy(250,400,'Erde');
      wahl:=' ';
    end;
    'X':
    begin
      a:=7.7834*4;
      e:=a*0.048;
      cleardevice;
      f1:=11;
      setcolor(f1);
      s0;
      outtextxy(50,400,'Jupiter');
      a:=14.2701*4;
      e:=a*0.056;
      f1:=14;
      setcolor(f1);
      s0;
      outtextxy(150,400,'Saturn');
      a:=28.696*4;
      e:=a*0.047;
      f1:=13;
      setcolor(f1);
      s0;
      outtextxy(250,400,'Uranus');
      a:=44.967*4;
      e:=a*0.009;
      f1:=10;
      setcolor(f1);
      s0;
      outtextxy(350,400,'Neptun');
      a:=58.99*4;
      e:=a*0.249;
      f1:=7;
      setcolor(f1);
      s0;
      outtextxy(450,400,'Pluto');
      f1:=12;
      wahl:=' ';
    end;
    'h':
    begin
      l:=1;
      f2:=1;
      f3:=1;
      setz00;
      setz;
      wahl:=' ';
    end;
    'H':
    begin
      l:=0;
      f2:=1;
      f3:=1;
      setz00;
      loesch000;
      setz;
      wahl:=' ';
    end;
    'L':
    begin
      loesch;
      wahl:=' ';
    end;
    'e':
    begin
    if e>0 then
    begin
      loesch1;
      loesch;
      e:=e-1;
      setz;
      setz1;
      end;
      wahl:=' ';
    end;
    'E':
    begin
      if e<a-2 then
      begin
        loesch1;
        loesch;
        e:=e+1;
        setz1;
        setz;
      end;
      wahl:=' ';
    end;
    'a':
    begin
    if a>e+1 then
    begin
      loesch2;
      loesch;
      a:=a-1;
      setz2;
      setz;
    end;
      wahl:=' ';
    end;
    'A':
    begin
      loesch2;
      loesch;
      a:=a+1;
      setz2;
      setz;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure ellipse;
begin
  cleardevice;
    a:=120;
    e:=60;
    f1:=12;
    l:=0;
    graphik;
    setz;
    setz1;
    auswahl;
  menue;
end;

procedure graphik2;
begin
  setbkcolor(1);
  setcolor(15);
  line(10,30,630,30);
  line(10,440,630,440);
  line(10,30,10,440);
  line(630,30,630,440);
  str((90-phi/pi*180):3:0,ortx1);
  outtextxy(545,380,ortx1+ 'ø');
  outtextxy(485,380,'phi =');
  str((h/1000):4:0,ortx2);
  outtextxy(545,400,ortx2+' km');
  outtextxy(500,400,'h = ');
  outtextxy(490,420,'v0 = ');
  str((v0/1000):4:2,ortx3);
  outtextxy(545,420,ortx3+' km/s');
  str(zeit:4,ortx4);
  outtextxy(580,445,ortx4);
  outtextxy(350,420,'v =');
  outtextxy(350,400,'t =');
  str((v/1000):4:2,ortx10);
  outtextxy(400,420,ortx10+' km/s');
  str((t/3600):4:2,ortx9);
  outtextxy(400,400,ortx9+' h');
  outtextxy(150,15,'Kepler - Ellipsen ( Satelliten in Erdn„he )');
  outtextxy(60,455,'Maástab ver„ndern (z/Z)  phi ver„ndern (p/P)  wiederherstellen (w) ');
  outtextxy(5,445,'  h ver„ndern (h/H)  v0 ver„ndern (v/V)  Zeitfaktor „ndern (t/T)  delay(     )');
  outtextxy(10,465,'Fahrstrahl anzeigen/nicht (1/0)  weitere Ellipsen zeichnen  (S)  beenden (b)');
  outtextxy(30,420,'starten (s)  pause (p)');
end;

procedure setz21;
begin
  setcolor(15);
  str((90-phi/pi*180):3:0,ortx1);
  outtextxy(545,380,ortx1);
  str((h/1000):4:0,ortx2);
  outtextxy(545,400,ortx2);
  str((v0/1000):4:2,ortx3);
  outtextxy(545,420,ortx3);
  str(zeit:4,ortx4);
  outtextxy(580,445,ortx4);
end;

procedure loesch21;
begin
  setcolor(1);
  outtextxy(545,380,ortx1);
  outtextxy(545,400,ortx2);
  outtextxy(545,420,ortx3);
  outtextxy(580,445,ortx4);
end;

procedure s2;
begin
  vx:=v0*cos(phi);
  vy:=v0*sin(phi);
  x:=h+r0;
  y:=0;
  setcolor(14);
  circle(400,240,round(r0/z));
end;

procedure setz22;
begin
  setcolor(15);
  str((v/1000):4:2,ortx10);
  outtextxy(400,420,ortx10+' km/s');
end;

procedure setz23;
begin
  setcolor(15);
  str((t/3600):4:2,ortx9);
  outtextxy(400,400,ortx9+' h');
end;

procedure loesch22;
begin
  setcolor(1);
  outtextxy(400,420,ortx10+' km/s');
end;

procedure loesch23;
begin
  setcolor(1);
  outtextxy(400,400,ortx9+' h');
end;


procedure rechnung2;
begin
  t:=t+dt;
  thilfe:=thilfe+dt;
  k:=k+1;
  a0:=-F/(x*x+y*y)/sqrt(x*x+y*y);
  ax:=a0*x;
  ay:=a0*y;
  vx:=vx+ax*dt;
  vy:=vy+ay*dt;
  v:=sqrt(vx*vx+vy*vy);
  x:=x+vx*dt;
  y:=y+vy*dt;
end;


procedure s21;
begin
  setcolor(14);
  setlinestyle(1,0,1);
  line(400,240,400+round(x/z),240-round(y/z));
  setlinestyle(0,0,1);
end;

procedure loesch20;
begin
  setfillstyle(0,1);
  bar(11,31,629,439);
end;

procedure loesch200;
begin
  setfillstyle(0,1);
  bar(544,379,629,449);
  bar(0,0,50,480);
end;

procedure loesch2000;
begin
  setfillstyle(0,1);
  bar(0,0,80,480);
  bar(544,379,629,449);
end;


procedure auswahl2;
begin
  f1:=10;
  s2;
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    's':
    begin
  if l=0 then
  begin
      t:=0;
      thilfe:=0;
      rechnung2;
      putpixel(400+round(x/z),240-round(y/z),f1);
      wahl2:=' ';
      repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
          end;
        rechnung2;
        if k>=10 then
        begin
          loesch22;
          loesch23;
          k:=0;
          putpixel(400+round(x/z),240-round(y/z),f1);
          setz22;
          setz23;
        end;
        delay(zeit);
      until wahl2='b';
    end;
  if l=1 then
    begin
      s21;
      t:=0;
      thilfe:=0;
      rechnung2;
      putpixel(400+round(x/z),240-round(y/z),f1);
      wahl2:=' ';
      repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
          end;
        rechnung2;
        if k>=10 then
        begin
          loesch22;
          loesch23;
          k:=0;
          putpixel(400+round(x/z),240-round(y/z),f1);
          setz22;
          setz23;
        end;

          if thilfe>=2000 then
          begin
            thilfe:=0;
            s21;
          end;
        delay(zeit);

      until wahl2='b';
    end;
    wahl:=' ';
    end;

    '1':
    begin
      l:=1;
      wahl:=' ';
    end;
    '0':
    begin
      l:=0;
      cleardevice;
      graphik2;
      s2;
      wahl:=' ';
    end;
    'P':
    begin
      loesch20;
      loesch21;
      phi:=phi+1/180*pi;
      graphik2;
      s2;
      setz21;
      wahl:=' ';
    end;
    'p':
    begin
      if phi>=pi/180 then
      begin
      loesch20;
      loesch21;
      phi:=phi-pi/180;
      graphik2;
      s2;
      setz21;
      end;
      wahl:=' ';
    end;
    'h':
    begin
      if h>=8000 then
      begin
      loesch20;
      loesch21;
      h:=h-10000;
      graphik2;
      s2;
      setz21;
      end;
      wahl:=' ';
    end;
    'H':
    begin
      if h<=80000000 then
      begin
      loesch20;
      loesch21;
      h:=h+10000;
      graphik2;
      s2;
      setz21;
      end;
      wahl:=' ';
    end;
    'z':
    begin
      if z>=20000 then
      begin
      loesch20;
      loesch21;
      z:=z-10000;
      graphik2;
      s2;
      setz21;
      end;
      wahl:=' ';
    end;
    'Z':
    begin
      loesch20;
      loesch21;
      z:=z+10000;
      graphik2;
      s2;
      setz21;
      wahl:=' ';
    end;
    'v':
    begin
      if v0>=5000 then
      begin
      loesch20;
      loesch21;
      v0:=v0-100;
      graphik2;
      s2;
      setz21;
      end;
      wahl:=' ';
    end;
    't':
    begin
      if zeit>=50 then
      begin
      loesch20;
      loesch21;
      zeit:=zeit-25;
      graphik2;
      s2;
      setz21;
      end;
      wahl:=' ';
    end;
    'w':
    begin
      cleardevice;
  v0:=9e3;
  v:=v0;
  r0:=6.37e6;
  h:=15e5;
  phi:=pi/2;
  t:=0;
  dt:=20;
  z:=10e4;
  zeit:=100;
  f1:=10;
      graphik2;
      s2;
      wahl:=' ';
    end;
    'T':
    begin
      if zeit<=1000 then
      begin
      loesch20;
      loesch21;

      zeit:=zeit+25;
      graphik2;
      s2;
      setz21;
      end;
      wahl:=' ';
    end;
    'S':
    begin
      setcolor(1);
      outtextxy(50,407,'Farbe');
      setcolor(14);
      outtextxy(80,407,'h in km eingeben');
      read(h);
      h:=1000*h;
      str((h/1000):4:0,ortx2);
      outtextxy(245,400,ortx2+' km');
      setcolor(1);
      outtextxy(80,407,'h in km');
      setcolor(14);
      outtextxy(50,407,'v0 im km/s');
      read(v0);
      v0:=v0*1000;
      str((v0/1000):4:1,ortx3);
      outtextxy(245,420,ortx3+' km/s');
      setcolor(1);
      outtextxy(50,407,'v0 in km/s');
      setcolor(14);
      outtextxy(85,407,'phi');
      read(phi);
      phi:=pi/2-phi/180*pi;
      str((90-phi/pi*180):3:0,ortx1);
      outtextxy(245,380,ortx1+' ø');
      setcolor(1);
      outtextxy(85,407,'phi');
      setcolor(14);
      outtextxy(50,407,'Farbe');
      read(f1);
      setcolor(1);
      outtextxy(80,407,'h in km eingeben');
      outtextxy(50,407,'Farbe');
      outtextxy(545,400,ortx2);
      outtextxy(545,420,ortx3);
      outtextxy(245,400,ortx2+' km');
      outtextxy(245,420,ortx3+' km/s');
      outtextxy(245,380,ortx1+' ø');
      loesch2000;
      graphik2;
      s2;
      setz21;
      wahl:=' ';
    end;
    'V':
    begin
      if v0<=50000 then
      begin
      loesch20;
      loesch21;
      v0:=v0+100;
      graphik2;
      s2;
      setz21;
      end;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure ellipse2;
begin
  cleardevice;
  m0:=5.973e24;
  F:=6.67e-11*m0;
  v0:=9e3;
  v:=v0;
  r0:=6.37e6;
  h:=15e5;
  phi:=pi/2;
  t:=0;
  dt:=20;
  z:=10e4;
  zeit:=100;
  f1:=10;
    graphik2;
    auswahl2;
  menue;
end;


procedure graphik3;
begin
  setbkcolor(1);
  setcolor(14);
  outtextxy(60,50,'');
  setcolor(15);
  line(10,30,630,30);
  line(10,440,630,440);
  line(10,30,10,440);
  line(630,30,630,440);
  outtextxy(495,380,'z =');
  str((z/1e8):4:0,ortx1);
  outtextxy(545,380,ortx1);
  str((r/1e9):4:0,ortx2);
  outtextxy(525,400,ortx2+' Mio km');
  outtextxy(480,400,'a-e = ');
  outtextxy(490,420,'v0 = ');
  str((v0/1000):4:2,ortx3);
  outtextxy(545,420,ortx3+' km/s');
  str(dt:4:0,ortx4);
  outtextxy(580,445,ortx4);
  outtextxy(200,15,'Kepler - Ellipsen ( Planetenbahnen )');
  outtextxy(80,455,'Maástab ver„ndern (z/Z)        Erdbahn wiederherstellen (w) ');
  outtextxy(5,445,' Planeten anzeigen (m/v/M/j/S/u/n/p/x/X)  Zeitfaktor „ndern (t/T)  dt =');
  outtextxy(20,465,'Fahrstrahl anzeigen/nicht (1/0)  Geschwindigkeit „ndern (g/G)  beenden (b)');
end;

procedure setz31;
begin
  setcolor(15);
  str((z/1e8):4:0,ortx1);
  outtextxy(545,380,ortx1);
  str((r/1e9):4:0,ortx2);
  outtextxy(525,400,ortx2+' Mio km');
  str((v0/1000):4:2,ortx3);
  outtextxy(545,420,ortx3+' km/s');
  str(dt:4:0,ortx4);
  outtextxy(580,445,ortx4);
end;

procedure loesch31;
begin
  setcolor(1);
  outtextxy(580,445,ortx4);
  outtextxy(545,380,ortx1);
  outtextxy(525,400,ortx2);
  outtextxy(545,420,ortx3);
end;

procedure r2;
begin
  if (x<=-e) and (x>=-e-1e9) and (y>1e9) then
  begin
  str((b/1e9):4:0,ortx5);
  outtextxy(225,380,ortx5+' Mio km');
  str((y/1e9):4:0,ortx6);
  outtextxy(225,400,ortx6+' Mio km');
  end;
  if (x<=-a-e+70e9) and (y<2e9) and (y>-2e9) then
  begin
  str((a/1e9):4:0,ortx7);
  outtextxy(25,380,ortx7+' Mio km');
  str(((-e-x)/1e9):4:0,ortx8);
  outtextxy(25,400,ortx8+' Mio km');
  end;
end;


procedure setz32;
begin
  setcolor(15);
  str((v/1000):4:2,ortx10);
  outtextxy(380,420,ortx10+' km/s');
end;

procedure setz33;
begin
  setcolor(15);
  str((t/3600/24):4:2,ortx9);
  outtextxy(380,400,ortx9+' d');
end;

procedure loesch32;
begin
  setcolor(1);
  outtextxy(380,420,ortx10+' km/s');
end;

procedure loesch33;
begin
  setcolor(1);
  outtextxy(380,400,ortx9+' d');
end;

procedure rechnung3;
begin
  t:=t+dt;
  a01:=-F/(x1*x1+y1*y1)/sqrt(x1*x1+y1*y1);
  ax1:=a01*x1;
  ay1:=a01*y1;
  vx1:=vx1+ax1*dt;
  vy1:=vy1+ay1*dt;
  x1:=x1+vx1*dt;
  y1:=y1+vy1*dt;
      putpixel(400+round(x1/z),240-round(y1/z),14);
  a02:=-F/(x2*x2+y2*y2)/sqrt(x2*x2+y2*y2);
  ax2:=a02*x2;
  ay2:=a02*y2;
  vx2:=vx2+ax2*dt;
  vy2:=vy2+ay2*dt;
  x2:=x2+vx2*dt;
  y2:=y2+vy2*dt;
      putpixel(400+round(x2/z),240-round(y2/z),13);
  a03:=-F/(x3*x3+y3*y3)/sqrt(x3*x3+y3*y3);
  ax3:=a03*x3;
  ay3:=a03*y3;
  vx3:=vx3+ax3*dt;
  vy3:=vy3+ay3*dt;
  x3:=x3+vx3*dt;
  y3:=y3+vy3*dt;
      putpixel(400+round(x3/z),240-round(y3/z),6);
  a04:=-F/(x4*x4+y4*y4)/sqrt(x4*x4+y4*y4);
  ax4:=a04*x4;
  ay4:=a04*y4;
  vx4:=vx4+ax4*dt;
  vy4:=vy4+ay4*dt;
  x4:=x4+vx4*dt;
  y4:=y4+vy4*dt;
      putpixel(400+round(x4/z),240-round(y4/z),12);
      delay(10);
end;

procedure rechnung4;
begin
  t:=t+dt;
  a01:=-F/(x1*x1+y1*y1)/sqrt(x1*x1+y1*y1);
  ax1:=a01*x1;
  ay1:=a01*y1;
  vx1:=vx1+ax1*dt;
  vy1:=vy1+ay1*dt;
  x1:=x1+vx1*dt;
  y1:=y1+vy1*dt;
      putpixel(400+round(x1/z),240-round(y1/z),11);
  a02:=-F/(x2*x2+y2*y2)/sqrt(x2*x2+y2*y2);
  ax2:=a02*x2;
  ay2:=a02*y2;
  vx2:=vx2+ax2*dt;
  vy2:=vy2+ay2*dt;
  x2:=x2+vx2*dt;
  y2:=y2+vy2*dt;
      putpixel(400+round(x2/z),240-round(y2/z),14);
  a03:=-F/(x3*x3+y3*y3)/sqrt(x3*x3+y3*y3);
  ax3:=a03*x3;
  ay3:=a03*y3;
  vx3:=vx3+ax3*dt;
  vy3:=vy3+ay3*dt;
  x3:=x3+vx3*dt;
  y3:=y3+vy3*dt;
      putpixel(400+round(x3/z),240-round(y3/z),12);
  a04:=-F/(x4*x4+y4*y4)/sqrt(x4*x4+y4*y4);
  ax4:=a04*x4;
  ay4:=a04*y4;
  vx4:=vx4+ax4*dt;
  vy4:=vy4+ay4*dt;
  x4:=x4+vx4*dt;
  y4:=y4+vy4*dt;
      putpixel(400+round(x4/z),240-round(y4/z),10);
  a05:=-F/(x5*x5+y5*y5)/sqrt(x5*x5+y5*y5);
  ax5:=a05*x5;
  ay5:=a05*y5;
  vx5:=vx5+ax5*dt;
  vy5:=vy5+ay5*dt;
  x5:=x5+vx5*dt;
  y5:=y5+vy5*dt;
      putpixel(400+round(x5/z),240-round(y5/z),7);
      delay(10);
end;

procedure auswahl3;
begin
  f1:=12;
  s2;
  setcolor(6);
  outtextxy(100,420,'Erdbahn');
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    's':
    begin
          if l=1 then  s21;
      t:=-dt;
      thilfe:=-dt;
      rechnung2;
  setcolor(1);
  outtextxy(25,380,ortx5+' Mio km');
  outtextxy(25,400,ortx6+' Mio km');
  setcolor(15);
  e:=a-h;
  b:=sqrt(a*a-e*e);
      putpixel(400+round(x/z),240-round(y/z),f1);
      wahl2:=' ';
      repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
          end;
        rechnung2;
        r2;
        if l=1 then
        begin
          if thilfe>=2e6 then
          begin
            thilfe:=0;
            s21;
          end;
        end;
       if (l=0) or (l=1) then
       begin
        if k>=100 then
        begin
          loesch33;
          loesch32;
          k:=0;
          putpixel(400+round(x/z),240-round(y/z),f1);
          setz32;
          setz33;
        end;
       end;
        delay(zeit);
      until wahl2='b';
    wahl:=' ';
    end;

    '1':
    begin
      l:=1;
      wahl:=' ';
    end;
    '0':
    begin
      l:=0;
      cleardevice;
      graphik3;
      s2;
      wahl:=' ';
    end;
    'G':
    begin
      if v0<=100000 then
      begin
      loesch20;
      loesch31;
      v0:=v0+100;
      graphik3;
      s2;
      setz31;
      end;
      wahl:=' ';
    end;
    'g':
    begin
      if v0>=200 then
      begin
      loesch20;
      loesch31;
      v0:=v0-100;
      graphik3;
      s2;
      setz31;
      end;
      wahl:=' ';
    end;
    'z':
    begin
      if z>=2e8 then
      begin
      loesch20;
      loesch31;
      z:=z-1e8;
      graphik3;
      s2;
      setz31;
      end;
      wahl:=' ';
    end;
    'Z':
    begin
      loesch20;
      loesch31;
      z:=z+1e8;
      graphik3;
      s2;
      setz31;
      wahl:=' ';
    end;
    'm':
    begin
      cleardevice;
      dt:=4000;
      v0:=59.15e3;
      r:=46e9;
      a:=57.91e9;
      r0:=7e8;
      h:=r-r0;
      phi:=pi/2;
      z:=1e9;
      f1:=14;
      l:=0;
      graphik3;
      s2;
      setcolor(f1);
      outtextxy(100,420,'Merkurbahn');
      wahl:=' ';
    end;
    'v':
    begin
      cleardevice;
      dt:=4000;
      v0:=35.3e3;
      r:=107.5e9;
      a:=108.21e9;
      r0:=7e8;
      h:=r-r0;
      phi:=pi/2;
      z:=1e9;
      f1:=13;
      l:=0;
      graphik3;
      s2;
      setcolor(f1);
      outtextxy(100,420,'Venusbahn');
      wahl:=' ';
    end;
    'M':
    begin
      cleardevice;
      dt:=4000;
      v0:=26.44e3;
      r:=206.7e9;
      a:=227.04e9;
      r0:=7e8;
      h:=r-r0;
      phi:=pi/2;
      z:=2e9;
      f1:=12;
      l:=0;
      graphik3;
      s2;
      setcolor(f1);
      outtextxy(100,420,'Marsbahn');
      wahl:=' ';
    end;
    'j':
    begin
      cleardevice;
      v0:=13.72e3;
      r:=740e9;
      a:=778.34e9;
      r0:=7e8;
      h:=r-r0;
      phi:=pi/2;
      z:=10e9;
      f1:=11;
      l:=0;
  dt:=80000;
  zeit:=10;
      graphik3;
      s2;
      setcolor(f1);
      outtextxy(100,420,'Jupiterbahn');
      wahl:=' ';
    end;
    'S':
    begin
      cleardevice;
      v0:=10.23e3;
      r:=1343e9;
      a:=1427.01e9;
      r0:=7e8;
      h:=r-r0;
      phi:=pi/2;
      z:=10e9;
      f1:=14;
      l:=0;
  dt:=80000;
  zeit:=10;
      graphik3;
      s2;
      setcolor(f1);
      outtextxy(100,420,'Saturnbahn');
      wahl:=' ';
    end;
    'u':
    begin
      cleardevice;
      v0:=7.13e3;
      r:=2735e9;
      a:=2869.6e9;
      r0:=7e8;
      h:=r-r0;
      phi:=pi/2;
      z:=30e9;
      f1:=12;
      l:=0;
  dt:=80000;
  zeit:=10;
      graphik3;
      s2;
      setcolor(f1);
      outtextxy(100,420,'Uranusbahn');
      wahl:=' ';
    end;
    'w':
    begin
      cleardevice;
      v0:=30.4e3;
      r:=147e9;
      a:=149.6e9;
      r0:=7e8;
      h:=r-r0;
      phi:=pi/2;
      dt:=4000;
      z:=1e9;
      zeit:=10;
      f1:=12;
      l:=0;
      graphik3;
      s2;
      setcolor(6);
      outtextxy(100,420,'Erdbahn');
      wahl:=' ';
    end;
    'n':
    begin
      cleardevice;
      v0:=5.48e3;
      r:=4456e9;
      a:=4496.7e9;
      r0:=7e8;
      h:=r-r0;
      phi:=pi/2;
      z:=30e9;
      f1:=10;
      l:=0;
  dt:=80000;
  zeit:=10;
      graphik3;
      s2;
      setcolor(f1);
      outtextxy(100,420,'Neptunbahn');
      wahl:=' ';
    end;
    'p':
    begin
      cleardevice;
      v0:=6.122e3;
      r:=4425e9;
      a:=5899e9;
      r0:=7e8;
      h:=r-r0;
      phi:=pi/2;
      z:=30e9;
      f1:=7;
      l:=0;
  dt:=80000;
  zeit:=10;
      graphik3;
      s2;
      setcolor(f1);
      outtextxy(100,420,'Plutobahn');
      wahl:=' ';
    end;
    'X':
    begin
      cleardevice;
  setcolor(14);
  circle(400,240,round(r0/z));
      v01:=13.72e3;
      x1:=740e9;
  dt:=80000;
      setcolor(11);
      outtextxy(50,420,'Jupiter');
      v02:=10.23e3;
      x2:=1343e9;
      setcolor(14);
      outtextxy(150,420,'Saturn');
      v03:=7.13e3;
      x3:=2735e9;
      setcolor(12);
      outtextxy(250,420,'Uranus');
      v04:=5.48e3;
      x4:=4456e9;
      setcolor(10);
      outtextxy(350,420,'Neptun');
      v05:=6.122e3;
      x5:=4425e9;
      z:=30e9;
      setcolor(7);
      outtextxy(450,420,'Plutobahn');
  vx1:=0;
  vy1:=v01;
  y1:=0;
  vx2:=0;
  vy2:=v02;
  y2:=0;
  vx3:=0;
  vy3:=v03;
  y3:=0;
  vx4:=0;
  vy4:=v04;
  y4:=0;
  vx5:=0;
  vy5:=v05;
  y5:=0;

      t:=-dt;
      thilfe:=-dt;
      rechnung4;
      wahl2:=' ';
        repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
          end;
        rechnung4;
       until (t>=9e9) or (wahl2='b');
       wahl:=' ';
    end;
    'x':
    begin
      cleardevice;
  setcolor(14);
  circle(400,240,round(r0/z));
      dt:=4000;
      v01:=59.15e3;
      x1:=46e9;
      z:=2e9;
      setcolor(14);
      outtextxy(50,420,'Merkur');
      v02:=35.3e3;
      x2:=107.5e9;
      setcolor(13);
      outtextxy(150,420,'Venus');
      v04:=26.44e3;
      x4:=206.7e9;
      setcolor(12);
      outtextxy(350,420,'Marsbahn');
      v03:=30.4e3;
      x3:=147e9;
      setcolor(6);
      outtextxy(250,420,'Erdbahn');

  vx1:=0;
  vy1:=v01;
  y1:=0;
  vx2:=0;
  vy2:=v02;
  y2:=0;
  vx3:=0;
  vy3:=v03;
  y3:=0;
  vx4:=0;
  vy4:=v04;
  y4:=0;

      t:=-dt;
      thilfe:=-dt;
      rechnung3;
      wahl2:=' ';
        repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
          end;
        rechnung3;
       until (t>=6e7) or (wahl2='b');
       wahl:=' ';
    end;
    't':
    begin
      if dt>=200 then
      begin
      loesch20;
      loesch31;
      dt:=dt-100;
      graphik3;
      s2;
      setz31;
      end;
      wahl:=' ';
    end;
    'T':
    begin
      if dt<=100000 then
      begin
      loesch20;
      loesch31;

      dt:=dt+100;
      graphik3;
      s2;
      setz31;
      end;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure ellipse3;
begin
  cleardevice;
  m0:=1.9891e30;
  F:=6.672e-11*m0;
      v0:=30.4e3;
      r:=147e9;
      a:=149.6e9;
      r0:=7e8;
      h:=r-r0;
  phi:=pi/2;
  dt:=4000;
  z:=1e9;
  zeit:=10;
  f1:=12;
    graphik3;
    auswahl3;
  menue;
end;

procedure rechnung55;
begin
  setcolor(1);
  circle(320+round(x3/z),240-round(y3/z),1);
  if m1<8e22 then
  begin
  circle(320+round(x2/z),240-round(y2/z),round(1.7e6/z));
  circle(320+round(x1/z),240-round(y1/z),round(6.4e6/z));
  end
  else
  begin
  circle(320+round(x2/z),240-round(y2/z),round(3+m1/m0));
  circle(320+round(x1/z),240-round(y1/z),round(3+m0/m1));
  end;
  t:=t+dt;
  entf:=sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2));
  a01:=-F/(entf*entf*entf);
  ax1:=a01*(x1-x2);
  ay1:=a01*(y1-y2);
  vx1:=vx1+ax1*dt;
  vy1:=vy1+ay1*dt;
  x1:=x1+vx1*dt;
  y1:=y1+vy1*dt;
  ax2:=-ax1*(m0/m1);
  ay2:=-ay1*(m0/m1);
  vx2:=vx2+ax2*dt;
  vy2:=vy2+ay2*dt;
  x2:=x2+vx2*dt;
  y2:=y2+vy2*dt;

  x3:=(x1*(m0/m1)+x2)/((m0/m1)+1);
  y3:=(y1*(m0/m1)+y2)/((m0/m1)+1);
  setcolor(10);
  circle(320+round(x3/z),240-round(y3/z),1);
  if m1<8e22 then
  begin
  circle(320+round(x2/z),240-round(y2/z),round(1.7e6/z));
  circle(320+round(x1/z),240-round(y1/z),round(6.4e6/z));
  end
  else
  begin
  circle(320+round(x2/z),240-round(y2/z),round(3+m1/m0));
  circle(320+round(x1/z),240-round(y1/z),round(3+m0/m1));
  end;
end;

procedure rechnung5;
begin
  setcolor(1);
  circle(320+round(x3/z),240-round(y3/z),1);
  t:=t+dt;
  entf:=sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2));
  a01:=-F/(entf*entf*entf);
  ax1:=a01*(x1-x2);
  ay1:=a01*(y1-y2);
  vx1:=vx1+ax1*dt;
  vy1:=vy1+ay1*dt;
  x1:=x1+vx1*dt;
  y1:=y1+vy1*dt;
  ax2:=-ax1*(m0/m1);
  ay2:=-ay1*(m0/m1);
  vx2:=vx2+ax2*dt;
  vy2:=vy2+ay2*dt;
  x2:=x2+vx2*dt;
  y2:=y2+vy2*dt;
      putpixel(320+round(x2/z),240-round(y2/z),13);
      putpixel(320+round(x1/z),240-round(y1/z),14);
  x3:=(x1*(m0/m1)+x2)/((m0/m1)+1);
  y3:=(y1*(m0/m1)+y2)/((m0/m1)+1);
  setcolor(10);
  circle(320+round(x3/z),240-round(y3/z),1);

end;

procedure graphik4;
begin
  setbkcolor(1);
  setcolor(15);
  line(10,30,630,30);
  line(10,440,630,440);
  line(10,30,10,440);
  line(630,30,630,440);
  outtextxy(495,360,'z =');
  str((z/1e8):4:0,ortx1);
  outtextxy(515,360,ortx1+' *10^8');
if m1<8e22 then
begin
  str((m1/1e22):4:2,ortx2);
  outtextxy(495,400,ortx2+' *10^22 kg');
  end
  else
  begin
  str((m1/1e30):4:2,ortx2);
  outtextxy(495,400,ortx2+' *10^30 kg');
  end;
  outtextxy(460,400,'m2 = ');
  outtextxy(460,420,'v2 = ');
  str((-vy2/1000):4:2,ortx3);
  outtextxy(515,420,ortx3+' km/s');
  str((m0/m1):4:2,ortx5);
  outtextxy(345,400,ortx5);
  outtextxy(270,400,'m1/m2 = ');
  outtextxy(270,420,'v1/v2 = ');
  str((vy1/-vy2):4:2,ortx6);
  outtextxy(345,420,ortx6);
  outtextxy(440,380,'entf = ');
  str((entf*1e-9):4:2,ortx10);
  outtextxy(495,380,ortx10+' *10^6 km');
  outtextxy(300,380,'t = ');
  str((t/3600/24):4:2,ortx7);
  outtextxy(345,380,ortx7+' d');
  str(dt:4:0,ortx4);
  outtextxy(580,445,ortx4);
  outtextxy(50,50,'Bahnkurven (0)  K”rper (1)');
  outtextxy(150,15,'Doppelsternsysteme / (Erde - Mond - System )');
  outtextxy(30,455,'Geschwindigkeiten proportional „ndern (v/V)     Geschwindigkeit „ndern (g/G) ');
  outtextxy(5,445,'Massenverh„ltnis „ndern (m/M)  Erde-Mond (e)   Zeit „ndern (t/T)  dt =');
  outtextxy(60,465,'Maástab ver„ndern (z/Z)    wiederherstellen (w)     beenden (b)');
  y1:=0;
  y2:=0;
  y3:=0;
  x3:=0;
  vx1:=0;
  vx2:=0;

      t:=-dt;
      if l=0 then rechnung5
      else
      rechnung55;
end;

procedure setz41;
begin
  setcolor(15);
  str((t/3600/24):4:2,ortx7);
  outtextxy(345,380,ortx7+' d');
  str((sqrt(vy2*vy2+vx2*vx2)/1000):4:2,ortx3);
  outtextxy(515,420,ortx3+' km/s');
  str((entf*1e-9):4:2,ortx10);
  outtextxy(495,380,ortx10+' *10^6 km');
end;

procedure loesch41;
begin
  setcolor(1);
  outtextxy(345,380,ortx7+' d');
  outtextxy(515,420,ortx3+' km/s');
  outtextxy(495,380,ortx10+' *10^6 km');
end;

procedure auswahl4;
begin

  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    's':
    begin
      wahl2:=' ';
  vx1:=0;
  vx2:=0;
      vy1:=vy10;
      vy2:=vy20;
      repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
          end;
      loesch41;
      if l=0 then rechnung5
      else
      rechnung55;
      setz41;
      delay(80);
      until wahl2='b';
    wahl:=' ';
    end;
    '1':
    begin
      l:=1;
      cleardevice;
      graphik4;
      wahl:=' ';
    end;
    '0':
    begin
      l:=0;
      cleardevice;
      graphik4;
      wahl:=' ';
    end;
    'z':
    begin
      if z>2e8 then
      begin
      cleardevice;;
      z:=z-1e8;
  vy1:=vy10;
  vy2:=vy20;
  x1:=-100e9;
  x2:=100e9;
      graphik4;
      end;
      wahl:=' ';
    end;
    'Z':
    begin
      cleardevice;;
      z:=z+1e8;
  vy1:=vy10;
  vy2:=vy20;
  x1:=-100e9;
  x2:=100e9;
      graphik4;
      wahl:=' ';
    end;
    'M':
    begin
    if (m1>9e22+0.1*m10) then
    begin
      loesch20;
      m1:=m1-0.01*m1;
  vy20:=-(m0/m1)*vy1;
  vy2:=vy20;
  x1:=-100e9;
  x2:=100e9;
      graphik4;
      end;
      wahl:=' ';
    end;
    'm':
    begin
      loesch20;
      m1:=m1+0.01*m1;
  vy20:=-(m0/m1)*vy1;
  vy2:=vy20;
  x1:=-100e9;
  x2:=100e9;
      graphik4;;
      wahl:=' ';
    end;
    'e':
    begin
  cleardevice;
  x1:=0;
  x2:=3.844e8;
  y1:=0;
  y2:=0;
  y3:=0;
  x3:=0;

  vx1:=0;
  vx2:=0;
  vy100:=12.3457;
  vy10:=vy100;
  vy1:=vy10;
  m00:=5.973e24;
  m0:=m00;
  m10:=m0/81;
  m1:=m10;
  vy200:=-(m0/m1)*vy1;
  vy20:=vy200;
  vy2:=vy20;
  F:=(6.672e-11)*m1;
  dt:=2000;
  z:=2e6;
    graphik4;
    wahl:=' ';
    end;
    'G':
    begin
      loesch20;
      r:=r+1;
  vy1:=vy10;
  vy20:=vy20+0.02*vy200;
  vy2:=vy20;
  x1:=-100e9;
  x2:=100e9;
      graphik4;;
      wahl:=' ';
    end;
    'g':
    begin
      loesch20;

  vy1:=vy10;
  vy20:=vy20-0.02*vy200;
  vy2:=vy20;
  x1:=-100e9;
  x2:=100e9;
      graphik4;;
      wahl:=' ';
    end;
    'v':
    begin
      loesch20;

  vy10:=vy10-0.02*vy10;
  vy20:=vy20-0.02*vy20;
  vy1:=vy10;
  vy2:=vy20;
  x1:=-100e9;
  x2:=100e9;
      graphik4;;
      wahl:=' ';
    end;
    'V':
    begin
      loesch20;

  vy10:=vy10+0.02*vy10;
  vy20:=vy20+0.02*vy20;
  vy1:=vy10;
  vy2:=vy20;
  x1:=-100e9;
  x2:=100e9;
      graphik4;;
      wahl:=' ';
    end;
    't':
    begin
      if dt>=200 then
      begin
      loesch20;
      loesch31;
      dt:=dt-1000;
  vy1:=vy10;
  vy2:=vy20;
  x1:=-100e9;
  x2:=100e9;
      graphik4;
      end;
      wahl:=' ';
    end;
    'T':
    begin
      if dt<=100000 then
      begin
      loesch20;
      loesch31;

      dt:=dt+1000;
  vy1:=vy10;
  vy2:=vy20;
  x1:=-100e9;
  x2:=100e9;
      graphik4;
      end;
      wahl:=' ';
    end;
    'w':
    begin
     cleardevice;
  m000:=1.9891e30;
  m00:=m000;
  m100:=2*m00;
  m10:=m100;
  m0:=m00;
  m1:=m10;
  x1:=-100e9;
  x2:=100e9;
  y1:=0;
  y2:=0;
  y3:=0;
  x3:=0;
  r:=1;
  vx1:=0;
  vx2:=0;
  vy100:=2.9826e4;
  vy10:=vy100;
  vy200:=-(m0/m1)*vy10;
  vy20:=vy200;
  vy1:=vy10;
  vy2:=vy20;
  F:=6.672e-11*m1;
  dt:=30000;
  z:=1e9;
  l:=0;
     graphik4;
     wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure ellipse4;
begin
  cleardevice;
  m000:=1.9891e30;
  m00:=m000;
  m0:=m00;
  m100:=4*m000;
  m10:=m100;
  m1:=m10;
  x1:=-100e9;
  x2:=100e9;
  y1:=0;
  y2:=0;
  y3:=0;
  x3:=0;
  r:=1;
  vx1:=0;
  vx2:=0;
  vy100:=4.62e4;
  vy10:=vy100;
  vy200:=-(m0/m1)*vy10;
  vy20:=vy200;
  vy1:=vy10;
  vy2:=vy20;
  F:=6.672e-11*m1;
  dt:=30000;
  z:=1e9;
  l:=0;
  zeit:=10;
  f1:=12;
    graphik4;
    auswahl4;
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
    '1':ellipse;
    '2':ellipse2;
    '3':ellipse3;
    '4':ellipse4;
  end;
  until wahl1='b';
end.