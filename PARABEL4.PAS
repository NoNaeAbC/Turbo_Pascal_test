program parabel4;

uses crt,graph;
var
  z,k,treiber,modus:integer;
  xe1,xe2,xe3,xw1,xw2,dx,a,b,c,d,e,x,y,x0,x1,y0,y1:real;
  wahl:char;
  ortx7,ortx6,ortx1,ortx2,ortx3,ortx4,ortx5:string;

procedure graphik;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(1);
  setcolor(15);
  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  outtextxy(50,15,'Parabel vierten Grades');
  setcolor(12);
  outtextxy(260,15,'y = a * x^4 + b * xü + c * xý + d * x + e');
  setcolor(11);
      outtextxy(120,40,'1.Ableitung (1/3) ');
  setcolor(10);
      outtextxy(120,40,'                    2.Ableitung (2/4)');
  setcolor(15);
      outtextxy(120,40,'                                        l”schen (l)');
      outtextxy(7,455,'a/b/c/d/e vergr”áern (A/B/C/D/E)      a,b,c,d und e vorgeben (v)    beenden (x)');
      outtextxy(5,465,'   verkleinern (a/b/c/d/e)      Startwerte wiederherstellen(w)   zoomen (z/Z) ');
end;

procedure setz;
begin
  setcolor(15);
  outtextxy(300,237+z,'-1');
  outtextxy(310,237-z,'1');
  outtextxy(318+z,245,'1');
  outtextxy(315-z,245,'-1');
  line(60,240,580,240);
  line(320,60,320,420);
  line(320+z,235,320+z,240);
  line(320-z,235,320-z,240);
  line(320,240+z,325,240+z);
  line(320,240-z,325,240-z);
  x0:=-280;
  dx:=0.2;
  repeat
    x0:=x0+dx;
    x:=x0/z;
    y0:=z*(a*x*x*x*x+b*x*x*x+c*x*x+d*x+e);
    if (y0<=180) and (y0>=-180) then
      begin
        putpixel(320+round(x0),240-round(y0),12);
      end;
  until x0>=280;
  setcolor(12);
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
end;

procedure setz1;
begin
  x0:=-280;
  dx:=0.2;
  repeat
    x0:=x0+dx;
    x:=x0/z;
    y0:=z*(4*a*x*x*x+3*b*x*x+2*c*x+d);
    if (y0<=180) and (y0>=-180) then
      begin
        putpixel(320+round(x0),240-round(y0),11);
      end;
  until x0>=280;
end;

procedure setz3;
begin
  setcolor(11);
  setlinestyle(1,0,1);
  if (a<>0) and (d=0) and (9*b*b/64/a/a>=c/2/a) then
    begin
      xe1:=0;
      xe2:=-3*b/8/a+sqrt(9*b*b/64/a/a-c/2/a);
      xe3:=-3*b/8/a-sqrt(9*b*b/64/a/a-c/2/a);
      line(320+round(z*xe1),60,320+round(z*xe1),420);
      line(320+round(z*xe2),60,320+round(z*xe2),420);
      line(320+round(z*xe3),60,320+round(z*xe3),420);
    end;
  if (a<>0) and (d=0) and (9*b*b/64/a/a<c/2/a) then
    line(320+round(z*xe1),60,320+round(z*xe1),420);
  if (a<>0) and (d<>0) then
    begin
  x0:=-280;
  dx:=0.05;
    repeat
      x0:=x0+dx;
      x:=x0/z;
      y0:=z*(4*a*x*x*x+3*b*x*x+2*c*x+d);
      if (y0<=30/z) and (y0>=-30/z) then
      begin
        line(320+round(x0),60,320+round(x0),420);
      end;
    until x0>=280;
    end;
  setlinestyle(0,0,1);
  setcolor(15);
end;

procedure setz2;
begin
  x0:=-280;
  dx:=0.2;
  repeat
    x0:=x0+dx;
    x:=x0/z;
    y0:=z*(12*a*x*x+6*b*x+2*c);
    if (y0<=180) and (y0>=-180) then
      begin
        putpixel(320+round(x0),240-round(y0),10);
      end;
  until x0>=280;
end;

procedure setz4;
begin
  setcolor(10);
  setlinestyle(1,0,1);
    if (a<>0) and (b*b/16/a/a>=c/6/a) then
    begin
      xw1:=-b/4/a+sqrt(b*b/16/a/a-c/6/a);
      xw2:=-b/4/a-sqrt(b*b/16/a/a-c/6/a);
      line(320+round(z*xw1),60,320+round(z*xw1),420);
      line(320+round(z*xw2),60,320+round(z*xw2),420);
    end;
    setlinestyle(0,0,1);
    setcolor(15);
end;


procedure loesch;
begin
  setcolor(1);
  x0:=-280;
  dx:=0.2;
  repeat
    x0:=x0+dx;
    x:=x0/z;
    y0:=z*(a*x*x*x*x+b*x*x*x+c*x*x+d*x+e);
    if (y0<=180) and (y0>=-180) then
      begin
        putpixel(320+round(x0),240-round(y0),1);
      end;
  until x0>=280;
    outtextxy(135,430,ortx1);
    outtextxy(240,430,ortx2);
    outtextxy(340,430,ortx3);
    outtextxy(445,430,ortx4);
    outtextxy(540,430,ortx5);
end;

procedure loesch1;
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

procedure loesch2;
begin
  setcolor(1);
  x0:=-280;
  dx:=0.2;
  repeat
    x0:=x0+dx;
    x:=x0/z;
    y0:=z*(4*a*x*x*x+3*b*x*x+2*c*x+d);
    if (y0<=180) and (y0>=-180) then
      begin
        putpixel(320+round(x0),240-round(y0),1);
      end;
    y1:=z*(12*a*x*x+6*b*x+2*c);
    if (y1<=180) and (y1>=-180) then
      begin
        putpixel(320+round(x0),240-round(y1),1);
      end;
  until x0>=280;

    if (a<>0) and (b*b/16/a/a>=c/6/a) then
    begin
      xw1:=-b/4/a+sqrt(b*b/16/a/a-c/6/a);
      xw2:=-b/4/a-sqrt(b*b/16/a/a-c/6/a);
      line(320+round(z*xw1),60,320+round(z*xw1),420);
      line(320+round(z*xw2),60,320+round(z*xw2),420);
    end;
    if (a<>0) and (d=0) and (9*b*b/64/a/a>=c/2/a) then
    begin
      xe1:=0;
      xe2:=-3*b/8/a+sqrt(9*b*b/64/a/a-c/2/a);
      xe3:=-3*b/8/a-sqrt(9*b*b/64/a/a-c/2/a);
      line(320+round(z*xe1),60,320+round(z*xe1),420);
      line(320+round(z*xe2),60,320+round(z*xe2),420);
      line(320+round(z*xe3),60,320+round(z*xe3),420);
    end;
    if (a<>0) and (d=0) and (9*b*b/64/a/a<c/2/a) then
      line(320+round(z*xe1),60,320+round(z*xe1),420);
    if (a<>0) and (d<>0) then
    begin
  x0:=-280;
  dx:=0.05;
     repeat
      x0:=x0+dx;
      x:=x0/z;
      y0:=z*(4*a*x*x*x+3*b*x*x+2*c*x+d);
      if (y0<=30/z) and (y0>=-30/z) then
      begin
        line(320+round(x0),60,320+round(x0),420);
      end;
   until x0>=280;
  end;
  setcolor(15);
  line(320,60,320,420);
end;

procedure ausgabe;
begin
  z:=125;
  a:=1;
  b:=-1;
  c:=-1;
  d:=0;
  e:=0;
  setz;
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
      setz2;
      wahl:=' ';
    end;
    '3':
    begin
      setz3;
      wahl:=' ';
    end;
    '4':
    begin
      setz4;
      wahl:=' ';
    end;
    'l':
    begin
      loesch2;
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
      wahl:=' ';
    end;
    end;
    'Z':
    begin
      loesch;
      loesch1;
      z:=z+1;
      setz;
      wahl:=' ';
    end;
    'a':
    begin
      loesch;
      a:=a-0.01;
      setz;
      wahl:=' ';
    end;
    'A':
    begin
      loesch;
      a:=a+0.01;
      setz;
      wahl:=' ';
    end;
    'b':
    begin
      loesch;
      b:=b-0.05;
      setz;
      wahl:=' ';
    end;
    'B':
    begin
      loesch;
      b:=b+0.05;
      setz;
      wahl:=' ';
    end;
    'c':
    begin
      loesch;
      c:=c-0.05;
      setz;
      wahl:=' ';
    end;
    'C':
    begin
      loesch;
      c:=c+0.05;
      setz;
      wahl:=' ';
    end;
    'd':
    begin
      loesch;
      d:=d-0.05;
      setz;
      wahl:=' ';
    end;
    'D':
    begin
      loesch;
      d:=d+0.05;
      setz;
      wahl:=' ';
    end;
    'e':
    begin
      loesch;
      e:=e-0.05;
      setz;
      wahl:=' ';
    end;
    'E':
    begin
      loesch;
      e:=e+0.05;
      setz;
      wahl:=' ';
    end;
    'w':
    begin
      loesch;
      loesch1;
      z:=125;
      a:=1;
      b:=-1;
      c:=-1;
      d:=0;
      e:=0;
      setz;
      wahl:=' ';
    end;
    'v':
    begin
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
      loesch;
      graphik;
      setz;
      wahl:=' ';
    end;
    'p':wahl:=readkey;
  end;
  until wahl='x';
end;

{Main}
begin
  graphik;
  ausgabe;
end.