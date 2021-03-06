program chaos2;
uses crt,graph;
var
  krit,laenge,ko,ku,kr,kl,np,nq,m,i,k0,k1,farbe,f1,f,l,n,k,treiber,modus:integer;
  a0,xzoom,yzoom,anf0,xanf0,oben0,unten0,xend0,oben,unten,anf,xend,da,a:real;
  wahl1,wahl:char;
  nxmax,nymax,pxj,pyj,pxm,pym,np0,nq0,tab0,tab1,jul,g00,maxi,farbe0,farbe1,farbe2:integer;
  realteil,realteil1:array[1..640] of real;
  imteil:array[1..480] of real;
  sim:array[1..80,1..60] of real;
  cx,cy,x1,p0,q0,r,p,q,x,dx,start,y,dy,grenze:real;
  zahl1,zahl2,zahl3,ortx1,ortx2,ortx3,ortx4,ortx5,ortx6,ortx7,ortx8,ortx9:string;

procedure menue;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(15);
  setcolor(8);
  outtextxy(70,200,'Die Folge  z -> z�+c   ->  1');
  outtextxy(70,250,'Die Folge  z -> z�+c und ihre Darstellung in der Ebene  ->  2');
  outtextxy(70,300,'Mandelbrot - Menge  ->  3');
  outtextxy(70,350,'Julia - Mengen  ->  4');
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
  outtextxy(50,15,'Die Folge  z(n+1) = z(n)� + c bei Julia - und Mandelbrotmengen');
  outtextxy(10,470,'Iterationsschritte �ndern (n/N)  Mandelbrot (m/M) Julia (j/J) beenden (b)');
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

procedure sim0;
begin
  dx:=1/20;
  dy:=1/20;
  for nq:=1 to 60 do
  begin
    for np:=1 to 80 do
    begin
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
        setcolor(12);
        if k1>1 then circle(round(320+100*x),round(240-100*y),2);
        delay(30);
      end;
    until (k1>100) or (x*x+y*y>100);
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
      sim[np,nq]:=14;
      setcolor(14);
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
{
        setcolor(farbe0);
      outtextxy(440,120+10*k1,zahl1);
}
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
 {
        setcolor(farbe0);
      outtextxy(440,390,zahl1);
  }
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
      juliaweg;
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
      outtextxy(20,440,'x(0) vergr��ern/verkleinern (r/l)');
      setcolor(13);
      outtextxy(20,450,'y(0) vergr��ern/verkleinern (o/u)');
      setcolor(8);
      outtextxy(400,55,'JULIA');
      outtextxy(350,440,'cx vergr��ern/verkleinern (X/x)');
      outtextxy(350,450,'cy vergr��ern/verkleinern (Y/y)');
    wahl:=' ';
    end;
    'J':
    begin
      juliaweg;
      jul:=1;
      juliaweg;
      outtextxy(20,440,'x(0) vergr��ern/verkleinern (r/l)');
      outtextxy(20,450,'y(0) vergr��ern/verkleinern (o/u)');
      outtextxy(400,55,'JULIA');
      outtextxy(350,440,'cx vergr��ern/verkleinern (X/x)');
      outtextxy(350,450,'cy vergr��ern/verkleinern (Y/y)');
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
  maxi:=30;
    tab0:=0;
    da:=0.01;
    l:=0;
    p0:=-0.22;
    q0:=0.74;
    x:=-2;
    y:=-1.5;
  dx:=0.01;
  dy:=0.01;
  np:=200;
  nq:=140;
    graphik1;
    s0;
      jul:=1;
      juliahin;
      setcolor(9);
      outtextxy(20,440,'x(0) vergr��ern/verkleinern (r/l)');
      setcolor(13);
      outtextxy(20,450,'y(0) vergr��ern/verkleinern (o/u)');
      setcolor(8);
      outtextxy(400,55,'JULIA');
      outtextxy(350,440,'cx vergr��ern/verkleinern (X/x)');
      outtextxy(350,450,'cy vergr��ern/verkleinern (Y/y)');
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
  outtextxy(200,20,'Die Folge  z(n+1) = z(n)� + c');
   outtextxy(60,50,'x(n+1) =        -       + cx');
   outtextxy(60,60,'y(n+1) = 2 *      *      + cy');
  setcolor(9);
  outtextxy(60,50,'x(n+1) =  x(n)�');
  outtextxy(60,60,'             x(n)');
  outtextxy(30,80,'                     x(0) ');
  outtextxy(20,410,'x(0) =');
  setcolor(13);
  outtextxy(60,50,'                  y(n)� ');
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
  outtextxy(20,465,'Julia (j/J)  Mandelbrot (m/M)  Tabelle einf�gen/entfernen (t/T)  beenden (b)');
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
  outtextxy(20,440,'x(0) vergr��ern/verkleinern (r/l)');
  setcolor(farbe2);
  outtextxy(20,450,'y(0) vergr��ern/verkleinern (o/u)');
  setcolor(farbe0);
  outtextxy(400,55,'JULIA');
   outtextxy(30,80,'wobei die Startwerte      und      die Lage des Punktes in der Ebene ');
   outtextxy(90,90,'bezeichnen und  cx und cy  fest vorgegebene Werte sind');
  outtextxy(350,440,'cx vergr��ern/verkleinern (X/x)');
  outtextxy(350,450,'cy vergr��ern/verkleinern (Y/y)');
    wahl:=' ';
    end;
    'J':
    begin
      jul:=1;
      juliaweg0;
  outtextxy(20,440,'x(0) vergr��ern/verkleinern (r/l)');
  outtextxy(20,450,'y(0) vergr��ern/verkleinern (o/u)');
  outtextxy(400,55,'JULIA');
   outtextxy(30,80,'wobei die Startwerte      und      die Lage des Punktes in der Ebene ');
   outtextxy(90,90,'bezeichnen und  cx und cy  fest vorgegebene Werte sind');
  outtextxy(350,440,'cx vergr��ern/verkleinern (X/x)');
  outtextxy(350,450,'cy vergr��ern/verkleinern (Y/y)');
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
  jul:=1;
  tab0:=1;
    da:=0.01;
    l:=0;
    p0:=-0.22;
    q0:=0.74;
    x:=-2;
    y:=-1.5;
  dx:=0.01;
  dy:=0.01;
  np:=200;
  nq:=140;
    graphik0;
    juliahin0;
  setcolor(farbe1);
  outtextxy(20,440,'x(0) vergr��ern/verkleinern (r/l)');
  setcolor(farbe2);
  outtextxy(20,450,'y(0) vergr��ern/verkleinern (o/u)');
  setcolor(farbe0);
  outtextxy(400,55,'JULIA');
   outtextxy(30,80,'wobei die Startwerte      und      die Lage des Punktes in der Ebene ');
   outtextxy(90,90,'bezeichnen und  cx und cy  fest vorgegebene Werte sind');
  outtextxy(350,440,'cx vergr��ern/verkleinern (X/x)');
  outtextxy(350,450,'cy vergr��ern/verkleinern (Y/y)');
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
  outtextxy(275,420,ortx5);
  outtextxy(100,420,'Genauigkeitsgrenze =');
  str(k0:4,ortx3);
  outtextxy(575,420,ortx3);
  outtextxy(400,420,'Iterationsschritte =');

  outtextxy(80,450,'Darstellungsart (0 bis 6)  Beispiele (a/A/c/C/d/D/f/F)');
  outtextxy(10,440,'Zoomgrenzen eingeben (E)   Zoomrahmen setzen/zoomen/ver�ndern (l/r/o/u/V/v//z)');
  outtextxy(152,470,'wiederherstellen (w)    starten/beenden (s/b)');
  outtextxy(80,460,'Iterationsschritte  und  Genauigkeitsgrenze eingeben (e)');
end;

procedure farbwahl;
begin
   if l=1 then
    begin
     if k1>=k0 then farbe:=0;
     if r>grenze then farbe:=15;
    end;
   if l=0 then
    begin
     if k1>=k0 then farbe:=15;
     if r>grenze then farbe:=0;
    end;
   if l=2 then
    begin
     if k1>=k0 then farbe:=0;
     if r>grenze then farbe:=8*(k1 mod 2)+7;
    end;
   if l=3 then
    begin
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
     if k1>=k0 then farbe:=0;
     if r>grenze then farbe:=(k1 mod 14)+1;
    end;
   if l=4 then
    begin
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
     if k1>=k0 then farbe:=0;
     if r>grenze then
     begin
       if k1<g00 then farbe:=15;
{
       if (k1>=100) and (k1<105) then farbe:=7;
       if (k1>=105) and (k1<110) then farbe:=8;
       if (k1>=110) and (k1<115) then farbe:=15;
       if (k1>=115) and (k1<120) then farbe:=8;
       if (k1>=120) and (k1<125) then farbe:=15;
       if (k1>=125) and (k1<130) then farbe:=8;
       if (k1>=130) and (k1<135) then farbe:=7;
}
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
{
   if l=11 then
    begin
     if k1>=k0 then farbe:=0;
     if r>grenze then
     begin
       if k1<57 then farbe:=15;
       if k1>=57 then
       begin
         krit:=(k1 mod 2);
         if krit=0 then farbe:=15;
         if krit=1 then farbe:=7;
       end;
     end;
    end;
   if l=12 then
    begin
     if k1>=k0 then farbe:=0;
     if r>grenze then
     begin
       if k1<140 then farbe:=15;
       if k1>=140 then
       begin
         krit:=(k1 mod 2);
         if krit=0 then farbe:=15;
         if krit=1 then farbe:=7;
       end;
     end;
    end;
   if l=13 then
    begin
     if k1>=k0 then farbe:=0;
     if r>grenze then
     begin
       if k1<240 then farbe:=15;
       if k1>=240 then
       begin
         krit:=(k1 mod 2);
         if krit=0 then farbe:=15;
         if krit=1 then farbe:=7;
       end;
     end;
    end;
   if l=14 then
    begin
     if k1>=k0 then farbe:=0;
     if r>grenze then
     begin
       if k1<400 then farbe:=15;
       if k1>=400 then
       begin
         krit:=(k1 mod 2);
         if krit=0 then farbe:=15;
         if krit=1 then farbe:=7;
       end;
     end;
    end;
}
end;

procedure farbwunsch;
begin
  outtextxy(150,50,'W�hle die Farbgestaltung aus:');
  outtextxy(100,100,'wei� auf schwarzem Hintergrund -> 0');
  outtextxy(100,120,'schwarz mit wei�em Hintergrund -> 1');
  outtextxy(100,140,'Hintergrund wei� / hellgrau -> 2');
  outtextxy(100,160,'Hintergrund wei� / hellgrau / dunkelgrau -> 3');
  outtextxy(100,180,'Hintergrund hellgr�n / t�rkis / dunkelgr�n -> 4');
  outtextxy(100,200,'Hintergrund gr�n / hellgr�n / hellblau / blau -> 5');
  outtextxy(100,220,'Hintergrund in mehreren gr�n - blau - Abstufungen -> 6');
  outtextxy(100,240,'Hintergrund in rot - gelb - Magenta - Abstufungen -> 7');
  outtextxy(100,260,'Hintergrund in 14 Farben -> 8');
  outtextxy(100,280,'Hintergrund bis Schritt 100 in wei�, dann grau/wei� ->9');

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
    outtextxy(100,410,'Grenze g0 f�r die Farbe wei� eingeben:');
    read(g00);
  end;

end;

procedure rechnung2;
begin
setbkcolor(0);
 dx:=(xend-anf)/639;
 dy:=(oben-unten)/479;
 p0:=anf;
 q0:=oben;
 for nq:=1 to 479 do
 begin
   if keypressed then wahl1:=readkey;
   for np:=1 to 639 do
   begin
     p0:=anf+(np-1)*dx;
     q0:=oben-(nq-1)*dy;
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
  putpixel(np,nq,farbe);
   end;
   case wahl1 of 'b':
     halt;
   end;
 end;
end;

procedure rechteck;
begin
  setlinestyle(1,0,1);
  line(kl,ko,kl+round(4/3*laenge),ko);
  line(kl,ko,kl,ko+laenge);
  line(kl+round(4/3*laenge),ko,kl+round(4/3*laenge),ko+laenge);
  line(kl+round(4/3*laenge),ko+laenge,kl,ko+laenge);
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
    anf0:=anf;
    xend0:=xend;
    unten0:=unten;
    oben0:=oben;
end;

procedure auswahl2;
begin
  wahl:=' ';
  wahl1:=' ';
  if keypressed then wahl1:=readkey;
  rechnung2;
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    's':
    begin
      cleardevice;
      rechnung2;
    wahl:=' ';
    end;
    '0':
    begin
      cleardevice;
      l:=0;
      f1:=7;
      rechnung2;
    wahl:=' ';
    end;
    '1':
    begin
      cleardevice;
      l:=1;
      f1:=7;
      rechnung2;
    wahl:=' ';
    end;
    '2':
    begin
      cleardevice;
      l:=2;
      f1:=12;
      rechnung2;
    wahl:=' ';
    end;
    '3':
    begin
      cleardevice;
      l:=3;
      f1:=12;
      rechnung2;
    wahl:=' ';
    end;
    '4':
    begin
      cleardevice;
      l:=4;
      f1:=12;
      rechnung2;
    wahl:=' ';
    end;
    '5':
    begin
      cleardevice;
      l:=5;
      f1:=12;
      rechnung2;
    wahl:=' ';
    end;
    '6':
    begin
      cleardevice;
      l:=6;
      f1:=12;
      rechnung2;
    wahl:=' ';
    end;
    '7':
    begin
      cleardevice;
      l:=7;
      f1:=9;
      rechnung2;
    wahl:=' ';
    end;
    '8':
    begin
      cleardevice;
      l:=8;
      f1:=15;
      rechnung2;
    wahl:=' ';
    end;
    '9':
    begin
      cleardevice;
      l:=9;
      f1:=15;
      rechnung2;
    wahl:=' ';
    end;
    'E':
    begin
      setcolor(f1);
      outtextxy(20,360,'anf eingeben');
      read(anf);
      outtextxy(20,370,'end eingeben');
      read(xend);
      outtextxy(20,380,'unten eingeben');
      read(unten);
      outtextxy(20,390,'oben eingeben');
      read(oben);
      s00;
      cleardevice;
      rechnung2;
      wahl:=' ';
    end;
    'e':
    begin
      setcolor(f1);
      outtextxy(20,390,'Iterationsschritte eingeben');
      read(k0);
      outtextxy(20,400,'Grenze eingeben');
      read(grenze);
      cleardevice;
      rechnung2;
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

   'o':
    begin
        rechteckweg;
        ko:=ko-5;
        oben0:=oben0+5*dx;
        rechteckhin;
      wahl:=' ';
    end;
   'u':
    begin
        rechteckweg;
        ko:=ko+5;
        oben0:=oben0-5*dx;
        rechteckhin;
      wahl:=' ';
    end;
   'r':
    begin
        rechteckweg;
        kl:=kl+5;
        anf0:=anf0+5*dx;
        rechteckhin;
      wahl:=' ';
    end;
   'l':
    begin
        rechteckweg;
        kl:=kl-5;
        anf0:=anf0-5*dx;
        rechteckhin;
      wahl:=' ';
    end;
    'z':
    begin
      unten:=oben0-laenge*dx;
      oben:=oben0;
      anf:=anf0;
      xend:=anf+4/3*laenge*dx;
      cleardevice;
      kl:=1;
      ko:=1;
      rechnung2;
      wahl:=' ';
    end;
    'g':
    begin
      graphik2;
      wahl:=' ';
    end;
    'a':
    begin
      cleardevice;
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
    wahl:=' ';
    end;
    'A':
    begin
      cleardevice;
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
    wahl:=' ';
    end;
    'c':
    begin
      cleardevice;
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
    wahl:=' ';
    end;
    'C':
    begin
      cleardevice;
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
    wahl:=' ';
    end;
    'd':
    begin
      cleardevice;
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
    wahl:=' ';
    end;
    'D':
    begin
      cleardevice;
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
    wahl:=' ';
    end;
    'f':
    begin
      cleardevice;
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
    wahl:=' ';
    end;
    'F':
    begin
      cleardevice;
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
    wahl:=' ';
    end;
    'w':
    begin
      cleardevice;
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
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;



procedure p2;
begin
  cleardevice;
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
    farbwunsch;
    cleardevice;
    auswahl2;
  menue;
end;

procedure graphik3;
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
  outtextxy(275,420,ortx5);
  outtextxy(100,420,'Genauigkeitsgrenze =');
  str(k0:4,ortx3);
  outtextxy(575,420,ortx3);
  outtextxy(400,420,'Iterationsschritte =');
  str(p0:8:6,ortx6);
  outtextxy(230,40,ortx6);
  outtextxy(200,40,'p =');
  str(q0:8:6,ortx7);
  outtextxy(230,50,ortx7);
  outtextxy(200,50,'q =');

  outtextxy(155,20,'p und q �ndern (p/P/q/Q)   eingeben (G)');
  outtextxy(80,450,'Darstellungsart (0 bis 6)  Beispiele (a/A/c/C/d/D/f/F)');
  outtextxy(10,440,'Zoomgrenzen eingeben (E)   Zoomrahmen setzen/zoomen/ver�ndern (l/r/o/u/V/v//z)');
  outtextxy(152,470,'wiederherstellen (w)    starten/beenden (s/b)');
  outtextxy(80,460,'Iterationsschritte  und  Genauigkeitsgrenze eingeben (e)');
end;





procedure rechnung3;
begin
setbkcolor(0);
 dx:=(xend-anf)/639;
 dy:=(oben-unten)/479;
 for nq:=1 to 479 do
 begin
   for np:=1 to 639 do
   begin
     x:=anf+(np-1)*dx;
     y:=oben-(nq-1)*dy;
     k1:=0;

     repeat
      k1:=k1+1;
      x1:=x;
      x:=x*x-y*y+p0;
      y:=2*x1*y+q0;
      r:=x*x+y*y;
     until (r>grenze) or (k1>=k0);
     farbwahl;
  putpixel(np,nq,farbe);
   end;
 end;
end;


procedure auswahl3;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    's':
    begin
      cleardevice;
      rechnung3;
    wahl:=' ';
    end;
    '0':
    begin
      cleardevice;
      l:=0;
      f1:=7;
      rechnung3;
    wahl:=' ';
    end;
    '1':
    begin
      cleardevice;
      l:=1;
      f1:=8;
      rechnung3;
    wahl:=' ';
    end;
    '2':
    begin
      cleardevice;
      l:=2;
      f1:=15;
      rechnung3;
    wahl:=' ';
    end;
    '3':
    begin
      cleardevice;
      l:=3;
      f1:=12;
      rechnung3;
    wahl:=' ';
    end;
    '4':
    begin
      cleardevice;
      l:=4;
      f1:=12;
      rechnung3;
    wahl:=' ';
    end;
    '5':
    begin
      cleardevice;
      l:=5;
      f1:=12;
      rechnung3;
    wahl:=' ';
    end;
    '6':
    begin
      cleardevice;
      l:=6;
      f1:=12;
      rechnung3;
    wahl:=' ';
    end;
    '7':
    begin
      cleardevice;
      l:=7;
      f1:=9;
      rechnung3;
    wahl:=' ';
    end;
    '8':
    begin
      cleardevice;
      l:=8;
      f1:=15;
      rechnung3;
    wahl:=' ';
    end;
    'a':
    begin
      cleardevice;
      p0:=-1.25;
      q0:=0;
      da:=0.01;
      rechnung3;
    wahl:=' ';
    end;
    'A':
    begin
      cleardevice;
      p0:=-0.194;
      q0:=0.6557;
      da:=0.0001;
      rechnung3;
    wahl:=' ';
    end;
    'c':
    begin
      cleardevice;
      p0:=-0.11;
      q0:=0.6557;
      da:=0.0001;
      rechnung3;
    wahl:=' ';
    end;
    'C':
    begin
      cleardevice;
      p0:=-0.12;
      q0:=0.74;
      da:=0.01;
      rechnung3;
    wahl:=' ';
    end;
    'd':
    begin
      cleardevice;
      p0:=0.27334;
      q0:=0.00742;
      da:=0.00001;
      k0:=1000;
      grenze:=100;
      rechnung3;
    wahl:=' ';
    end;
    'D':
    begin
      cleardevice;
      p0:=0.11031;
      q0:=-0.67037;
      da:=0.00001;
      k0:=30;
      grenze:=0;
      rechnung3;
    wahl:=' ';
    end;
    'f':
    begin
      cleardevice;
      p0:=-0.39054;
      q0:=-0.58679;
      da:=0.00001;
      rechnung3;
    wahl:=' ';
    end;
    'E':
    begin
      setcolor(f1);
      outtextxy(20,360,'anf eingeben');
      read(anf);
      outtextxy(20,370,'end eingeben');
      read(xend);
      outtextxy(20,380,'unten eingeben');
      read(unten);
      outtextxy(20,390,'oben eingeben');
      read(oben);
      unten0:=unten;
      oben0:=oben;
      xend0:=xend;
      anf0:=anf;
      cleardevice;
      rechnung3;
      wahl:=' ';
    end;
    'e':
    begin
      setcolor(f1);
      outtextxy(20,390,'Iterationsschritte eingeben');
      read(k0);
      outtextxy(20,400,'Grenze eingeben');
      read(grenze);
      cleardevice;
      rechnung3;
      wahl:=' ';
    end;
    'G':
    begin
      setcolor(f1);
      outtextxy(20,390,'p eingeben');
      read(p0);
      outtextxy(20,400,'q eingeben');
      read(q0);
      cleardevice;
      rechnung3;
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
   'p':
    begin
        cleardevice;
        p0:=p0-da;
        graphik3;
      wahl:=' ';
    end;
   'P':
    begin
        cleardevice;
        p0:=p0+da;
        graphik3;
      wahl:=' ';
    end;
   'q':
    begin
        cleardevice;
        q0:=q0-da;
        graphik3;
      wahl:=' ';
    end;
   'Q':
    begin
        cleardevice;
        q0:=q0+da;
        graphik3;
      wahl:=' ';
    end;

   'o':
    begin
        rechteckweg;
        ko:=ko-5;
        oben0:=oben0+5*dx;
        rechteckhin;
      wahl:=' ';
    end;
   'u':
    begin
        rechteckweg;
        ko:=ko+5;
        oben0:=oben0-5*dx;
        rechteckhin;
      wahl:=' ';
    end;
   'r':
    begin
        rechteckweg;
        kl:=kl+5;
        anf0:=anf0+5*dx;
        rechteckhin;
      wahl:=' ';
    end;
   'l':
    begin
        rechteckweg;
        kl:=kl-5;
        anf0:=anf0-5*dx;
        rechteckhin;
      wahl:=' ';
    end;
    'z':
    begin
      unten:=oben0-laenge*dx;
      oben:=oben0;
      anf:=anf0;
      xend:=anf+4/3*laenge*dx;
      cleardevice;
      kl:=0;
      ko:=0;
      rechnung3;
      wahl:=' ';
    end;
    'g':
    begin
      graphik3;
      wahl:=' ';
    end;
    'w':
    begin
      cleardevice;
      grenze:=100;
      anf:=-1.5;
      anf0:=anf;
      xend:=1.5;
      xend0:=xend;
      unten:=-1.125;
      unten0:=unten;
      oben:=1.125;
      oben0:=oben;
      k0:=100;
      rechnung3;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;


procedure p3;
begin
  cleardevice;
    grenze:=100;
    k0:=100;
    anf:=-1.5;
    anf0:=anf;
    xend:=1.5;
    xend0:=xend;
    unten:=-1.125;
    unten0:=unten;
    oben:=1.125;
    oben0:=oben;
    p0:=-0.74543;
    q0:=0.11301;
    da:=0.00001;
      ko:=0;
      kl:=0;
      f1:=8;
      laenge:=40;
    farbwunsch;
    cleardevice;
    rechnung3;
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
    '1':p00;
    '2':p1;
    '3':p2;
    '4':p3;
  end;
  until wahl1='b';
end.