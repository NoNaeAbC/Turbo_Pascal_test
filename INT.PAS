program integral;

uses crt,graph;
var
  k3,k2,l2,k1,l1,farbe,l,z,k,treiber,modus:integer;
  y3,y2,x3,mt,ms,xstart,x2,xw,xe1,xe2,xe3,xw1,xw2,dx,a,b,c,d,e,x,y,x0,x1,y0,y1:real;
  h,x5,x6,y5,y6,y7,x4,y4,xa,xe,n,us,os,delta:real;
  wahl,wahl1:char;
  ortx13,ortx8,ortx9,ortx10,ortx11,ortx7,ortx6,ortx1,ortx2,ortx3,ortx4,ortx5:string;

procedure menue;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(7);
  setcolor(1);
  outtextxy(80,150,'Unter - / Obersumme und Fl„cheninhalt  ->  1');
  outtextxy(80,200,'Bestimmung von Fl„cheninhaltsfunktionen  ->  2');
  outtextxy(80,250,'Stammfunktion und Ableitungsfunktion   ->  3');
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

procedure sa;
begin
  if l2=1 then
  begin
    a:=0;
    b:=0;
    c:=1;
    d:=0;
    e:=0;
    h:=0;
    z:=150;
    xa:=0;
    xe:=1;
    n:=4;
    x3:=xe;
    x2:=xa;
  end;
  if l2=2 then
  begin
    a:=0;
    b:=0;
    c:=1;
    d:=0;
    e:=0;
    h:=0;
    z:=50;
    xa:=0;
    xe:=3/z;
    n:=4;
    x3:=xe;
    x2:=xa;
  end;
  if l2=3 then
  begin
    a:=-0.2;
    b:=1;
    c:=-1;
    d:=-1;
    e:=1;
    z:=85;
    h:=0;
    xa:=0;
    xe:=3/z;
    n:=4;
    x3:=xe;
    x2:=xa;
  end;
end;

procedure versuch1;
begin
  if l2=1 then
  begin
    setcolor(12);
      outtextxy(45,430,'Untersumme setzen/l”schen (u/U) ');
    setcolor(10);
      outtextxy(90,430,'                                 Obersumme setzen/l”schen (o/O)');
    setcolor(9);
    outtextxy(340,420,'Fl„cheninhalt angeben/l”schen (i/I)');
    setcolor(11);
    outtextxy(10,440,'Endpunkte setzen/l”schen (p/P) Anzahl n der Teilungen erh”hen/verringern (N/n)');
    setcolor(15);
      outtextxy(35,471,'xa/xe nach rechts/links verschieben (r/l/R/L)    Hilfslinien l”schen (W)');
    outtextxy(7,455,'a/b/c/d/e vergr”áern (A/B/C/D/E)      a,b,c,d und e vorgeben (v)    beenden (x)');
    outtextxy(5,463,'   verkleinern (a/b/c/d/e)      Startwerte wiederherstellen(w)   zoomen (z/Z) ');
    outtextxy(82,15,'Ober - und Untersumme bei  y = a x^4 + b xü + c xý + d x + e');
  end;
  if l2=2 then
  begin
    setcolor(12);
      outtextxy(30,440,'Fl„cheninhaltsfunktion erstellen (g/k)    insgesamt setzen/l”schen (f/F) ');
    setcolor(11);
      outtextxy(20,430,'xa/xe setzen/l”schen (p/P)    xa/xe nach rechts/links verschieben (r/l/R/L)');
    setcolor(15);
      outtextxy(235,471,'Hilfslinien l”schen (W)');
    outtextxy(7,455,'a/b/c/d/e vergr”áern (A/B/C/D/E)      a,b,c,d und e vorgeben (v)    beenden (x)');
    outtextxy(5,463,'   verkleinern (a/b/c/d/e)      Startwerte wiederherstellen(w)   zoomen (z/Z) ');
    outtextxy(77,15,'Fl„cheninhaltsfunktion bei  y = a x^4 + b xü + c xý + d x + e');
  end;
  if l2=3 then
  begin
    setcolor(12);
      outtextxy(15,430,'Stammfunktion setzen/l”schen (1/2) ');
      outtextxy(15,440,'Stammfunktion nach unten/oben verschieben (h/H)');
    setcolor(10);
      outtextxy(30,430,'                                    Ableitungsfunktion setzen/l”schen (3/4)');
    setcolor(13);
    outtextxy(10,471,'Markierungen nach links/rechts verschieben (m/M//y/Y)');
    setcolor(9);
    outtextxy(495,440,'2.Ableitung (5/6)');
    setcolor(11);
    outtextxy(325,420,'xa/xe setzen/l”schen...(p/P//l/r//L/R)');
    setcolor(15);
      outtextxy(100,430,'');
    outtextxy(7,455,'a/b/c/d/e vergr”áern (A/B/C/D/E)      a,b,c,d und e vorgeben (v)    beenden (x)');
    outtextxy(5,463,'   verkleinern (a/b/c/d/e)      Startwerte wiederherstellen(w)   zoomen (z/Z) ');
    outtextxy(10,471,'                                                       Hilfslinien l”schen (W)');
    outtextxy(45,15,'Ableitungs - und Stammfunktion bei  y = a x^4 + b xü + c xý + d x + e ');
  end;
end;

procedure versuch;
begin
  if l=1 then
  y0:=z*(a*x*x*x*x+b*x*x*x+c*x*x+d*x+e);
  if l=2 then
  y0:=z*(4*a*x*x*x+3*b*x*x+2*c*x+d);
  if l=3 then
  y0:=z*(0.2*a*x*x*x*x*x+0.25*b*x*x*x*x+1/3*c*x*x*x+0.5*d*x*x+e*x+h);
  if l=4 then
  y0:=z*(12*a*x*x+6*b*x+2*c);
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
  l:=l1;
  f0;
end;


procedure loeschf1;
begin
  farbe:=1;
  l:=l1;
  f0;
end;

procedure f2;
begin
  farbe:=12;
  l:=l1;
  f0;
end;

procedure f3;
begin
  farbe:=10;
  l:=l1;
  f0;
end;

procedure f4;
begin
  farbe:=9;
  l:=l1;
  f0;
end;



procedure setz1;
begin
  l1:=1;
  f1;
  farbe:=15;
  versuch1;
  setcolor(14);
    str(a:4:2,ortx1);
    outtextxy(125,40,ortx1);
    str(b:4:2,ortx2);
    outtextxy(230,40,ortx2);
    str(c:4:2,ortx3);
    outtextxy(330,40,ortx3);
    str(d:4:2,ortx4);
    outtextxy(435,40,ortx4);
    str(e:4:2,ortx5);
    outtextxy(530,40,ortx5);
    outtextxy(90,40,'y =       * x^4 +      * xü +       * xý +       * x +');
  setz;
end;

procedure loesch;
begin
  setcolor(1);
  setz0;
end;


procedure loesch1;
begin
  setcolor(1);
  loeschf1;
    outtextxy(125,40,ortx1);
    outtextxy(230,40,ortx2);
    outtextxy(330,40,ortx3);
    outtextxy(435,40,ortx4);
    outtextxy(530,40,ortx5);
end;

procedure s2;
begin
  x0:=x2;
  delta:=(x3-x2)/n;
  y0:=z*(a*x0*x0*x0*x0+b*x0*x0*x0+c*x0*x0+d*x0+e);
  setcolor(farbe);
  setlinestyle(1,0,1);
  line(320+round(z*x0),240,320+round(z*x0),240-round(y0));
  setlinestyle(0,0,1);
  us:=delta*(y0/z);
  k1:=0;
  repeat
    k1:=k1+1;
    y0:=z*(a*x0*x0*x0*x0+b*x0*x0*x0+c*x0*x0+d*x0+e);
    x1:=x0+delta;
    y1:=z*(a*x1*x1*x1*x1+b*x1*x1*x1+c*x1*x1+d*x1+e);
    us:=us+delta*(y1/z);
    line(320+round(z*x0),240,320+round(z*x0),240-round(y0));
    line(320+round(z*x1),240,320+round(z*x1),240-round(y0));
    line(320+round(z*x0),240-round(y0),320+round(z*x1),240-round(y0));
    x0:=x1;
  until k1=round(n)-1;
    k1:=k1+1;
    y0:=z*(a*x0*x0*x0*x0+b*x0*x0*x0+c*x0*x0+d*x0+e);
    x1:=x0+delta;
    y1:=z*(a*x1*x1*x1*x1+b*x1*x1*x1+c*x1*x1+d*x1+e);
    line(320+round(z*x0),240,320+round(z*x0),240-round(y0));
    line(320+round(z*x1),240,320+round(z*x1),240-round(y0));
    line(320+round(z*x0),240-round(y0),320+round(z*x1),240-round(y0));
    x0:=x1;
  setlinestyle(1,0,1);
  line(320+round(z*x1),240,320+round(z*x1),240-round(y1));
  setlinestyle(0,0,1);
  outtextxy(500,330,'U = ');
  str(us:5:3,ortx6);
  outtextxy(540,330,ortx6);
end;

procedure setz2;
begin
  farbe:=12;
  s2;
end;

procedure s3;
begin
  delta:=(x3-x2)/n;
  x0:=x2;
  y0:=z*(a*x0*x0*x0*x0+b*x0*x0*x0+c*x0*x0+d*x0+e);
  setcolor(farbe);
  x1:=x0+delta;
  y1:=z*(a*x1*x1*x1*x1+b*x1*x1*x1+c*x1*x1+d*x1+e);
  line(320+round(z*x0),240-round(y1),320+round(z*x1),240-round(y1));
  setlinestyle(1,0,1);
  line(320+round(z*x0),240,320+round(z*x0),240-round(y1));
  setlinestyle(0,0,1);
  os:=delta*(y1/z);
  x0:=x1;
  k1:=0;
  repeat
    k1:=k1+1;
    y0:=z*(a*x0*x0*x0*x0+b*x0*x0*x0+c*x0*x0+d*x0+e);
    x1:=x0+delta;
    y1:=z*(a*x1*x1*x1*x1+b*x1*x1*x1+c*x1*x1+d*x1+e);
    os:=os+delta*(y1/z);
    line(320+round(z*x0),240,320+round(z*x0),240-round(y1));
    line(320+round(z*x1),240,320+round(z*x1),240-round(y1));
    line(320+round(z*x0),240-round(y1),320+round(z*x1),240-round(y1));
    x0:=x1;
  until k1=round(n)-1;
  setlinestyle(1,0,1);
  line(320+round(z*x1),240,320+round(z*x1),240-round(y1));
  setlinestyle(0,0,1);
  outtextxy(500,315,'O =');
  str(os:5:3,ortx7);
  outtextxy(540,315,ortx7);
end;

procedure setz3;
begin
  farbe:=10;
  s3;
end;

procedure loesch2;
begin
  farbe:=1;
  s2;
end;

procedure loesch3;
begin
  farbe:=1;
  s3;
end;

procedure s1b;
begin
  setcolor(farbe);
    y1:=a*x1*x1*x1*x1+b*x1*x1*x1+c*x1*x1+d*x1+e;
    str(x1:4:2,ortx10);
    outtextxy(440,400,ortx10);
    outtextxy(390,400,'xa =  ');
    circle(320+round(z*x1),240-round(z*y1),2);
  circle(320+round(z*x1),240,2);
  setlinestyle(1,0,1);
  line(320+round(z*x1),240,320+round(z*x1),240-round(z*y1));
  setlinestyle(0,0,1);
end;

procedure setz1b;
begin
  farbe:=11;
  s1b;
end;

procedure loesch1b;
begin
  farbe:=1;
  s1b;
end;

procedure s1c;
begin
  setcolor(farbe);
    y4:=a*x4*x4*x4*x4+b*x4*x4*x4+c*x4*x4+d*x4+e;
    str(x4:4:2,ortx7);
    outtextxy(550,400,ortx7);
    outtextxy(500,400,'xe =  ');
    circle(320+round(z*x4),240-round(z*y4),2);
  circle(320+round(z*x4),240,2);
  setlinestyle(1,0,1);
  line(320+round(z*x4),240,320+round(z*x4),240-round(z*y4));
  setlinestyle(0,0,1);
end;

procedure setz1c;
begin
  farbe:=11;
  s1c;
end;

procedure loesch1c;
begin
  farbe:=1;
  s1c;
end;

procedure setz1d;
begin
  setcolor(11);
  outtextxy(500,370,'n =');
  str(n:5:0,ortx13);
  outtextxy(540,370,ortx13);
end;

procedure loesch1d;
begin
  setcolor(1);
  outtextxy(500,370,'n =');
  str(n:5:0,ortx13);
  outtextxy(540,370,ortx13);
end;

procedure s1e;
begin
  setcolor(farbe);
  x5:=x2;
  y5:=(0.2*a*x5*x5*x5*x5*x5+0.25*b*x5*x5*x5*x5+1/3*c*x5*x5*x5+0.5*d*x5*x5+e*x5);
  x6:=x3;
  y6:=(0.2*a*x6*x6*x6*x6*x6+0.25*b*x6*x6*x6*x6+1/3*c*x6*x6*x6+0.5*d*x6*x6+e*x6);
  y7:=y6-y5;
  str(y7:5:3,ortx10);
  outtextxy(540,350,ortx10);
  outtextxy(500,350,'A =');
end;

procedure setz1e;
begin
  farbe:=9;
  s1e;
end;

procedure setz2e;
begin
  farbe:=k3;
  s1e;
end;

procedure loesch1e;
begin
  farbe:=1;
  s1e;
end;

procedure setz2f;
begin
  x0:=x2-3/z;
  y5:=(0.2*a*x0*x0*x0*x0*x0+0.25*b*x0*x0*x0*x0+1/3*c*x0*x0*x0+0.5*d*x0*x0+e*x0);
  x1:=x3-3/z;
  y6:=(0.2*a*x1*x1*x1*x1*x1+0.25*b*x1*x1*x1*x1+1/3*c*x1*x1*x1+0.5*d*x1*x1+e*x1);
  y1:=y6-y5;
  putpixel(320+round(z*x1),240-round(z*y1),k3);
  x0:=x2+3/z;
  y5:=(0.2*a*x0*x0*x0*x0*x0+0.25*b*x0*x0*x0*x0+1/3*c*x0*x0*x0+0.5*d*x0*x0+e*x0);
  x1:=x3+3/z;
  y6:=(0.2*a*x1*x1*x1*x1*x1+0.25*b*x1*x1*x1*x1+1/3*c*x1*x1*x1+0.5*d*x1*x1+e*x1);
  y0:=y6-y5;

  putpixel(320+round(z*x1),240-round(z*y0),k3);
  circle(320+round(z*x3),240-round(z*y7),2);
end;

procedure ausgabe;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    'f':
    begin
      l1:=3;
      x:=x2;
      h:=-(0.2*a*x*x*x*x*x+0.25*b*x*x*x*x+1/3*c*x*x*x+0.5*d*x*x+e*x);
      f2;
      l1:=1;
      wahl:=' ';
    end;
    'F':
    begin
      l1:=3;
      x:=x2;
      h:=-(0.2*a*x*x*x*x*x+0.25*b*x*x*x*x+1/3*c*x*x*x+0.5*d*x*x+e*x);
      loeschf1;
      l1:=1;
      setz;
      wahl:=' ';
    end;
    '1':
    begin
      l1:=3;
      f2;
      l1:=1;
      wahl:=' ';
    end;
    '3':
    begin
      l1:=2;
      f3;
      l1:=1;
      wahl:=' ';
    end;
    '2':
    begin
      l1:=3;
      loeschf1;
      l1:=1;
      setz;
      setz1;
      wahl:=' ';
    end;
    '4':
    begin
      l1:=2;
      loeschf1;
      l1:=1;
      setz;
      setz1;
      wahl:=' ';
    end;
    '5':
    begin
      l1:=4;
      f4;
      l1:=1;
      wahl:=' ';
    end;
    '6':
    begin
      l1:=4;
      loeschf1;
      l1:=1;
      setz;
      setz1;
      wahl:=' ';
    end;
    'i':
    begin
      setz1e;
      wahl:=' ';
    end;
    'I':
    begin
      loesch1e;
      wahl:=' ';
    end;
    'p':
    begin
      x1:=x2;
      x4:=x3;
      setz1b;
      setz1c;
      setz2e;
      wahl:=' ';
    end;
    'P':
    begin
      loesch1b;
      loesch1c;
        setcolor(1);
  outtextxy(540,350,ortx10);
      loesch1e;
      wahl:=' ';
    end;
    'g':
    begin
        setcolor(1);
  outtextxy(540,350,ortx10);
   circle(320+round(z*(x3-1/z)),240-round(z*y7),2);
       x4:=x3;
        loesch1c;
        x4:=x4+1/z;
        setz1c;
        setz;
        setz1;
        setz2e;
        setz2f;
        x3:=x4;
      wahl:=' ';
    end;
    'k':
    begin
        setcolor(1);
  outtextxy(540,350,ortx10);
   circle(320+round(z*(x3+1/z)),240-round(z*y7),2);
       x4:=x3;
        loesch1c;
        x4:=x4-1/z;
        setz1c;
        setz;
        setz1;
        setz2e;
        setz2f;
        x3:=x4;
      wahl:=' ';
    end;
    'R':
    begin
        setcolor(1);
  outtextxy(540,350,ortx10);
       x4:=x3;
        loesch1c;
        x4:=x4+1/z;
        setz1c;
        setz;
        setz1;
        setz2e;
        x3:=x4;
      wahl:=' ';
    end;
    'r':
    begin
      if (x2<=x3-1/z) then
      begin
        setcolor(1);
  outtextxy(540,350,ortx10);
        x1:=x2;
        loesch1b;
        x1:=x1+1/z;
        setz1b;
        setz2e;
        setz;
        setz1;
        x2:=x1;
      end;
      wahl:=' ';
    end;
    'L':
    begin
      if (x3>=x2+1/z) then
      begin
        setcolor(1);
  outtextxy(540,350,ortx10);
       x4:=x3;
        loesch1c;
        x4:=x4-1/z;
        setz1c;
        setz2e;
        setz;
        setz1;
        x3:=x4;
      end;
      wahl:=' ';
    end;
    'l':
    begin
        setcolor(1);
  outtextxy(540,350,ortx10);
        x1:=x2;
        loesch1b;
        x1:=x1-1/z;
        setz1b;
        setz2e;
        setz;
        setz1;
        x2:=x1;
      wahl:=' ';
    end;
    'M':
    begin
        setcolor(1);
        x1:=x2;
        setlinestyle(1,0,1);
        line(320+round(z*x1),60,320+round(z*x1),420);
        setlinestyle(0,0,1);
        x1:=x1+1/z;
        setcolor(13);
        setlinestyle(1,0,1);
        line(320+round(z*x1),60,320+round(z*x1),420);
        setlinestyle(0,0,1);
        setz;
        setz1;
        x2:=x1;
      wahl:=' ';
    end;
    'm':
    begin
        setcolor(1);
        x1:=x2;
        setlinestyle(1,0,1);
        line(320+round(z*x1),60,320+round(z*x1),420);
        setlinestyle(0,0,1);
        x1:=x1-1/z;
        setcolor(13);
        setlinestyle(1,0,1);
        line(320+round(z*x1),60,320+round(z*x1),420);
        setlinestyle(0,0,1);
        setz;
        setz1;
        x2:=x1;
      wahl:=' ';
    end;
    'Y':
    begin
        setcolor(1);
        x1:=x3;
        setlinestyle(1,0,1);
        line(320+round(z*x1),60,320+round(z*x1),420);
        setlinestyle(0,0,1);
        x1:=x1+1/z;
        setcolor(13);
        setlinestyle(1,0,1);
        line(320+round(z*x1),60,320+round(z*x1),420);
        setlinestyle(0,0,1);
        setz;
        setz1;
        x3:=x1;
      wahl:=' ';
    end;
    'y':
    begin
        setcolor(1);
        x1:=x3;
        setlinestyle(1,0,1);
        line(320+round(z*x1),60,320+round(z*x1),420);
        setlinestyle(0,0,1);
        x1:=x1-1/z;
        setcolor(13);
        setlinestyle(1,0,1);
        line(320+round(z*x1),60,320+round(z*x1),420);
        setlinestyle(0,0,1);
        setz;
        setz1;
        x3:=x1;
      wahl:=' ';
    end;
    'u':
    begin
      setz2;
      setz1d;
      wahl:=' ';
    end;
    'o':
    begin
      setz3;
      setz1d;
      wahl:=' ';
    end;
    'U':
    begin
      loesch2;
      loesch1d;
      setz;
      wahl:=' ';
    end;
    'O':
    begin
      loesch3;
      loesch1d;
      setz;
      wahl:=' ';
    end;
    'n':
    begin
    if n>=3 then
      begin
      loesch2;
      loesch3;
      loesch1d;
      n:=round(n-1);
      setz1d;
      setz;
      setz1;
      setz3;
      setz2;
      delay(100);
      end;
      wahl:=' ';
    end;
    'N':
    begin
      loesch1d;
      loesch2;
      loesch3;
      n:=round(n+1);
      setz1d;
      setz;
      setz1;
      setz3;
      setz2;
      delay(150);
      wahl:=' ';
    end;
    'z':
    begin
    if z>=2 then
    begin
      loesch;
      loesch1;
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
      z:=z+1;
      setz;
      setz1;
      wahl:=' ';
    end;
    'a':
    begin
      loesch1;
      a:=round(100*a-10)/100;
      setz1;
      wahl:=' ';
    end;
    'A':
    begin
      loesch1;
      a:=round(100*a+10)/100;
      setz1;
      wahl:=' ';
    end;
    'b':
    begin
      loesch1;
      b:=round(100*b-10)/100;
      setz1;
      wahl:=' ';
    end;
    'B':
    begin
      loesch1;
      b:=round(100*b+10)/100;
      setz1;
      wahl:=' ';
    end;
    'c':
    begin
      loesch1;
      c:=round(100*c-10)/100;
      setz1;
      wahl:=' ';
    end;
    'C':
    begin
      loesch1;
      c:=round(100*c+10)/100;
      setz1;
      wahl:=' ';
    end;
    'd':
    begin
      loesch1;
      d:=round(100*d-10)/100;
      setz1;
      wahl:=' ';
    end;
    'D':
    begin
      loesch1;
      d:=round(100*d+10)/100;
      setz1;
      wahl:=' ';
    end;
    'e':
    begin
      loesch1;
      e:=round(100*e-10)/100;
      setz1;
      wahl:=' ';
    end;
    'E':
    begin
      loesch1;
      e:=round(100*e+10)/100;
      setz1;
      wahl:=' ';
    end;
    'h':
    begin
      l1:=3;
      loeschf1;
      h:=round(100*h-10)/100;
      f2;
      l1:=1;
      wahl:=' ';
    end;
    'H':
    begin
      l1:=3;
      loeschf1;
      h:=round(100*h+10)/100;
      f2;
      l1:=1;
      wahl:=' ';
    end;
    'w':
    begin
      loesch;
      loesch1;
      sa;
      setz;
      setz1;
      wahl:=' ';
    end;
    'v':
    begin
      loesch1;
      setcolor(12);
      outtextxy(15,350,'a eingeben');
      read(a);
      outtextxy(15,360,'b eingeben');
      read(b);
      outtextxy(15,370,'c eingeben');
      read(c);
      outtextxy(15,380,'d eingeben');
      read(d);
      outtextxy(15,390,'e eingeben');
      read(e);
      cleardevice;
      g;
      setz1;
      setz;
      wahl:=' ';
    end;
    'W':
    begin
      cleardevice;
      g;
      setz1;
      setz;
      wahl:=' ';
    end;
  end;
  until wahl='x';
end;

procedure p1;
begin
  cleardevice;
  k3:=1;
  l1:=1;
  l:=l1;
  l2:=l1;
  sa;
  setz;
  farbe:=15;
  g;
  versuch1;
  setz1;
  ausgabe;
  menue;
end;

procedure p2;
begin
  cleardevice;
  k3:=12;
  l1:=1;
  l:=l1;
  l2:=2;
  sa;
  setz;
  farbe:=15;
  g;
  versuch1;
  setz1;
  ausgabe;
  menue;
end;

procedure p3;
begin
  cleardevice;
  k3:=12;
  l1:=1;
  l:=l1;
  l2:=3;
  sa;
  setz;
  farbe:=15;
  g;
  versuch1;
  setz1;
  ausgabe;
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