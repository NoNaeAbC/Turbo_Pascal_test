program parabel3;

uses crt,graph;
var
  z,k,treiber,modus:integer;
  dx,a,b,c,d,x,y,x0,x1,y0,y1:real;
  wahl:char;
  ortx6,ortx1,ortx2,ortx3,ortx4,ortx5:string;

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
  outtextxy(100,15,'Parabel dritten Grades');
  setcolor(12);
  outtextxy(290,15,'y = a * x� + b * x� + c * x + d');
  setcolor(15);
      outtextxy(15,455,'a/b/c/d vergr��ern (A/B/C/D)        a,b,c und d vorgeben (v)      beenden (x)');
      outtextxy(15,465,'   verkleinern (a/b/c/d)        Startwerte wiederherstellen(w)   zoomen (z/Z) ');
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
    y0:=z*(a*x*x*x+b*x*x+c*x+d);
    if (y0<=180) and (y0>=-180) then
      begin
        putpixel(320+round(x0),240-round(y0),12);
      end;
  until x0>=280;
  setcolor(12);
    str(a:4:2,ortx1);
    outtextxy(190,430,ortx1);
    str(b:4:2,ortx2);
    outtextxy(290,430,ortx2);
    str(c:4:2,ortx3);
    outtextxy(390,430,ortx3);
    str(d:4:2,ortx4);
    outtextxy(480,430,ortx4);
    outtextxy(150,430,'y =       * x� +       * x� +      * x +');
end;

procedure loesch;
begin
  setcolor(1);
  x0:=-280;
  dx:=0.2;
  repeat
    x0:=x0+dx;
    x:=x0/z;
    y0:=z*(a*x*x*x+b*x*x+c*x+d);
    if (y0<=180) and (y0>=-180) then
      begin
        putpixel(320+round(x0),240-round(y0),1);
      end;
  until x0>=280;
    outtextxy(190,430,ortx1);
    outtextxy(290,430,ortx2);
    outtextxy(390,430,ortx3);
    outtextxy(480,430,ortx4);
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

procedure ausgabe;
begin
  z:=40;
  a:=1;
  b:=0;
  c:=0;
  d:=0;
  setz;
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
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
    'w':
    begin
      loesch;
      a:=1;
      b:=0;
      c:=0;
      d:=0;
      setz;
      wahl:=' ';
    end;
    'v':
    begin
      setcolor(12);
      outtextxy(40,410,'a eingeben');
      read(a);
      outtextxy(40,420,'b eingeben');
      read(b);
      outtextxy(40,430,'c eingeben');
      read(c);
      outtextxy(40,440,'d eingeben');
      read(d);
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