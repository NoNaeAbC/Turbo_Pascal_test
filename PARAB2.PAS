program parabel;

uses crt,graph;
var
  k,treiber,modus:integer;
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
  outtextxy(190,15,'Parabel');
  setcolor(12);
  outtextxy(280,15,'y = a * x� + b * x + c');
  setcolor(15);
      outtextxy(5,455,'a/b/c vergr��ern(A/B/C)  a,b und c vorgeben(v)  Startwerte wiederherstellen(w)');
      outtextxy(5,465,' verkleinern (a/b/c)      Hilfsparabel setzen/l�schen (s/l)      beenden (x) ');
end;

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
    outtextxy(50,430,'y =       * x� +       * x +      =       * ( x +      )� + ');
end;

procedure setz1;
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

procedure loesch;
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

procedure loesch1;
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


procedure ausgabe;
begin
  a:=1;
  b:=0;
  c:=0;
  setz;
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    's':
    begin
      setz1;
      wahl:=' ';
    end;
    'l':
    begin
      loesch1;
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
    'w':
    begin
      loesch;
      a:=1;
      b:=0;
      c:=0;
      setz;
      wahl:=' ';
    end;
    'v':
    begin
      setcolor(12);
      outtextxy(20,400,'a eingeben');
      read(a);
      outtextxy(20,410,'b eingeben');
      read(b);
      outtextxy(20,420,'c eingeben');
      read(c);
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