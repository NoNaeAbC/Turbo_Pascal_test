program ableitung2;

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
  outtextxy(80,100,'y = (a xý + b x + c) * sin(d x + e)  ->  1');
  outtextxy(80,150,'y = xý + a x + b + c sin(d x + e)  ->  2');
  outtextxy(80,200,'y = xý + a x + b + c x sin(d x + e)   ->  3');
  outtextxy(80,250,'y = xý + a x + b + c xý sin(d x + e)  ->  4');
  outtextxy(80,300,'y = (xü + a xý + b x + c ) sin(d x + e)  ->  5');
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


procedure graphik1;
begin
  g;
  setcolor(1);
      outtextxy(120,430,'1.Ableitung (1) ');
  setcolor(1);
      outtextxy(120,430,'                    2.Ableitung (2)');
      outtextxy(120,430,'                                        l”schen (l)');
  setcolor(15);
  outtextxy(7,455,'a/b/c/d/e vergr”áern (A/B/C/D/E)      a,b,c,d und e vorgeben (v)    beenden (x)');
  outtextxy(5,463,'   verkleinern (a/b/c/d/e)      Startwerte wiederherstellen(w)   zoomen (z/Z) ');
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

procedure versuch1;
begin
  setcolor(farbe);
  if l=1 then
  outtextxy(180,15,'y = (xý + a x + b) * sin(d x + e)');
  if l=2 then
  outtextxy(180,15,'y = xý + a x + b + c sin(d x + e) ');
  if l=3 then
  outtextxy(180,15,'y = xý + a x + b + c x sin(d x + e) ');
  if l=4 then
  outtextxy(180,15,'y = xý + a x + b + c xý sin(d x + e) ');
  if l=5 then
  outtextxy(180,15,'y = (xü + a xý + b x + c ) sin(d x + e)  ');
end;

procedure versuch;
begin
  if l=1 then
  y0:=z*(x*x+a*x+b)*sin(10*d*x+e);
  if l=2 then
  y0:=z*(x*x+a*x+b+c*sin(10*d*x+e));
  if l=3 then
  y0:=z*(x*x+a*x+b+c*x*sin(10*d*x+e));
  if l=4 then
  y0:=z*(x*x+a*x+b+c*x*x*sin(10*d*x+e));
  if l=5 then
  y0:=z*(x*x*x+a*x*x+b*x+c)*sin(10*d*x+e);
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

procedure setz1;
begin
  f1;
  farbe:=15;
  versuch1;
  setcolor(14);
    outtextxy(100,40,'a =');
    str(a:4:2,ortx1);
    outtextxy(135,40,ortx1);
    outtextxy(200,40,'b =');
    str(b:4:2,ortx2);
    outtextxy(235,40,ortx2);
    outtextxy(300,40,'c =');
    str(c:4:2,ortx3);
    outtextxy(335,40,ortx3);
    outtextxy(400,40,'d =');
    str((10*d):4:2,ortx4);
    outtextxy(435,40,ortx4);
    outtextxy(500,40,'e =');
    str(e:4:2,ortx5);
    outtextxy(535,40,ortx5);
    outtextxy(100,430,'');
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
    outtextxy(135,40,ortx1);
    outtextxy(235,40,ortx2);
    outtextxy(335,40,ortx3);
    outtextxy(435,40,ortx4);
    outtextxy(535,40,ortx5);
end;

procedure ausgabe;
begin
  a:=0;
  b:=0;
  c:=1;
  d:=1;
  e:=0;
  z:=175;
  setz;
  setz1;
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    '1':
    begin
      setz1;
      wahl:=' ';
    end;
    '2':
    begin
      setz1;
      wahl:=' ';
    end;
    '3':
    begin
      setz1;
      wahl:=' ';
    end;
    '4':
    begin
      setz1;
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
    'w':
    begin
      loesch;
      loesch1;
  a:=0;
  b:=0;
  c:=1;
  d:=1;
  e:=0;
  z:=175;
      setz;
      setz1;
      wahl:=' ';
    end;
    'v':
    begin
      loesch1;
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
      wahl:=' ';
    end;
    'l':
    begin
      cleardevice;
      graphik1;
      setz;
      setz1;
      wahl:=' ';
    end;
  end;
  until wahl='x';
end;

procedure p1;
begin
  cleardevice;
  farbe:=15;
  l1:=1;
  l:=l1;
  graphik1;
  versuch1;
  ausgabe;
  menue;
end;

procedure p2;
begin
  cleardevice;
  farbe:=15;
  l1:=2;
  l:=l1;
  graphik1;
  versuch1;
  ausgabe;
  menue;
end;

procedure p3;
begin
  cleardevice;
  farbe:=15;
  l1:=3;
  l:=l1;
  graphik1;
  versuch1;
  ausgabe;
  menue;
end;

procedure p4;
begin
  cleardevice;
  farbe:=15;
  l1:=4;
  l:=l1;
  graphik1;
  versuch1;
  ausgabe;
  menue;
end;

procedure p5;
begin
  cleardevice;
  farbe:=15;
  l1:=5;
  l:=l1;
  graphik1;
  versuch1;
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
    '4':p4;
    '5':p5;
  end;
  until wahl1='b';
end.