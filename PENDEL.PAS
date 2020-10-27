program pendel;

uses crt,graph;
var
  z,k,treiber,modus:integer;
  y0,y1,alpha0,dx1,dx2,x1,x2,t,dt,a1,a2,alpha,alpha1,alpha2,l,g,v1,v2,dv1,dv2:real;
  wahl,wahl1:char;
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
  line(400,100,400,400);
  line(400,250,600,250);
  line(450,245,450,255);
  line(500,245,500,255);
  line(550,245,550,255);
  line(600,245,600,255);
  outtextxy(447,260,'1');
  outtextxy(497,260,'2');
  outtextxy(547,260,'3');
  outtextxy(597,260,'4');
  outtextxy(610,245,'t');
  outtextxy(390,85,'x(t)');
      str(dt:6:4,ortx5);
      outtextxy(470,460,ortx5);
  outtextxy(100,15,'Vergleich zwischen             und ');
  outtextxy(6,460,'Pendell„nge vergr”áern/verkleinern (L/l) starten (s)  dt =       s „ndern (t/T)');
  outtextxy(12,472,'Anfangswinkel vergr”áern/verkleinern (A/a) Pause (p) wiederh.(w/W) beenden(b)');
  setcolor(14);
  outtextxy(100,15,'                   Fadenpendel');
    outtextxy(248,420,'alpha =       ø ');
    str((180*alpha/pi):4:2,ortx1);
    outtextxy(310,420,ortx1);
    outtextxy(280,400,'l =       m');
    str(l:4:2,ortx2);
    outtextxy(318,400,ortx2);
  setcolor(12);
  outtextxy(100,15,'                                   harmonischer Schwingung');
  setcolor(9);
  outtextxy(120,440,'Markierung nach rechts/links bewegen (M/m)');
end;

procedure setz;
begin
  a1:=-g*sin(x1/l);
  a2:=-g/l*x2;
    dv1:=a1*dt;
    dv2:=a2*dt;
    v1:=v1+dv1;
    v2:=v2+dv2;
    dx1:=v1*dt;
    dx2:=v2*dt;
    x1:=x1+dx1;
    x2:=x2+dx2;
    alpha1:=x1/l;
    alpha2:=x2/l;
    setcolor(12);
    circle(200,120,4);
    line(200,120,round(200+200*l*sin(alpha2)),round(120+200*l*cos(alpha2)));
    circle(round(200+200*l*sin(alpha2)),round(120+200*l*cos(alpha2)),3);
    setcolor(14);
    line(200,120,round(200+200*l*sin(alpha1)),round(120+200*l*cos(alpha1)));
    circle(round(200+200*l*sin(alpha1)),round(120+200*l*cos(alpha1)),3);
    putpixel(400+round(50*t),250-round(100*x1),14);
    putpixel(400+round(50*t),250-round(100*x2),12);
    setcolor(15);
  line(400,100,400,400);
  delay(10);
end;

procedure loesch;
begin
  setcolor(1);
    line(200,120,round(200+200*l*sin(alpha1)),round(120+200*l*cos(alpha1)));
    circle(round(200+200*l*sin(alpha1)),round(120+200*l*cos(alpha1)),3);
    line(200,120,round(200+200*l*sin(alpha2)),round(120+200*l*cos(alpha2)));
    circle(round(200+200*l*sin(alpha2)),round(120+200*l*cos(alpha2)),3);
end;

procedure zeit;
begin
      setcolor(12);
      outtextxy(480,400,'T =       s ');
      str((2*pi*sqrt(l/g)):4:2,ortx3);
      outtextxy(518,400,ortx3);
end;

procedure setz0;
begin
  y0:=475;
  x1:=alpha*l;
  x2:=alpha*l;
  a1:=-g*sin(x1/l);
  a2:=-g/l*x2;
  v1:=0;
  v2:=0;
  t:=0;
end;

procedure r0;
begin
  t:=0;
  dt:=0.0001;
  v1:=0;
  x1:=alpha*l;
  repeat
    t:=t+dt;
    a1:=-g*sin(x1/l);
    dv1:=a1*dt;
    v1:=v1+dv1;
    dx1:=v1*dt;
    x1:=x1+dx1;
    alpha1:=x1/l;
    until x1<=0;
    dt:=0.0008;
      setcolor(14);
      outtextxy(480,420,'T =       s ');
      str((4*t):4:2,ortx4);
      outtextxy(518,420,ortx4);
end;

procedure s2;
begin
  line(400,100,400,400);
  line(400,250,600,250);
  line(450,245,450,255);
  line(500,245,500,255);
  line(550,245,550,255);
  line(600,245,600,255);
  outtextxy(447,260,'1');
  outtextxy(497,260,'2');
  outtextxy(547,260,'3');
  outtextxy(597,260,'4');
  outtextxy(610,245,'t');
  outtextxy(390,85,'x(t)');
end;

procedure rechnung;
begin
  setz0;
  setz;
  wahl:=' ';
  wahl1:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    't':
    begin
      setcolor(1);
      outtextxy(470,460,ortx5);
      dt:=dt/2;
      setcolor(15);
      str(dt:6:4,ortx5);
      outtextxy(470,460,ortx5);
      wahl:=' ';
    end;
    'T':
    begin
      setcolor(1);
      outtextxy(470,460,ortx5);
      dt:=dt*2;
      setcolor(15);
      str(dt:6:4,ortx5);
      outtextxy(470,460,ortx5);
      wahl:=' ';
    end;
    'w':
    begin
      cleardevice;
      setz0;
      graphik;
      setz;
      wahl:=' ';
    end;
    'W':
    begin
      cleardevice;
      l:=1;
      alpha:=50/180*pi;
      setz0;
      graphik;
      setz;
      wahl:=' ';
    end;
    's':
    begin
      repeat
        loesch;
        t:=t+dt;
        setz;
        wahl:=' ';
        if keypressed then wahl1:=readkey;
        case wahl1 of
        'p':wahl1:=readkey;
        'b':halt;
        end;
      until t>=4;
      zeit;
      r0;
      t:=0;
      wahl:=' ';
    end;
    'l':
    begin
      if l>=0.02 then
      begin
        loesch;
        outtextxy(318,400,ortx2);
        l:=l-0.01;
        setcolor(14);
        str(l:4:2,ortx2);
        outtextxy(318,400,ortx2);
        setz0;
        setz;
        wahl:=' ';
      end;
    end;
    'L':
    begin
      loesch;
      outtextxy(318,400,ortx2);
      l:=l+0.01;
      setcolor(14);
      str(l:4:2,ortx2);
      outtextxy(318,400,ortx2);
      setz0;
      setz;
      wahl:=' ';
    end;
    'a':
    begin
      if alpha>=2/180*pi then
      begin
        loesch;
        outtextxy(310,420,ortx1);
        alpha:=alpha-1/180*pi;
        setcolor(14);
        str((180*alpha/pi):4:2,ortx1);
        outtextxy(310,420,ortx1);
        setz0;
        setz;
        wahl:=' ';
      end;
    end;
    'A':
    begin
      if alpha<178/180*pi then
      begin
        loesch;
        outtextxy(310,420,ortx1);
        alpha:=alpha+1/180*pi;
        setcolor(14);
        str((180*alpha/pi):4:2,ortx1);
        outtextxy(310,420,ortx1);
        setz0;
        setz;
        wahl:=' ';
      end;
    end;
    'm':
    begin
        setcolor(1);
      outtextxy(518,440,ortx6);
        y1:=y0;
        setlinestyle(1,0,1);
        line(round(y1),110,round(y1),390);
        setlinestyle(0,0,1);
        y1:=y1-1;
        setcolor(9);
        setlinestyle(1,0,1);
        line(round(y1),110,round(y1),390);
        setlinestyle(0,0,1);
      outtextxy(480,440,'t =       s ');
      str(((y1-400)/50):4:2,ortx6);
      outtextxy(518,440,ortx6);
        y0:=y1;
        setcolor(15);
        s2;
      wahl:=' ';
    end;
    'M':
    begin
        setcolor(1);
      outtextxy(518,440,ortx6);
        y1:=y0;
        setlinestyle(1,0,1);
        line(round(y1),110,round(y1),390);
        setlinestyle(0,0,1);
        y1:=y1+1;
        setcolor(9);
        setlinestyle(1,0,1);
        line(round(y1),110,round(y1),390);
        setlinestyle(0,0,1);
      outtextxy(480,440,'t =       s ');
      str(((y1-400)/50):4:2,ortx6);
      outtextxy(518,440,ortx6);
        y0:=y1;
        setcolor(15);
        s2;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

{MAIN}
begin
  l:=1;
  alpha:=50/180*pi;
  dt:=0.0008;

  g:=9.81;
  graphik;
  rechnung;
end.
