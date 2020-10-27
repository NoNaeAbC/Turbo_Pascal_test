program ableitung;

uses crt,graph;
var
  l1,farbe,l,z,k,treiber,modus:integer;
  y3,y2,x3,mt,ms,xstart,x2,xw,xe1,xe2,xe3,xw1,xw2,dx,a,b,c,d,e,x,y,x0,x1,y0,y1:real;
  wahl,wahl1:char;
  ortx8,ortx9,ortx10,ortx11,ortx7,ortx6,ortx1,ortx2,ortx3,ortx4,ortx5:string;

procedure menue;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(7);
  setcolor(1);
  outtextxy(80,100,'Sekantensteigungsfunktion  ->  1');
  outtextxy(80,150,'Tangentensteigung und Ableitungsfunktion  ->  2');
  outtextxy(80,200,'Erste und zweite Ableitung einer Parabel dritten Grades  ->  3');
  outtextxy(80,250,'Erste und zweite Ableitung einer Parabel vierten Grades  ->  4');
  outtextxy(80,300,'Zusammenhang zwischen den Ableitungen und der Funktion  ->  5');
  outtextxy(400,400,'beenden  ->  b');
end;

procedure g;
begin
  setbkcolor(1);
  setcolor(15);
  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
end;

procedure graphika;
begin
  g;
  outtextxy(7,455,'a/b/c/d/e vergr”áern (A/B/C/D/E)      a,b,c,d und e vorgeben (v)    beenden (x)');
  outtextxy(5,463,'   verkleinern (a/b/c/d/e)      Startwerte wiederherstellen(w)   zoomen (z/Z) ');
end;

procedure graphik4;
begin
  g;
  outtextxy(50,15,'Parabel vierten Grades');
  setcolor(14);
  outtextxy(260,15,'y = a * x^4 + b * xü + c * xý + d * x + e');
  setcolor(12);
      outtextxy(120,40,'1.Ableitung (1/2) ');
  setcolor(10);
      outtextxy(120,40,'                    2.Ableitung (3/4)');
  setcolor(15);
      outtextxy(120,40,'                                        l”schen (l)');
      outtextxy(15,455,'a/b/c/d vergr”áern (A/B/C/D)        a,b,c und d vorgeben (v)      beenden (x)');
      outtextxy(15,465,'   verkleinern (a/b/c/d)        Startwerte wiederherstellen(w)   zoomen (z/Z) ');
end;


procedure setz0;
begin
  outtextxy(300,237+z,'-1');
  outtextxy(310,237-z,'1');
  outtextxy(318+z,245,'1');
  outtextxy(315-z,245,'-1');
  line(320+z,235,320+z,240);
  line(320-z,235,320-z,240);
  line(320,240+z,325,240+z);
  line(320,240-z,325,240-z);
end;

procedure setz;
begin
  setcolor(15);
  line(60,240,580,240);
  line(320,60,320,420);
  setz0;
end;

procedure versuch;
begin
    if l=1 then  y0:=z*(a*x*x*x*x+b*x*x*x+c*x*x+d*x+e);
    if l=2 then  y0:=z*(4*a*x*x*x+3*b*x*x+2*c*x+d);
    if l=3 then  y0:=z*(12*a*x*x+6*b*x+2*c);
    if l=4 then  y0:=z*(a*x*x*x+b*x*x+c*x+d);
    if l=5 then  y0:=z*(3*a*x*x+2*b*x+c);
    if l=6 then  y0:=z*(6*a*x+2*b);

end;


procedure f0;
begin
  x0:=-280;
  dx:=0.2;
  repeat
    x0:=x0+dx;
    x:=x0/z;
    versuch;
    if (y0<=180) and (y0>=-180) then
      begin
        putpixel(320+round(x0),240-round(y0),farbe);
      end;
  until x0>=280;
end;


procedure f1;
begin
  farbe:=14;
  l:=1;
  f0;
end;

procedure setz4a;
begin
  farbe:=12;
  l:=2;
  f0;
end;

procedure setz4c;
begin
  farbe:=10;
  l:=3;
  f0;
end;

procedure f4;
begin
  farbe:=14;
  l:=4;
  f0;
end;

procedure setz3a;
begin
  farbe:=12;
  l:=5;
  f0;
end;

procedure setz3c;
begin
  farbe:=10;
  l:=6;
  f0;
end;

procedure loeschf1;
begin
  farbe:=1;
  l:=1;
  f0;
end;


procedure loeschf2;
begin
  farbe:=1;
  l:=2;
  f0;
end;

procedure loeschf3;
begin
  farbe:=1;
  l:=3;
  f0;
end;

procedure loeschf4;
begin
  farbe:=1;
  l:=4;
  f0;
end;

procedure loeschf5;
begin
  farbe:=1;
  l:=5;
  f0;
end;

procedure loeschf6;
begin
  farbe:=1;
  l:=6;
  f0;
end;

procedure setz4;
begin
  f1;
  setcolor(14);
    str(a:4:2,ortx1);
    outtextxy(135,430,ortx1);
    str(b:4:2,ortx2);
    outtextxy(240,430,ortx2);
    str(c:4:2,ortx3);
    outtextxy(340,430,ortx3);
    str(d:4:2,ortx4);
    outtextxy(445,430,ortx4);
    str(e:4:2,ortx5);
    outtextxy(540,430,ortx5);
    outtextxy(100,430,'y =       * x^4 +      * xü +       * xý +       * x +');
  setz;
end;

procedure h;
begin
        circle(320+round(z*xe1),240,2);
        line(320+round(z*xe1),240-round(y),320+round(z*xe1),240);
        line(320+round(z*xe2),240-round(y1),320+round(z*xe2),240);
        circle(320+round(z*xe2),240,2);
end;

procedure h1;
begin
        y:=z*(a*xe1*xe1*xe1*xe1+b*xe1*xe1*xe1+c*xe1*xe1+d*xe1+e);
        y1:=z*(a*xe2*xe2*xe2*xe2+b*xe2*xe2*xe2+c*xe2*xe2+d*xe2+e);
        h;
end;


procedure hilfe1a;
begin
      xe3:=0;
      xe1:=-3*b/8/a+sqrt(9*b*b/64/a/a-c/2/a);
      xe2:=-3*b/8/a-sqrt(9*b*b/64/a/a-c/2/a);
        circle(320,240-round(z*e),2);
        line(320,240-round(z*e),320,240-round(z*d));
      h1;
end;

procedure hilfe1b;
begin
        circle(320,240-round(z*d),2);
        circle(320+round(z*xe1),240-round(y),2);
        circle(320+round(z*xe2),240-round(y1),2);
end;

procedure h2;
  begin
  if (a<>0) and (d=0) and (9*b*b/64/a/a>=c/2/a) then
    begin
      setcolor(farbe);
      hilfe1a;
      setcolor(l);
      hilfe1b;
    end;
    setcolor(l);
  if (a<>0) and (d=0) and (9*b*b/64/a/a<c/2/a) then
    circle(320,240,2);
  if (d<>0) then
    begin
    x0:=-280;
    dx:=0.05;
    repeat
      x0:=x0+dx;
      x:=x0/z;
      y0:=z*(4*a*x*x*x+3*b*x*x+2*c*x+d);
      if (y0<=30/z) and (y0>=-30/z) then
      begin
        y1:=z*(a*x*x*x*x+b*x*x*x+c*x*x+d*x+e);
        setcolor(l);
        circle(320+round(z*x),240-round(y0),2);
        line(320+round(z*x),240-round(y0),320+round(z*x),240-round(y1));
        setcolor(farbe);
        circle(320+round(z*x),240-round(y1),2);
      end;
    until x0>=280;
    end;
end;

procedure h3;
begin
    if (a<>0) and (b*b/9/a/a>=c/3/a) then
      begin
        setcolor(farbe);
        xe1:=-b/3/a+sqrt(b*b/9/a/a-c/3/a);
        xe2:=-b/3/a-sqrt(b*b/9/a/a-c/3/a);
        y:=z*(a*xe1*xe1*xe1+b*xe1*xe1+c*xe1+d);
        y1:=z*(a*xe2*xe2*xe2+b*xe2*xe2+c*xe2+d);
        h;
        setcolor(l);
        circle(320+round(z*xe1),240-round(y),2);
        circle(320+round(z*xe2),240-round(y1),2);
      end;
end;


procedure setz4b;
begin
  setlinestyle(1,0,1);
  farbe:=14;
  l:=12;
  h2;
  setlinestyle(0,0,1);
end;

procedure h5;
begin
        y:=z*(a*xe1*xe1*xe1*xe1+b*xe1*xe1*xe1+c*xe1*xe1+d*xe1+e);
      y1:=z*(4*a*xe1*xe1*xe1+3*b*xe1*xe1+2*c*xe1+d);
      circle(320+round(z*xe1),240-round(y1),2);
      line(320+round(z*xe1),240-round(y),320+round(z*xe1),240-round(y1));
        y3:=z*(a*xe2*xe2*xe2*xe2+b*xe2*xe2*xe2+c*xe2*xe2+d*xe2+e);
      y2:=z*(4*a*xe2*xe2*xe2+3*b*xe2*xe2+2*c*xe2+d);
      circle(320+round(z*xe2),240-round(y2),2);
      line(320+round(z*xe2),240-round(y3),320+round(z*xe2),240-round(y2));
end;

procedure setz4d;
begin
  setlinestyle(1,0,1);
    if (a<>0) and (b*b/16/a/a>=c/6/a) then
    begin
      xe1:=-b/4/a+sqrt(b*b/16/a/a-c/6/a);
      xe2:=-b/4/a-sqrt(b*b/16/a/a-c/6/a);
        setcolor(9);
        h5;
        setcolor(10);
        h1;
        setcolor(14);
        circle(320+round(z*xe1),240-round(y),2);
        circle(320+round(z*xe2),240-round(y1),2);
    end;
    setlinestyle(0,0,1);
    setcolor(15);
end;


procedure loesch;
begin
  setcolor(1);
  setz0;
end;

procedure loesch7;
begin
  loeschf2;
  loeschf3;
end;

procedure loesch4a;
begin
  loesch7;
    setcolor(1);
    farbe:=1;
    l:=1;
    h2;
    if (a<>0) and (b*b/16/a/a>=c/6/a) then
    begin
      xe1:=-b/4/a+sqrt(b*b/16/a/a-c/6/a);
      xe2:=-b/4/a-sqrt(b*b/16/a/a-c/6/a);
        h1;
        circle(320+round(z*xe1),240-round(y),2);
        circle(320+round(z*xe2),240-round(y1),2);
        h5;
    end;
  setcolor(15);
  line(320,60,320,420);
end;


procedure loescha;
begin
  setcolor(1);
  loeschf1;
    outtextxy(135,430,ortx1);
    outtextxy(240,430,ortx2);
    outtextxy(340,430,ortx3);
    outtextxy(445,430,ortx4);
    outtextxy(540,430,ortx5);
end;

procedure loesch6;
begin
  loescha;
  loesch7;
end;

procedure loesch4;
begin
    loesch4a;
    loescha;
end;

procedure ausgabe4;
begin
  a:=-0.2;
  b:=1;
  c:=-1;
  d:=-1;
  e:=1;
  z:=85;
  setz;
  setz4;
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    '1':
    begin
      setz4a;
      wahl:=' ';
    end;
    '3':
    begin
      setz4c;
      wahl:=' ';
    end;
    '2':
    begin
      setz4b;
      wahl:=' ';
    end;
    '4':
    begin
      setz4d;
      wahl:=' ';
    end;
    'z':
    begin
    if z>=2 then
    begin
      loesch;
      loescha;
      z:=z-1;
      setz;
      setz4;
      wahl:=' ';
    end;
    end;
    'Z':
    begin
      loesch;
      loescha;
      z:=z+1;
      setz;
      setz4;
      wahl:=' ';
    end;
    'a':
    begin
      loescha;
      a:=round(100*a-1)/100;
      setz4;
      wahl:=' ';
    end;
    'A':
    begin
      loescha;
      a:=round(100*a+1)/100;
      setz4;
      wahl:=' ';
    end;
    'b':
    begin
      loescha;
      b:=round(100*b-1)/100;
      setz4;
      wahl:=' ';
    end;
    'B':
    begin
      loescha;
      b:=round(100*b+1)/100;
      setz4;
      wahl:=' ';
    end;
    'c':
    begin
      loescha;
      c:=round(100*c-5)/100;
      setz4;
      wahl:=' ';
    end;
    'C':
    begin
      loescha;
      c:=round(100*c+5)/100;
      setz4;
      wahl:=' ';
    end;
    'd':
    begin
      loescha;
      d:=round(100*d-5)/100;
      setz4;
      wahl:=' ';
    end;
    'D':
    begin
      loescha;
      d:=round(100*d+5)/100;
      setz4;
      wahl:=' ';
    end;
    'e':
    begin
      loescha;
      e:=round(100*e-5)/100;
      setz4;
      wahl:=' ';
    end;
    'E':
    begin
      loescha;
      e:=round(100*e+5)/100;
      setz4;
      wahl:=' ';
    end;
    'w':
    begin
      loesch;
      loescha;
  a:=-0.2;
  b:=1;
  c:=-1;
  d:=-1;
  e:=1;
  z:=85;
      setz;
      setz4;
      wahl:=' ';
    end;
    'v':
    begin
      loesch4a;
      setcolor(12);
      outtextxy(15,400,'a eingeben');
      read(a);
      outtextxy(15,410,'b eingeben');
      read(b);
      outtextxy(15,420,'c eingeben');
      read(c);
      outtextxy(15,430,'d eingeben');
      read(d);
      outtextxy(15,440,'e eingeben');
      read(e);
      cleardevice;
      graphik4;
      setz;
      setz4;
      wahl:=' ';
    end;
    'l':
    begin
      cleardevice;
      graphik4;
      setz;
      setz4;
      wahl:=' ';
    end;
  end;
  until wahl='x';
end;


procedure graphik1;
begin
  graphika;
  outtextxy(55,15,'                   bei');
  setcolor(14);
  outtextxy(250,15,'y = a * x^4 + b * xü + c * xý + d * x + e');
  setcolor(10);
  outtextxy(60,15,'Sekantensteigung ');
      outtextxy(15,35,'Ann„herung von links/rechts (l/L/r/R) ');
  setcolor(12);
      outtextxy(15,35,'                                       Tangentensteigung setzen/l”schen (3/4)');
  setcolor(14);
      outtextxy(170,45,' P nach links/rechts verschieben (1/2)  ');
  setcolor(15);
      outtextxy(20,471,'Sekante l”schen (s)   Sekantensteigungsfunktion und Hilfslinien l”schen (W)');
end;


procedure setz1a;
begin
    setcolor(12);
    x:=xstart;
    y:=a*x*x*x*x+b*x*x*x+c*x*x+d*x+e;
    mt:=4*a*x*x*x+3*b*x*x+2*c*x+d;
    str(mt:4:2,ortx6);
    outtextxy(540,410,ortx6);
    outtextxy(500,410,'mt = ');
    line(320+round(z*x+z/2),240-round(z*y+z*mt/2),320+round(z*x-z/2),240-round(z*y-z*mt/2));
    circle(320+round(z*x),240-round(z*mt),2);
end;

procedure setz1b;
begin
  setcolor(10);
    x:=xstart;
    y:=a*x*x*x*x+b*x*x*x+c*x*x+d*x+e;
    y1:=a*x1*x1*x1*x1+b*x1*x1*x1+c*x1*x1+d*x1+e;
    ms:=(y1-y)/(x1-x);
    str(x1:4:2,ortx10);
    outtextxy(500,370,ortx10);
    str(y1:4:2,ortx11);
    outtextxy(560,370,ortx11);
    outtextxy(450,370,'Q = (       ;       )');
    circle(320+round(z*x1),240-round(z*y1),2);
    circle(320+round(z*x1),240-round(z*ms),1);
    str(ms:4:2,ortx7);
    outtextxy(540,390,ortx7);
    outtextxy(500,390,'ms = ');
    line(320+round(z*x+z),240-round(z*y+z*ms),320+round(z*x-z),240-round(z*y-z*ms));
    putpixel(320+round(z*x1),240-round(z*ms),10);
end;

procedure setz1c;
begin
  setcolor(14);
    x:=xstart;
    y:=a*x*x*x*x+b*x*x*x+c*x*x+d*x+e;
    str(x:4:2,ortx8);
    outtextxy(500,350,ortx8);
    str(y:4:2,ortx9);
    outtextxy(560,350,ortx9);
    outtextxy(450,350,'P = (       ;       )');
    circle(320+round(z*x),240-round(z*y),2);
end;

procedure setz1;
begin
  setz4;
  setz1c;
end;

procedure loesch1a;
begin
    setcolor(1);
    y:=a*x*x*x*x+b*x*x*x+c*x*x+d*x+e;
    mt:=4*a*x*x*x+3*b*x*x+2*c*x+d;
    outtextxy(540,410,ortx6);
    outtextxy(500,410,'mt = ');
    line(320+round(z*x+z/2),240-round(z*y+z*mt/2),320+round(z*x-z/2),240-round(z*y-z*mt/2));
    circle(320+round(z*x),240-round(z*mt),2);
end;

procedure loesch1b;
begin
  setcolor(1);
    y:=a*x*x*x*x+b*x*x*x+c*x*x+d*x+e;
    y1:=a*x1*x1*x1*x1+b*x1*x1*x1+c*x1*x1+d*x1+e;
    ms:=(y1-y)/(x1-x);
    outtextxy(500,370,ortx10);
    outtextxy(560,370,ortx11);
    outtextxy(450,370,'Q = (       ;       )');
    circle(320+round(z*x1),240-round(z*y1),2);
    circle(320+round(z*x1),240-round(z*ms),1);
    putpixel(320+round(z*x1),240-round(z*ms),10);
    outtextxy(540,390,ortx7);
    outtextxy(500,390,'ms = ');
    line(320+round(z*x+z),240-round(z*y+z*ms),320+round(z*x-z),240-round(z*y-z*ms));
end;

procedure loesch1c;
begin
  setcolor(1);
    x:=xstart;
    y:=a*x*x*x*x+b*x*x*x+c*x*x+d*x+e;
    outtextxy(500,350,ortx8);
    outtextxy(560,350,ortx9);
    outtextxy(450,350,'P = (       ;       )');
    circle(320+round(z*x),240-round(z*y),2);
end;

procedure loesch1d;
begin
  loesch1a;
  loesch1b;
  loesch1c;
end;

procedure loesch1;
begin
  loescha;
  loesch1d;
end;


procedure ausgabe1;
begin
  z:=45;
  a:=0;
  b:=0;
  c:=1;
  d:=0;
  e:=0;
  xstart:=-1;
  x3:=xstart+1;
  x2:=xstart-1;
  setz;
  setz1;
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    's':
    begin
      setcolor(1);
      line(320+round(z*x+z),240-round(z*y+z*ms),320+round(z*x-z),240-round(z*y-z*ms));
      wahl:=' ';
    end;
    'R':
    begin
        x1:=x3;
        loesch1b;
        x1:=x1+1/z;
        setz1b;
        setz;
        setz1;
        x3:=x1;
      wahl:=' ';
    end;
    'r':
    begin
      if (x3>=x+2/z) then
      begin
        x1:=x3;
        loesch1b;
        x1:=x1-1/z;
        setz1b;
        setz;
        setz1;
        x3:=x1;
      end;
      wahl:=' ';
    end;
    'L':
    begin
        x1:=x2;
        loesch1b;
        x1:=x1-1/z;
        setz1b;
        setz;
        setz1;
        x2:=x1;
      wahl:=' ';
    end;
    'l':
    begin
      if (x2<=x-2/z) then
      begin
        x1:=x2;
        loesch1b;
        x1:=x1+1/z;
        setz1b;
        setz;
        setz1;
        x2:=x1;
      end;
      wahl:=' ';
    end;
    '3':
    begin
      x:=xstart;
      setz1a;
      wahl:=' ';
    end;
    '4':
    begin
      x:=xstart;
      loesch1a;
      wahl:=' ';
    end;
    '1':
    begin
      loesch1c;
      xstart:=xstart-1/z;
      x3:=xstart+1;
      x2:=xstart-1;
      setz1c;
      wahl:=' ';
    end;
    '2':
    begin
      loesch1c;
      xstart:=xstart+1/z;
      x3:=xstart+1;
      x2:=xstart-1;
      setz1c;
      wahl:=' ';
    end;
    'W':
    begin
      cleardevice;
      graphik1;
      setz;
      setz1;
      x3:=xstart+1;
      x2:=xstart-1;
      wahl:=' ';
    end;
    'z':
    begin
    if z>=2 then
    begin
      loesch;
      loesch1;
    putpixel(320+round(z*x1),240-round(z*ms),1);
      z:=z-1;
      setz;
      setz1;
      wahl:=' ';
    end;
    end;
    'Z':
    begin
      loesch;
      loesch1;
    putpixel(320+round(z*x1),240-round(z*ms),1);
      z:=z+1;
      setz;
      setz1;
      wahl:=' ';
    end;
    'a':
    begin
      loesch1;
  x3:=xstart+1;
  x2:=xstart-1;
      a:=round(100*a-1)/100;
      setz1;
      wahl:=' ';
    end;
    'A':
    begin
      loesch1;
  x3:=xstart+1;
  x2:=xstart-1;
      a:=round(100*a+1)/100;
      setz1;
      wahl:=' ';
    end;
    'b':
    begin
      loesch1;
  x3:=xstart+1;
  x2:=xstart-1;
      b:=round(100*b-5)/100;
      setz1;
      wahl:=' ';
    end;
    'B':
    begin
      loesch1;
  x3:=xstart+1;
  x2:=xstart-1;
      b:=round(100*b+5)/100;
      setz1;
      wahl:=' ';
    end;
    'c':
    begin
      loesch1;
  x3:=xstart+1;
  x2:=xstart-1;
      c:=round(100*c-5)/100;
      setz1;
      wahl:=' ';
    end;
    'C':
    begin
      loesch1;
  x3:=xstart+1;
  x2:=xstart-1;
      c:=round(100*c+5)/100;
      setz1;
      wahl:=' ';
    end;
    'd':
    begin
      loesch1;
  x3:=xstart+1;
  x2:=xstart-1;
      d:=round(100*d-5)/100;
      setz1;
      wahl:=' ';
    end;
    'D':
    begin
      loesch1;
  x3:=xstart+1;
  x2:=xstart-1;
      d:=round(100*d+5)/100;
      setz1;
      wahl:=' ';
    end;
    'e':
    begin
      loesch1;
  x3:=xstart+1;
  x2:=xstart-1;
      e:=round(100*e-5)/100;
      setz1;
      wahl:=' ';
    end;
    'E':
    begin
      loesch1;
  x3:=xstart+1;
  x2:=xstart-1;
      e:=round(100*e+5)/100;
      setz1;
      wahl:=' ';
    end;
    'w':
    begin
      cleardevice;
      z:=45;
      a:=0;
      b:=0;
      c:=1;
      d:=0;
      e:=0;
      xstart:=-1;
      x3:=xstart+1;
      x2:=xstart-1;
      graphik1;
      setz;
      setz1;
      wahl:=' ';
    end;
    'v':
    begin
      loesch1d;
      setcolor(12);
      outtextxy(15,400,'a eingeben');
      read(a);
      outtextxy(15,410,'b eingeben');
      read(b);
      outtextxy(15,420,'c eingeben');
      read(c);
      outtextxy(15,430,'d eingeben');
      read(d);
      outtextxy(15,440,'e eingeben');
      read(e);
      cleardevice;
      graphik1;
      setz;
      setz1;
  x3:=xstart+1;
  x2:=xstart-1;
      wahl:=' ';
    end;
  end;
  until wahl='x';
end;


procedure graphik0;
begin
  graphika;
  outtextxy(50,15,'Parabel vierten Grades');
  setcolor(14);
  outtextxy(260,15,'y = a * x^4 + b * xü + c * xý + d * x + e');
end;

procedure graphik2;
begin
  graphik0;
  setcolor(12);
      outtextxy(70,35,'1.Ableitung bestimmen (1) ');
      outtextxy(18,45,'P nach links/rechts verschieben (l/r)');
  setcolor(10);
      outtextxy(120,35,'                               2.Ableitung bestimmen (2)');
      outtextxy(328,45,'P nach links/rechts verschieben (L/R)  ');
  setcolor(15);
      outtextxy(60,471,'Tangente l”schen (t)       Ableitungen und Hilfslinien l”schen (W)');
end;

procedure setz2a;
begin
  x0:=-280;
  dx:=0.2;
  repeat
    x0:=x0+dx;
    x:=x0/z;
    y0:=z*(a*x*x*x*x+b*x*x*x+c*x*x+d*x+e);
    y1:=z*(4*a*x*x*x+3*b*x*x+2*c*x+d);
  until (y0<=180) and (y0>=-180) and (y1<=180) and (y1>=-180);
  xstart:=x;
  x2:=xstart;
  setcolor(14);
  circle(320+round(x0),240-round(y0),2);
  setcolor(12);
  circle(320+round(x0),240-round(y1),1);
  putpixel(320+round(x0),240-round(y1),12);
    mt:=4*a*x*x*x+3*b*x*x+2*c*x+d;
    str(mt:4:2,ortx6);
    outtextxy(540,390,ortx6);
    outtextxy(500,390,'mt = ');
    line(320+round(z*x+z/2),240-round(y0+z*mt/2),320+round(z*x-z/2),240-round(y0-z*mt/2));
end;


procedure setz2b;
begin
  x0:=-280;
  dx:=0.2;
  repeat
    x0:=x0+dx;
    x:=x0/z;
    y0:=z*(4*a*x*x*x+3*b*x*x+2*c*x+d);
    y1:=z*(12*a*x*x+6*b*x+2*c);
  until (y0<=180) and (y0>=-180) and (y1<=180) and (y1>=-180);
  xstart:=x;
  x2:=xstart;
  setcolor(12);
  circle(320+round(x0),240-round(y0),2);
  setcolor(10);
  circle(320+round(x0),240-round(y1),1);
  putpixel(320+round(x0),240-round(y1),10);
    mt:=12*a*x*x+6*b*x+2*c;
    str(mt:4:2,ortx6);
    outtextxy(540,410,ortx6);
    outtextxy(500,410,'mt = ');
    line(320+round(z*x+z/2),240-round(y0+z*mt/2),320+round(z*x-z/2),240-round(y0-z*mt/2));
  setz4a;
end;

procedure s1;
begin
  setcolor(farbe);
    y0:=z*(a*x1*x1*x1*x1+b*x1*x1*x1+c*x1*x1+d*x1+e);
    y1:=z*(4*a*x1*x1*x1+3*b*x1*x1+2*c*x1+d);
  circle(320+round(x1*z),240-round(y0),2);
  setcolor(l);
  circle(320+round(x1*z),240-round(y1),1);
  putpixel(320+round(x1*z),240-round(y1),12);
    mt:=4*a*x1*x1*x1+3*b*x1*x1+2*c*x1+d;
    str(mt:4:2,ortx6);
    outtextxy(540,390,ortx6);
    outtextxy(500,390,'mt = ');
    line(320+round(z*x1+z/2),240-round(y0+z*mt/2),320+round(z*x1-z/2),240-round(y0-z*mt/2));
end;

procedure setz2c;
begin
  farbe:=14;
  l:=12;
  s1;
end;

procedure loesch2c;
begin
  farbe:=1;
  l:=1;
  s1;
end;

procedure s2;
begin
  setcolor(farbe);
    y0:=z*(4*a*x1*x1*x1+3*b*x1*x1+2*c*x1+d);
    y1:=z*(12*a*x1*x1+6*b*x1+2*c);
  circle(320+round(x1*z),240-round(y0),2);
  setcolor(l);
  circle(320+round(x1*z),240-round(y1),1);
  putpixel(320+round(x1*z),240-round(y1),10);
    mt:=12*a*x1*x1+6*b*x1+2*c;
    str(mt:4:2,ortx6);
    outtextxy(540,410,ortx6);
    outtextxy(500,410,'mt = ');
    line(320+round(z*x1+z/2),240-round(y0+z*mt/2),320+round(z*x1-z/2),240-round(y0-z*mt/2));
end;

procedure setz2d;
begin
  farbe:=12;
  l:=10;
  s2;
end;

procedure loesch2d;
begin
  farbe:=1;
  l:=1;
  s2;
end;

procedure setz2;
begin
  setz4;
end;

procedure ausgabe2;
begin
  z:=85;
  a:=-0.2;
  b:=1;
  c:=-1;
  d:=-1;
  e:=1;
  setz;
  setz2;
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    't':
    begin
      setcolor(1);
    y0:=z*(4*a*x1*x1*x1+3*b*x1*x1+2*c*x1+d);
    y1:=z*(12*a*x1*x1+6*b*x1+2*c);
    mt:=12*a*x1*x1+6*b*x1+2*c;
    line(320+round(z*x1+z/2),240-round(y0+z*mt/2),320+round(z*x1-z/2),240-round(y0-z*mt/2));
    y0:=z*(a*x1*x1*x1*x1+b*x1*x1*x1+c*x1*x1+d*x1+e);
    y1:=z*(4*a*x1*x1*x1+3*b*x1*x1+2*c*x1+d);
    mt:=4*a*x1*x1*x1+3*b*x1*x1+2*c*x1+d;
    line(320+round(z*x1+z/2),240-round(y0+z*mt/2),320+round(z*x1-z/2),240-round(y0-z*mt/2));
      wahl:=' ';
    end;
    'R':
    begin
      if (x2<=280/z) then
      begin
        x1:=x2;
        loesch2d;
        x1:=x1+1/z;
        setz2d;
        setz4a;
        setz;
        x2:=x1;
      end;
      wahl:=' ';
    end;
    'r':
    begin
      if (x2<=280/z) then
      begin
        x1:=x2;
        loesch2c;
        x1:=x1+1/z;
        setz2c;
        setz4;
        setz;
        x2:=x1;
      end;
      wahl:=' ';
    end;
    'L':
    begin
      if (x2>=-280/z) then
      begin
        x1:=x2;
        loesch2d;
        x1:=x1-1/z;
        setz2d;
        setz4a;
        setz;
        x2:=x1;
      end;
      wahl:=' ';
    end;
    'l':
    begin
      if (x2>=-280/z) then
      begin
        x1:=x2;
        loesch2c;
        x1:=x1-1/z;
        setz2c;
        setz4;
        setz;
        x2:=x1;
      end;
      wahl:=' ';
    end;
    '1':
    begin
      setz2a;
      wahl:=' ';
    end;
    '2':
    begin
      setz2b;
      wahl:=' ';
    end;
    'W':
    begin
      cleardevice;
      graphik2;
      setz;
      setz2;
      wahl:=' ';
    end;
    'z':
    begin
    if z>=2 then
    begin
      loesch;
      loescha;
      z:=z-1;
      setz;
      setz2;
      wahl:=' ';
    end;
    end;
    'Z':
    begin
      loesch;
      loescha;
      z:=z+1;
      setz;
      setz2;
      wahl:=' ';
    end;
    'a':
    begin
      loescha;
      a:=round(100*a-1)/100;
      setz2;
      wahl:=' ';
    end;
    'A':
    begin
      loescha;
      a:=round(100*a+1)/100;
      setz2;
      wahl:=' ';
    end;
    'b':
    begin
      loescha;
      b:=round(100*b-1)/100;
      setz2;
      wahl:=' ';
    end;
    'B':
    begin
      loescha;
      b:=round(100*b+1)/100;
      setz2;
      wahl:=' ';
    end;
    'c':
    begin
      loescha;
      c:=round(100*c-1)/100;
      setz2;
      wahl:=' ';
    end;
    'C':
    begin
      loescha;
      c:=round(100*c+1)/100;
      setz2;
      wahl:=' ';
    end;
    'd':
    begin
      loescha;
      d:=round(100*d-1)/100;
      setz2;
      wahl:=' ';
    end;
    'D':
    begin
      loescha;
      d:=round(100*d+1)/100;
      setz2;
      wahl:=' ';
    end;
    'e':
    begin
      loescha;
      e:=round(100*e-5)/100;
      setz2;
      wahl:=' ';
    end;
    'E':
    begin
      loescha;
      e:=round(100*e+5)/100;
      setz2;
      wahl:=' ';
    end;
    'w':
    begin
      cleardevice;
      z:=85;
      a:=-0.2;
      b:=1;
      c:=-1;
      d:=-1;
      e:=1;
      graphik2;
      setz;
      setz2;
      wahl:=' ';
    end;
    'v':
    begin
      loescha;
      setcolor(12);
      outtextxy(15,400,'a eingeben');
      read(a);
      outtextxy(15,410,'b eingeben');
      read(b);
      outtextxy(15,420,'c eingeben');
      read(c);
      outtextxy(15,430,'d eingeben');
      read(d);
      outtextxy(15,440,'e eingeben');
      read(e);
      cleardevice;
      graphik2;
      setz;
      setz2;
      wahl:=' ';
    end;
  end;
  until wahl='x';
end;

procedure graphik6;
begin
  graphik0;
      outtextxy(70,35,'Verbindungslinie setzen (1)    Bewegung nach links/rechts (l/r) ');
      outtextxy(260,471,' Hilfslinie l”schen (W)');
      setcolor(12);
      outtextxy(200,45,'1. Ableitung');
      setcolor(10);
      outtextxy(200,45,'                  2.Ableitung');
end;

procedure setz6;
begin
  graphik6;
  setz4;
  setz4a;
  setz4c;
end;

procedure setz6a;
begin
  x0:=-280;
  dx:=0.2;
  repeat
    x0:=x0+dx;
    x:=x0/z;
    y0:=z*(a*x*x*x*x+b*x*x*x+c*x*x+d*x+e);
    y1:=z*(4*a*x*x*x+3*b*x*x+2*c*x+d);
    y2:=z*(12*a*x*x+6*b*x+2*c);
  until (y0<=180) and (y0>=-180) and (y1<=180) and (y1>=-180) and (y2<=180) and (y2>=-180);
  xstart:=x;
  x2:=xstart;
  setlinestyle(1,0,1);
  setcolor(15);
  line(320+round(x0),240-round(y2),320+round(x0),240-round(y0));
  line(320+round(x0),240-round(y2),320+round(x0),240-round(y1));
  setlinestyle(0,0,1);
  setcolor(14);
  circle(320+round(x0),240-round(y0),2);
  setcolor(12);
  circle(320+round(x0),240-round(y1),2);
  setcolor(10);
  circle(320+round(x0),240-round(y2),2);
end;

procedure setz6b;
begin
    y0:=z*(a*x1*x1*x1*x1+b*x1*x1*x1+c*x1*x1+d*x1+e);
    y1:=z*(4*a*x1*x1*x1+3*b*x1*x1+2*c*x1+d);
    y2:=z*(12*a*x1*x1+6*b*x1+2*c);
  setlinestyle(1,0,1);
  setcolor(15);
  line(320+round(z*x1),240-round(y2),320+round(z*x1),240-round(y0));
  line(320+round(z*x1),240-round(y2),320+round(z*x1),240-round(y1));
  setlinestyle(0,0,1);
  setcolor(14);
  circle(320+round(z*x1),240-round(y0),2);
  setcolor(12);
  circle(320+round(z*x1),240-round(y1),2);
  setcolor(10);
  circle(320+round(z*x1),240-round(y2),2);
{  setz6; }
  setz;
end;

procedure loesch6b;
begin
  setcolor(1);
    y0:=z*(a*x1*x1*x1*x1+b*x1*x1*x1+c*x1*x1+d*x1+e);
    y1:=z*(4*a*x1*x1*x1+3*b*x1*x1+2*c*x1+d);
    y2:=z*(12*a*x1*x1+6*b*x1+2*c);
  line(320+round(z*x1),240-round(y2),320+round(z*x1),240-round(y0));
  line(320+round(z*x1),240-round(y2),320+round(z*x1),240-round(y1));
  circle(320+round(z*x1),240-round(y0),2);
  circle(320+round(z*x1),240-round(y1),2);
  circle(320+round(z*x1),240-round(y2),2);
    x:=x1-2/z;
    y0:=z*(a*x*x*x*x+b*x*x*x+c*x*x+d*x+e);
    y1:=z*(4*a*x*x*x+3*b*x*x+2*c*x+d);
    y2:=z*(12*a*x*x+6*b*x+2*c);
    putpixel(320+round(z*x),240-round(y0),14);
    putpixel(320+round(z*x),240-round(y1),12);
    putpixel(320+round(z*x),240-round(y2),10);
    x:=x1+2/z;
    y0:=z*(a*x*x*x*x+b*x*x*x+c*x*x+d*x+e);
    y1:=z*(4*a*x*x*x+3*b*x*x+2*c*x+d);
    y2:=z*(12*a*x*x+6*b*x+2*c);
    putpixel(320+round(z*x),240-round(y0),14);
    putpixel(320+round(z*x),240-round(y1),12);
    putpixel(320+round(z*x),240-round(y2),10);
end;


procedure ausgabe6;
begin
  z:=85;
  a:=-0.2;
  b:=1;
  c:=-1;
  d:=-1;
  e:=1;
  setz6;
  setz;
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    'r':
    begin
      if (x2<=280/z) then
      begin
        x1:=x2;
        loesch6b;
        x1:=x1+1/z;
        setz6b;
        x2:=x1;
      end;
      wahl:=' ';
    end;
    'l':
    begin
      if (x2>=-280/z) then
      begin
        x1:=x2;
        loesch6b;
        x1:=x1-1/z;
        setz6b;
        x2:=x1;
      end;
      wahl:=' ';
    end;
    '1':
    begin
      setz6a;
      wahl:=' ';
    end;
    'W':
    begin
      cleardevice;
      graphik6;
      setz;
      setz6;
      wahl:=' ';
    end;
    'z':
    begin
    if z>=2 then
    begin
      loesch;
      loesch6;
      z:=z-1;
      setz;
      setz6;
      wahl:=' ';
    end;
    end;
    'Z':
    begin
      loesch;
      loesch6;
      z:=z+1;
      setz;
      setz6;
      wahl:=' ';
    end;
    'a':
    begin
      loesch6;
      a:=round(100*a-1)/100;
      setz6;
      wahl:=' ';
    end;
    'A':
    begin
      loesch6;
      a:=round(100*a+1)/100;
      setz6;
      wahl:=' ';
    end;
    'b':
    begin
      loesch6;
      b:=round(100*b-1)/100;
      setz6;
      wahl:=' ';
    end;
    'B':
    begin
      loesch6;
      b:=round(100*b+1)/100;
      setz6;
      wahl:=' ';
    end;
    'c':
    begin
      loesch6;
      c:=round(100*c-1)/100;
      setz6;
      wahl:=' ';
    end;
    'C':
    begin
      loesch6;
      c:=round(100*c+1)/100;
      setz6;
      wahl:=' ';
    end;
    'd':
    begin
      loesch6;
      d:=round(100*d-1)/100;
      setz6;
      wahl:=' ';
    end;
    'D':
    begin
      loesch6;
      d:=round(100*d+1)/100;
      setz6;
      wahl:=' ';
    end;
    'e':
    begin
      loesch6;
      e:=round(100*e-5)/100;
      setz6;
      wahl:=' ';
    end;
    'E':
    begin
      loesch6;
      e:=round(100*e+5)/100;
      setz6;
      wahl:=' ';
    end;
    'w':
    begin
      cleardevice;
      z:=85;
      a:=-0.2;
      b:=1;
      c:=-1;
      d:=-1;
      e:=1;
      graphik6;
      setz;
      setz6;
      wahl:=' ';
    end;
    'v':
    begin
      loesch6;
      setcolor(12);
      outtextxy(15,400,'a eingeben');
      read(a);
      outtextxy(15,410,'b eingeben');
      read(b);
      outtextxy(15,420,'c eingeben');
      read(c);
      outtextxy(15,430,'d eingeben');
      read(d);
      outtextxy(15,440,'e eingeben');
      read(e);
      cleardevice;
      graphik4;
      setz;
      setz6;
      wahl:=' ';
    end;
  end;
  until wahl='x';
end;


procedure p2;
begin
  cleardevice;
  graphik2;
  ausgabe2;
  menue;
end;


procedure graphik3;
begin
  g;
  outtextxy(100,15,'Parabel dritten Grades');
  setcolor(14);
  outtextxy(290,15,'y = a * xü + b * xý + c * x + d');
  setcolor(12);
      outtextxy(120,40,'1.Ableitung (1/2) ');
  setcolor(10);
      outtextxy(120,40,'                    2.Ableitung (3/4)');
  setcolor(15);
      outtextxy(120,40,'                                        l”schen (l)');
      outtextxy(15,455,'a/b/c/d vergr”áern (A/B/C/D)        a,b,c und d vorgeben (v)      beenden (x)');
      outtextxy(15,465,'   verkleinern (a/b/c/d)        Startwerte wiederherstellen(w)   zoomen (z/Z) ');
end;

procedure setz3b;
begin
   farbe:=12;
   l:=14;
        setlinestyle(1,0,1);
        h3;
        setlinestyle(0,0,1);
        setcolor(15);
end;

procedure h4;
begin
  if (a<>0) then
    begin
      xe1:=-b/3/a;
      y:=z*(a*xe1*xe1*xe1+b*xe1*xe1+c*xe1+d);
      setcolor(farbe);
      y1:=z*(3*a*xe1*xe1+2*b*xe1+c);
      circle(320+round(z*xe1),240-round(y1),2);
      line(320+round(z*xe1),240-round(y),320+round(z*xe1),240-round(y1));
      setcolor(l);
      circle(320+round(z*xe1),240,2);
      line(320+round(z*xe1),240-round(y),320+round(z*xe1),240);
      setcolor(l1);
      circle(320+round(z*xe1),240-round(y),2);
    end;
end;

procedure setz3d;
begin
  setlinestyle(1,0,1);
  farbe:=9;
  l:=10;
  l1:=14;
  h4;
  setlinestyle(0,0,1);
  setcolor(15);
end;



procedure loesch3a;
begin
  setcolor(1);
    loeschf5;
    loeschf6;
    farbe:=1;
    l:=1;
    l1:=1;
    h3;
    h4;
end;

procedure setz3;
begin
  setcolor(15);
  f4;
  setcolor(14);
    str(a:4:2,ortx1);
    outtextxy(190,430,ortx1);
    str(b:4:2,ortx2);
    outtextxy(290,430,ortx2);
    str(c:4:2,ortx3);
    outtextxy(390,430,ortx3);
    str(d:4:2,ortx4);
    outtextxy(480,430,ortx4);
    outtextxy(150,430,'y =       * xü +       * xý +      * x +');
  setz;
end;


procedure loesch3;
begin
  setcolor(1);
    loeschf4;
    outtextxy(190,430,ortx1);
    outtextxy(290,430,ortx2);
    outtextxy(390,430,ortx3);
    outtextxy(480,430,ortx4);
 loesch3a;
end;


procedure ausgabe3;
begin
  z:=35;
  a:=0.25;
  b:=-1;
  c:=-1;
  d:=0.25;
  setz3;
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    '1':
    begin
      setz3a;
      wahl:=' ';
    end;
    '3':
    begin
      setz3c;
      wahl:=' ';
    end;
    '2':
    begin
      setz3b;
      wahl:=' ';
    end;
    '4':
    begin
      setz3d;
      wahl:=' ';
    end;
    'l':
    begin
      loesch3a;
      setz;
      wahl:=' ';
    end;
    'z':
    begin
    if z>=2 then
    begin
      loesch;
      loesch3;
      z:=z-1;
      setz;
      setz3;
      wahl:=' ';
    end;
    end;
    'Z':
    begin
      loesch;
      loesch3;
      z:=z+1;
      setz;
      setz3;
      wahl:=' ';
    end;
    'a':
    begin
      loesch3;
      a:=round(100*a-1)/100;
      setz3;
      wahl:=' ';
    end;
    'A':
    begin
      loesch3;
      a:=round(100*a+1)/100;
      setz3;
      wahl:=' ';
    end;
    'b':
    begin
      loesch3;
      b:=round(100*b-5)/100;
      setz3;
      wahl:=' ';
    end;
    'B':
    begin
      loesch3;
      b:=round(100*b+5)/100;
      setz3;
      wahl:=' ';
    end;
    'c':
    begin
      loesch3;
      c:=round(100*c-5)/100;
      setz3;
      wahl:=' ';
    end;
    'C':
    begin
      loesch3;
      c:=round(100*c+5)/100;
      setz3;
      wahl:=' ';
    end;
    'd':
    begin
      loesch3;
      d:=round(100*d-5)/100;
      setz3;
      wahl:=' ';
    end;
    'D':
    begin
      loesch3;
      d:=round(100*d+5)/100;
      setz3;
      wahl:=' ';
    end;
    'w':
    begin
      loesch;
      loesch3;
      z:=35;
      a:=0.25;
      b:=-1;
      c:=-1;
      d:=0.25;
      setz;
      setz3;
      wahl:=' ';
    end;
    'v':
    begin
      loesch3a;
      setcolor(12);
      outtextxy(40,410,'a eingeben');
      read(a);
      outtextxy(40,420,'b eingeben');
      read(b);
      outtextxy(40,430,'c eingeben');
      read(c);
      outtextxy(40,440,'d eingeben');
      read(d);
      cleardevice;
      graphik3;
      setz;
      setz3;
      wahl:=' ';
    end;
  end;
  until wahl='x';
end;


procedure p1;
begin
  cleardevice;
  graphik1;
  ausgabe1;
  menue;
end;


procedure p3;
begin
  cleardevice;
  graphik3;
  ausgabe3;
  menue;
end;

procedure p4;
begin
  cleardevice;
  graphik4;
  ausgabe4;
  menue;
end;

procedure p6;
begin
  cleardevice;
  graphik6;
  ausgabe6;
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
    '5':p6;
  end;
  until wahl1='b';
end.