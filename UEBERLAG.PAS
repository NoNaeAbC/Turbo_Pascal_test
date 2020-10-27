program wellenfunktion;
uses crt,graph;
var
  n,k,treiber,modus,farbe,farbe1,farbe2,farbe0,farbe3:integer;
  a0,a,delta,lambda1,lambda2,x,dx:real;
  wahl1,wahl:char;
  ortx1,ortx2,ortx3,ortx4,ortx5,ortx6:string;

procedure menue;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(7);
  setcolor(1);
  farbe0:=1;
  farbe1:=15;
  farbe2:=12;
  farbe3:=14;
  outtextxy(50,200,'šberlagerung von Wellenfunktionen gleicher Amplitude  ->  1');
  outtextxy(50,300,'šberlagerung von Wellenfunktionen unterschiedlicher Amplitude  ->  2');
  outtextxy(400,400,'beenden  ->  b');
end;

procedure g0;
begin
  setbkcolor(farbe0);
  setcolor(farbe1);

  for k:=0 to 15 do
  begin
  str(k:2,ortx4);
  outtextxy(87+round(30*k),380,ortx4);
  line(95+round(30*k),370,95+round(30*k),365);
  end;

  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  str(n:4,ortx1);
  outtextxy(445,420,ortx1);
  outtextxy(400,420,'n =        ');
  outtextxy(90,420,'l1 =        ');
  outtextxy(240,420,'l2 =        ');
  outtextxy(50,80,'Wellenzug');
  outtextxy(20,230,'Amplitudenquadrat');
  outtextxy(40,460,'l1 ver„ndern (l/L)  l2 ver„ndern (r/R)  n ver„ndern (n/N)   beenden (b)');
end;

procedure graphik;
begin
  g0;
  outtextxy(120,15,'šberlagerung von Wellenfunktionen gleicher Amplitude ');
end;


procedure graphik2;
begin
  g0;
  outtextxy(70,15,'šberlagerung von Wellenfunktionen unterschiedlicher Amplitude ');
end;


procedure setz;
begin
  setcolor(15);
  str(lambda1:4:2,ortx2);
  outtextxy(145,420,ortx2);
  str(lambda2:4:2,ortx3);
  outtextxy(295,420,ortx3);
end;

procedure loesch;
begin
  setcolor(1);
  outtextxy(145,420,ortx2);
  outtextxy(295,420,ortx3);
end;

procedure setz1;
begin
  setcolor(15);
  str(n:4,ortx1);
  outtextxy(445,420,ortx1);
end;

procedure loesch1;
begin
  setcolor(1);
  outtextxy(445,420,ortx1);
end;

procedure rechnung;
begin
  a:=a0/n*sin(2*pi/lambda1*x);
  for k:=1 to n-1 do
  begin
  a:=a+a0/n*sin(2*pi/(lambda1+k*delta)*x);
  end;
end;

procedure b;
begin
  delta:=(lambda2-lambda1)/(n-1);
  setcolor(farbe);
  for k:=0 to n-1 do
  line(95+round(30*(lambda1+k*delta)),330,95+round(30*(lambda1+k*delta)),360);
  x:=-270;
  repeat
    x:=x+dx;
    rechnung;
    putpixel(320+round(x),150-round(a),farbe);
    putpixel(320+round(x),300-round(a*a/a0*2),farbe);
  until x>=270;
end;

procedure bild;
begin
  farbe:=farbe2;
  b;
end;

procedure weg;
begin
  farbe:=farbe0;
{  setcolor(farbe);
  setfillstyle(1,farbe0);
  bar(50,50,600,401);
}
  b;
end;

procedure rechnung2;
begin
  a:=0;
  for k:=1 to n-1 do
  begin
  a:=a+a0/n*cos(k*pi/(n-1)-pi/2)*cos(k*pi/(n-1)-pi/2)*sin(2*pi/(lambda1+k*delta)*x);
  end;
end;

procedure b2;
begin
  delta:=(lambda2-lambda1)/(n-1);
  setcolor(farbe);
  for k:=0 to n-1 do
  begin
  x:=cos(k*pi/(n-1)-pi/2)*cos(k*pi/(n-1)-pi/2);
  line(95+round(30*(lambda1+k*delta)),360,95+round(30*(lambda1+k*delta)),360-round(30*x));
  end;
  x:=-270;
  repeat
    x:=x+dx;
    rechnung2;
    putpixel(320+round(x),150-round(2*a),farbe);
    putpixel(320+round(x),300-round(a*a/a0*8),farbe);
  until x>=270;
end;

procedure bild2;
begin
  farbe:=farbe2;
  b2;
end;

procedure weg2;
begin
  farbe:=farbe0;
{  setcolor(farbe);
  setfillstyle(1,farbe0);
  bar(50,50,600,401);
}
  b2;
end;


procedure auswahl;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    'n':
    begin
      if n>=3 then
      begin
        loesch1;
        weg;
        n:=n-1;
        setz1;
        bild;
      end;
      wahl:=' ';
    end;
    'N':
    begin
      loesch1;
      weg;
      n:=n+1;
      setz1;
      bild;
      wahl:=' ';
    end;
    'l':
    begin
      if lambda1>=1 then
      begin
        loesch;
        weg;
        lambda1:=lambda1-0.25;
        setz;
        bild;
      end;
      wahl:=' ';
    end;
    'L':
    begin
      if lambda1<=15 then
      begin
        loesch;
        weg;
        lambda1:=lambda1+0.25;
        setz;
        bild;
      end;
      wahl:=' ';
    end;
    'r':
    begin
      if lambda2>=1 then
      begin
        loesch;
        weg;
        lambda2:=lambda2-0.25;
        setz;
        bild;
      end;
      wahl:=' ';
    end;
    'R':
    begin
      if lambda2<=15 then
      begin
        loesch;
        weg;
        lambda2:=lambda2+0.25;
        setz;
        bild;
      end;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure auswahl2;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    'n':
    begin
      if n>=5 then
      begin
        loesch1;
        weg2;
        n:=n-2;
        setz1;
        bild2;
      end;
      wahl:=' ';
    end;
    'N':
    begin
      loesch1;
      weg2;
      n:=n+2;
      setz1;
      bild2;
      wahl:=' ';
    end;
    'l':
    begin
      if lambda1>=1 then
      begin
        loesch;
        weg2;
        lambda1:=lambda1-0.25;
        setz;
        bild2;
      end;
      wahl:=' ';
    end;
    'L':
    begin
      if lambda1<=15 then
      begin
        loesch;
        weg2;
        lambda1:=lambda1+0.25;
        setz;
        bild2;
      end;
      wahl:=' ';
    end;
    'r':
    begin
      if lambda2>=1 then
      begin
        loesch;
        weg2;
        lambda2:=lambda2-0.25;
        setz;
        bild2;
      end;
      wahl:=' ';
    end;
    'R':
    begin
      if lambda2<=15 then
      begin
        loesch;
        weg2;
        lambda2:=lambda2+0.25;
        setz;
        bild2;
      end;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure bewegung;
begin
  cleardevice;
    a0:=20;
    n:=11;
    lambda1:=9;
    lambda2:=10.5;
    delta:=lambda2-lambda1;
    x:=0;
    dx:=0.1;
    graphik;
    bild;
    setz;
    auswahl;
  menue;
end;

procedure bewegung2;
begin
  cleardevice;
    a0:=20;
    n:=11;
    lambda1:=9;
    lambda2:=10.5;
    delta:=lambda2-lambda1;
    x:=0;
    dx:=0.1;
    graphik2;
    bild2;
    setz;
    auswahl2;
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
    '1':bewegung;
    '2':bewegung2;
  end;
  until wahl1='b';
end.