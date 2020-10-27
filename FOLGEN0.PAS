program folgen;

uses crt,graph;
var
  zyfest,yk,x,a,nanf,nend,zx,zy:longint;
  h0,m,n,hilf,hilfe:integer;
  h000,farbe0,farbe1,farbe2,farbe3,farbe4,farbe5,farbe6,farbe7,farbe8,l,farbe,z,k,treiber,modus:integer;
  faktor,gfest,g,epsilon,y,y0:real;
  wahl,wahl1:char;
  ortx8,ortx9,ortx10,ortx11,ortx7,ortx6,ortx1,ortx2,ortx3,ortx4,ortx5:string;


procedure en;
begin
  if h000=0 then
    begin
     farbe0:=15;
     farbe1:=8;
     farbe2:=12;
     farbe3:=9;
     farbe4:=2;
     farbe5:=3;
     farbe6:=13;
     farbe7:=5;
     farbe8:=10;
    end;
  if h000=1 then
    begin
     farbe0:=1;
     farbe1:=15;
     farbe2:=10;
     farbe3:=14;
     farbe4:=10;
     farbe5:=11;
     farbe6:=13;
     farbe7:=9;
     farbe8:=2;
    end;
end;

procedure menue;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(15);
  setcolor(1);
         outtextxy(100,120,'a[n] =                         -> 1 ');
         outtextxy(100,115,'       1');
         outtextxy(100,125,'       n');
         line(153,123,163,123);

         outtextxy(100,170,'a[n] =                         -> 2 ');
         outtextxy(100,175,'       (2n-13)(3n-52)');
         outtextxy(100,165,'            n-63');
         line(155,173,265,173);

         outtextxy(100,220,'a[n] =                         -> 3 ');
         outtextxy(100,215,'        (n-3)(5n-45)');
         outtextxy(100,225,'       (3n-14)(2n-15)');
         line(155,223,265,223);

         outtextxy(100,270,'a[n] =                         -> 4 ');
         outtextxy(100,265,'       n * sin(100/n)');
         outtextxy(100,275,'            100');
         line(155,273,265,273);
{
         outtextxy(100,320,'a[n] =                         -> 5 ');
         outtextxy(100,315,'       a*ný + b*n + c');
         outtextxy(100,325,'       d*ný + e*n + f');
         line(155,323,267,323);
 }
  outtextxy(405,400,'beenden  ->  b');
  setcolor(7);
  outtextxy(20,465,'heller Hintergrund (h)                              dunkler Hintergrund (d)');
end;

procedure g00;
begin
  setcolor(farbe);
     if l=0 then
       begin
         if a=0 then outtextxy(280,20,'a[n] = ');
         if a=0 then outtextxy(280,15,'       1');
         if a=0 then outtextxy(280,25,'       n');
         if a=0 then line(333,23,343,23);
         if a=1 then outtextxy(250,20,'a[n] = (-1)^n * ');
         if a=1 then outtextxy(250,15,'                1');
         if a=1 then outtextxy(250,25,'                n');
         if a=1 then line(375,23,385,23);
       end;
     if l=1 then
       begin
         if a=0 then outtextxy(240,20,'a[n] = ');
         if a=0 then outtextxy(240,25,'       (2n-13)(3n-52)');
         if a=0 then outtextxy(240,15,'            n-63');
         if a=0 then line(295,23,405,23);
         if a=1 then outtextxy(200,20,'a[n] = (-1)^n * ');
         if a=1 then outtextxy(200,25,'                (2n-13)(3n-52)');
         if a=1 then outtextxy(200,15,'                     n-63');
         if a=1 then line(327,23,437,23);
       end;
     if l=2 then
       begin
         if a=0 then outtextxy(250,20,'a[n] =  ');
         if a=0 then outtextxy(250,15,'        (n-3)(5n-45)');
         if a=0 then outtextxy(250,25,'       (3n-14)(2n-15)');
         if a=0 then line(305,23,415,23);
         if a=1 then outtextxy(200,20,'a[n] = (-1)^n *  ');
         if a=1 then outtextxy(200,15,'                 (n-3)(5n-45)');
         if a=1 then outtextxy(200,25,'                (3n-14)(2n-15)');
         if a=1 then line(327,23,437,23);
       end;
     if l=3 then
       begin
         if a=0 then outtextxy(250,20,'a[n] = ');
         if a=0 then outtextxy(250,15,'       n * sin(100/n)');
         if a=0 then outtextxy(250,25,'            100');
         if a=0 then line(305,23,415,23);
         if a=1 then outtextxy(200,20,'a[n] = (-1)^n *');
         if a=1 then outtextxy(200,15,'                 n * sin(100/n)');
         if a=1 then outtextxy(200,25,'                      100');
         if a=1 then line(335,23,445,23);
       end;
end;

procedure g01;
begin
  farbe:=farbe2;
  g00;
end;

procedure g01weg;
begin
  farbe:=farbe0;
  g00;
end;

procedure versuch;
begin
    if l=0 then y0:=zy*(cos(a*(x+1)*pi)/x);
    if l=1 then y0:=zy*(cos(a*(x+1)*pi)*(x-63)/((2*x-13)*(3*x-52)));
    if l=2 then y0:=zy*(cos(a*(x+1)*pi)*(x-3)*(5*x-45)/((3*x-14)*(2*x-15)));
    if l=3 then y0:=zy*(cos(a*(x+1)*pi)*x/100*sin(100/x));

end;


procedure f1;
begin
  for n:=1 to round(510/zx) do
  begin
    x:=nanf+n;
    versuch;
    if (gfest+faktor*(y0/zy*zyfest-gfest)>-170-yk) and (gfest+faktor*(y0/zy*zyfest-gfest)<170-yk) then
    begin
      setcolor(farbe2);
      circle(60+round(zx*n),240-yk-round(gfest+faktor*(y0/zy*zyfest-gfest)),2);
    end;
  end;
end;


procedure loeschf1;
begin
  for n:=1 to round(510/zx) do
  begin
    x:=nanf+n;
    versuch;
    if (gfest+faktor*(y0/zy*zyfest-gfest)>-170-yk) and (gfest+faktor*(y0/zy*zyfest-gfest)<170-yk) then
    begin
      setcolor(farbe0);
      circle(60+round(zx*n),240-yk-round(gfest+faktor*(y0/zy*zyfest-gfest)),2);
    end;
  end;
end;

procedure s0000;
begin
  if (240-yk-round(gfest-zy*g)<410) and (240-yk-round(gfest-zy*g)>70) then
  begin
    outtextxy(32+zx,245-yk-round(gfest-zy*g),ortx1);
    outtextxy(32+5*zx,245-yk-round(gfest-zy*g),ortx2);
  end;
  if (240-yk-round(gfest-zy*g)>=410) then
  begin
    outtextxy(32+zx,245+170,ortx1);
    outtextxy(32+5*zx,245+170,ortx2);
  end;
  if (240-yk-round(gfest-zy*g)<=70) then
  begin
    outtextxy(32+zx,245-170,ortx1);
    outtextxy(32+5*zx,245-170,ortx2);
  end;
end;


procedure setz1;
begin
  setcolor(farbe1);
    str((nanf+1):4,ortx1);
    str((nanf+5):4,ortx2);
    s0000;
end;


procedure loesch1;
begin
  setcolor(farbe0);
  s0000;
end;


procedure setz0;
begin
  if (240-round(gfest+faktor*(-zyfest/2-gfest))<410) and (yk=0) then
  begin
    outtextxy(20,237-round(gfest+faktor*(-zyfest/2-gfest)),'-0,5');
    line(60,240-round(gfest+faktor*(-zyfest/2-gfest)),55,240-round(gfest+faktor*(-zyfest/2-gfest)));
  end;
  if (gfest+faktor*(zyfest/2-gfest)<170) and (yk=0) then
  begin
    outtextxy(30,237-round(gfest+faktor*(zyfest/2-gfest)),'0,5');
    line(60,240-round(gfest+faktor*(zyfest/2-gfest)),55,240-round(gfest+faktor*(zyfest/2-gfest)));
  end;
  if (240-round(gfest+faktor*(-zyfest-gfest))<410) and (yk=0) then
  begin
    outtextxy(30,237-round(gfest+faktor*(-zyfest-gfest)),'-1');
    line(60,240-round(gfest+faktor*(-zyfest-gfest)),55,240-round(gfest+faktor*(-zyfest-gfest)));
  end;
  if (gfest+faktor*(zyfest-gfest)<170) and (yk=0) then
  begin
    outtextxy(40,237-round(gfest+faktor*(zyfest-gfest)),'1');
    line(60,240-round(gfest+faktor*(zyfest-gfest)),55,240-round(gfest+faktor*(zyfest-gfest)));
  end;

  if ((yk+gfest+faktor*(zyfest-gfest))>=170) or (yk<>0) then
  begin
    str(((180-yk-gfest)/zy+g):5:4,ortx4);
    outtextxy(20,47,ortx4);
    line(60,60,55,60);
  end;
  if  ((yk+gfest+faktor*(-zyfest-gfest))>=170) or (yk<>0) then
  begin
    str((g-(180+yk+gfest)/zy):5:4,ortx5);
    outtextxy(20,427,ortx5);
    line(60,420,55,420);
  end;


  if (240-yk-round(gfest-zy*g)<410) and (240-yk-round(gfest-zy*g)>70) then
  begin
    line(60,240-yk-round(gfest-zy*g),580,240-yk-round(gfest-zy*g));
    line(60+zx,242-yk-round(gfest-zy*g),60+zx,238-yk-round(gfest-zy*g));
    for k:=1 to 25 do
    begin
      if 5*k*zx<510 then
      line(60+5*k*zx,238-yk-round(gfest-zy*g),60+5*k*zx,242-yk-round(gfest-zy*g));
      str((nanf+50):4,ortx8);
      outtextxy(32+51*zx,245-yk-round(gfest-zy*g),ortx8);
    end;
  end;
  if (240-yk-round(gfest-zy*g)>=410) then
  begin
    line(60,240+170,580,240+170);
    line(60+zx,238+170,60+zx,242+170);
    for k:=1 to 25 do
    begin
      if 5*k*zx<510 then
      line(60+5*k*zx,238+170,60+5*k*zx,242+170);
      str((nanf+50):4,ortx8);
      outtextxy(32+51*zx,245+170,ortx8);
    end;
  end;
  if (240-yk-round(gfest-zy*g)<=70)  then
  begin
    line(60,240-170,580,240-170);
    line(60+zx,238-170,60+zx,242-170);
    for k:=1 to 25 do
    begin
      if 5*k*zx<510 then
      line(60+5*k*zx,238-170,60+5*k*zx,242-170);
      str((nanf+50):4,ortx8);
      outtextxy(32+51*zx,245-170,ortx8);
    end;
end;
end;

procedure setz;
begin
  setcolor(farbe1);
  setz1;
  setz0;
  line(60,60,60,420);
end;

procedure loesch;
begin
  setcolor(farbe0);
  farbe:=farbe0;
  loesch1;
  setz0;
end;

procedure epsa;
begin
  setcolor(farbe);
  setfillstyle(9,farbe);
  if (240-yk-round(gfest-zy*epsilon)<410) and (240-yk-round(gfest+zy*epsilon)>70) then
  begin
    bar(63,240-yk-round(gfest+zy*epsilon),580,240-yk-round(gfest-zy*epsilon));
    line(61,240-yk-round(gfest),582,240-yk-round(gfest));
    str(epsilon:5:5,ortx7);
    outtextxy(80,440,'epsilon = '+ortx7);
    str(g:5:5,ortx9);
    outtextxy(128,430,'g = '+ortx9);
    str(g:3:2,ortx6);
    outtextxy(20,237-yk-round(gfest),ortx6);
  end;
end;

procedure epsb;
begin
  for n:=1 to round(510/zx) do
  begin
    x:=nanf+n;
    versuch;
    if (zy*(g+epsilon)>y0) and (zy*(g-epsilon)<y0) then
    begin
      setcolor(farbe);
      circle(60+round(zx*n),240-yk-round(gfest+faktor*(y0/zy*zyfest-gfest)),2);
    end;
  end;
end;

procedure epshin;
begin
  farbe:=farbe5;
  epsa;
  f1;
  farbe:=farbe5;
  epsb;
  setz;
end;

procedure epsweg;
begin
  farbe:=farbe0;
  epsa;
  loesch;
  loeschf1;
  epsb;
end;


procedure graphik1;
begin
  setbkcolor(farbe0);
  g01;
  setcolor(farbe1);
  line(10,40,630,40);
  line(10,450,630,450);
  line(10,40,10,450);
  line(630,40,630,450);
  outtextxy(5,465,'epsilon ver„ndern (e/E//v)  Grenzwert angeben (V)  Ausschnitt verschieben (r/l) ');
  outtextxy(55,455,'alternierend (1) / Original (0)    zoomen (x/X//y/Y)   beenden (b)');
  setcolor(7);
  outtextxy(300,420,'Epsilonumgebung setzen / l”schen (s/S)');
  outtextxy(300,430,'Koordinatensystem nach oben / unten (o/u)');
  outtextxy(300,440,'Epsilonumgebung nach oben / unten (G/g)');
end;

procedure ausgabe1;
begin
  zyfest:=zy;
  faktor:=1;
  h0:=0;
  yk:=0;
  g:=0;
  gfest:=0;
  epsilon:=0.1;
  a:=0;
  nanf:=0;
  graphik1;
  setz;
  f1;
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    '1':
    begin
      loeschf1;
      loesch1;
      g01weg;
      a:=1;
      g01;
      setz;
      f1;
      wahl:=' ';
    end;
    '0':
    begin
      loeschf1;
      loesch1;
      g01weg;
      a:=0;
      g01;
      setz;
      f1;
      wahl:=' ';
    end;
    's':
    begin
      epshin;
      h0:=1;
      wahl:=' ';
    end;
    'S':
    begin
      epsweg;
      h0:=0;
      f1;
      setz;
      wahl:=' ';
    end;
    'e':
    begin
      epsweg;
      epsilon:=0.9*epsilon;
      epshin;
      wahl:=' ';
    end;
    'E':
    begin
      epsweg;
      epsilon:=1.1*epsilon;
      epshin;
      wahl:=' ';
    end;
    'G':
    begin
      loesch;
      loeschf1;
      epsweg;
      g:=g+1/zy;
      gfest:=zyfest*g;
      epshin;
      wahl:=' ';
    end;
    'g':
    begin
      loesch;loeschf1;
      epsweg;
      g:=g-1/zy;
      gfest:=zyfest*g;
      epshin;
      wahl:=' ';
    end;
    'V':
    begin
      epsweg;
      f1;
      setz;
      setcolor(farbe5);
      outtextxy(30,440,'(Grenzwert eingeben)');
      read(g);
      cleardevice;
      gfest:=zyfest*g;
      graphik1;
      f1;
      setz;
      epshin;
      wahl:=' ';
    end;
    'v':
    begin
      epsweg;
      f1;
      setz;
      setcolor(farbe5);
      outtextxy(30,440,'(Epsilon - Wert eingeben)');
      read(epsilon);
      cleardevice;
      graphik1;
      f1;
      setz;
      epshin;
      wahl:=' ';
    end;
    'o':
    begin
      loeschf1;
      loesch;
      if h0=1 then epsweg;
      yk:=yk+5;
      setz;
      f1;
      if h0=1 then epshin;
      wahl:=' ';
    end;
    'u':
    begin
      loeschf1;
      loesch;
      if h0=1 then epsweg;
      yk:=yk-5;
      setz;
      f1;
      if h0=1 then epshin;
      wahl:=' ';
    end;
    'r':
    begin
      loeschf1;
      loesch1;
      loesch;
      if h0=1 then epsweg;
      nanf:=nanf+5;
      setz;
      f1;
      if h0=1 then epshin;
      wahl:=' ';
    end;
    'l':
    begin
      if nanf>=5 then
      begin
       loeschf1;
       loesch1;
       loesch;
      if h0=1 then epsweg;
       nanf:=nanf-5;
       setz;
       f1;
      if h0=1 then epshin;
       wahl:=' ';
      end;
    end;

    'x':
    begin
      loeschf1;
      loesch;
      if h0=1 then epsweg;
      zx:=round(zx*0.9);
      setz;
      f1;
      if h0=1 then epshin;
      wahl:=' ';
    end;
    'X':
    begin
      loeschf1;
      loesch;
      if h0=1 then epsweg;
      zx:=round(zx*1.1);
      setz;
      f1;
      if h0=1 then epshin;
      wahl:=' ';
    end;
    'y':
    begin
      loeschf1;
      loesch;
      if h0=1 then epsweg;
      zy:=round(zy*0.9);
      faktor:=faktor*0.9;
      setz;
      f1;
      if h0=1 then epshin;
      wahl:=' ';
    end;
    'Y':
    begin
      loeschf1;
      loesch;
      if h0=1 then epsweg;
      zy:=round(zy*1.1);
      faktor:=faktor*1.1;
      setz;
      f1;
      if h0=1 then epshin;
      wahl:=' ';
    end;
    'w':
    begin
      cleardevice;
      graphik1;
  h0:=0;
  yk:=0;
  g:=0;
  epsilon:=0.1;
  a:=0;
  nanf:=0;
      if l=0 then
      begin
        zy:=155;
        zx:=20;
      end;
      setz;
      f1;
      setz1;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure p1;
begin
  cleardevice;
  en;
  l:=0;
  a:=0;
  zy:=155;
  zx:=20;
  graphik1;
  ausgabe1;
  menue;
end;

procedure p2;
begin
  cleardevice;
  en;
  l:=1;
  a:=0;
  zx:=20;
  zy:=70;
  graphik1;
  ausgabe1;
  menue;
end;

procedure p3;
begin
  cleardevice;
  en;
  l:=2;
  a:=0;
  zx:=20;
  zy:=20;
  graphik1;
  ausgabe1;
  menue;
end;

procedure p4;
begin
  cleardevice;
  en;
  l:=3;
  a:=0;
  zx:=10;
  zy:=155;
  graphik1;
  ausgabe1;
  menue;
end;

{MAIN}
begin
  h000:=0;
  menue;
  repeat
  wahl1:=' ';
if keypressed then wahl1:=readkey;
  case wahl1 of
    '1':p1;
    '2':p2;
    '3':p3;
    '4':p4;
    'h':h000:=0;
    'd':h000:=1;
  end;
  until wahl1='b';
end.