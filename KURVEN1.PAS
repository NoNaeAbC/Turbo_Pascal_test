program kurvenschar;

uses crt,graph;
var
  krit,m33,m34,m3,nend,hu,ho,zx,zy,m,n,hilf,hilfh,hilfw:integer;
  h000,farbe0,farbe1,farbe2,farbe3,farbe4,farbe5,farbe6,farbe7,farbe8,l,farbe,z,k,treiber,modus:integer;
  da,hilfe,x3,mt,ms,xstart,x2,xw,xe1,xe2,xe3,xw1,xw2,dx,a,b,c,d,e,x,y,x0,x1,y0,y1,y2,y3:real;
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
     farbe2:=12;
     farbe3:=14;
     farbe4:=10;
     farbe5:=11;
     farbe6:=13;
     farbe7:=9;
     farbe8:=2;
    end;
end;


procedure versuch;
begin
    if l=0 then  y0:=z*(1/8*x*x*x*x-3/2*a*x*x+5/2*a*a);
    if l=1 then  y0:=z*(1/2*x*x*x-3*a*x);
    if l=2 then  y0:=z*(3/2*x*x-3*a);
    if l=3 then  y0:=z*(-1/18*x*x*x*x);
    if l=4 then  y0:=z/8*(x*x*x-3*a*x*x+3*a*a*x-12*x);
    if l=5 then  y0:=z/8*(3*x*x-6*a*x+3*a*a-12);
    if l=6 then  y0:=z/8*(6*x-6*a);
    if l=7 then  y0:=z/8*x*x*(x-6);
    if l=8 then  y0:=z/8*x*x*(x+6);
    if l=9 then  y0:=z/8*x*(x*x-12);
    if l=10 then  y0:=z/32*x*(x*x-48);
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


procedure f;
begin
  farbe:=farbe3;
  l:=0;
  f0;
end;


procedure f1;
begin
  farbe:=farbe2;
  l:=1;
  f0;
end;

procedure f2;
begin
  farbe:=farbe4;
  l:=2;
  f0;
end;

procedure ft;
begin
  farbe:=farbe6;
  l:=3;
  f0;
end;

procedure f4;
begin
  farbe:=farbe3;
  l:=4;
  f0;
end;

procedure f5;
begin
  farbe:=farbe2;
  l:=5;
  f0;
end;

procedure f6;
begin
  farbe:=farbe4;
  l:=6;
  f0;
end;

procedure f7;
begin
  farbe:=farbe6;
  l:=7;
  f0;
end;

procedure f8;
begin
  farbe:=farbe7;
  l:=8;
  f0;
end;

procedure f9;
begin
  farbe:=farbe8;
  l:=9;
  f0;
end;

procedure f10;
begin
  farbe:=farbe5;
  l:=10;
  f0;
end;



procedure loeschf;
begin
  farbe:=farbe0;
  l:=0;
  f0;
end;

procedure loeschf1;
begin
  farbe:=farbe0;
  l:=1;
  f0;
end;

procedure loeschf2;
begin
  farbe:=farbe0;
  l:=2;
  f0;
end;

procedure loeschft;
begin
  farbe:=farbe0;
  l:=3;
  f0;
end;

procedure loeschf4;
begin
  farbe:=farbe0;
  l:=4;
  f0;
end;

procedure loeschf5;
begin
  farbe:=farbe0;
  l:=5;
  f0;
end;

procedure loeschf6;
begin
  farbe:=farbe0;
  l:=6;
  f0;
end;

procedure loeschf7;
begin
  farbe:=farbe0;
  l:=7;
  f0;
end;

procedure loeschf8;
begin
  farbe:=farbe0;
  l:=8;
  f0;
end;

procedure loeschf9;
begin
  farbe:=farbe0;
  l:=9;
  f0;
end;

procedure loeschf10;
begin
  farbe:=farbe0;
  l:=10;
  f0;
end;


procedure menue;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(15);
  setcolor(1);
  outtextxy(50,230,'Kurvenschar  y = 1/8 x^4 - 3/2 a xý + 5/2 aý   ');
  outtextxy(50,280,'Kurvenschar  y = 1/8 ( x^3 - 3 a xý + 3 aý x - 12 x ) ');
  outtextxy(490,230,' ->  1');
  outtextxy(490,280,' ->  2');
  outtextxy(120,330,'sin(1/x) , x sin(1/x)  und  xý sin(1/x)  -> 3');
  outtextxy(405,400,'beenden  ->  b');
  setcolor(7);
  outtextxy(20,465,'heller Hintergrund (h)                              dunkler Hintergrund (d)');
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
  setcolor(farbe1);
  line(60,240,580,240);
  line(320,60,320,420);
  setz0;
end;

procedure loesch;
begin
  setcolor(farbe0);
  setz0;
end;

procedure graphik0;
begin
  setbkcolor(farbe0);
  setcolor(farbe1);
  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  outtextxy(115,15,'Kurvenschar');
  setcolor(farbe2);
      outtextxy(120,35,'1.Ableitung (1/2) ');
  setcolor(farbe4);
      outtextxy(120,35,'                     2.Ableitung(3/4)  ');
  setcolor(farbe1);
      outtextxy(120,35,'                                         l”schen (l)');
      outtextxy(45,455,'  a vergr”áern (A)            a vorgeben (v)            beenden (b)');
      outtextxy(45,465,'   verkleinern (a)   Startwerte wiederherstellen(0)   zoomen (z/Z) ');
end;

procedure graphik1;
begin
  graphik0;
  setcolor(farbe3);
  outtextxy(230,15,'y = 1/8 * x^4 - 3/2 * a * xý + 5/2 * aý ');
  setcolor(farbe6);
  outtextxy(150,45,'Kurve aller Tiefpunkte setzen/l”schen (t/T)');
end;


procedure setz1;
begin
  f;
  setcolor(7);
    str(da/100:5:4,ortx5);
    outtextxy(100,440,ortx5);
    outtextxy(60,440,'da =         ver„ndern (d/D)   Spur setzen/l”schen/nicht setzen (5/w/6)');
  setcolor(farbe3);
    str(a:5:4,ortx4);
    outtextxy(100,430,ortx4);
    outtextxy(70,430,'a =');
    str((1/8):4:3,ortx1);
    outtextxy(235,430,ortx1);
    str((-3/2*a):4:2,ortx2);
    outtextxy(340,430,ortx2);
    str((5/2*a*a):4:2,ortx3);
    outtextxy(440,430,ortx3);
    outtextxy(200,430,'y =       * x^4 +       * xý +      ');
  setz;
end;

procedure s5;
begin
  setcolor(7);
    str(da/100:5:4,ortx5);
    outtextxy(100,440,ortx5);
    outtextxy(60,440,'da =');
end;

procedure hilfe1;
begin
        xe1:=sqrt(6*a);
        xe2:=-sqrt(6*a);
        y:=z*(1/8*xe1*xe1*xe1*xe1-3/2*a*xe1*xe1+5/2*a*a);
        y1:=z*(1/8*xe2*xe2*xe2*xe2-3/2*a*xe2*xe2+5/2*a*a);
        y2:=z*(1/2*xe1*xe1*xe1-3*a*xe1);
        y3:=z*(1/2*xe2*xe2*xe2-3*a*xe2);
        circle(320,240,2);
        line(320,240,320,240-round(z*5/2*a*a));
        circle(320+round(z*xe1),240-round(y2),2);
        line(320+round(z*xe1),240-round(y),320+round(z*xe1),240-round(y2));
        line(320+round(z*xe2),240-round(y1),320+round(z*xe2),240-round(y3));
        circle(320+round(z*xe2),240-round(y3),2);
end;

procedure hilfe2;
begin
        circle(320,240-round(z*5/2*a*a),2);
        circle(320+round(z*xe1),240-round(y),2);
        circle(320+round(z*xe2),240-round(y1),2);
end;

procedure setz1b;
begin
        setcolor(farbe2);
        setlinestyle(1,0,1);
    if (a>0) then
      begin
        hilfe1;
        setcolor(farbe3);
        hilfe2;
      end;
        setlinestyle(0,0,1);
end;

procedure hilfe3;
begin
      xw:=sqrt(2*a);
      circle(320+round(xw*z),240,2);
      circle(320+round(-xw*z),240,2);
end;

procedure setz1d;
begin
  setcolor(farbe4);
  setlinestyle(1,0,1);
  if (a>0) then
    begin
     hilfe3;
    end;
  setlinestyle(0,0,1);
end;

procedure loesch1a;
begin
  loeschf1;
  loeschf2;
  setcolor(farbe0);
    if (a>0) then
    begin
      hilfe1;
      hilfe2;
      hilfe3;
    end;
end;

procedure loesch1;
begin
  loeschf;
  setcolor(farbe0);
    outtextxy(100,430,ortx4);
    outtextxy(235,430,ortx1);
    outtextxy(340,430,ortx2);
    outtextxy(440,430,ortx3);
 loesch1a;
end;

procedure loesch11;
begin
  setcolor(farbe0);
    outtextxy(100,430,ortx4);
    outtextxy(235,430,ortx1);
    outtextxy(340,430,ortx2);
    outtextxy(440,430,ortx3);
end;

procedure l5;
begin
  setcolor(farbe0);
  outtextxy(100,440,ortx5);
end;


procedure ausgabe1;
begin
  z:=50;
  a:=0.5;
  hilf:=0;
  setz1;
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    '1':
    begin
      f1;
      wahl:=' ';
    end;
    '3':
    begin
      f2;
      wahl:=' ';
    end;
    '2':
    begin
      setz1b;
      wahl:=' ';
    end;
    '4':
    begin
      setz1d;
      wahl:=' ';
    end;
    '5':
    begin
      krit:=1;
      wahl:=' ';
    end;
    '6':
    begin
      krit:=0;
      wahl:=' ';
    end;
    'D':
    begin
      l5;
      da:=da*1.1;
      s5;
      wahl:=' ';
    end;
    'd':
    begin
      l5;
      da:=da/1.1;
      s5;
      wahl:=' ';
    end;
    'l':
    begin
      loesch1a;
      setz;
      wahl:=' ';
    end;
    't':
    begin
      if a>0 then
      ft;
      hilf:=1;
      wahl:=' ';
    end;
    'T':
    begin
      if a>0 then
      loeschft;
      hilf:=0;
      setz;
      wahl:=' ';
    end;
    'z':
    begin
    if z>=2 then
    begin
      loesch;
      loesch1;
      if hilf=1 then loeschft;
      z:=z-1;
      setz;
      setz1;
      if hilf=1 then ft;
      wahl:=' ';
    end;
    end;
    'Z':
    begin
      loesch;
      loesch1;
      if hilf=1 then loeschft;
      z:=z+1;
      setz;
      setz1;
      if hilf=1 then ft;
      wahl:=' ';
    end;
    'w':
    begin
      cleardevice;
      graphik1;
      setz1;
      if hilf=1 then ft;
      wahl:=' ';
    end;
    'a':
    begin
      if krit=0 then loesch1;
      loesch11;
      a:=round(100*a-da)/100;
      setz1;
      if hilf=1 then ft;
      wahl:=' ';
    end;
    'A':
    begin
      if krit=0 then loesch1;
      loesch11;
      a:=round(100*a+da)/100;
      setz1;
      if hilf=1 then ft;
      wahl:=' ';
    end;
    '0':
    begin
      cleardevice;
      graphik1;
      z:=50;
      a:=0.5;
      setz;
      setz1;
      wahl:=' ';
    end;
    'v':
    begin
      loesch1a;
      setz;
      setcolor(farbe3);
      outtextxy(40,410,'a eingeben');
      read(a);
      cleardevice;
      graphik1;
      setz;
      setz1;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;


procedure graphik2;
begin
  graphik0;
  setcolor(farbe3);
  outtextxy(230,15,'y = 1/8 ( x^3 - 3 a xý + 3 aý x - 12 x )');
  setcolor(farbe1);
  outtextxy(50,45,'Kurve aller Tief-, Hoch-, Wendepunkte setzen/l”schen (t/T//h/H//w/W)');
  setcolor(farbe6);
  outtextxy(50,45,'            Tief-, Hoch-, Wendepunkte                 t/T           ');
  setcolor(farbe7);
  outtextxy(50,45,'                   Hoch-, Wendepunkte                      h/H      ');
  setcolor(farbe8);
  outtextxy(50,45,'                          Wendepunkte                           w/W ');
  setcolor(farbe5);
  outtextxy(70,425,'Hllkurve setzen/l”schen (S/L)');
  setcolor(farbe1);
  outtextxy(70,425,'                                 alle Hilfslinien l”schen (9)');
  setcolor(7);
    outtextxy(360,410,'da =         ver„ndern (d/D)');
    outtextxy(330,400,'Spur setzen/weg/nicht setzen (5/6/7)');
end;

procedure setz2;
begin
  f4;
  setcolor(7);
    str(da/100:5:4,ortx5);
    outtextxy(400,410,ortx5);
  setcolor(farbe3);
    str(a:4:2,ortx4);
    outtextxy(120,435,ortx4);
    outtextxy(90,435,'a =');
    str((1/8):4:3,ortx1);
    outtextxy(265,435,ortx1);
    str((-3/8*a):4:2,ortx2);
    outtextxy(370,435,ortx2);
    str((3/8*a*a-12):4:2,ortx3);
    outtextxy(470,435,ortx3);
    outtextxy(230,435,'y =       * x^3 +       * xý +      ');
  setz;
end;

procedure setz2b;
begin
  setcolor(farbe2);
  setlinestyle(1,0,1);
  xe1:=a-2;
  xe2:=a+2;
  y:=z/8*(xe1*xe1*xe1-3*a*xe1*xe1+3*a*a*xe1-12*xe1);
  y1:=z/8*(3*xe1*xe1-6*a*xe1+3*a*a-12);
  y2:=z/8*(xe2*xe2*xe2-3*a*xe2*xe2+3*a*a*xe2-12*xe2);
  y3:=z/8*(3*xe2*xe2-6*a*xe2+3*a*a-12);
        circle(320+round(z*xe1),240-round(y1),2);
        line(320+round(z*xe1),240-round(y),320+round(z*xe1),240-round(y1));
        line(320+round(z*xe2),240-round(y2),320+round(z*xe2),240-round(y3));
        circle(320+round(z*xe2),240-round(y3),2);
  setcolor(farbe3);
        circle(320+round(z*xe1),240-round(y),2);
        circle(320+round(z*xe2),240-round(y2),2);
  setlinestyle(0,0,1);
end;

procedure setz2d;
begin
  setcolor(farbe4);
  setlinestyle(1,0,1);
    y:=z/8*(a*a*a-3*a*a*a+3*a*a*a-12*a);
    y1:=z/8*(6*a-6*a);
  circle(320+round(a*z),240-round(y1),2);
  line(320+round(a*z),240-round(y),320+round(a*z),240-round(y1));
  setcolor(farbe3);
  circle(320+round(a*z),240-round(y),2);
  setlinestyle(0,0,1);
end;


procedure loesch2a;
begin
  loeschf5;
  loeschf6;
  setcolor(farbe0);
  xe1:=a-2;
  xe2:=a+2;
  y:=z/8*(xe1*xe1*xe1-3*a*xe1*xe1+3*a*a*xe1-12*xe1);
  y1:=z/8*(3*xe1*xe1-6*a*xe1+3*a*a-12);
  y2:=z/8*(xe2*xe2*xe2-3*a*xe2*xe2+3*a*a*xe2-12*xe2);
  y3:=z/8*(3*xe2*xe2-6*a*xe2+3*a*a-12);
        circle(320+round(z*xe1),240-round(y1),2);
        line(320+round(z*xe1),240-round(y),320+round(z*xe1),240-round(y1));
        line(320+round(z*xe2),240-round(y2),320+round(z*xe2),240-round(y3));
        circle(320+round(z*xe2),240-round(y3),2);
        circle(320+round(z*xe1),240-round(y),2);
        circle(320+round(z*xe2),240-round(y2),2);
    y:=z/8*(a*a*a-3*a*a*a+3*a*a*a-12*a);
    y1:=z/8*(6*a-6*a);
  circle(320+round(a*z),240-round(y1),2);
  line(320+round(a*z),240-round(y),320+round(a*z),240-round(y1));
  circle(320+round(a*z),240-round(y),2);
end;

procedure loesch2;
begin
  loeschf4;
  setcolor(farbe0);
    outtextxy(120,435,ortx4);
    outtextxy(265,435,ortx1);
    outtextxy(370,435,ortx2);
    outtextxy(470,435,ortx3);
 loesch2a;
end;

procedure loesch21;
begin
  setcolor(farbe0);
    outtextxy(120,435,ortx4);
    outtextxy(265,435,ortx1);
    outtextxy(370,435,ortx2);
    outtextxy(470,435,ortx3);
end;

procedure s25;
begin
  setcolor(7);
    str(da/100:5:4,ortx5);
    outtextxy(400,410,ortx5);
end;

procedure l25;
begin
  setcolor(farbe0);
    outtextxy(400,410,ortx5);
end;


procedure ausgabe2;
begin
  z:=30;
  a:=0.5;
  setz2;
  s25;
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    '1':
    begin
      f5;
      wahl:=' ';
    end;
    '3':
    begin
      f6;
      wahl:=' ';
    end;
    '2':
    begin
      setz2b;
      wahl:=' ';
    end;
    '4':
    begin
      setz2d;
      wahl:=' ';
    end;
    '5':
    begin
      krit:=1;
      wahl:=' ';
    end;
    '7':
    begin
      krit:=0;
      wahl:=' ';
    end;
    '6':
    begin
      cleardevice;
      graphik2;
      setz2;
      wahl:=' ';
    end;
    'D':
    begin
      l25;
      da:=da*1.1;
      s25;
      wahl:=' ';
    end;
    'd':
    begin
      l25;
      da:=da/1.1;
      s25;
      wahl:=' ';
    end;
    'l':
    begin
      loesch2a;
      setz;
      wahl:=' ';
    end;
    'S':
    begin
      f10;
      wahl:=' ';
    end;
    'L':
    begin
      loeschf10;
      setz;
      wahl:=' ';
    end;
    't':
    begin
      f7;
      hilf:=1;
      wahl:=' ';
    end;
    'T':
    begin
      loeschf7;
      hilf:=0;
      setz;
      wahl:=' ';
    end;
    'h':
    begin
      f8;
      hilfh:=1;
      wahl:=' ';
    end;
    'H':
    begin
      loeschf8;
      hilfh:=0;
      setz;
      wahl:=' ';
    end;
    'w':
    begin
      f9;
      hilfw:=1;
      wahl:=' ';
    end;
    'W':
    begin
      loeschf9;
      hilfw:=0;
      setz;
      wahl:=' ';
    end;
    '9':
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
      loesch2;
      if hilf=1 then loeschf7;
      if hilfh=1 then loeschf8;
      if hilfw=1 then loeschf9;
      z:=z-1;
      setz;
      setz2;
      if hilf=1 then f7;
      if hilfh=1 then f8;
      if hilfw=1 then f9;
      wahl:=' ';
    end;
    end;
    'Z':
    begin
      loesch;
      loesch2;
      if hilf=1 then loeschf7;
      if hilfh=1 then loeschf8;
      if hilfw=1 then loeschf9;
      z:=z+1;
      setz;
      setz2;
      if hilf=1 then f7;
      if hilfh=1 then f8;
      if hilfw=1 then f9;
      wahl:=' ';
    end;
    'a':
    begin
      if krit=0 then loesch2;
      loesch21;
      a:=round(100*a-da)/100;
      setz2;
      if hilf=1 then f7;
      if hilfh=1 then f8;
      if hilfw=1 then f9;
      wahl:=' ';
    end;
    'A':
    begin
      if krit=0 then loesch2;
      loesch21;
      a:=round(100*a+da)/100;
      setz2;
      if hilf=1 then f7;
      if hilfh=1 then f8;
      if hilfw=1 then f9;
      wahl:=' ';
    end;
    '0':
    begin
      cleardevice;
      graphik2;
      z:=30;
      a:=0.5;
      setz;
      setz2;
      wahl:=' ';
    end;
    'v':
    begin
      loesch2a;
      setcolor(farbe3);
      outtextxy(40,410,'a eingeben');
      read(a);
      cleardevice;
      graphik2;
      setz;
      setz2;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure p1;
begin
  cleardevice;
  en;
  da:=5;
  krit:=1;
  graphik1;
  ausgabe1;
  menue;
end;


procedure p2;
begin
  cleardevice;
  en;
  da:=10;
  krit:=1;
  graphik2;
  ausgabe2;
  menue;
end;

procedure graphik3;
begin
  setbkcolor(farbe0);
  setcolor(7);
  outtextxy(40,40,'a[n]=1/(x+2*n*pi) (8) / von links (9) // l”schen (l) // x „ndern (m/M)');
  outtextxy(45,51,'Beispiele unter (6/7)');
  setcolor(farbe1);
  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  outtextxy(40,460,'Zoomen in x-Richtung (x/X) , in y-Richtung (y/Y) , normaler Zoom (z/Z) ');
  outtextxy(50,470,'Original wiederherstellen (w)    n ver„ndern (n/N)       beenden (b)');
  outtextxy(80,15,'Die Funktionen  sin(1/x) , x sin(1/x)  und  xý sin(1/x)');
  outtextxy(50,440,'sin(1/x) , x sin(1/x) , xý sin(1/x)  hinzufgen/l”schen (0/1/2/3/4/5)');
  setcolor(farbe3);
  outtextxy(80,15,'                sin(1/x) ');
  outtextxy(50,440,'sin(1/x)                                                 0 1 ');
  setcolor(farbe2);
  outtextxy(80,15,'                           x sin(1/x)  ');
  outtextxy(50,440,'           x sin(1/x)                                        2 3  ');
  setcolor(farbe4);
  outtextxy(80,15,'                                            xý sin(1/x)');
  outtextxy(50,440,'                        xý sin(1/x)                              4 5');
end;


procedure versuch3;
begin
    if l=0 then  y0:=zy*(sin(1/x));
    if l=1 then  y0:=zy*(x*sin(1/x));
    if l=2 then  y0:=zy*(x*x*sin(1/x));
end;


procedure f000;
begin
  for m:=1 to 800 do
  begin
    x0:=-zx/280-m*pi/400;
    for n:=0 to nend do
    begin
      x:=1/(x0-2*n*pi);
      versuch3;
      if (y0>-160) and (y0<160) then
      putpixel(320+round(zx*x),240-round(y0),farbe);
    end;
  end;
  for m:=1 to 800 do
  begin
    x0:=zx/280+m*pi/400;
    for n:=0 to nend do
    begin
      x:=1/(x0+2*n*pi);
      versuch3;
      if (y0>-160) and (y0<160) then
      putpixel(320+round(zx*x),240-round(y0),farbe);
    end;
  end;
end;

procedure s000;
begin
    x0:=-zx/280-m3*pi/20;
    for n:=0 to nend do
    begin
      x:=1/(x0-2*n*pi);
      versuch3;
      if (y0>-160) and (y0<160) and (x<0) then
      setcolor(farbe);
      circle(320+round(zx*x),240-round(y0),2);
    end;
end;

procedure s001;
begin
    x0:=zx/280+m3*pi/20;
    for n:=0 to nend do
    begin
      x:=1/(x0+2*n*pi);
      versuch3;
      if (y0>-160) and (y0<160) and (x>0) then
      setcolor(farbe);
      circle(320+round(zx*x),240-round(y0),2);
    end;
end;

procedure se001;
begin
  if hilf=1 then
  begin
    l:=0;
    versuch;
    farbe:=farbe3;
    s001;
  end;
  if hu=1 then
  begin
    l:=1;
    versuch;
    farbe:=farbe2;
    s001;
  end;
  if ho=1 then
  begin
    l:=2;
    versuch;
    farbe:=farbe4;
    s001;
  end;
end;

procedure loe3;
begin
  farbe:=farbe0;
  if hilf=1 then
  begin
    l:=0;
    versuch;
    if m34=1 then s000;
    if m33=1 then s001;
  end;
  if hu=1 then
  begin
    l:=1;
    versuch;
    if m34=1 then s000;
    if m33=1 then s001;
  end;
  if ho=1 then
  begin
    l:=2;
    versuch;
    if m34=1 then s000;
    if m33=1 then s001;
  end;
end;

procedure se000;
begin
  if hilf=1 then
  begin
    l:=0;
    versuch;
    farbe:=farbe3;
    s000;
  end;
  if hu=1 then
  begin
    l:=1;
    versuch;
    farbe:=farbe2;
    s000;
  end;
  if ho=1 then
  begin
    l:=2;
    versuch;
    farbe:=farbe4;
    s000;
  end;
end;

procedure sin1;
begin
  farbe:=farbe3;
  l:=0;
  f000;
end;


procedure sin2;
begin
  farbe:=farbe2;
  l:=1;
  f000;
end;

procedure sin3;
begin
  farbe:=farbe4;
  l:=2;
  f000;
end;

procedure sin1l;
begin
  farbe:=farbe0;
  l:=0;
  f000;
end;


procedure sin2l;
begin
  farbe:=farbe0;
  l:=1;
  f000;
end;

procedure sin3l;
begin
  farbe:=farbe0;
  l:=2;
  f000;
end;

procedure setz000;
begin
  if zx>=2500 then
  begin
    outtextxy(round(308+zx/100),245,'0,01');
    outtextxy(round(305-zx/100),245,'-0,01');
  line(round(320+zx/100),235,round(320+zx/100),240);
  line(round(320-zx/100),235,round(320-zx/100),240);
  end;
  if (zx>=250) and (zx<2500) then
  begin
    outtextxy(round(308+zx/10),245,'0,1');
    outtextxy(round(305-zx/10),245,'-0,1');
  line(round(320+zx/10),235,round(320+zx/10),240);
  line(round(320-zx/10),235,round(320-zx/10),240);
  end ;
  if (zx>20) and (zx<250) then
  begin
    outtextxy(318+zx,245,'1');
    outtextxy(315-zx,245,'-1');
    line(320+zx,235,320+zx,240);
    line(320-zx,235,320-zx,240);
  end;
  if zy<160 then
  begin
   outtextxy(300,242+zy,'-1');
   outtextxy(310,232-zy,'1');
   line(320,240+zy,325,240+zy);
   line(320,240-zy,325,240-zy);
  end;
end;


procedure setz111;
begin
  setcolor(farbe1);
  line(60,240,580,240);
  line(320,60,320,420);
  setz000;
end;

procedure loesch111;
begin
  setcolor(farbe0);
  setz000;
end;


procedure ausgabe3;
begin
  m3:=0;
  zx:=120;
  zy:=120;
  hilf:=1;
  hu:=0;
  ho:=0;
  nend:=10;
  setz111;
  str(nend,ortx1);outtextxy(460,470,ortx1);
  sin1;
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    'n':
    begin
      if nend>=10 then
      begin
        setcolor(farbe0);
        str(nend,ortx1);outtextxy(460,470,ortx1);
        nend:=nend-1;
        setcolor(farbe1);
        str(nend,ortx1);outtextxy(460,470,ortx1);
        wahl:=' ';
      end;
    end;
    'N':
    begin
        setcolor(farbe0);
        str(nend,ortx1);outtextxy(460,470,ortx1);
        nend:=nend+1;
        setcolor(farbe1);
        str(nend,ortx1);outtextxy(460,470,ortx1);
        wahl:=' ';
    end;
    '0':
    begin
      sin1;
      hilf:=1;
      wahl:=' ';
    end;
    '1':
    begin
      sin1l;
      hilf:=0;
      setz111;
      wahl:=' ';
    end;
    '2':
    begin
      sin2;
      hu:=1;
      wahl:=' ';
    end;
    '3':
    begin
      sin2l;
      hu:=0;
      setz111;
      wahl:=' ';
    end;
    '4':
    begin
      sin3;
      ho:=1;
      wahl:=' ';
    end;
    '5':
    begin
      sin3l;
      ho:=0;
      setz111;
      wahl:=' ';
    end;
    '8':
    begin
      se001;
      m33:=1;
      wahl:=' ';
    end;
    '9':
    begin
      se000;
      m34:=1;
      wahl:=' ';
    end;
    'l':
    begin
      loe3;
      setz111;
      if hilf=1 then sin1;
      if hu=1 then sin2;
      if ho=1 then sin3;
      setz111;
      m33:=0;
      m34:=0;
      wahl:=' ';
    end;
    'M':
    begin
      loe3;
      m3:=m3+1;
      setz111;
      if m33=1 then se001;
      if m34=1 then se000;
      if hilf=1 then sin1;
      if hu=1 then sin2;
      if ho=1 then sin3;
      setz111;
      wahl:=' ';
    end;
    'm':
    begin
      loe3;
      m3:=m3-1;
      if m33=1 then se001;
      if m34=1 then se000;
      if hilf=1 then sin1;
      if hu=1 then sin2;
      if ho=1 then sin3;
      setz111;
      wahl:=' ';
    end;
    'x':
    begin
    if zx>=17 then
    begin
      setcolor(farbe0);
      setfillstyle(0,farbe0);
      bar(0,60,640,420);
      zx:=round(zx*0.9);
      setz111;
      line(10,60,10,420);
      line(630,60,630,420);
      if hilf=1 then sin1;
      if hu=1 then sin2;
      if ho=1 then sin3;
      setz111;
      wahl:=' ';
    end;
    end;
    'X':
    begin
      setcolor(farbe0);
      setfillstyle(0,farbe0);
      bar(0,60,640,420);
      zx:=round(zx*1.1);
      setz111;
      line(10,60,10,420);
      line(630,60,630,420);
      if hilf=1 then sin1;
      if hu=1 then sin2;
      if ho=1 then sin3;
      setz111;
      wahl:=' ';
    end;
    'y':
    begin
    if zy>=17 then
    begin
      setcolor(farbe0);
      setfillstyle(0,farbe0);
      bar(40,60,600,420);
      zy:=round(zy*0.9);
      setz111;
      if hilf=1 then sin1;
      if hu=1 then sin2;
      if ho=1 then sin3;
      setz111;
      wahl:=' ';
    end;
    end;
    'Y':
    begin
      setcolor(farbe0);
      setfillstyle(0,farbe0);
      bar(40,60,600,420);
      zy:=round(zy*1.1);
      setz111;
      if hilf=1 then sin1;
      if hu=1 then sin2;
      if ho=1 then sin3;
      setz111;
      wahl:=' ';
    end;
    'z':
    begin
    if zx>=17 then
    begin
      setcolor(farbe0);
      setfillstyle(0,farbe0);
      bar(0,60,640,420);
      zx:=round(zx*0.9);
      zy:=zx;
      setz111;
      line(10,60,10,420);
      line(630,60,630,420);
      if hilf=1 then sin1;
      if hu=1 then sin2;
      if ho=1 then sin3;
      setz111;
      wahl:=' ';
    end;
    end;
    'Z':
    begin
      setcolor(farbe0);
      setfillstyle(0,farbe0);
      bar(0,60,640,420);
      zx:=round(zx*1.1);
      zy:=zx;
      setz111;
      line(10,60,10,420);
      line(630,60,630,420);
      if hilf=1 then sin1;
      if hu=1 then sin2;
      if ho=1 then sin3;
      setz111;
      wahl:=' ';
    end;
    'w':
    begin
      cleardevice;
      graphik3;
      m3:=5;
      zx:=120;
      zy:=120;
      nend:=20;
      sin1;
      hilf:=1;
      setz111;
      wahl:=' ';
    end;
    '6':
    begin
      cleardevice;
      graphik3;
      m3:=3;
      zx:=1200;
      zy:=120;
      nend:=10;
      sin1;
      hilf:=1;
      ho:=0;
      hu:=0;
      m33:=1;
      m34:=0;
      setz111;
      se001;
      wahl:=' ';
    end;
    '7':
    begin
      cleardevice;
      graphik3;
      m3:=10;
      zx:=1200;
      zy:=zx;
      nend:=10;
      sin2;
      hu:=1;
      hilf:=0;
      ho:=0;
      m33:=1;
      m34:=0;
      setz111;
      se001;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;



procedure p3;
begin
  cleardevice;
  en;
  graphik3;
  ausgabe3;
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
    'h':h000:=0;
    'd':h000:=1;
  end;
  until wahl1='b';
end.