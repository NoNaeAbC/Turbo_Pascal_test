program klasse7und8;

uses crt,graph;
var
  k,treiber,modus:integer;
  xs1,xs2,xs,ys,ys1,ys2,dx,a,b,c,d,x,y,x0,x1,y0,y1:real;
  wahl1,wahl:char;
  ortx10,ortx11,ortx8,ortx9,ortx7,ortx6,ortx1,ortx2,ortx3,ortx4,ortx5:string;

procedure setz;
begin
  setcolor(15);
  outtextxy(300,397,'-4');
  outtextxy(300,357,'-3');
  outtextxy(300,317,'-2');
  outtextxy(300,277,'-1');
  outtextxy(310,197,'1');
  outtextxy(310,157,'2');
  outtextxy(310,117,'3');
  outtextxy(310,77,'4');
  outtextxy(358,245,'1');
  outtextxy(398,245,'2');
  outtextxy(438,245,'3');
  outtextxy(478,245,'4');
  outtextxy(518,245,'5');
  outtextxy(558,245,'6');
  outtextxy(275,245,'-1');
  outtextxy(235,245,'-2');
  outtextxy(195,245,'-3');
  outtextxy(155,245,'-4');
  outtextxy(115,245,'-5');
  outtextxy(75,245,'-6');
  line(60,240,580,240);
  line(320,60,320,420);
  setlinestyle(1,0,1);
  line(60,280,580,280);
  line(60,320,580,320);
  line(60,360,580,360);
  line(60,400,580,400);
  line(60,200,580,200);
  line(60,160,580,160);
  line(60,120,580,120);
  line(60,80,580,80);
  line(360,60,360,420);
  line(400,60,400,420);
  line(440,60,440,420);
  line(480,60,480,420);
  line(520,60,520,420);
  line(560,60,560,420);
  line(80,60,80,420);
  line(120,60,120,420);
  line(160,60,160,420);
  line(200,60,200,420);
  line(240,60,240,420);
  line(280,60,280,420);
  setlinestyle(0,0,1);
end;


procedure graphik1;
begin
  setbkcolor(1);
  setcolor(15);
  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  outtextxy(235,15,'Gerade ');
  setcolor(14);
  outtextxy(235,15,'        y = a * x + b');
  setcolor(15);
      outtextxy(15,455,'a vergr”áern (A)         b vergr”áern (B)           a und b vorgeben (v)');
      outtextxy(15,465,' verkleinern (a)          verkleinern (b)        Startwerte (w)  beenden (x) ');
end;

procedure setz1;
begin
  x0:=-280;
  dx:=0.2;
  repeat
    x0:=x0+dx;
    y0:=a*x0+40*b;
    if (y0<=180) and (y0>=-180) then
      begin
        putpixel(320+round(x0),240-round(y0),14);
      end;
  until x0>=280;
  setcolor(14);
    str(a:4:2,ortx1);
    outtextxy(445,430,ortx1);
    str(b:4:2,ortx2);
    outtextxy(540,430,ortx2);
    outtextxy(410,430,'y =       * x +');
end;

procedure loesch1;
begin
  setcolor(1);
  x0:=-289;
  dx:=0.2;
  repeat
    x0:=x0+dx;
    y0:=a*x0+40*b;
    if (y0<=180) and (y0>=-180) then
      begin
        putpixel(320+round(x0),240-round(y0),1);
      end;
  until x0>=280;
    outtextxy(445,430,ortx1);
    outtextxy(540,430,ortx2);
end;

procedure ausgabe1;
begin
  a:=1;
  b:=0;
  setz;
  setz1;
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    'a':
    begin
      loesch1;
      a:=round(100*a-1)/100;
      setz;
      setz1;
      wahl:=' ';
    end;
    'A':
    begin
      loesch1;
      a:=round(100*a+1)/100;
      setz;
      setz1;
      wahl:=' ';
    end;
    'b':
    begin
      loesch1;
      b:=round(100*b-5)/100;
      setz;
      setz1;
      wahl:=' ';
    end;
    'B':
    begin
      loesch1;
      b:=round(100*b+5)/100;
      setz;
      setz1;
      wahl:=' ';
    end;
    'w':
    begin
      loesch1;
      a:=1;
      b:=0;
      setz;
      setz1;
      wahl:=' ';
    end;
    'v':
    begin
      loesch1;
      setz;
      setcolor(14);
      outtextxy(40,430,'a eingeben');
      read(a);
    str(a:4:2,ortx1);
    outtextxy(445,430,ortx1);
      setcolor(1);
      outtextxy(40,430,'a eingeben');
      setcolor(14);
      outtextxy(40,430,'b eingeben');
      read(b);
      cleardevice;
      graphik1;
      setz;
      setz1;
      wahl:=' ';
    end;
  end;
  until wahl='x';
end;


procedure graphik2;
begin
  setbkcolor(1);
  setcolor(15);
  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  outtextxy(70,15,'Schnittpunkt zweier Geraden                 und');
  setcolor(14);
  outtextxy(300,15,'y = a * x + b');
  setcolor(12);
  outtextxy(465,15,'y = c * x + d');
  setcolor(15);
      outtextxy(15,455,'a/c vergr”áern (A/C)     b/d vergr”áern (B/D)        a,b,c und d vorgeben (v)');
      outtextxy(15,463,' verkleinern (a/c)         verkleinern (b/d)      Startwerte (w)  beenden (x) ');
      setcolor(11);
      outtextxy(50,471,'Schnittpunkt angeben/l”schen (s/l)    Hilfsgerade setzen/l”schen (S/L)');
end;

procedure setz2a;
begin
  if (a=c) and (d=b) then
  begin
    setcolor(11);
    outtextxy(100,45,'Identische Geraden');
    setcolor(15);
  end;
  if (a=c) and (d<>b) then
  begin
    setcolor(11);
    outtextxy(100,45,'Kein Schnittpunkt');
    setcolor(15);
  end;
  if (a<>c) then
  begin
    setcolor(11);
    outtextxy(100,45,'S = (      ;       ) ');
    xs:=(d-b)/(a-c);
    ys:=a*xs+b;
    circle(320+round(40*xs),240-round(40*ys),2);
    str(xs:4:2,ortx5);
    str(ys:4:2,ortx6);
    outtextxy(145,45,ortx5);
    outtextxy(205,45,ortx6);
    setcolor(15);
  end;
end;

procedure loesch2a;
begin
    setcolor(1);
  if (a=c) and (d=b) then
    outtextxy(100,45,'Identische Geraden');
  if (a=c) and (d<>b) then
    outtextxy(100,45,'Kein Schnittpunkt');
  if (a<>c) then
  begin
    xs:=(d-b)/(a-c);
    ys:=a*xs+b;
    circle(320+round(40*xs),240-round(40*ys),2);
    outtextxy(100,45,'S = (      ;       ) ');
    outtextxy(145,45,ortx5);
    outtextxy(205,45,ortx6);
  end;
end;


procedure setz2b;
begin
  x0:=-289;
  dx:=1;
  repeat
    x0:=x0+dx;
    y0:=(a-c)*x0+40*(b-d);
    if (y0<=180) and (y0>=-180) then
      begin
        putpixel(320+round(x0),240-round(y0),11);
      end;
  until x0>=280;
  setcolor(11);
  outtextxy(110,435,'y =       * x +');
  str((a-c):4:2,ortx10);
  outtextxy(145,435,ortx10);
  str((b-d):4:2,ortx11);
  outtextxy(240,435,ortx11);

  if (a<>c) then
  begin
    setlinestyle(1,0,1);
    xs:=(d-b)/(a-c);
    ys:=a*xs+b;
    line(320+round(40*xs),240,320+round(40*xs),240-round(40*ys));
    circle(320+round(40*xs),240,2);
    circle(320+round(40*xs),240-round(40*ys),2);
    setlinestyle(0,0,1);
    setcolor(15);
  end;
end;

procedure loesch2b;
begin
  x0:=-289;
  dx:=1;
  repeat
    x0:=x0+dx;
    y0:=(a-c)*x0+40*(b-d);
    if (y0<=180) and (y0>=-180) then
      begin
        putpixel(320+round(x0),240-round(y0),1);
      end;
  until x0>=280;
  setcolor(1);
  outtextxy(110,435,'y =       * x +');
  outtextxy(145,435,ortx10);
  outtextxy(240,435,ortx11);

  if (a<>c) then
  begin
    setlinestyle(1,0,1);
    xs:=(d-b)/(a-c);
    ys:=a*xs+b;
    line(320+round(40*xs),240,320+round(40*xs),240-round(40*ys));
    circle(320+round(40*xs),240,2);
    circle(320+round(40*xs),240-round(40*ys),2);
    setlinestyle(0,0,1);
  end;
end;


procedure setz2;
begin
  x0:=-280;
  dx:=0.2;
  repeat
    x0:=x0+dx;
    y0:=a*x0+40*b;
    if (y0<=180) and (y0>=-180) then
      begin
        putpixel(320+round(x0),240-round(y0),14);
      end;
  until x0>=280;
  x0:=-280;
  dx:=0.2;
  repeat
    x0:=x0+dx;
    y:=c*x0+40*d;
    if (y<=180) and (y>=-180) then
      begin
        putpixel(320+round(x0),240-round(y),12);
      end;
  until x0>=280;
  setcolor(12);
    str(c:4:2,ortx3);
    outtextxy(445,440,ortx3);
    str(d:4:2,ortx4);
    outtextxy(540,440,ortx4);
    outtextxy(410,440,'y =       * x +');
  setcolor(14);
    str(a:4:2,ortx1);
    outtextxy(445,430,ortx1);
    str(b:4:2,ortx2);
    outtextxy(540,430,ortx2);
    outtextxy(410,430,'y =       * x +');
end;

procedure loesch2;
begin
  setcolor(1);
  x0:=-289;
  dx:=0.2;
  repeat
    x0:=x0+dx;
    y:=c*x0+40*d;
    if (y<=180) and (y>=-180) then
      begin
        putpixel(320+round(x0),240-round(y),1);
      end;
  until x0>=280;
    outtextxy(445,440,ortx3);
    outtextxy(540,440,ortx4);
  x0:=-289;
  dx:=0.2;
  repeat
    x0:=x0+dx;
    y0:=a*x0+40*b;
    if (y0<=180) and (y0>=-180) then
      begin
        putpixel(320+round(x0),240-round(y0),1);
      end;
  until x0>=280;
    outtextxy(445,430,ortx1);
    outtextxy(540,430,ortx2);
loesch2a;
loesch2b;
end;

procedure ausgabe2;
begin
  a:=1;
  b:=0;
  c:=-1;
  d:=0;
  setz;
  setz2;
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    'a':
    begin
      loesch2;
      a:=round(100*a-5)/100;
      setz;
      setz2;
      wahl:=' ';
    end;
    'A':
    begin
      loesch2;
      a:=round(100*a+5)/100;
      setz;
      setz2;
      wahl:=' ';
    end;
    'b':
    begin
      loesch2;
      b:=round(100*b-5)/100;
      setz;
      setz2;
      wahl:=' ';
    end;
    'B':
    begin
      loesch2;
      b:=round(100*b+5)/100;
      setz;
      setz2;
      wahl:=' ';
    end;
    'c':
    begin
      loesch2;
      c:=round(100*c-5)/100;
      setz;
      setz2;
      wahl:=' ';
    end;
    'C':
    begin
      loesch2;
      c:=round(100*c+5)/100;
      setz;
      setz2;
      wahl:=' ';
    end;
    'd':
    begin
      loesch2;
      d:=round(100*d-5)/100;
      setz;
      setz2;
      wahl:=' ';
    end;
    'D':
    begin
      loesch2;
      d:=round(100*d+5)/100;
      setz;
      setz2;
      wahl:=' ';
    end;
    'S':
    begin
      setz2b;
      wahl:=' ';
    end;
    'L':
    begin
      loesch2b;
      setz;
      wahl:=' ';
    end;
    's':
    begin
      setz2a;
      wahl:=' ';
    end;
    'l':
    begin
      loesch2a;
      wahl:=' ';
    end;
    'w':
    begin
      loesch2;
      a:=1;
      b:=0;
      c:=-1;
      d:=0;
      setz;
      setz2;
      wahl:=' ';
    end;
    'v':
    begin
      loesch2;
      setz;
      setcolor(14);
      outtextxy(40,430,'a eingeben');
      read(a);
    str(a:4:2,ortx1);
    outtextxy(445,430,ortx1);
      setcolor(1);
      outtextxy(40,430,'a eingeben');
      setcolor(14);
      outtextxy(40,430,'b eingeben');
      read(b);
    str(b:4:2,ortx2);
    outtextxy(540,430,ortx2);
      setcolor(1);
      outtextxy(40,430,'b eingeben');
      setcolor(12);
      outtextxy(40,440,'c eingeben');
      read(c);
    str(c:4:2,ortx3);
    outtextxy(445,440,ortx3);
      setcolor(1);
      outtextxy(40,440,'c eingeben');
      setcolor(12);
      outtextxy(40,440,'d eingeben');
      read(d);
      cleardevice;
      graphik2;
      setz;
      setz2;
      wahl:=' ';
    end;
    end;
    until wahl='x';
end;

procedure graphik3;
begin
  setbkcolor(1);
  setcolor(15);
  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  outtextxy(190,15,'Parabel');
  setcolor(12);
  outtextxy(280,15,'y = a * xý + b * x + c');
  setcolor(15);
      outtextxy(5,455,'a/b/c vergr”áern(A/B/C)  a,b und c vorgeben(v)  Startwerte wiederherstellen(w)');
      outtextxy(5,463,' verkleinern (a/b/c)                                             beenden (x) ');
  setcolor(9);
      outtextxy(5,463,'                          Hilfsparabel setzen/l”schen (s/l)');
  setcolor(11);
    outtextxy(200,471,'Nullstellen angeben/l”schen (n/m)');
end;

procedure setz3;
begin
  setcolor(15);
  x0:=-280;
  dx:=0.2;
  repeat
    x0:=x0+dx;
    x:=x0/40;
    y0:=40*(a*x*x+b*x+c);
    if (y0<=180) and (y0>=-180) then
      begin
        putpixel(320+round(x0),240-round(y0),12);
      end;
  until x0>=280;
  setcolor(12);
    str(a:4:2,ortx1);
    outtextxy(90,430,ortx1);
    outtextxy(345,430,ortx1);
    str(b:4:2,ortx2);
    outtextxy(190,430,ortx2);
    str(c:4:2,ortx3);
    outtextxy(280,430,ortx3);
    if a<>0 then
    begin
      str((b/2/a):4:2,ortx4);
      outtextxy(450,430,ortx4);
      str((c-b*b/4/a):4:2,ortx5);
      outtextxy(530,430,ortx5);
    end;
    outtextxy(50,430,'y =       * xý +       * x +      =       * ( x +      )ý + ');
end;

procedure setz3a;
begin
  x0:=-280;
  dx:=0.2;
  repeat
    x0:=x0+dx;
    x:=x0/40;
    y1:=40*(-x*x*a+c);
    if (y1<=180) and (y1>=-180) then
      begin
        putpixel(320+round(x0),240-round(y1),9);
      end;
  until x0>=280;
end;

procedure loesch3;
begin
  setcolor(1);
  x0:=-280;
  dx:=0.2;
  repeat
    x0:=x0+dx;
    x:=x0/40;
    y0:=40*(a*x*x+b*x+c);
    if (y0<=180) and (y0>=-180) then
      begin
        putpixel(320+round(x0),240-round(y0),1);
      end;
  until x0>=280;
    outtextxy(90,430,ortx1);
    outtextxy(190,430,ortx2);
    outtextxy(280,430,ortx3);
    outtextxy(345,430,ortx1);
    outtextxy(190,430,ortx2);
    outtextxy(280,430,ortx3);
    outtextxy(450,430,ortx4);
    outtextxy(530,430,ortx5);
end;

procedure loesch3a;
begin
  x0:=-280;
  dx:=0.2;
  repeat
    x0:=x0+dx;
    x:=x0/40;
    y1:=40*(-x*x*a+c);
    if (y1<=180) and (y1>=-180) then
      begin
        putpixel(320+round(x0),240-round(y1),1);
      end;
  until x0>=280;
end;

procedure setz3b;
begin
  setcolor(11);
  if (a=0) and (b=0) and (c=0) then
  begin
  outtextxy(155,45,'Die Nullstellen sind');
    outtextxy(330,45,'Alle Punkte der  x - Achse');
  end;
  if (a=0) and (b=0) and (c<>0) then
  begin
    outtextxy(330,45,'Keine Nullstelle')
  end;
  if (a=0) and (b<>0) then
  begin
  outtextxy(165,45,'Die Nullstelle ist');
    outtextxy(330,45,'x = ');
    xs:=-c/b;
    str(xs:4:2,ortx6);
    outtextxy(365,45,ortx6);
  end;
  if (a<>0) and (sqr(b/2/a) < c/a) then
  begin
    outtextxy(330,45,'Keine Nullstelle');
  end;
  if (a<>0) and (sqr(b/2/a) = c/a) then
  begin
  outtextxy(165,45,'Die Nullstelle ist');
    outtextxy(330,45,'x = ');
    xs:=-b/2/a;
    str(xs:4:2,ortx6);
    outtextxy(365,45,ortx6);
  end;
  if (a<>0) and (sqr(b/2/a) > c/a) then
  begin
  outtextxy(155,45,'Die Nullstellen sind');
    outtextxy(330,45,'x =        und  x = ');
    xs1:=-b/2/a-sqrt(sqr(b/2/a)-c/a);
    xs2:=-b/2/a+sqrt(sqr(b/2/a)-c/a);
    str(xs1:4:2,ortx6);
    outtextxy(365,45,ortx6);
    str(xs2:4:2,ortx7);
    outtextxy(490,45,ortx7);
  end;
end;

procedure loesch3b;
begin
  setcolor(1);
  if (a=0) and (b=0) and (c=0) then
  begin
  outtextxy(155,45,'Die Nullstellen sind');
    outtextxy(330,45,'Alle Punkte der  x - Achse');
  end;
  if (a=0) and (b=0) and (c<>0) then
  begin
    outtextxy(330,45,'Keine Nullstelle')
  end;
  if (a=0) and (b<>0) then
  begin
  outtextxy(165,45,'Die Nullstelle ist');
    outtextxy(330,45,'x = ');
    outtextxy(365,45,ortx6);
  end;
  if (a<>0) and (sqr(b/2/a) < c/a) then
  begin
    outtextxy(330,45,'Keine Nullstelle');
  end;
  if (a<>0) and (sqr(b/2/a) = c/a) then
  begin
  outtextxy(165,45,'Die Nullstelle ist');
    outtextxy(330,45,'x = ');
    outtextxy(365,45,ortx6);
  end;
  if (a<>0) and (sqr(b/2/a) > c/a) then
  begin
  outtextxy(155,45,'Die Nullstellen sind');
    outtextxy(330,45,'x =        und  x = ');
    outtextxy(365,45,ortx6);
    outtextxy(490,45,ortx7);
  end;
end;

procedure setz3c;
begin
  setcolor(11);
  if (a=0) and (b<>0) then
  begin
    xs:=-c/b;
    circle(320+round(40*xs),240,2);
  end;
  if (a<>0) and (sqr(b/2/a) = c/a) then
  begin
    xs:=-b/2/a;
    circle(320+round(40*xs),240,2);
  end;
  if (a<>0) and (sqr(b/2/a) > c/a) then
  begin
    xs1:=-b/2/a-sqrt(sqr(b/2/a)-c/a);
    xs2:=-b/2/a+sqrt(sqr(b/2/a)-c/a);
    circle(320+round(40*xs1),240,2);
    circle(320+round(40*xs2),240,2);
  end;
end;

procedure loesch3c;
begin
  setcolor(1);
  if (a=0) and (b<>0) then
  begin
    xs:=-c/b;
    circle(320+round(40*xs),240,2);
  end;
  if (a<>0) and (sqr(b/2/a) = c/a) then
  begin
    xs:=-b/2/a;
    circle(320+round(40*xs),240,2);
  end;
  if (a<>0) and (sqr(b/2/a) > c/a) then
  begin
    xs1:=-b/2/a-sqrt(sqr(b/2/a)-c/a);
    xs2:=-b/2/a+sqrt(sqr(b/2/a)-c/a);
    circle(320+round(40*xs1),240,2);
    circle(320+round(40*xs2),240,2);
  end;
end;


procedure ausgabe3;
begin
  a:=1;
  b:=0;
  c:=0;
  setz;
  setz3;
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    'n':
    begin
      setz3b;
      setz3c;
      wahl:=' ';
    end;
    'm':
    begin
      loesch3b;
      loesch3c;
      wahl:=' ';
    end;
    's':
    begin
      setz3a;
      wahl:=' ';
    end;
    'l':
    begin
      loesch3a;
      wahl:=' ';
    end;
    'a':
    begin
      loesch3;
      loesch3a;
      loesch3b;
      loesch3c;
      a:=round(100*a-1)/100;
      setz;
      setz3;
      wahl:=' ';
    end;
    'A':
    begin
      loesch3;
      loesch3a;
      loesch3b;
      loesch3c;
      a:=round(100*a+1)/100;
      setz;
      setz3;
      wahl:=' ';
    end;
    'b':
    begin
      loesch3;
      loesch3b;
      loesch3c;
      b:=round(100*b-5)/100;
      setz;
      setz3;
      wahl:=' ';
    end;
    'B':
    begin
      loesch3;
      loesch3b;
      loesch3c;
      b:=round(100*b+5)/100;
      setz;
      setz3;
      wahl:=' ';
    end;
    'c':
    begin
      loesch3;
      loesch3a;
      loesch3b;
      loesch3c;
      c:=round(100*c-5)/100;
      setz;
      setz3;
      wahl:=' ';
    end;
    'C':
    begin
      loesch3;
      loesch3a;
      loesch3b;
      loesch3c;
      c:=round(100*c+5)/100;
      setz;
      setz3;
      wahl:=' ';
    end;
    'w':
    begin
      loesch3;
      loesch3a;
      loesch3b;
      loesch3c;
      a:=1;
      b:=0;
      c:=0;
      setz;
      setz3;
      wahl:=' ';
    end;
    'v':
    begin
      loesch3;
      loesch3a;
      loesch3b;
      loesch3c;
      setcolor(12);
      outtextxy(20,400,'a eingeben');
      read(a);
      outtextxy(20,410,'b eingeben');
      read(b);
      outtextxy(20,420,'c eingeben');
      read(c);
      cleardevice;
      graphik3;
      setz;
      setz3;
      wahl:=' ';
    end;
  end;
  until wahl='x';
end;

procedure graphik4;
begin
  setbkcolor(1);
  setcolor(15);
  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  outtextxy(60,15,'Schnittpunkt von Parabel               und Gerade');
  setcolor(12);
  outtextxy(270,15,'y = a * xý ');
  setcolor(14);
  outtextxy(480,15,'y = b * x + c');
  setcolor(15);
      outtextxy(5,455,'a/b/c vergr”áern(A/B/C)  a,b und c vorgeben(v)  Startwerte wiederherstellen(w)');
      outtextxy(5,463,' verkleinern (a/b/c)                                             beenden (x) ');
  setcolor(9);
      outtextxy(5,463,'                          Hilfsparabel setzen/l”schen (s/l)       ');

  setcolor(11);
    outtextxy(200,471,'Schnittpunkte angeben/l”schen (n/m)');
end;

procedure setz4;
begin
  setcolor(15);
  x0:=-280;
  dx:=0.2;
  repeat
    x0:=x0+dx;
    x:=x0/40;
    y0:=40*(a*x*x);
    if (y0<=180) and (y0>=-180) then
      begin
        putpixel(320+round(x0),240-round(y0),12);
      end;
  until x0>=280;
  x0:=-280;
  dx:=0.2;
  repeat
    x0:=x0+dx;
    x:=x0/40;
    y0:=40*(b*x+c);
    if (y0<=180) and (y0>=-180) then
      begin
        putpixel(320+round(x0),240-round(y0),14);
      end;
  until x0>=280;

  setcolor(12);
    str(a:4:2,ortx1);
    outtextxy(230,430,ortx1);
    outtextxy(190,430,'y =       * xý  ');
  setcolor(14);
    str(b:4:2,ortx2);
    outtextxy(390,430,ortx2);
    str(c:4:2,ortx3);
    outtextxy(475,430,ortx3);
    outtextxy(350,430,'y =       * x + ');
end;

procedure setz4a;
begin
  x0:=-280;
  dx:=0.2;
  repeat
    x0:=x0+dx;
    x:=x0/40;
    y1:=40*(a*x*x-b*x-c);
    if (y1<=180) and (y1>=-180) then
      begin
        putpixel(320+round(x0),240-round(y1),9);
      end;
  until x0>=280;
end;

procedure loesch4a;
begin
  x0:=-280;
  dx:=0.2;
  repeat
    x0:=x0+dx;
    x:=x0/40;
    y1:=40*(a*x*x-b*x-c);
    if (y1<=180) and (y1>=-180) then
      begin
        putpixel(320+round(x0),240-round(y1),1);
      end;
  until x0>=280;
end;

procedure setz4c;
begin
  setcolor(11);
  setlinestyle(1,0,1);
  if (a=0) and (b<>0) then
  begin
    xs:=-c/b;
    line(320+round(40*xs),60,320+round(40*xs),420);
    circle(320+round(40*xs),240,2);
    circle(320+round(40*xs),240-round(40*ys),2);
  end;
  if (a<>0) and (-sqr(b/2/a) = c/a) then
  begin
    xs:=b/2/a;
    line(320+round(40*xs),60,320+round(40*xs),420);
    circle(320+round(40*xs),240,2);
    circle(320+round(40*xs),240-round(40*ys),2);
  end;
  if (a<>0) and (sqr(b/2/a) > -c/a) then
  begin
    xs1:=b/2/a-sqrt(sqr(b/2/a)+c/a);
    xs2:=b/2/a+sqrt(sqr(b/2/a)+c/a);
    line(320+round(40*xs1),60,320+round(40*xs1),420);
    line(320+round(40*xs2),60,320+round(40*xs2),420);
    circle(320+round(40*xs1),240,2);
    circle(320+round(40*xs2),240,2);
    circle(320+round(40*xs1),240-round(40*ys1),2);
    circle(320+round(40*xs2),240-round(40*ys2),2);
  end;
  setlinestyle(0,0,1);
end;

procedure loesch4c;
begin
  setcolor(1);
  setlinestyle(1,0,1);
  if (a=0) and (b<>0) then
  begin
    xs:=-c/b;
    line(320+round(40*xs),60,320+round(40*xs),420);
    circle(320+round(40*xs),240-round(40*ys),2);
    circle(320+round(40*xs),240,2);
  end;
  if (a<>0) and (-sqr(b/2/a) = c/a) then
  begin
    xs:=b/2/a;
    line(320+round(40*xs),60,320+round(40*xs),420);
    circle(320+round(40*xs),240,2);
    circle(320+round(40*xs),240-round(40*ys),2);
  end;
  if (a<>0) and (sqr(b/2/a) > -c/a) then
  begin
    xs1:=b/2/a-sqrt(sqr(b/2/a)+c/a);
    xs2:=b/2/a+sqrt(sqr(b/2/a)+c/a);
    line(320+round(40*xs1),60,320+round(40*xs1),420);
    line(320+round(40*xs2),60,320+round(40*xs2),420);
    circle(320+round(40*xs1),240,2);
    circle(320+round(40*xs2),240,2);
    circle(320+round(40*xs1),240-round(40*ys1),2);
    circle(320+round(40*xs2),240-round(40*ys2),2);
  end;
  setlinestyle(0,0,1);
end;

procedure setz4b;
begin
  setcolor(11);
  if (a=0) and (b=0) and (c=0) then
  begin
  outtextxy(155,45,'Die Schnittpunkte sind alle Punkte der  x - Achse');
  end;
  if (a=0) and (b=0) and (c<>0) then
  begin
    outtextxy(330,45,'Kein Schnittpunkt')
  end;
  if (a=0) and (b<>0) then
  begin
  outtextxy(155,45,'Der Schnittpunkt ist');
    outtextxy(330,45,'S = (      ;      ) ');
    xs:=-c/b;
    ys:=a*xs*xs;
    circle(320+round(40*xs),240-round(40*ys),2);
    str(xs:4:2,ortx6);
    outtextxy(375,45,ortx6);
    str(ys:4:2,ortx8);
    outtextxy(435,45,ortx8);
  end;
  if (a<>0) and (sqr(b/2/a) < -c/a) then
  begin
    outtextxy(330,45,'Kein Schnittpunkt');
  end;
  if (a<>0) and (sqr(b/2/a) = -c/a) then
  begin
  outtextxy(155,45,'Der Schnittpunkt ist');
    outtextxy(330,45,'S = (      ;      )');
    xs:=b/2/a;
    ys:=a*xs*xs;
    circle(320+round(40*xs),240-round(40*ys),2);
    str(xs:4:2,ortx6);
    outtextxy(375,45,ortx6);
    str(ys:4:2,ortx8);
    outtextxy(435,45,ortx8);
  end;
  if (a<>0) and (sqr(b/2/a) > -c/a) then
  begin
  outtextxy(55,45,'Die Schnittpunkte sind');
    outtextxy(250,45,'S = (      ;      )  und  S = (      ;      )');
    xs1:=b/2/a-sqrt(sqr(b/2/a)+c/a);
    xs2:=b/2/a+sqrt(sqr(b/2/a)+c/a);
    ys1:=a*xs1*xs1;
    ys2:=a*xs2*xs2;
    circle(320+round(40*xs1),240-round(40*ys1),2);
    circle(320+round(40*xs2),240-round(40*ys2),2);
    str(xs1:4:2,ortx6);
    outtextxy(295,45,ortx6);
    str(xs2:4:2,ortx7);
    outtextxy(500,45,ortx7);
    str(ys1:4:2,ortx8);
    outtextxy(355,45,ortx8);
    str(ys2:4:2,ortx9);
    outtextxy(560,45,ortx9);
  end;
end;

procedure loesch4b;
begin
  setcolor(1);
  if (a=0) and (b=0) and (c=0) then
  begin
  outtextxy(155,45,'Die Schnittpunkte sind alle Punkte der  x - Achse');
  end;
  if (a=0) and (b=0) and (c<>0) then
  begin
    outtextxy(330,45,'Kein Schnittpunkt')
  end;
  if (a=0) and (b<>0) then
  begin
  outtextxy(155,45,'Der Schnittpunkt ist');
    outtextxy(330,45,'S = (      ;      ) ');
    xs:=-c/b;
    ys:=a*xs*xs;
    circle(320+round(40*xs),240-round(40*ys),2);
    outtextxy(375,45,ortx6);
    outtextxy(435,45,ortx8);
  end;
  if (a<>0) and (sqr(b/2/a) < -c/a) then
  begin
    outtextxy(330,45,'Kein Schnittpunkt');
  end;
  if (a<>0) and (sqr(b/2/a) = -c/a) then
  begin
  outtextxy(155,45,'Der Schnittpunkt ist');
    outtextxy(330,45,'S = (      ;      )');
    xs:=b/2/a;
    ys:=a*xs*xs;
    circle(320+round(40*xs),240-round(40*ys),2);
    outtextxy(375,45,ortx6);
    outtextxy(435,45,ortx8);
  end;
  if (a<>0) and (sqr(b/2/a) > -c/a) then
  begin
  outtextxy(55,45,'Die Schnittpunkte sind');
    outtextxy(250,45,'S = (      ;      )  und  S = (      ;      )');
    xs1:=b/2/a-sqrt(sqr(b/2/a)+c/a);
    xs2:=b/2/a+sqrt(sqr(b/2/a)+c/a);
    ys1:=a*xs1*xs1;
    ys2:=a*xs2*xs2;
    circle(320+round(40*xs1),240-round(40*ys1),2);
    circle(320+round(40*xs2),240-round(40*ys2),2);
    outtextxy(295,45,ortx6);
    outtextxy(500,45,ortx7);
    outtextxy(355,45,ortx8);
    outtextxy(560,45,ortx9);
  end;
end;

procedure loesch4;
begin
  setcolor(1);
  x0:=-280;
  dx:=0.2;
  repeat
    x0:=x0+dx;
    x:=x0/40;
    y0:=40*(a*x*x);
    if (y0<=180) and (y0>=-180) then
      begin
        putpixel(320+round(x0),240-round(y0),1);
      end;
  until x0>=280;
  x0:=-280;
  dx:=0.2;
  repeat
    x0:=x0+dx;
    x:=x0/40;
    y0:=40*(b*x+c);
    if (y0<=180) and (y0>=-180) then
      begin
        putpixel(320+round(x0),240-round(y0),1);
      end;
  until x0>=280;
    outtextxy(230,430,ortx1);
    outtextxy(390,430,ortx2);
    outtextxy(475,430,ortx3);
  loesch4a;
  loesch4b;
  loesch4c;
end;


procedure ausgabe4;
begin
  a:=1;
  b:=1;
  c:=2;
  setz;
  setz4;
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    'n':
    begin
      setz4b;
      wahl:=' ';
    end;
    'm':
    begin
      loesch4b;
      setz;
      wahl:=' ';
    end;
    's':
    begin
      setz4a;
      setz4c;
      wahl:=' ';
    end;
    'l':
    begin
      loesch4a;
      loesch4c;
      setz;
      wahl:=' ';
    end;
    'a':
    begin
      loesch4;
      a:=round(100*a-1)/100;
      setz;
      setz4;
      wahl:=' ';
    end;
    'A':
    begin
      loesch4;
      a:=round(100*a+1)/100;
      setz;
      setz4;
      wahl:=' ';
    end;
    'b':
    begin
      loesch4;
      b:=round(100*b-5)/100;
      setz;
      setz4;
      wahl:=' ';
    end;
    'B':
    begin
      loesch4;
      b:=round(100*b+5)/100;
      setz;
      setz4;
      wahl:=' ';
    end;
    'c':
    begin
      loesch4;
      c:=round(100*c-5)/100;
      setz;
      setz4;
      wahl:=' ';
    end;
    'C':
    begin
      loesch4;
      c:=round(100*c+5)/100;
      setz;
      setz4;
      wahl:=' ';
    end;
    'w':
    begin
      loesch4;
      a:=1;
      b:=1;
      c:=2;
      setz;
      setz4;
      wahl:=' ';
    end;
    'v':
    begin
      loesch4;
      setz;
      setcolor(12);
      outtextxy(20,400,'a eingeben');
      read(a);
      outtextxy(20,410,'b eingeben');
      read(b);
      outtextxy(20,420,'c eingeben');
      read(c);
      cleardevice;
      graphik4;
      setz;
      setz4;
      wahl:=' ';
    end;
  end;
  until wahl='x';
end;

procedure graphik5;
begin
  setbkcolor(1);
  setcolor(15);
  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  outtextxy(20,15,'Parabel                als Schnitt von Parabel          und Gerade ');
  setcolor(12);
  outtextxy(20,15,'         y=a*xý+b*x+c ');
  setcolor(14);
  outtextxy(20,15,'                                                y=a*xý              y=-b*x-c');
  setcolor(15);
      outtextxy(5,455,'a/b/c vergr”áern(A/B/C)  a,b und c vorgeben(v)  Startwerte wiederherstellen(w)');
      outtextxy(5,463,' verkleinern (a/b/c)                                             beenden (x) ');
  setcolor(14);
      outtextxy(5,463,'                        Parabel & Gerade setzen/l”schen (s/l)       ');

  setcolor(11);
    outtextxy(150,471,'Nullstellen/Schnittpunkte angeben/l”schen (n/m)');
end;

procedure setz5;
begin
  setcolor(15);
  x0:=-280;
  dx:=0.2;
  repeat
    x0:=x0+dx;
    x:=x0/40;
    y0:=40*(a*x*x+b*x+c);
    if (y0<=180) and (y0>=-180) then
      begin
        putpixel(320+round(x0),240-round(y0),12);
      end;
  until x0>=280;

  setcolor(12);
    str(a:4:2,ortx1);
    outtextxy(65,430,ortx1);
    str(b:4:2,ortx2);
    outtextxy(165,430,ortx2);
    str(c:4:2,ortx3);
    outtextxy(255,430,ortx3);
    outtextxy(30,430,'y =       * xý +      * x +');
  setcolor(14);
    outtextxy(355,430,ortx1);
    outtextxy(320,430,'y =       * xý  ');
    str(-b:4:2,ortx10);
    outtextxy(495,430,ortx10);
    str(-c:4:2,ortx11);
    outtextxy(585,430,ortx11);
    outtextxy(440,430,'; y =       * x + ');
end;

procedure setz5a;
begin
  x0:=-280;
  dx:=0.2;
  repeat
    x0:=x0+dx;
    x:=x0/40;
    y0:=40*(a*x*x);
    if (y0<=180) and (y0>=-180) then
      begin
        putpixel(320+round(x0),240-round(y0),14);
      end;
  until x0>=280;
  x0:=-280;
  dx:=0.2;
  repeat
    x0:=x0+dx;
    x:=x0/40;
    y0:=40*(-b*x-c);
    if (y0<=180) and (y0>=-180) then
      begin
        putpixel(320+round(x0),240-round(y0),14);
      end;
  until x0>=280;
end;


procedure loesch5a;
begin
  x0:=-280;
  dx:=0.2;
  repeat
    x0:=x0+dx;
    x:=x0/40;
    y0:=40*(a*x*x);
    if (y0<=180) and (y0>=-180) then
      begin
        putpixel(320+round(x0),240-round(y0),1);
      end;
  until x0>=280;
  x0:=-280;
  dx:=0.2;
  repeat
    x0:=x0+dx;
    x:=x0/40;
    y0:=40*(-b*x-c);
    if (y0<=180) and (y0>=-180) then
      begin
        putpixel(320+round(x0),240-round(y0),1);
      end;
  until x0>=280;
end;

procedure setz5c;
begin
  setcolor(11);
  if (a=0) and (b=0) and (c=0) then
  begin
  outtextxy(155,45,'Die Schnittpunkte sind alle Punkte der  x - Achse');
  end;
  if (a=0) and (b=0) and (c<>0) then
  begin
    outtextxy(330,45,'Keine Nullstelle , kein Schnittpunkt')
  end;
  setlinestyle(1,0,1);
  if (a=0) and (b<>0) then
  begin
  outtextxy(155,45,'Der Schnittpunkt ist');
    outtextxy(330,45,'S = (      ;      ) ');
    xs:=-c/b;
    ys:=a*xs*xs;
    str(xs:4:2,ortx6);
    outtextxy(375,45,ortx6);
    str(ys:4:2,ortx8);
    outtextxy(435,45,ortx8);
    line(320+round(40*xs),60,320+round(40*xs),420);
    circle(320+round(40*xs),240,2);
  end;
  if (a<>0) and (sqr(b/2/a) < c/a) then
  begin
    outtextxy(330,45,'Keine Nullstelle, kein Schnittpunkt');
  end;
  if (a<>0) and (sqr(b/2/a) = c/a) then
  begin
  outtextxy(155,45,'Der Schnittpunkt ist');
    outtextxy(330,45,'S = (      ;      )');
    xs:=-b/2/a;
    ys:=a*xs*xs;
    str(xs:4:2,ortx6);
    outtextxy(375,45,ortx6);
    str(ys:4:2,ortx8);
    outtextxy(435,45,ortx8);
    line(320+round(40*xs),60,320+round(40*xs),420);
    circle(320+round(40*xs),240,2);
  end;
  if (a<>0) and (sqr(b/2/a) > c/a) then
  begin
  outtextxy(55,45,'Die Schnittpunkte sind');
    outtextxy(250,45,'S = (      ;      )  und  S = (      ;      )');
    xs1:=-b/2/a-sqrt(sqr(b/2/a)-c/a);
    xs2:=-b/2/a+sqrt(sqr(b/2/a)-c/a);
    ys1:=a*xs1*xs1;
    ys2:=a*xs2*xs2;
    str(xs1:4:2,ortx6);
    outtextxy(295,45,ortx6);
    str(xs2:4:2,ortx7);
    outtextxy(500,45,ortx7);
    str(ys1:4:2,ortx8);
    outtextxy(355,45,ortx8);
    str(ys2:4:2,ortx9);
    outtextxy(560,45,ortx9);
    line(320+round(40*xs1),60,320+round(40*xs1),420);
    line(320+round(40*xs2),60,320+round(40*xs2),420);
    circle(320+round(40*xs1),240,2);
    circle(320+round(40*xs2),240,2);
  end;
  setlinestyle(0,0,1);
end;

procedure loesch5c;
begin
  setcolor(1);
  if (a=0) and (b=0) and (c=0) then
  begin
  outtextxy(155,45,'Die Schnittpunkte sind alle Punkte der  x - Achse');
  end;
  if (a=0) and (b=0) and (c<>0) then
  begin
    outtextxy(330,45,'Keine Nullstelle , kein Schnittpunkt')
  end;
  setlinestyle(1,0,1);
  if (a=0) and (b<>0) then
  begin
  outtextxy(155,45,'Der Schnittpunkt ist');
    outtextxy(330,45,'S = (      ;      ) ');
    xs:=-c/b;
    ys:=a*xs*xs;
    outtextxy(375,45,ortx6);
    outtextxy(435,45,ortx8);
    line(320+round(40*xs),60,320+round(40*xs),420);
    circle(320+round(40*xs),240,2);
  end;
  if (a<>0) and (sqr(b/2/a) < c/a) then
  begin
    outtextxy(330,45,'Keine Nullstelle, kein Schnittpunkt');
  end;
  if (a<>0) and (sqr(b/2/a) = c/a) then
  begin
  outtextxy(155,45,'Der Schnittpunkt ist');
    outtextxy(330,45,'S = (      ;      )');
    xs:=-b/2/a;
    ys:=a*xs*xs;
    outtextxy(375,45,ortx6);
    outtextxy(435,45,ortx8);
    line(320+round(40*xs),60,320+round(40*xs),420);
    circle(320+round(40*xs),240,2);
  end;
  if (a<>0) and (sqr(b/2/a) > c/a) then
  begin
  outtextxy(55,45,'Die Schnittpunkte sind');
    outtextxy(250,45,'S = (      ;      )  und  S = (      ;      )');
    xs1:=-b/2/a-sqrt(sqr(b/2/a)-c/a);
    xs2:=-b/2/a+sqrt(sqr(b/2/a)-c/a);
    ys1:=a*xs1*xs1;
    ys2:=a*xs2*xs2;
    outtextxy(295,45,ortx6);
    outtextxy(500,45,ortx7);
    outtextxy(355,45,ortx8);
    outtextxy(560,45,ortx9);
    line(320+round(40*xs1),60,320+round(40*xs1),420);
    line(320+round(40*xs2),60,320+round(40*xs2),420);
    circle(320+round(40*xs1),240,2);
    circle(320+round(40*xs2),240,2);
  end;
  setlinestyle(0,0,1);
end;

procedure setz5b;
begin
  setcolor(11);
  if (a=0) and (b<>0) then
  begin
    xs:=-c/b;
    ys:=a*xs*xs;
    circle(320+round(40*xs),240-round(40*ys),2);
  end;
  if (a<>0) and (sqr(b/2/a) = c/a) then
  begin
    xs:=-b/2/a;
    ys:=a*xs*xs;
    circle(320+round(40*xs),240-round(40*ys),2);
  end;
  if (a<>0) and (sqr(b/2/a) > c/a) then
  begin
    xs1:=-b/2/a-sqrt(sqr(b/2/a)-c/a);
    xs2:=-b/2/a+sqrt(sqr(b/2/a)-c/a);
    ys1:=a*xs1*xs1;
    ys2:=a*xs2*xs2;
    circle(320+round(40*xs1),240-round(40*ys1),2);
    circle(320+round(40*xs2),240-round(40*ys2),2);
  end;
end;

procedure loesch5b;
begin
  setcolor(1);
  if (a=0) and (b<>0) then
  begin
    xs:=-c/b;
    ys:=a*xs*xs;
    circle(320+round(40*xs),240-round(40*ys),2);
  end;
  if (a<>0) and (sqr(b/2/a) = c/a) then
  begin
    xs:=-b/2/a;
    ys:=a*xs*xs;
    circle(320+round(40*xs),240-round(40*ys),2);
  end;
  if (a<>0) and (sqr(b/2/a) > c/a) then
  begin
    xs1:=-b/2/a-sqrt(sqr(b/2/a)-c/a);
    xs2:=-b/2/a+sqrt(sqr(b/2/a)-c/a);
    ys1:=a*xs1*xs1;
    ys2:=a*xs2*xs2;
    circle(320+round(40*xs1),240-round(40*ys1),2);
    circle(320+round(40*xs2),240-round(40*ys2),2);
  end;
end;

procedure loesch5;
begin
  setcolor(1);
  x0:=-280;
  dx:=0.2;
  repeat
    x0:=x0+dx;
    x:=x0/40;
    y0:=40*(a*x*x+b*x+c);
    if (y0<=180) and (y0>=-180) then
      begin
        putpixel(320+round(x0),240-round(y0),1);
      end;
  until x0>=280;
    outtextxy(65,430,ortx1);
    outtextxy(165,430,ortx2);
    outtextxy(255,430,ortx3);
    outtextxy(355,430,ortx1);
    outtextxy(495,430,ortx10);
    outtextxy(585,430,ortx11);
  loesch5a;
  loesch5b;
  loesch5c;
end;

procedure ausgabe5;
begin
  a:=1;
  b:=-1;
  c:=-2;
  setz;
  setz5;
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    's':
    begin
      setz5a;
      setz5b;
      wahl:=' ';
    end;
    'l':
    begin
      loesch5a;
      loesch5b;
      setz;
      wahl:=' ';
    end;
    'n':
    begin
      setz5c;
      wahl:=' ';
    end;
    'm':
    begin
      loesch5c;
      setz;
      wahl:=' ';
    end;
    'a':
    begin
      loesch5;
      a:=round(100*a-1)/100;
      setz;
      setz5;
      wahl:=' ';
    end;
    'A':
    begin
      loesch5;
      a:=round(100*a+1)/100;
      setz;
      setz5;
      wahl:=' ';
    end;
    'b':
    begin
      loesch5;
      b:=round(100*b-5)/100;
      setz;
      setz5;
      wahl:=' ';
    end;
    'B':
    begin
      loesch5;
      b:=round(100*b+5)/100;
      setz;
      setz5;
      wahl:=' ';
    end;
    'c':
    begin
      loesch5;
      c:=round(100*c-5)/100;
      setz;
      setz5;
      wahl:=' ';
    end;
    'C':
    begin
      loesch5;
      c:=round(100*c+5)/100;
      setz;
      setz5;
      wahl:=' ';
    end;
    'w':
    begin
      loesch5;
      a:=1;
      b:=-1;
      c:=-2;
      setz;
      setz5;
      wahl:=' ';
    end;
    'v':
    begin
      loesch5;
      setz;
      setcolor(12);
      outtextxy(20,400,'a eingeben');
      read(a);
      outtextxy(20,410,'b eingeben');
      read(b);
      outtextxy(20,420,'c eingeben');
      read(c);
      cleardevice;
      graphik5;
      setz;
      setz5;
      wahl:=' ';
    end;
  end;
  until wahl='x';
end;


procedure menue;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(7);
  setcolor(1);
  outtextxy(80,100,'Darstellung einer Geraden  ->  1');
  outtextxy(80,150,'Schnittpunkt zweier Geraden  ->  2');
  outtextxy(80,200,'Darstellung einer Parabel  ->  3');
  outtextxy(80,250,'Schnitt von Normalparabel und Gerade  ->  4');
  outtextxy(80,300,'Beliebige Parabel als Schnitt von Normalparabel und Gerade  ->  5');
  outtextxy(400,400,'beenden  ->  b');
end;


procedure gerade1;
begin
  cleardevice;
  graphik1;
  ausgabe1;
  menue;
end;

procedure gerade2;
begin
  cleardevice;
  graphik2;
  ausgabe2;
  menue;
end;

procedure parabel;
begin
  cleardevice;
  graphik3;
  ausgabe3;
  menue;
end;

procedure parabel2;
begin
  cleardevice;
  graphik4;
  ausgabe4;
  menue;
end;

procedure parabel3;
begin
  cleardevice;
  graphik5;
  ausgabe5;
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
    '1':gerade1;
    '2':gerade2;
    '3':parabel;
    '4':parabel2;
    '5':parabel3;
  end;
  until wahl1='b';
end.