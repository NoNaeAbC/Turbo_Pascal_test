program welle2;
uses crt,graph;
var
  l2,l1,l,m,farbe,farbe1,n,k,treiber,modus:integer;
  y,alpha,dx,a,lambda,c,v,x,t,dt:real;
  wahl2,wahl1,wahl:char;
  ortx1,ortx2,ortx3,ortx4,ortx5,ortx6,ortx7:string;

procedure menue;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(7);
  setcolor(1);
  outtextxy(150,200,'šberlagerung zweier Elementarwellen  ->  1');
  outtextxy(150,250,'Dopplereffekt: Ruhende Schallquelle  ->  2');
  outtextxy(150,300,'Dopplereffekt: Bewegte Schallquelle  ->  3');
  outtextxy(400,400,'beenden  ->  b');
end;

procedure graphik1;
begin
  setbkcolor(1);
  setcolor(15);
  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  str(c/10:4:2,ortx1);
  outtextxy(545,380,ortx1);
  outtextxy(500,380,'c =        m/s');
  str(a/10:4:2,ortx2);
  outtextxy(545,400,ortx2);
  outtextxy(500,400,'a =        m');
  str(lambda/10:4:2,ortx3);
  outtextxy(545,420,ortx3);
  outtextxy(500,420,'l =        m');
  outtextxy(175,15,'šberlagerung zweier Elementarwellen ');
  outtextxy(10,460,'c vergr”áern (C)   c verkleinern (c)   original (w)  starten (s)   beenden (b)');
  outtextxy(20,470,'a vergr”áern (A)   a verkleinern (a)   lambda vergr”áern/verkleinern (L/l)');
  outtextxy(200,50,'                 gegenphasig (1)');
  outtextxy(25,435,'                               mit Interfernzhyperbeln (I)');
  setcolor(12);
  outtextxy(25,435,'ohne Interferenzhyperbeln (i)');
  outtextxy(200,50,'in Phase (0)');
end;

procedure setz1;
begin
  for n:=0 to round(160/lambda) do
  begin
    setcolor(14);
    circle(round(320+a),240,round(lambda*n+c*t-alpha));
    circle(round(320-a),240,round(lambda*n+c*t));
    setcolor(12);
    circle(round(320+a),240,round(lambda*n-alpha+c*(t-lambda/2/c)));
    circle(round(320-a),240,round(lambda*n+c*(t-lambda/2/c)));
  end;
end;

procedure loesch1;
begin
  for n:=0 to round(160/lambda) do
  begin
    setcolor(1);
    circle(round(320+a),240,round(lambda*n+c*t-alpha));
    circle(round(320-a),240,round(lambda*n+c*t));
    circle(round(320+a),240,round(lambda*n-alpha+c*(t-lambda/2/c)));
    circle(round(320-a),240,round(lambda*n+c*(t-lambda/2/c)));
  end;
end;

procedure setz11;
begin
  setcolor(15);
  str(c/10:4:2,ortx1);
  outtextxy(545,380,ortx1);
end;

procedure loesch11;
begin
  setcolor(1);
  outtextxy(545,380,ortx1);
end;

procedure setz12;
begin
  setcolor(15);
  str(a/10:4:2,ortx2);
  outtextxy(545,400,ortx2);
end;

procedure loesch12;
begin
  setcolor(1);
  outtextxy(545,400,ortx2);
end;

procedure setz13;
begin
  setcolor(15);
  str(lambda/10:4:2,ortx3);
  outtextxy(545,420,ortx3);
end;

procedure loesch13;
begin
  setcolor(1);
  outtextxy(545,420,ortx3);
end;

procedure setz14;
begin
  setcolor(15);
  outtextxy(200,50,'                 gegenphasig (1)');
  setcolor(12);
  outtextxy(200,50,'in Phase (0)');
end;

procedure setz15;
begin
  setcolor(12);
  outtextxy(200,50,'                 gegenphasig (1)');
  setcolor(15);
  outtextxy(200,50,'in Phase (0)');
end;

procedure setz17;
begin
  setcolor(15);
  outtextxy(25,435,'                               mit Interfernzhyperbeln (I)');
  setcolor(12);
  outtextxy(25,435,'ohne Interferenzhyperbeln (i)');
end;

procedure setz18;
begin
  setcolor(12);
  outtextxy(25,435,'                               mit Interfernzhyperbeln (I)');
  setcolor(15);
  outtextxy(25,435,'ohne Interferenzhyperbeln (i)');
end;

procedure setz16;
begin
  setcolor(9);
  line(320,90,320,390);
  dx:=0.8;
  for n:=1 to trunc(4*a/lambda) do
  begin
  x:=n*lambda/4;
  repeat
    x:=x+dx;
    y:=sqrt(sqr(4*a/n/lambda*x-n*lambda/4)-sqr(x-a));
    if y<=150 then
    begin
    putpixel(320+round(x),240-round(y),9);
    putpixel(320+round(x),240+round(y),9);
    putpixel(320-round(x),240-round(y),9);
    putpixel(320-round(x),240+round(y),9);
    end;
  until x>=150;
  end;
end;

procedure loesch16;
begin
  setcolor(1);
  line(320,90,320,390);
  dx:=0.8;
  for n:=1 to trunc(4*a/lambda) do
  begin
  x:=n*lambda/4;
  repeat
    x:=x+dx;
    y:=sqrt(sqr(4*a/n/lambda*x-n*lambda/4)-sqr(x-a));
    if y<=150 then
    begin
    putpixel(320+round(x),240-round(y),1);
    putpixel(320+round(x),240+round(y),1);
    putpixel(320-round(x),240-round(y),1);
    putpixel(320-round(x),240+round(y),1);
    end;
  until x>=150;
  end;
end;

procedure auswahl1;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    's':
    begin
      loesch1;
      loesch16;
      t:=0;
      graphik1;
      setz1;
      if l=1 then setz16;
      if l1=0 then setz17 else setz18;
      if l2=0 then setz14 else setz15;
      wahl2:=' ';
      repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
          end;
        if l=1 then loesch16;
        loesch1;
        t:=t+dt;
        if t>=lambda/c then t:=0;
        if l=1 then setz16;
      if l1=0 then setz17 else setz18;
      if l2=0 then setz14 else setz15;
        setz1;
      until wahl2='b';
    wahl:=' ';
    end;
    'I':
    begin
      l:=1;
      l1:=1;
      setz16;
      setz18;
      wahl:=' ';
    end;
    'i':
    begin
      l:=0;
      l1:=0;
      loesch16;
      setz17;
      wahl:=' ';
    end;
    '0':
    begin
      loesch1;
      alpha:=0;
      setz1;
      setz14;
      l2:=0;
      wahl:=' ';
    end;
    '1':
    begin
      loesch1;
      alpha:=lambda/2;
      setz1;
      setz15;
      l2:=1;
      wahl:=' ';
    end;
    'c':
    begin
      if c>=2 then
      begin
        loesch11;
        if l=1 then loesch16;
        loesch1;
        c:=c-1;
        setz11;
        if l=1 then setz16;
        setz1;
      end;
      wahl:=' ';
    end;
    'C':
    begin
      loesch1;
      loesch11;
      if l=1 then loesch16;
      c:=c+1;
      setz11;
      if l=1 then setz16;
      setz1;
      wahl:=' ';
    end;
    'a':
    begin
      if a>=2 then
      begin
        loesch12;
        loesch1;
        if l=1 then loesch16;
        a:=a-1;
        setz12;
        if l=1 then setz16;
        setz1;
      end;
      wahl:=' ';
    end;
    'A':
    begin
      loesch12;
      loesch1;
      if l=1 then loesch16;
      a:=a+1;
      setz12;
      setz1;
      if l=1 then setz16;
      wahl:=' ';
    end;
    'l':
    begin
      if lambda>=2 then
      begin
        loesch13;
        if l=1 then loesch16;
        loesch1;
        lambda:=lambda-1;
        setz13;
        if l=1 then setz16;
        setz1;
      end;
      wahl:=' ';
    end;
    'L':
    begin
      loesch1;
      loesch13;
      if l=1 then loesch16;
      lambda:=lambda+1;
      setz13;
      if l=1 then setz16;
      setz1;
      wahl:=' ';
    end;
    'w':
    begin
      loesch1;
      loesch13;
      loesch12;
      loesch16;
      loesch11;
    graphik1;
     c:=200;
    a:=20;
    lambda:=30;
    t:=0;
      setz1;
      setz11;
      setz12;
      setz16;
      setz13;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure p1;
begin
  cleardevice;
    alpha:=0;
    c:=200;
    a:=20;
    lambda:=30;
    t:=0;
    dt:=0.005;
    l:=0;
    l1:=0;
    l2:=0;
    graphik1;
    setz1;
    auswahl1;
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
  str(c/10:4:2,ortx1);
  outtextxy(545,380,ortx1);
  outtextxy(500,380,'c =        m/s');
  str(v/10:4:2,ortx2);
  outtextxy(545,400,ortx2);
  outtextxy(500,400,'v =        m/s');
  str(lambda/10:4:2,ortx3);
  outtextxy(545,420,ortx3);
  outtextxy(500,420,'l =        m');
  outtextxy(175,15,'Dopplereffekt: Ruhende Schallquelle ');
  outtextxy(10,460,'c vergr”áern (C)   c verkleinern (c)   original (w)  starten (s)   beenden (b)');
  outtextxy(20,470,'v vergr”áern (V)   v verkleinern (V)   lambda vergr”áern/verkleinern (L/l)');
end;

procedure setz2;
begin
  for n:=0 to round(160/lambda) do
  begin
    setcolor(14);
    circle(320,240,round(lambda*n+c*t));
  end;
    setcolor(12);
    circle(round(140+x),240,2);
end;

procedure loesch2;
begin
  for n:=0 to round(160/lambda) do
  begin
    setcolor(1);
    circle(320,240,round(lambda*n+c*t));
  end;
    circle(round(140+x),240,2);
end;

procedure setz21;
begin
  setcolor(15);
  str(c/10:4:2,ortx1);
  outtextxy(545,380,ortx1);
end;

procedure loesch21;
begin
  setcolor(1);
  outtextxy(545,380,ortx1);
end;

procedure setz22;
begin
  setcolor(15);
  str(v/10:4:2,ortx2);
  outtextxy(545,400,ortx2);
end;

procedure loesch22;
begin
  setcolor(1);
  outtextxy(545,400,ortx2);
end;

procedure setz23;
begin
  setcolor(15);
  str(lambda/10:4:2,ortx3);
  outtextxy(545,420,ortx3);
end;

procedure loesch23;
begin
  setcolor(1);
  outtextxy(545,420,ortx3);
end;


procedure auswahl2;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    's':
    begin
      loesch2;
      t:=0;
      x:=0;
      dx:=v*dt;
      setz2;
      wahl2:=' ';
      repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
          end;
        loesch2;
        t:=t+dt;
        x:=x+dx;
        if t>=lambda/c then t:=0;
        setz2;
        delay(100);
      until (wahl2='b') or (x>=360);
    wahl:=' ';
    end;
    'c':
    begin
      if c>=2 then
      begin
        loesch21;
        c:=c-1;
        setz21;
      end;
      wahl:=' ';
    end;
    'C':
    begin
      loesch21;
      c:=c+1;
      setz21;
      wahl:=' ';
    end;
    'v':
    begin
      if v>=2 then
      begin
        loesch22;
        loesch2;
        v:=v-1;
        setz22;
        setz2;
      end;
      wahl:=' ';
    end;
    'V':
    begin
      loesch22;
      loesch2;
      v:=v+1;
      setz22;
      setz2;
      wahl:=' ';
    end;
    'l':
    begin
      if lambda>=2 then
      begin
        loesch23;
        loesch2;
        lambda:=lambda-1;
        setz23;
        setz2;
      end;
      wahl:=' ';
    end;
    'L':
    begin
      loesch2;
      loesch23;
      lambda:=lambda+1;
      setz23;
      setz2;
      wahl:=' ';
    end;
    'w':
    begin
      loesch2;
      loesch23;
      loesch22;
      loesch21;
     c:=100;
    v:=50;
    lambda:=40;
    t:=0;
      setz2;
      setz21;
      setz22;
      setz23;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure p2;
begin
  cleardevice;
    c:=100;
    v:=50;
    lambda:=40;
    t:=0;
    dt:=0.005;
    graphik2;
    setz2;
    auswahl2;
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
  str(c/10:4:2,ortx1);
  outtextxy(545,380,ortx1);
  outtextxy(500,380,'c =        m/s');
  str(v/10:4:2,ortx2);
  outtextxy(545,400,ortx2);
  outtextxy(500,400,'v =        m/s');
  str(lambda/10:4:2,ortx3);
  outtextxy(545,420,ortx3);
  outtextxy(500,420,'l =        m');
  outtextxy(175,15,'Dopplereffekt: Bewegte Schallquelle ');
  outtextxy(10,460,'c vergr”áern (C)   c verkleinern (c)   original (w)  starten (s)   beenden (b)');
  outtextxy(20,470,'v vergr”áern (V)   v verkleinern (V)   lambda vergr”áern/verkleinern (L/l)');
 setcolor(10);
 outtextxy(30,430,'Beobachter zu/weg (1/0)');
end;

procedure setz31;
begin
    setcolor(10);
    circle(320-80,240,2);
    circle(320+80,240,2);
end;

procedure loesch31;
begin
    setcolor(1);
    circle(320-80,240,2);
    circle(320+80,240,2);
end;

procedure setz30;
begin
  for n:=0 to round(160/lambda) do
  begin
    setcolor(farbe);
    circle(round(320+n*v*lambda/c),240,round(c*t-n*lambda));
    circle(round(1600+n*v*lambda/c),240,round(160-c*t-n*lambda));
  end;
    setcolor(farbe1);
    circle(round(320+v*t),240,2);
    if m=1 then setz31;
end;

procedure setz3;
begin
  farbe:=14;
  farbe1:=12;
  setz30;
end;

procedure loesch3;
begin
  farbe:=1;
  farbe1:=1;
  setz30;
end;


procedure auswahl3;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    's':
    begin
      loesch3;
      loesch31;
      if m=1 then setz31;
      t:=0;
      setz3;
      wahl2:=' ';
      repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
          end;
        loesch3;
        t:=t+dt;
        setz3;
        delay(130);
      until (wahl2='b') or (c*t>=200);
    wahl:=' ';
    end;
    '1':
    begin
      m:=1;
      setz31;
      wahl:=' ';
    end;
    '0':
    begin
      m:=0;
      loesch31;
      wahl:=' ';
    end;
    'c':
    begin
      if c>=2 then
      begin
        loesch3;
        loesch21;
        c:=c-1;
        setz21;
        setz3;
      end;
      wahl:=' ';
    end;
    'C':
    begin
      loesch3;
      loesch21;
      c:=c+1;
      setz21;
      setz3;
      wahl:=' ';
    end;
    'v':
    begin
      if v>=-1.5*c then
      begin
        loesch22;
        loesch3;
        v:=v-1;
        setz22;
        setz3;
      end;
      wahl:=' ';
    end;
    'V':
    begin
      loesch22;
      loesch3;
      v:=v+1;
      setz22;
      setz3;
      wahl:=' ';
    end;
    'l':
    begin
      if lambda>=2 then
      begin
        loesch23;
        loesch3;
        lambda:=lambda-1;
        setz23;
        setz3;
      end;
      wahl:=' ';
    end;
    'L':
    begin
      loesch3;
      loesch23;
      lambda:=lambda+1;
      setz23;
      setz3;
      wahl:=' ';
    end;
    'w':
    begin
      loesch3;
      loesch23;
      loesch22;
      loesch21;
     c:=100;
    v:=50;
    lambda:=40;
    m:=0;
    t:=0;
      setz3;
      setz21;
      setz22;
      setz23;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure p3;
begin
  cleardevice;
    c:=100;
    v:=50;
    lambda:=40;
    m:=0;
    t:=0;
    dt:=0.005;
    graphik3;
    setz3;
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
    '1':p1;
    '2':p2;
    '3':p3;
  end;
  until wahl1='b';
end.