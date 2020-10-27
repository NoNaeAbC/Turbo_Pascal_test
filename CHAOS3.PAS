program chaos3;
uses crt,graph;
var
  kr0,krit,laenge,ko,ku,kr,kl,np,nq,m,i,k0,k1,farbe,f1,f,l,n,k,treiber,modus:integer;
  a0,xzoom,yzoom,anf0,xanf0,oben0,unten0,xend0,oben,unten,anf,xend,da,a:real;
  wahl1,wahl:char;
  nxmax,nymax,pxj,pyj,pxm,pym,time,np0,nq0,tab0,tab1,jul,g00,maxi,farbe0,farbe1,farbe2:integer;
  realteil,realteil1:array[1..640] of real;
  imteil:array[1..480] of real;
  sim:array[1..80,1..60] of real;
  hilf:integer;
  anf0j,xanf0j,oben0j,unten0j,xend0j,obenj,untenj,anfj,xendj:real;
  cx,cy,x1,p0,q0,r,p,q,x,dx,start,y,dy,grenze:real;
  zahl1,zahl2,zahl3,ortx1,ortx2,ortx3,ortx4,ortx5,ortx6,ortx7,ortx8,ortx9:string;

procedure menue;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(15);
  setcolor(8);
  outtextxy(70,150,'Die Folge  z -> z˝+c   ->  1');
  outtextxy(70,200,'Die Folge  z -> z˝+c und ihre Darstellung in der Ebene  ->  2');
  outtextxy(70,250,'Zusammenhang zwischen Julia- und Mandelbrot-Mengen -> 3');
  outtextxy(70,300,'Mandelbrot - Menge  ->  4');
  outtextxy(70,350,'Julia - Mengen  ->  5');
  outtextxy(300,420,'beenden  ->  b');
end;

procedure g1;
begin
  setcolor(8);
  line(320+150,240,320-150,240);
  line(320,240-150,320,240+150);
  circle(320,240,100);
  outtextxy(320-120,247,'-1');
  outtextxy(320+110,247,'1');
  outtextxy(300,240+110,'-i');
  outtextxy(310,240-115,'i');
end;


procedure graphik1;
begin
  setcolor(8);
  g1;
  line(10,30,630,30);
  line(10,430,630,430);
  line(10,30,10,430);
  line(630,30,630,430);
  line(48,50,48,150);
  line(47,100,49,100);
  line(47,120,49,120);
  line(47,80,49,80);
  outtextxy(35,100,'0');
  outtextxy(25,120,'-2');
  outtextxy(35,80,'2');
  setcolor(9);
  outtextxy(20,410,'x(0) =');
  setcolor(13);
  outtextxy(20,420,'y(0) =');
 setcolor(8);
  outtextxy(340,410,'cx =');
  outtextxy(340,420,'cy =');
  outtextxy(500,420,'N = ');
  outtextxy(50,15,'Die Folge  z(n+1) = z(n)˝ + c bei Julia - und Mandelbrotmengen');
  outtextxy(10,470,'Iterationsschritte Ñndern (n/N)  Mandelbrot (m/M) Julia (j/J) beenden (b)');
  outtextxy(10,460,'  Tabelle (t/T)  Simulation (s)');
end;


procedure l0;
begin
  setcolor(15);
  outtextxy(535,420,ortx7);
  if maxi<=270 then
  begin
   line(49,100,53+2*maxi,100);
   outtextxy(2*maxi+58,100,'N');
  end;
end;

procedure s0;
begin
  setcolor(8);
  str(maxi:4,ortx7);
  outtextxy(535,420,ortx7);
  if maxi<=270 then
  begin
   line(49,100,53+2*maxi,100);
   outtextxy(2*maxi+58,100,'N');
  end;
end;

procedure s10;
begin
  setcolor(8);
  str(p0:7:2,ortx1);
  outtextxy(365,410,ortx1);
  str(q0:7:2,ortx2);
  outtextxy(365,420,ortx2);
  setcolor(9);
  str(x:8:2,ortx3);
  outtextxy(215,410,ortx3);
  outtextxy(45,410,ortx5);
  setcolor(13);
  str(y:8:2,ortx4);
  outtextxy(215,420,ortx4);
  outtextxy(45,420,ortx6);
end;

procedure l10;
begin
  setcolor(15);
  outtextxy(365,410,ortx1);
  outtextxy(365,420,ortx2);
  outtextxy(215,410,ortx3);
  outtextxy(215,420,ortx4);
  outtextxy(45,410,ortx5);
  outtextxy(45,420,ortx6);
end;

procedure s11;
begin
  setcolor(8);
  str(p0:7:2,ortx1);
  outtextxy(365,410,ortx1);
  str(q0:7:2,ortx2);
  outtextxy(365,420,ortx2);
  setcolor(9);
  outtextxy(45,410,ortx5);
  setcolor(13);
  outtextxy(45,420,ortx6);
end;

procedure l11;
begin
  setcolor(15);
  outtextxy(365,410,ortx1);
  outtextxy(365,420,ortx2);
  outtextxy(45,410,ortx5);
  outtextxy(45,420,ortx6);
end;


procedure julia;
begin
 if jul=0 then
 begin
  p0:=-2+np*dx;
  q0:=-1.5+nq*dy;
  setcolor(f1);
  circle(round(320+100*p0),round(240-100*q0),2);
  x:=0;
  y:=0;
  str(x:8:2,ortx5);
  str(y:8:2,ortx6);
 end;
 if jul=1 then
 begin
  x:=-2+np*dx;
  y:=-1.5+nq*dy;
  str(x:8:2,ortx5);
  str(y:8:2,ortx6);
  setcolor(f1);
  circle(round(320+100*x),round(240-100*y),2);
 end;
  k1:=0;
  if tab0=1 then
  begin
      str(k1:2,zahl1);
      str(x:6:4,zahl2);
      str(y:6:4,zahl3);
    setcolor(farbe1);
      outtextxy(480,120+10*k1,zahl2);
      outtextxy(490,105,'x(n)');
    setcolor(farbe2);
      outtextxy(570,105,'y(n)');
      outtextxy(560,120+10*k1,zahl3);
  end;
  repeat
    k1:=k1+1;
    x1:=x;
    x:=x*x-y*y+p0;
    y:=2*x1*y+q0;
    if (x<2) and (x>-2) and (y<2) and (y>-2) then
    begin
      setcolor(farbe);
      if k1>1 then circle(round(320+100*x),round(240-100*y),2);
    end;
    if (x<8) and (x>-8) and (y<8) and (y>-8) then
    begin
      if k1<270 then
      begin
        setcolor(farbe1);
        circle(round(50+2*k1),round(100-10*x),1);
        setcolor(farbe2);
        circle(round(50+2*k1),round(100-10*y),1);
     end;
    end;
    if (k1<26) and (tab0=1) then
    begin
      str(k1:2,zahl1);
      str(x:6:4,zahl2);
      str(y:6:4,zahl3);
      setcolor(farbe1);
      outtextxy(480,120+10*k1,zahl2);
      setcolor(farbe2);
      outtextxy(560,120+10*k1,zahl3);
    end;
  until (k1>maxi) or (x*x+y*y>100);
      str(k1:2,zahl1);
  if tab0=1 then
  begin
      str(x:6:4,zahl2);
      str(y:6:4,zahl3);
        setcolor(farbe1);
      outtextxy(480,390,zahl2);
        setcolor(farbe2);
      outtextxy(560,390,zahl3);
  end;
  setcolor(farbe1);
  outtextxy(150,410,'x('+zahl1+') =');
  setcolor(farbe2);
  outtextxy(150,420,'y('+zahl1+') =');
end;

procedure juliahin;
begin
  farbe:=12;
  farbe1:=9;
  farbe2:=13;
  f1:=10;
  julia;
  setcolor(8);
  if maxi<=270 then line(49,100,53+2*maxi,100) else
  begin
   line(49,100,595,100);
   outtextxy(601,100,'N');
  end;
  s10;
  g1;
end;

procedure juliaweg;
begin
  f1:=15;
  farbe:=15;
  farbe1:=15;
  farbe2:=15;
  julia;
  if maxi>270 then outtextxy(601,100,'N');
  l10;
end;

procedure g0000;
begin
    graphik1;
    s0;
      jul:=1;
      juliahin;
      setcolor(9);
      outtextxy(20,440,'x(0) vergrî·ern/verkleinern (r/l)');
      setcolor(13);
      outtextxy(20,450,'y(0) vergrî·ern/verkleinern (o/u)');
      setcolor(8);
      outtextxy(400,55,'JULIA');
      outtextxy(350,440,'cx vergrî·ern/verkleinern (X/x)');
      outtextxy(350,450,'cy vergrî·ern/verkleinern (Y/y)');
end;

procedure g01;
begin
  g1;
  setcolor(9);
  outtextxy(20,410,'x(0) =');
  setcolor(13);
  outtextxy(20,420,'y(0) =');
 setcolor(8);
  outtextxy(340,410,'cx =');
  outtextxy(340,420,'cy =');
  outtextxy(50,450,'Delay verÑndern (t/T)        pause (p)   beenden (e)');
  if jul=0 then  outtextxy(250,30,'Mandelbrotmenge');
  if jul=1 then outtextxy(270,30,'Juliamenge');
end;

procedure sim0;
begin
  time:=30;
  str(time:4,ortx1);
  setcolor(8);
  outtextxy(220,450,ortx1);
  dx:=1/20;
  dy:=1/20;
  for nq:=1 to 60 do
  begin
    for np:=1 to 80 do
    begin
    l11;
    g01;
    if jul=0 then
    begin
      p0:=-2+np*dx;
      q0:=-1.5+nq*dy;
      x:=0;
      y:=0;
  str(x:8:2,ortx5);
  str(y:8:2,ortx6);
    end;
    if jul=1 then
    begin
      x:=-2+np*dx;
      y:=-1.5+nq*dy;
  str(x:8:2,ortx5);
  str(y:8:2,ortx6);
    end;
    s11;
    k1:=0;
    wahl1:=' ';
    repeat
      k1:=k1+1;
      x1:=x;
      x:=x*x-y*y+p0;
      y:=2*x1*y+q0;
      if (x<2) and (x>-2) and (y<2) and (y>-2) then
      begin
        setcolor(12);
        if k1>1 then circle(round(320+100*x),round(240-100*y),2);
        delay(time);
      end;
    until (k1>100) or (x*x+y*y>100);
        if keypressed then wahl1:=readkey;
        case wahl1 of
        'p':wahl1:=readkey;
        'e':
        begin
          cleardevice;
          g0000;
          exit;
        end;
        'T':
        begin
         setcolor(15);
         str(time:4,ortx1);
         outtextxy(220,450,ortx1);
         if time<1000 then time:=time*2;
         str(time:4,ortx1);
         setcolor(8);
         outtextxy(220,450,ortx1);
         wahl1:=' ';
       end;
        't':
        begin
         setcolor(15);
         str(time:4,ortx1);
         outtextxy(220,450,ortx1);
         time:=round(time/2);
         str(time:4,ortx1);
         setcolor(8);
         outtextxy(220,450,ortx1);
         wahl1:=' ';
       end;
        end;
       delay(2*time);
    if jul=0 then
    begin
      p0:=-2+np*dx;
      q0:=-1.5+nq*dy;
      x:=0;
      y:=0;
    end;
    if jul=1 then
    begin
      x:=-2+np*dx;
      y:=-1.5+nq*dy;
    end;
    k1:=0;
    repeat
      k1:=k1+1;
      x1:=x;
      x:=x*x-y*y+p0;
      y:=2*x1*y+q0;
      if (x<2) and (x>-2) and (y<2) and (y>-2) then
      begin
        setcolor(15);
        if k1>1 then circle(round(320+100*x),round(240-100*y),2);
      end;
    until (k1>200) or (x*x+y*y>100);
    if k1<=200 then
    begin
      sim[np,nq]:=10;
      setcolor(10);
      circle(round(320+100*(-2+np*dx)),round(240-100*(-1.5+nq*dx)),1);
    end;
    if k1>200 then
    begin
      sim[np,nq]:=8;
      setcolor(8);
      circle(round(320+100*(-2+np*dx)),round(240-100*(-1.5+nq*dx)),1);
    end;
    for nq0:=1 to nq do
    begin
      for np0:=1 to np do
      begin
        setcolor(round(sim[np0,nq0]));
        circle(round(320+100*(-2+np0*dx)),round(240-100*(-1.5+nq0*dx)),1);
      end;
    end;
  end;
 end;
end;


procedure auswahl1;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    't':
    begin
      juliaweg;
      tab0:=0;
      juliahin;
    wahl:=' ';
    end;
    's':
    begin
      cleardevice;
      sim0;
    wahl:=' ';
    end;
    'T':
    begin
      juliaweg;
      tab0:=1;
      juliahin;
    wahl:=' ';
    end;
    'm':
    begin
      juliaweg;
      jul:=0;
      juliahin;
      setcolor(8);
      outtextxy(4,440,'Die Lage des Punktes (cx;cy) nach rechts/links/oben/unten verschieben (r/l/o/u)');
      outtextxy(400,55,'MANDELBROT');
    wahl:=' ';
    end;
    'M':
    begin
      juliaweg;
      jul:=0;
      juliaweg;
      setcolor(15);
      outtextxy(4,440,'Die Lage des Punktes (cx;cy) nach rechts/links/oben/unten verschieben (r/l/o/u)');
      outtextxy(400,55,'MANDELBROT');
    wahl:=' ';
    end;
    'j':
    begin
      juliaweg;
      jul:=1;
      juliahin;
      setcolor(9);
      outtextxy(20,440,'x(0) vergrî·ern/verkleinern (r/l)');
      setcolor(13);
      outtextxy(20,450,'y(0) vergrî·ern/verkleinern (o/u)');
      setcolor(8);
      outtextxy(400,55,'JULIA');
      outtextxy(350,440,'cx vergrî·ern/verkleinern (X/x)');
      outtextxy(350,450,'cy vergrî·ern/verkleinern (Y/y)');
    wahl:=' ';
    end;
    'J':
    begin
      juliaweg;
      jul:=1;
      juliaweg;
      outtextxy(20,440,'x(0) vergrî·ern/verkleinern (r/l)');
      outtextxy(20,450,'y(0) vergrî·ern/verkleinern (o/u)');
      outtextxy(400,55,'JULIA');
      outtextxy(350,440,'cx vergrî·ern/verkleinern (X/x)');
      outtextxy(350,450,'cy vergrî·ern/verkleinern (Y/y)');
    wahl:=' ';
    end;
    'x':
    begin
      juliaweg;
      p0:=p0-da;
      juliahin;
    wahl:=' ';
    end;
    'X':
    begin
      juliaweg;
      p0:=p0+da;
      juliahin;
    wahl:=' ';
    end;
    'y':
    begin
      juliaweg;
      q0:=q0-da;
      juliahin;
    wahl:=' ';
    end;
    'Y':
    begin
      juliaweg;
      q0:=q0+da;
      juliahin;
    wahl:=' ';
    end;
    'u':
    begin
      juliaweg;
      nq:=nq-1;
      juliahin;
    wahl:=' ';
    end;
    'n':
    begin
    if maxi>2 then
    begin
      juliaweg;
      l0;
      maxi:=maxi-1;
      s0;
      juliahin;
    end;
    wahl:=' ';
    end;
    'N':
    begin
      juliaweg;
      l0;
      maxi:=maxi+1;
      s0;
      juliahin;
    wahl:=' ';
    end;
    'u':
    begin
      juliaweg;
      nq:=nq-1;
      juliahin;
    wahl:=' ';
    end;
    'o':
    begin
      juliaweg;
      nq:=nq+1;
      juliahin;
    wahl:=' ';
    end;
    'l':
    begin
      juliaweg;
      np:=np-1;
      juliahin;
    wahl:=' ';
    end;
    'r':
    begin
      juliaweg;
      np:=np+1;
      juliahin;
    wahl:=' ';
    end;
  end;
  until wahl='b';
end;



procedure p1;
begin
  cleardevice;
   kr0:=0;
  maxi:=30;
    tab0:=0;
    da:=0.01;
    l:=0;
    x:=-2;
    y:=-1.5;
  dx:=0.01;
  dy:=0.01;
  np:=200;
  nq:=140;
    g0000;
    auswahl1;
  menue;
end;

procedure graphik0;
begin
  setbkcolor(15);
  setcolor(8);
  outtextxy(340,410,'cx =');
  outtextxy(340,420,'cy =');
  line(10,30,630,30);
  line(10,430,630,430);
  line(10,30,10,430);
  line(630,30,630,430);
  setcolor(8);
  outtextxy(200,20,'Die Folge  z(n+1) = z(n)˝ + c');
   outtextxy(60,50,'x(n+1) =        -       + cx');
   outtextxy(60,60,'y(n+1) = 2 *      *      + cy');
  setcolor(9);
  outtextxy(60,50,'x(n+1) =  x(n)˝');
  outtextxy(60,60,'             x(n)');
  outtextxy(30,80,'                     x(0) ');
  outtextxy(20,410,'x(0) =');
  setcolor(13);
  outtextxy(60,50,'                  y(n)˝ ');
  outtextxy(60,60,'y(n+1) =            y(n)');
  outtextxy(30,80,'                              y(0) ');
  outtextxy(20,420,'y(0) =');
  setcolor(8);
  line(50,240,350,240);
  line(50,100,50,380);
  for k:=-7 to -1 do
  begin
    str(k:1,ortx1);
    outtextxy(30,235-20*k,ortx1);
    line(48,240-20*k,50,240-20*k);
  end;
  for k:=0 to 7 do
  begin
    str(k:1,ortx1);
    outtextxy(36,235-20*k,ortx1);
    line(48,240-20*k,50,240-20*k);
  end;
  outtextxy(20,465,'Julia (j/J)  Mandelbrot (m/M)  Tabelle einfÅgen/entfernen (t/T)  beenden (b)');
end;


procedure julia0;
begin
 if jul=0 then
 begin
  p0:=-2+np*dx;
  q0:=-1.5+nq*dy;
  x:=0;
  y:=0;
  str(x:8:2,ortx5);
  str(y:8:2,ortx6);
 end;
 if jul=1 then
 begin
  x:=-2+np*dx;
  y:=-1.5+nq*dy;
  str(x:8:2,ortx5);
  str(y:8:2,ortx6);
 end;
  k1:=0;
  if tab0=1 then
  begin
      str(k1:2,zahl1);
      str(x:6:4,zahl2);
      str(y:6:4,zahl3);
    setcolor(farbe0);
      outtextxy(440,120+10*k1,zahl1);
      outtextxy(445,105,'n');
    setcolor(farbe1);
      outtextxy(480,120+10*k1,zahl2);
      outtextxy(490,105,'x(n)');
    setcolor(farbe2);
      outtextxy(570,105,'y(n)');
      outtextxy(560,120+10*k1,zahl3);
  end;
  repeat
    k1:=k1+1;
    x1:=x;
    x:=x*x-y*y+p0;
    y:=2*x1*y+q0;
    if (x<8) and (x>-8) and (y<8) and (y>-8) then
    begin
        setcolor(farbe1);
        circle(round(50+2*k1),round(240-20*x),1);
        setcolor(farbe2);
        circle(round(50+2*k1),round(240-20*y),1);
    end;
    if (k1<26) and (tab0=1) then
    begin
      str(k1:2,zahl1);
      str(x:6:4,zahl2);
      str(y:6:4,zahl3);
        setcolor(farbe0);
      outtextxy(440,120+10*k1,zahl1);
        setcolor(farbe1);
      outtextxy(480,120+10*k1,zahl2);
        setcolor(farbe2);
      outtextxy(560,120+10*k1,zahl3);
    end;
  until (k1>250) or (x*x+y*y>2000);
      str(k1:2,zahl1);
  if tab0=1 then
  begin
      str(x:6:4,zahl2);
      str(y:6:4,zahl3);
        setcolor(farbe0);
      outtextxy(440,390,zahl1);
        setcolor(farbe1);
      outtextxy(480,390,zahl2);
        setcolor(farbe2);
      outtextxy(560,390,zahl3);
  end;
  setcolor(farbe1);
  outtextxy(150,410,'x('+zahl1+') =');
  setcolor(farbe2);
  outtextxy(150,420,'y('+zahl1+') =');
end;

procedure juliahin0;
begin
  farbe0:=8;
  farbe:=12;
  farbe1:=9;
  farbe2:=13;
  f1:=10;
  if tab0=0 then
  begin
    setcolor(8);
    line(49,240,555,240);
    outtextxy(562,237,'n');
    for k:=1 to 10 do
    begin
      str(25*k:3,ortx1);
      outtextxy(35+50*k,245,ortx1);
      line(50+50*k,240,50+50*k,242)
    end;
   end;
   if tab0=1 then
   begin
     setcolor(8);
     line(49,240,355,240);
     outtextxy(362,237,'n');
     for k:=1 to 6 do
     begin
       str(25*k:3,ortx1);
       outtextxy(35+50*k,245,ortx1);
       line(50+50*k,240,50+50*k,242)
     end;
   end;
  julia0;
  s10;
end;

procedure juliaweg0;
begin
  f1:=15;
  farbe0:=15;
  farbe:=15;
  farbe1:=15;
  farbe2:=15;
  julia0;
  l10;
  if tab0=0 then
  begin
   line(49,240,555,240);
   outtextxy(562,237,'n');
   for k:=1 to 10 do
   begin
    str(25*k:3,ortx1);
    outtextxy(35+50*k,245,ortx1);
    line(50+50*k,240,50+50*k,242)
   end;
   end;
   if tab0=1 then
   begin
    line(49,240,355,240);
    outtextxy(362,237,'n');
    for k:=1 to 6 do
    begin
     str(25*k:3,ortx1);
     outtextxy(35+50*k,245,ortx1);
     line(50+50*k,240,50+50*k,242)
    end;
   end;
end;

procedure auswahl0;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    't':
    begin
      juliaweg0;
      tab0:=0;
      juliahin0;
    wahl:=' ';
    end;
    'T':
    begin
      juliaweg0;
      tab0:=1;
      juliahin0;
    wahl:=' ';
    end;
    'm':
    begin
      jul:=0;
      juliahin0;
  setcolor(farbe0);
  outtextxy(30,80,'wobei die Startwerte      und      gleich 0 gesetzt werden und cx und cy');
  outtextxy(90,90,' die Koordinaten des Punktes in der Ebene bezeichnen');
  outtextxy(4,440,'Die Lage des Punktes (cx;cy) nach rechts/links/oben/unten verschieben (r/l/o/u)');
  outtextxy(400,55,'MANDELBROT');
    wahl:=' ';
    end;
    'M':
    begin
      jul:=0;
      juliaweg0;
  setcolor(15);
  outtextxy(30,80,'wobei die Startwerte      und      gleich 0 gesetzt werden und cx und cy');
  outtextxy(90,90,' die Koordinaten des Punktes in der Ebene bezeichnen');
  outtextxy(4,440,'Die Lage des Punktes (cx;cy) nach rechts/links/oben/unten verschieben (r/l/o/u)');
  outtextxy(400,55,'MANDELBROT');
    wahl:=' ';
    end;
    'j':
    begin
      jul:=1;
      juliahin0;
  setcolor(farbe1);
  outtextxy(20,440,'x(0) vergrî·ern/verkleinern (r/l)');
  setcolor(farbe2);
  outtextxy(20,450,'y(0) vergrî·ern/verkleinern (o/u)');
  setcolor(farbe0);
  outtextxy(400,55,'JULIA');
   outtextxy(30,80,'wobei die Startwerte      und      die Lage des Punktes in der Ebene ');
   outtextxy(90,90,'bezeichnen und  cx und cy  fest vorgegebene Werte sind');
  outtextxy(350,440,'cx vergrî·ern/verkleinern (X/x)');
  outtextxy(350,450,'cy vergrî·ern/verkleinern (Y/y)');
    wahl:=' ';
    end;
    'J':
    begin
      jul:=1;
      juliaweg0;
  outtextxy(20,440,'x(0) vergrî·ern/verkleinern (r/l)');
  outtextxy(20,450,'y(0) vergrî·ern/verkleinern (o/u)');
  outtextxy(400,55,'JULIA');
   outtextxy(30,80,'wobei die Startwerte      und      die Lage des Punktes in der Ebene ');
   outtextxy(90,90,'bezeichnen und  cx und cy  fest vorgegebene Werte sind');
  outtextxy(350,440,'cx vergrî·ern/verkleinern (X/x)');
  outtextxy(350,450,'cy vergrî·ern/verkleinern (Y/y)');
    wahl:=' ';
    end;
    'x':
    begin
      juliaweg0;
      p0:=p0-da;
      juliahin0;
    wahl:=' ';
    end;
    'X':
    begin
      juliaweg0;
      p0:=p0+da;
      juliahin0;
    wahl:=' ';
    end;
    'y':
    begin
      juliaweg0;
      q0:=q0-da;
      juliahin0;
    wahl:=' ';
    end;
    'Y':
    begin
      juliaweg0;
      q0:=q0+da;
      juliahin0;
    wahl:=' ';
    end;
    'u':
    begin
      juliaweg0;
      nq:=nq-1;
      juliahin0;
    wahl:=' ';
    end;
    'o':
    begin
      juliaweg0;
      nq:=nq+1;
      juliahin0;
    wahl:=' ';
    end;
    'l':
    begin
      juliaweg0;
      np:=np-1;
      juliahin0;
    wahl:=' ';
    end;
    'r':
    begin
      juliaweg0;
      np:=np+1;
      juliahin0;
    wahl:=' ';
    end;
  end;
  until wahl='b';
end;



procedure p00;
begin
  cleardevice;
   kr0:=0;
  jul:=1;
  tab0:=1;
    da:=0.01;
    l:=0;
    x:=-2;
    y:=-1.5;
  dx:=0.01;
  dy:=0.01;
  np:=200;
  nq:=140;
    graphik0;
    juliahin0;
  setcolor(farbe1);
  outtextxy(20,440,'x(0) vergrî·ern/verkleinern (r/l)');
  setcolor(farbe2);
  outtextxy(20,450,'y(0) vergrî·ern/verkleinern (o/u)');
  setcolor(farbe0);
  outtextxy(400,55,'JULIA');
   outtextxy(30,80,'wobei die Startwerte      und      die Lage des Punktes in der Ebene ');
   outtextxy(90,90,'bezeichnen und  cx und cy  fest vorgegebene Werte sind');
  outtextxy(350,440,'cx vergrî·ern/verkleinern (X/x)');
  outtextxy(350,450,'cy vergrî·ern/verkleinern (Y/y)');
    auswahl0;
  menue;
end;

procedure graphik2;
begin
  setcolor(f1);
  str(anf:8:6,ortx1);
  outtextxy(5,10,ortx1);
  outtextxy(5,460,ortx1);
  str(xend:8:6,ortx2);
  outtextxy(545,10,ortx2);
  outtextxy(545,460,ortx2);
  str(oben:8:6,ortx4);
  outtextxy(5,20,ortx4+' i');
  outtextxy(545,20,ortx4+' i');
  str(unten:8:6,ortx8);
  outtextxy(5,470,ortx8+' i');
  outtextxy(545,470,ortx8+' i');
  str(grenze:4:0,ortx5);
  outtextxy(575,420,ortx5);
  outtextxy(400,420,'Genauigkeitsgrenze =');
  str(k0:4,ortx3);
  outtextxy(275,420,ortx3);
  outtextxy(100,420,'Iterationsschritte =');
  outtextxy(80,450,'Darstellungsart (0 bis 9)  Beispiele (a/A/c/C/d/D/f/F)');
  outtextxy(80,440,' Zoomrahmen setzen/zoomen/verÑndern (l/r/o/u/V/v//z)');
  outtextxy(152,470,'wiederherstellen (w)    starten/beenden (s/b)');
  outtextxy(80,460,'Iterationsschritte  und  Genauigkeitsgrenze eingeben (e)');
end;

procedure graphik3;
begin
  setcolor(f1);
  str(anfj:8:6,ortx1);
  outtextxy(5,10,ortx1);
  outtextxy(5,460,ortx1);
  str(xendj:8:6,ortx2);
  outtextxy(545,10,ortx2);
  outtextxy(545,460,ortx2);
  str(obenj:8:6,ortx4);
  outtextxy(5,20,ortx4+' i');
  outtextxy(545,20,ortx4+' i');
  str(untenj:8:6,ortx8);
  outtextxy(5,470,ortx8+' i');
  outtextxy(545,470,ortx8+' i');
  str(grenze:4:0,ortx5);
  outtextxy(575,420,ortx5);
  outtextxy(400,420,'Genauigkeitsgrenze =');
  str(k0:4,ortx3);
  outtextxy(275,420,ortx3);
  outtextxy(100,420,'Iterationsschritte =');
  str(cx:8:6,ortx6);
  outtextxy(230,40,ortx6);
  outtextxy(200,40,'cx =');
  str(cy:8:6,ortx7);
  outtextxy(230,50,ortx7);
  outtextxy(200,50,'cy =');
  outtextxy(155,20,'cx und cy Ñndern (p/P/q/Q)   eingeben (G)');
  outtextxy(80,450,'Darstellungsart (0 bis 9)  Beispiele (a/A/c/C/d/D/f/F/h)');
  outtextxy(80,440,' Zoomrahmen setzen/zoomen/verÑndern (l/r/o/u/V/v//z)');
  outtextxy(152,470,'wiederherstellen (w)    starten/beenden (s/b)');
  outtextxy(80,460,'Iterationsschritte  und  Genauigkeitsgrenze eingeben (e)');
end;


procedure farbwahl;
begin
   if l=1 then
    begin
     f1:=12;
     if k1>=k0 then farbe:=0;
     if r>grenze then farbe:=15;
    end;
   if l=0 then
    begin
     f1:=12;
     if k1>=k0 then farbe:=15;
     if r>grenze then farbe:=0;
    end;
   if l=2 then
    begin
     f1:=12;
     if k1>=k0 then farbe:=0;
     if r>grenze then farbe:=8*(k1 mod 2)+7;
    end;
   if l=3 then
    begin
     f1:=12;
     if k1>=k0 then farbe:=0;
     if r>grenze then
     begin
       krit:=(k1 mod 3);
       if krit=0 then farbe:=15;
       if krit=1 then farbe:=7;
       if krit=2 then farbe:=8;
     end;
    end;
   if l=5 then
    begin
     f1:=12;
     if k1>=k0 then farbe:=0;
     if r>grenze then
     begin
       krit:=(k1 mod 4);
       if krit=0 then farbe:=2;
       if krit=1 then farbe:=10;
       if krit=2 then farbe:=9;
       if krit=3 then farbe:=1;
     end;
    end;
   if l=6 then
    begin
     f1:=12;
     if k1>=k0 then farbe:=0;
     if r>grenze then
     begin
       krit:=(k1 mod 8);
       if krit=0 then farbe:=2;
       if krit=1 then farbe:=10;
       if krit=2 then farbe:=9;
       if krit=3 then farbe:=1;
       if krit=4 then farbe:=2;
       if krit=5 then farbe:=9;
       if krit=6 then farbe:=11;
       if krit=7 then farbe:=1;
     end;
    end;
   if l=7 then
    begin
     f1:=15;
     if k1>=k0 then farbe:=0;
     if r>grenze then
     begin
       krit:=(k1 mod 8);
       if krit=0 then farbe:=12;
       if krit=1 then farbe:=4;
       if krit=2 then farbe:=5;
       if krit=3 then farbe:=13;
       if krit=4 then farbe:=12;
       if krit=5 then farbe:=4;
       if krit=6 then farbe:=14;
       if krit=7 then farbe:=4;
     end;
    end;
   if l=8 then
    begin
     f1:=7;
     if k1>=k0 then farbe:=0;
     if r>grenze then
      begin
       krit:=(k1 mod 11);
       if krit<5 then farbe:=krit+1;
       if krit>=5 then farbe:=krit+4;
     end;
    end;
   if l=4 then
    begin
     f1:=12;
     if k1>=k0 then farbe:=0;
     if r>grenze then
     begin
       krit:=(k1 mod 3);
       if krit=0 then farbe:=2;
       if krit=1 then farbe:=3;
       if krit=2 then farbe:=10;
     end;
    end;
   if l=9 then
    begin
     f1:=12;
     if k1>=k0 then farbe:=0;
     if r>grenze then
     begin
       if k1<g00 then farbe:=15;
       if k1>=g00 then
       begin
         krit:=(k1 mod 2);
         if krit=0 then farbe:=15;
         if krit=1 then farbe:=7;
       end;
     end;
    end;
   if l=10 then
    begin
     if k1>=k0 then farbe:=0;
     if r>grenze then
     begin
       if k1<100 then farbe:=15;

       if (k1>=100) and (k1<110) then farbe:=7;
       if (k1>=110) and (k1<120) then farbe:=15;
       if (k1>=120) and (k1<130) then farbe:=7;
       if (k1>=130) and (k1<140) then farbe:=15;
       if (k1>=124) and (k1<150) then farbe:=7;
       if (k1>=150) and (k1<160) then farbe:=15;
       if (k1>=160) and (k1<170) then farbe:=7;

       if k1>=170 then
       begin
         krit:=(k1 mod 2);
         if krit=0 then farbe:=15;
         if krit=1 then farbe:=7;
       end;
     end;
    end;
end;

procedure farbwunsch;
begin
  outtextxy(150,50,'WÑhle die Farbgestaltung aus:');
  outtextxy(100,100,'wei· auf schwarzem Hintergrund -> 0');
  outtextxy(100,120,'schwarz mit wei·em Hintergrund -> 1');
  outtextxy(100,140,'Hintergrund wei· / hellgrau -> 2');
  outtextxy(100,160,'Hintergrund wei· / hellgrau / dunkelgrau -> 3');
  outtextxy(100,180,'Hintergrund hellgrÅn / tÅrkis / dunkelgrÅn -> 4');
  outtextxy(100,200,'Hintergrund grÅn / hellgrÅn / hellblau / blau -> 5');
  outtextxy(100,220,'Hintergrund in mehreren grÅn - blau - Abstufungen -> 6');
  outtextxy(100,240,'Hintergrund in rot - gelb - Magenta - Abstufungen -> 7');
  outtextxy(100,260,'Hintergrund in 11 Farben -> 8');
  outtextxy(100,280,'Hintergrund bis Schritt g0 in wei·, dann grau/wei· ->9');

  outtextxy(100,310,'Farbwahl eingeben:');
  read(l);
  str(l:2,ortx5);
  outtextxy(275,310,ortx5);
  str(k0:4,ortx3);
  outtextxy(275,340,ortx3);
  str(grenze:4:0,ortx5);
  outtextxy(575,340,ortx5);
  outtextxy(400,340,'Genauigkeitsgrenze =');
  outtextxy(100,340,'Iterationsschritte =');
  outtextxy(100,360,'Neue Iterationszahl eingeben:');
  read(k0);
  setcolor(15);
  outtextxy(275,340,ortx3);
  setcolor(8);
  str(k0:4,ortx3);
  outtextxy(275,340,ortx3);
  outtextxy(100,380,'Neue Genauigkeitsgrenze eingeben:');
  read(grenze);
  setcolor(15);
  outtextxy(575,340,ortx5);
  setcolor(8);
  str(grenze:4:0,ortx5);
  outtextxy(575,340,ortx5);
  if l=9 then
  begin
    outtextxy(100,410,'Grenze g0 fÅr die Farbe wei· eingeben:');
    read(g00);
  end;
end;

procedure rechnung2;
begin
setbkcolor(0);
 dx:=(xend-anf)/(nxmax-1);
 dy:=(oben-unten)/(nymax-1);
 p0:=anf;
 q0:=oben;
   wahl1:=' ';
 for nq:=0 to (nymax-1) do
 begin
   for np:=0 to (nxmax-1) do
   begin
     p0:=anf+np*dx;
     q0:=oben-nq*dy;
     k1:=0;
     x:=0;
     y:=0;
     repeat
      k1:=k1+1;
      x1:=x;
      x:=x*x-y*y+p0;
      y:=2*x1*y+q0;
      r:=x*x+y*y;
     until (r>grenze) or (k1>=k0) ;
     farbwahl;
     putpixel(pxm+np,pym+nq,farbe);
   end;
   if keypressed then wahl1:=readkey;
   case wahl1 of
   'p':wahl1:=readkey;
   'e':
     begin
        graphik2;
        exit;
     end;
   end;
 end;
end;

procedure rechnung3;
begin
setbkcolor(0);
 dx:=(xendj-anfj)/(nxmax-1);
 dy:=(obenj-untenj)/(nymax-1);
   wahl1:=' ';
 for nq:=0 to (nymax-1) do
 begin
   for np:=0 to (nxmax-1) do
   begin
     x:=anfj+np*dx;
     y:=obenj-nq*dy;
     k1:=0;
     repeat
      k1:=k1+1;
      x1:=x;
      x:=x*x-y*y+cx;
      y:=2*x1*y+cy;
      r:=x*x+y*y;
     until (r>grenze) or (k1>=k0);
     farbwahl;
     putpixel(pxj+np,pyj+nq,farbe);
   end;
   if keypressed then wahl1:=readkey;
   case wahl1 of
   'p':wahl1:=readkey;
   'e':
     begin
        graphik3;
        exit;
     end;
   end;
 end;
end;


procedure chin;
begin
  setcolor(8);
  str(cx:6:5,ortx1);
  outtextxy(100,420,ortx1);
  str(cy:6:5,ortx2);
  outtextxy(100,430,ortx2);
  str(anf:5:4,ortx3);
  outtextxy(380,335,ortx3);
  str(xend:5:4,ortx4);
  outtextxy(570,335,ortx4);
  str(unten:5:4,ortx5);
  outtextxy(570,325,ortx5);
  str(oben:5:4,ortx6);
  outtextxy(570,10,ortx6);
  outtextxy(330,335,'xl =');
  outtextxy(520,335,'xr =');
  outtextxy(520,325,'yu =');
  outtextxy(520,10,'yo =');
end;

procedure cweg;
begin
  setcolor(15);
  outtextxy(100,420,ortx1);
  outtextxy(100,430,ortx2);
  outtextxy(380,335,ortx3);
  outtextxy(570,335,ortx4);
  outtextxy(570,325,ortx5);
  outtextxy(570,10,ortx6);
end;


procedure markehin;
begin
  setcolor(f1);
  circle(kl,ko,2);
      cx:=anf0;
      cy:=oben0;
  chin;
end;

procedure markeweg;
begin
  setcolor(7);
  circle(kl,ko,1);
  cweg;
 dx:=(xend-anf)/(nxmax-1);
end;


procedure rechteck;
begin
  setlinestyle(1,0,1);
 if (hilf=0) or (hilf=1) then
 begin
  line(kl,ko,kl+round(4/3*laenge),ko);
  line(kl,ko,kl,ko+laenge);
  line(kl+round(4/3*laenge),ko,kl+round(4/3*laenge),ko+laenge);
  line(kl+round(4/3*laenge),ko+laenge,kl,ko+laenge);
 end;
 if hilf=2 then
 begin
  line(kl-laenge,ko+laenge,kl+laenge,ko+laenge);
  line(kl-laenge,ko+laenge,kl-laenge,ko-laenge);
  line(kl+laenge,ko+laenge,kl+laenge,ko-laenge);
  line(kl-laenge,ko-laenge,kl+laenge,ko-laenge);
 end;
  setlinestyle(0,0,1);
end;

procedure rechteckhin;
begin
  setcolor(8);
  rechteck;
end;

procedure rechteckweg;
begin
  setcolor(7);
  rechteck;
end;


procedure s00;
begin
    anf0j:=anfj;
    xend0j:=xendj;
    unten0j:=untenj;
    oben0j:=obenj;
    anf0:=anf;
    xend0:=xend;
    unten0:=unten;
    oben0:=oben;
end;


procedure graphik4;
begin
  setfillstyle(1,15);
  bar(0,320,640,480);
  bar(0,0,640,20);
  bar(0,20,10,320);
  bar(310,20,330,320);
  bar(630,20,640,320);
  setcolor(8);
  outtextxy(120,360,'Juliamenge                           Mandelbrotmenge');
  chin;
  str(k0:5,ortx7);
  outtextxy(560,420,ortx7);
  str(grenze:5:0,ortx8);
  outtextxy(560,430,ortx8);
  outtextxy(30,420,'cx =                                                 Iterationen:');
  outtextxy(30,430,'cy =                                                      Grenze:');
  outtextxy(2,435,'                       Mandelbrotmenge neu zeichnen (m)');
  outtextxy(2,445,'Marke verschieben (r/l/o/u)  Juliamenge zeigen (j)  Mandel in Originalgrî·e (w)');
  outtextxy(15,455,'Zoomrahmen setzen/zoomen (S/z)  Grî·e Ñndern (v/V)   Farbwahl (0 bis 9)');
  outtextxy(5,465,'Genauigkeit Ñndern (e)  beide Mengen zeichnen (s)  abbrechen (ee) beenden (b)');
end;


procedure auswahl2;
begin
 if kr0=0 then
   begin
    farbwunsch;
 end;
 cleardevice;
  wahl:=' ';
  wahl1:=' ';
  if hilf=1 then rechnung2;
  if hilf=0 then rechnung3;
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    's':
    begin
       if hilf=1 then rechnung2;
       if hilf=0 then rechnung3;
    wahl:=' ';
    end;
    '0':
    begin
      cleardevice;
      l:=0;
      f1:=12;
       if hilf=1 then rechnung2;
       if hilf=0 then rechnung3;
    wahl:=' ';
    end;
    '1':
    begin
      cleardevice;
      l:=1;
      f1:=12;
       if hilf=1 then rechnung2;
       if hilf=0 then rechnung3;
    wahl:=' ';
    end;
    '2':
    begin
      cleardevice;
      l:=2;
      f1:=12;
       if hilf=1 then rechnung2;
       if hilf=0 then rechnung3;
    wahl:=' ';
    end;
    '3':
    begin
      cleardevice;
      l:=3;
      f1:=12;
       if hilf=1 then rechnung2;
       if hilf=0 then rechnung3;
    wahl:=' ';
    end;
    '4':
    begin
      cleardevice;
      l:=4;
      f1:=12;
       if hilf=1 then rechnung2;
       if hilf=0 then rechnung3;
    wahl:=' ';
    end;
    '5':
    begin
      cleardevice;
      l:=5;
      f1:=12;
       if hilf=1 then rechnung2;
       if hilf=0 then rechnung3;
    wahl:=' ';
    end;
    '6':
    begin
      cleardevice;
      l:=6;
      f1:=12;
       if hilf=1 then rechnung2;
       if hilf=0 then rechnung3;
    wahl:=' ';
    end;
    '7':
    begin
      cleardevice;
      l:=7;
      f1:=12;
       if hilf=1 then rechnung2;
       if hilf=0 then rechnung3;
    wahl:=' ';
    end;
    '8':
    begin
      cleardevice;
      l:=8;
      f1:=15;
       if hilf=1 then rechnung2;
       if hilf=0 then rechnung3;
    wahl:=' ';
    end;
    '9':
    begin
      cleardevice;
      l:=9;
      f1:=15;
    outtextxy(100,410,'Grenze g0 fÅr die Farbe wei· eingeben:');
    read(g00);
       if hilf=1 then rechnung2;
       if hilf=0 then rechnung3;
    wahl:=' ';
    end;
    'e':
    begin
     begin
      setcolor(f1);
      outtextxy(20,390,'Iterationsschritte eingeben');
      read(k0);
      outtextxy(20,400,'Grenze eingeben');
      read(grenze);
      end;
      wahl:=' ';
    end;
   'v':
    begin
      if laenge>=11 then
      begin
        rechteckweg;
        laenge:=laenge-1;
        rechteckhin;
      end;
      wahl:=' ';
    end;
   'V':
    begin
        rechteckweg;
        laenge:=laenge+1;
        rechteckhin;
      wahl:=' ';
    end;
   'S':
    begin
      rechteckhin;
      wahl:=' ';
    end;

   'o':
    begin
        rechteckweg;
        ko:=ko-5;
        oben0:=oben0+5*dx;
        oben0j:=oben0j+5*dx;
        rechteckhin;
      wahl:=' ';
    end;
   'u':
    begin
        rechteckweg;
        ko:=ko+5;
        oben0:=oben0-5*dx;
        oben0j:=oben0j-5*dx;
        rechteckhin;
      wahl:=' ';
    end;
   'r':
    begin
        rechteckweg;
        kl:=kl+5;
        anf0:=anf0+5*dx;
        anf0j:=anf0j+5*dx;
        rechteckhin;
      wahl:=' ';
    end;
   'l':
    begin
        rechteckweg;
        kl:=kl-5;
        anf0:=anf0-5*dx;
        anf0j:=anf0j-5*dx;
        rechteckhin;
      wahl:=' ';
    end;
    'z':
    begin
      untenj:=oben0j-laenge*dx;
      obenj:=oben0j;
      anfj:=anf0j;
      xendj:=anfj+4/3*laenge*dx;
      unten:=oben0-laenge*dx;
      oben:=oben0;
      anf:=anf0;
      xend:=anf+4/3*laenge*dx;
      kl:=1;
      ko:=1;
       if hilf=1 then rechnung2;
       if hilf=0 then rechnung3;
      wahl:=' ';
    end;
    'g':
    begin
      if hilf=1 then graphik2;
      if hilf=0 then graphik3;
      wahl:=' ';
    end;
   'p':
    begin
        cleardevice;
        cx:=cx-da;
        graphik3;
      wahl:=' ';
    end;
   'P':
    begin
        cleardevice;
        cx:=cx+da;
        graphik3;
      wahl:=' ';
    end;
   'q':
    begin
        cleardevice;
        cy:=cy-da;
        graphik3;
      wahl:=' ';
    end;
   'Q':
    begin
        cleardevice;
        cy:=cy+da;
        graphik3;
      wahl:=' ';
    end;
    'a':
    begin
     if hilf=1 then
     begin
      f1:=12;
      grenze:=2000;
      k0:=150;
      g00:=100;
      l:=9;
      anf:=-1.254024;
      xend:=-1.252861;
      unten:=0.046252;
      oben:=0.047125;
      s00;
      rechnung2;
    end;
     if hilf=0 then
     begin
      cx:=-1.25;
      cy:=0;
      da:=0.01;
      rechnung3;
     end;
    wahl:=' ';
    end;
    'A':
    begin
     if hilf=1 then
     begin
      f1:=12;
      grenze:=4000;
      k0:=600;
      g00:=100;
      l:=9;
      anf:=-0.75204;
      xend:=-0.7398;
      unten:=0.10511;
      oben:=0.11536;
      s00;
      rechnung2;
    end;
     if hilf=0 then
     begin
      cx:=-0.194;
      cy:=0.6557;
      da:=0.0001;
      rechnung3;
     end;
    wahl:=' ';
    end;
    'c':
    begin
     if hilf=1 then
     begin
      f1:=12;
      grenze:=4000;
      k0:=600;
      l:=2;
      anf:=-0.74758;
      xend:=-0.74624;
      unten:=0.10671;
      oben:=0.10779;
      s00;
      rechnung2;
     end;
     if hilf=0 then
     begin
      cx:=-0.11;
      cy:=0.6557;
      da:=0.0001;
      rechnung3;
     end;
   wahl:=' ';
    end;
    'C':
    begin
     if hilf=1 then
     begin
      f1:=12;
      grenze:=2000;
      k0:=150;
      g00:=57;
      l:=9;
      anf:=-0.74625;
      xend:=-0.74426;
      unten:=0.11196;
      oben:=0.11339;
      s00;
      rechnung2;
     end;
     if hilf=0 then
     begin
      cx:=-0.12;
      cy:=0.74;
      da:=0.01;
      rechnung3;
     end;
    wahl:=' ';
    end;
    'd':
    begin
     if hilf=1 then
     begin
      f1:=12;
      grenze:=2000;
      k0:=200;
      g00:=140;
      l:=9;
      anf:=-0.745538;
      xend:=-0.745054;
      unten:=0.112881;
      oben:=0.113236;
      s00;
      rechnung2;
     end;
     if hilf=0 then
     begin
      cx:=0.27334;
      cy:=0.00742;
      da:=0.00001;
      k0:=1000;
      grenze:=100;
      rechnung3;
     end;
    wahl:=' ';
    end;
    'D':
    begin
     if hilf=1 then
     begin
      f1:=12;
      grenze:=2000;
      k0:=200;
      g00:=140;
      l:=9;
      anf:=-0.745468;
      xend:=-0.745385;
      unten:=0.112979;
      oben:=0.113039;
      s00;
      rechnung2;
     end;
     if hilf=0 then
     begin
      cx:=0.11031;
      cy:=-0.67037;
      da:=0.00001;
      k0:=50;
      grenze:=4;
      rechnung3;
     end;
    wahl:=' ';
    end;
    'f':
    begin
     if hilf=1 then
     begin
      f1:=12;
      grenze:=8000;
      k0:=1200;
      g00:=240;
      l:=9;
      anf:=-0.7454356;
      xend:=-0.7454215;
      unten:=0.1130037;
      oben:=0.1130139;
      s00;
      rechnung2;
     end;
     if hilf=0 then
     begin
      cx:=-0.39054;
      cy:=-0.58679;
      da:=0.00001;
      rechnung3;
     end;
    wahl:=' ';
    end;
    'F':
    begin
     if hilf=1 then
     begin
      f1:=12;
      grenze:=8000;
      k0:=2000;
      g00:=400;
      l:=9;
      anf:=-0.7454301;
      xend:=-0.7454289;
      unten:=0.1130076;
      oben:=0.1130085;
      s00;
      rechnung2;
     end;
     if hilf=0 then
     begin
       cx:=-0.74543;
       cy:=0.11301;
       da:=0.00001;
      rechnung3;
     end;
    wahl:=' ';
    end;
    'h':
    begin
     if hilf=1 then
     begin
     end;
     if hilf=0 then
     begin
       k0:=150;
       grenze:=1000;
       cx:=-0.74248;
       cy:=0.16463;
       da:=0.00001;
      rechnung3;
     end;
    wahl:=' ';
    end;
    'G':
    begin
      setcolor(f1);
      outtextxy(20,390,'cx eingeben');
      read(cx);
      outtextxy(20,400,'cy eingeben');
      read(cy);
      cleardevice;
      rechnung3;
      wahl:=' ';
    end;
    'w':
    begin
     if hilf=0 then
     begin
      grenze:=100;
      anfj:=-1.5;
      xendj:=1.5;
      untenj:=-1.125;
      obenj:=1.125;
      k0:=100;
      laenge:=40;
      rechnung3;
     end;
     if hilf=1 then
     begin
      grenze:=2000;
      anf:=-2.25;
      xend:=0.75;
      unten:=-1.125;
      oben:=1.125;
      k0:=70;
      s00;
      ko:=0;
      kl:=0;
      f1:=8;
      laenge:=40;
      rechnung2;
     end;
     s00;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure auswahl4;
begin
  wahl:=' ';
  wahl1:=' ';
  rechnung2;
  rechnung3;
  markehin;
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
   'o':
    begin
        markeweg;
        ko:=ko-2;
        oben0:=oben0+2*dx;
        markehin;
      wahl:=' ';
    end;
   'u':
    begin
        markeweg;
        ko:=ko+2;
        oben0:=oben0-2*dx;
        markehin;
      wahl:=' ';
    end;
   'r':
    begin
        markeweg;
        kl:=kl+2;
        anf0:=anf0+2*dx;
        markehin;
      wahl:=' ';
    end;
   'l':
    begin
        markeweg;
        kl:=kl-2;
        anf0:=anf0-2*dx;
        markehin;
      wahl:=' ';
    end;
    'z':
    begin
      cweg;
      dx:=(xend-anf)/(nxmax-1);
      unten:=oben0-laenge*dx;
      oben:=oben0+laenge*dx;
      anf:=anf0-laenge*dx;
      xend:=anf0+laenge*dx;
      ko:=20+150;
      kl:=330+150;
      cx:=anf0;
      cy:=oben0;
      chin;
      rechnung2;
      markehin;
      wahl:=' ';
    end;
    'j':
    begin
      cx:=anf0;
      cy:=oben0;
      graphik4;
      rechnung3;
      wahl:=' ';
    end;
    's':
    begin
       graphik4;
       rechnung2;
       rechnung3;
       markehin;
    wahl:=' ';
    end;
    'm':
    begin
       graphik4;
       rechnung2;
       markehin;
    wahl:=' ';
    end;
    '0':
    begin
      graphik4;
      l:=0;
      f1:=12;
       rechnung2;
       rechnung3;
        markehin;
    wahl:=' ';
    end;
    '1':
    begin
      cleardevice;
      graphik4;
      l:=1;
      f1:=12;
       rechnung2;
       rechnung3;
        markehin;
    wahl:=' ';
    end;
    '2':
    begin
      cleardevice;
      graphik4;
      l:=2;
      f1:=12;
       rechnung2;
       rechnung3;
        markehin;
    wahl:=' ';
    end;
    '3':
    begin
      cleardevice;
      graphik4;
      l:=3;
      f1:=12;
       rechnung2;
       rechnung3;
        markehin;
    wahl:=' ';
    end;
    '4':
    begin
      cleardevice;
      graphik4;
      l:=4;
      f1:=12;
       rechnung2;
       rechnung3;
        markehin;
    wahl:=' ';
    end;
    '5':
    begin
      cleardevice;
      graphik4;
      l:=5;
      f1:=12;
       rechnung2;
       rechnung3;
        markehin;
    wahl:=' ';
    end;
    '6':
    begin
      cleardevice;
      graphik4;
      l:=6;
      f1:=12;
       rechnung2;
       rechnung3;
        markehin;
    wahl:=' ';
    end;
    '7':
    begin
      cleardevice;
      graphik4;
      l:=7;
      f1:=15;
       rechnung2;
       rechnung3;
        markehin;
    wahl:=' ';
    end;
    '8':
    begin
      cleardevice;
      graphik4;
      l:=8;
      f1:=15;
       rechnung2;
       rechnung3;
        markehin;
    wahl:=' ';
    end;
    '9':
    begin
      cleardevice;
      graphik4;
      l:=9;
      f1:=12;
       rechnung2;
       rechnung3;
        markehin;
    wahl:=' ';
    end;
    'e':
    begin
     begin
      setcolor(f1);
      outtextxy(20,390,'Iterationsschritte eingeben');
      read(k0);
      outtextxy(20,400,'Grenze eingeben');
      read(grenze);
      end;
      wahl:=' ';
    end;
   'v':
    begin
      if laenge>=11 then
      begin
        rechteckweg;
        laenge:=laenge-1;
        rechteckhin;
      end;
      wahl:=' ';
    end;
   'V':
    begin
        rechteckweg;
        laenge:=laenge+1;
        rechteckhin;
      wahl:=' ';
    end;
   'S':
    begin
      rechteckhin;
      wahl:=' ';
    end;
    'w':
    begin
      cweg;
      anf:=-2.25;
      xend:=0.75;
      unten:=-1.5;
      oben:=1.5;
      rechnung2;
      ko:=20+round((oben-cy)/(oben-unten)*300);
      kl:=330+round((cx-anf)/(xend-anf)*300);
      anf0:=cx;
      oben0:=cy;
      markehin;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure p2;
begin
  cleardevice;
  hilf:=1;
    pxm:=0;
    pym:=0;
    nxmax:=639;
    nymax:=479;
    grenze:=2000;
    k0:=70;
    g00:=100;
    anf:=-2.25;
    xend:=0.75;
    unten:=-1.125;
    oben:=1.125;
    s00;
      ko:=0;
      kl:=0;
      f1:=8;
      laenge:=40;
    cleardevice;
    auswahl2;
   kr0:=0;
   menue;
end;

procedure p3;
begin
  cleardevice;
    hilf:=0;
    pxj:=0;
    pyj:=0;
    nxmax:=639;
    nymax:=479;
  if kr0=0 then
  begin
    grenze:=100;
    k0:=100;
  end;
    anfj:=-1.5;
    xendj:=1.5;
    untenj:=-1.125;
    obenj:=1.125;
      s00;
      ko:=0;
      kl:=0;
      f1:=8;
      laenge:=40;
    auswahl2;
  kr0:=0;
  menue;
end;

procedure p4;
begin
    cleardevice;
    kr0:=1;
    pxj:=10;
    pyj:=20;
    pxm:=330;
    pym:=20;
    nxmax:=300;
    nymax:=300;
    anf:=-2.25;
    xend:=0.75;
    unten:=-1.5;
    oben:=1.5;
    anfj:=-1.5;
    xendj:=1.5;
    untenj:=-1.5;
    obenj:=1.5;
      s00;
      ko:=20+round((oben-cy)/(oben-unten)*300);
      kl:=330+round((cx-anf)/(xend-anf)*300);
      f1:=12;
      anf0:=cx;
      oben0:=cy;
    laenge:=20;
    hilf:=2;
    farbwunsch;
    cleardevice;
    graphik4;
    auswahl4;
  menue;
end;

{MAIN}
begin
  wahl1:=' ';
    cx:=0.32;
    cy:=0.043;
    p0:=-0.22;
    q0:=0.74;
    kr0:=0;
  menue;
  repeat
  wahl1:=' ';
  if keypressed then wahl1:=readkey;
  case wahl1 of
    '1':p00;
    '2':p1;
    '3':p4;
    '4':p2;
    '5':p3;
  end;
  until wahl1='b';
end.