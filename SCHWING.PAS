program schwing;
uses crt,graph;
var
  ampl,hilfe,z,k,treiber,modus:integer;
  y0,y1,alpha0,dx1,dx2,x1,x2,t,dt,a1,a2,alpha,alpha1,alpha2,l,g,v1,v2,dv1,dv2:real;
  wahl,wahl1:char;
  ortx6,ortx1,ortx2,ortx3,ortx4,ortx5:string;
  delta1,i1,zeit,dL,dC,dR,taus,dt0,i,i0,R,C,x0,delta,omega,omega0,x,y:real;
  w1,w2,dw:real;
  ortx,orty,ortz:string;

procedure menue;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(7);
  setcolor(1);
  outtextxy(100,200,'Pendel (harmonisches und mathematisches)  ->  1');
  outtextxy(100,250,'Unged„mpfte und ged„mpfte elektrische Schwingungen  ->  2');
  outtextxy(100,300,'šberlagerung zweier sinusf”rmiger Schwingungen  ->  3');
  outtextxy(400,400,'beenden  ->  b');
end;




procedure graphik1;
begin
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

procedure setz1;
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

procedure loesch1;
begin
  setcolor(1);
    line(200,120,round(200+200*l*sin(alpha1)),round(120+200*l*cos(alpha1)));
    circle(round(200+200*l*sin(alpha1)),round(120+200*l*cos(alpha1)),3);
    line(200,120,round(200+200*l*sin(alpha2)),round(120+200*l*cos(alpha2)));
    circle(round(200+200*l*sin(alpha2)),round(120+200*l*cos(alpha2)),3);
end;

procedure zeit1;
begin
      setcolor(12);
      outtextxy(480,400,'T =       s ');
      str((2*pi*sqrt(l/g)):4:2,ortx3);
      outtextxy(518,400,ortx3);
end;

procedure setz10;
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

procedure r10;
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

procedure s12;
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

procedure rechnung1;
begin
  setz10;
  setz1;
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
      setz10;
      graphik1;
      setz1;
      wahl:=' ';
    end;
    'W':
    begin
      cleardevice;
      l:=1;
      alpha:=50/180*pi;
      setz10;
      graphik1;
      setz1;
      wahl:=' ';
    end;
    's':
    begin
      repeat
        loesch1;
        t:=t+dt;
        setz1;
        delay(20);
        wahl:=' ';
        wahl1:=' ';
        if keypressed then wahl1:=readkey;
        case wahl1 of
        'p':wahl1:=readkey;

        end;
      until (t>=4) or (wahl1='b');
      zeit1;
      r10;
      t:=0;
      wahl1:=' ';
      wahl:=' ';
    end;
    'l':
    begin
      if l>=0.02 then
      begin
        loesch1;
        outtextxy(318,400,ortx2);
        l:=l-0.01;
        setcolor(14);
        str(l:4:2,ortx2);
        outtextxy(318,400,ortx2);
        setz10;
        setz1;
        wahl:=' ';
      end;
    end;
    'L':
    begin
      loesch1;
      outtextxy(318,400,ortx2);
      l:=l+0.01;
      setcolor(14);
      str(l:4:2,ortx2);
      outtextxy(318,400,ortx2);
      setz10;
      setz1;
      wahl:=' ';
    end;
    'a':
    begin
      if alpha>=2/180*pi then
      begin
        loesch1;
        outtextxy(310,420,ortx1);
        alpha:=alpha-1/180*pi;
        setcolor(14);
        str((180*alpha/pi):4:2,ortx1);
        outtextxy(310,420,ortx1);
        setz10;
        setz1;
        wahl:=' ';
      end;
    end;
    'A':
    begin
      if alpha<178/180*pi then
      begin
        loesch1;
        outtextxy(310,420,ortx1);
        alpha:=alpha+1/180*pi;
        setcolor(14);
        str((180*alpha/pi):4:2,ortx1);
        outtextxy(310,420,ortx1);
        setz10;
        setz1;
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
        s12;
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
        s12;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure pen;
begin
  cleardevice;
  l:=1;
  alpha:=50/180*pi;
  dt:=0.0008;

  g:=9.81;
  graphik1;
  rechnung1;
  menue;
end;



procedure graphik2;
begin
  setbkcolor(1);
  setcolor(15);
  line(10,40,630,40);
  line(10,420,630,420);
  line(10,40,10,420);
  line(630,40,630,420);
  outtextxy(250,25,'Ged„mpfte Schwingung');
      outtextxy(65,435,'R vergr”áern (R)        L vergr”áern (L)        C vergr”áern (C)');
      outtextxy(65,450,' verkleinern (r)         verkleinern (l)         verkleinern (c)');
      outtextxy(25,465,'dR vergr”áern (g) / verkleinern (k)                        beenden (b)');
  setcolor(9);
  outtextxy(320,70,'Imax  verdoppeln (I) / halbieren (i)');
  setcolor(15);
end;

procedure rechnung2;
begin
  taus:=100000*t;
  delta:=R/2/L;
  omega0:=1/L/C;
  if omega0>delta*delta then
    begin
      omega:=sqrt(omega0-delta*delta);
      zeit:=2*pi/omega;
       i:=i0*exp(-delta*t)*cos(sqrt(omega0-delta*delta)*t+alpha);
    putpixel(100+round(taus),250-round(-i0*exp(-delta*t)),9);
    putpixel(100+round(taus),250-round(i0*exp(-delta*t)),9);
    putpixel(100+round(taus),250-round(i),14);
    end
    else
    begin
      delta1:=delta-sqrt(delta*delta-omega0);
      i:=i0*exp(-delta1*t)*cos(alpha);
      zeit:=0;
    putpixel(100+round(taus),250-round(i),12);
    end;
end;


procedure setz2;
begin
  t:=0;
  line(100,90,100,410);
  line(95,100,105,100);
  outtextxy(55,95,'Imax');
  line(95,400,105,400);
  outtextxy(40,395,'- Imax');
  line(100,250,610,250);
  line(200,245,200,255);
  outtextxy(198,265,'1 ');
  line(300,245,300,255);
  outtextxy(298,265,'2 ');
  line(400,245,400,255);
  outtextxy(398,265,'3 ');
  line(500,245,500,255);
  outtextxy(498,265,'5 ');
  line(600,245,600,255);
  outtextxy(585,265,'6 ms');
  setcolor(9);
    str(R:4:0,ortx1);
    outtextxy(230,405,ortx1);
    outtextxy(200,405,'R =      Ohm');
    str(L*1000:4:0,ortx2);
    outtextxy(380,405,ortx2);
    outtextxy(350,405,'L =      mH');
    str(C*1000000:4:2,ortx3);
    outtextxy(530,405,ortx3);
    outtextxy(500,405,'C =      æF');
    str(dR:4:0,ortx5);
    outtextxy(370,465,ortx5);
    outtextxy(340,465,'dR =      Ohm');
  setcolor(15);
  repeat
    t:=t+dt;
    rechnung2;
  until taus>=510;
  if omega0>delta*delta then
    begin
      setcolor(14);
      str(zeit*1000:4:3,ortx4);
      outtextxy(480,380,ortx4);
      outtextxy(450,380,'T =       ms');
      outtextxy(200,90,'I(t) = Imax * exp(-d*t) * cos(w*t + alpha)');
    end
    else
    begin
      setcolor(12);
      outtextxy(460,380,'Kriechfall');
      outtextxy(200,90,'I(t) = Imax * cos(alpha) * exp(- dø*t)   ');
    end;
      setcolor(9);
      str(k:4,ortx6);
      outtextxy(90,60,ortx6);
      outtextxy(40,60,'alpha =    * pi/10              alpha  vergr”áern (A) / verkleinern (a)');
end;


procedure loesch2;
begin
  t:=0;
    setcolor(1);
    outtextxy(230,405,ortx1);
    outtextxy(380,405,ortx2);
    outtextxy(530,405,ortx3);
    outtextxy(270,380,ortx6);
  repeat
    t:=t+dt;
    rechnung2;
    putpixel(100+round(taus),250-round(-i0*exp(-delta*t)),1);
    putpixel(100+round(taus),250-round(i0*exp(-delta*t)),1);
    putpixel(100+round(taus),250-round(i),1);
  until taus>=510;
  if omega0>delta*delta then
    begin
      str(zeit*1000:4:3,ortx4);
      outtextxy(480,380,ortx4);
      outtextxy(450,380,'T =       ms');
      outtextxy(200,90,'I(t) = Imax * exp(-d*t) * cos(w*t + alpha)');
    end
    else
    begin
      outtextxy(460,380,'Kriechfall');
      outtextxy(200,90,'I(t) = Imax * cos(alpha) * exp(- dø*t)  ');
    end;
      str(k:4,ortx6);
      outtextxy(90,60,ortx6);
      outtextxy(40,60,'alpha =    * pi/10');

    setcolor(15);
end;



procedure ausgabe2;
begin
  i0:=150;
  dt0:=0.0001;
  dt:=1/30*dt0;
  t:=0;
  R:=50;
  L:=0.035;
  C:=0.0000005;
  dR:=10;
  dL:=0.001;
  dC:=0.00000001;
  alpha:=0;
  k:=0;
  setz2;
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    'a':
    begin
      loesch2;
      k:=k-1;
      alpha:=alpha-0.1*pi;
      setz2;
      wahl:=' ';
    end;
    'A':
    begin
      loesch2;
      k:=k+1;
      alpha:=alpha+0.1*pi;
      setz2;
      wahl:=' ';
    end;
    'g':
    begin
      setcolor(1);
      str(dR:4:0,ortx5);
      outtextxy(370,465,ortx5);
      dR:=dR+1;
      str(dR:4:0,ortx5);
      setcolor(9);
      outtextxy(370,465,ortx5);
      wahl:=' ';
    end;
    'k':
    begin
      if dR>=2 then
      begin
        setcolor(1);
        str(dR:4:0,ortx5);
        outtextxy(370,465,ortx5);
        dR:=dR-1;
        setcolor(9);
        str(dR:4:0,ortx5);
        outtextxy(370,465,ortx5);
      end;
      wahl:=' ';
    end;
    'r':
    begin
      if R>=dR then
      begin
        loesch2;
        R:=R-dR;
        setz2;
        wahl:=' ';
      end
      else
      begin
        R:=R;
        wahl:=' ';
      end;
    end;
    'R':
    begin
      loesch2;
      R:=R+dR;
      setz2;
      wahl:=' ';
    end;
    'i':
    begin
      loesch2;
      I0:=I0/2;
      setz2;
      wahl:=' ';
    end;
    'I':
    begin
      loesch2;
      I0:=I0*2;
      setz2;
      wahl:=' ';
    end;
    'c':
    begin
      if C>=2*dC then
      begin
        loesch2;
        C:=C-dC;
        setz2;
        wahl:=' ';
      end
      else
      begin
        C:=C;
        wahl:=' ';
      end;
    end;
    'C':
    begin
      loesch2;
      C:=C+dC;
      setz2;
      wahl:=' ';
    end;
    'l':
    begin
      if L>=2*dL then
      begin
        loesch2;
        L:=L-dL;
        setz2;
        wahl:=' ';
      end
      else
      begin
        L:=L;
        wahl:=' ';
      end;
    end;
    'L':
    begin
      loesch2;
      L:=L+dL;
      setz2;
      wahl:=' ';
    end;
    'p':wahl:=readkey;
  end;
  until wahl='b';
end;

procedure ged;
begin
  cleardevice;
  graphik2;
  ausgabe2;
  menue;
end;


{
procedure auswahl;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    's':
    begin
      loesch;
      t:=0;
      x:=v*t;
      setz;
      delay(10000);
      repeat
        loesch;
        t:=t+dt;
        x:=v*t;
        setz;
      until x>=5;
    wahl:=' ';
    end;
    'v':
    begin
      if v>=0.2 then
      begin
        loesch1;
        v:=v-0.1;
        setz1;
      end;
      wahl:=' ';
    end;
    'V':
    begin
      loesch1;
      v:=v+0.1;
      setz1;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;


procedure bewegung;
begin
  cleardevice;
    v:=1.5;
    t:=0;
    x:=v*t;
    dt:=0.001;
    graphik;
    setz;
    auswahl;
  menue;
end;
}


procedure grafik3;
begin
  setbkcolor(1);
  setcolor(15);
  line(10,40,630,40);
  line(10,420,630,420);
  line(10,40,10,420);
  line(630,40,630,420);
  outtextxy(180,20,'šberlagerung zweier Schwingungen');
  outtextxy(40,370,'w1 = ');
  outtextxy(40,380,'w2 = ');
  outtextxy(40,390,'ampl =');
  outtextxy(210,380,'A(t) = 30*sin(w1*t)+ampl*sin(w2*t) , t = 0...550');
  outtextxy(20,430,'Amplitude ver„ndern (a/A)  w2 erh”hen (w)  w2 verringern (u)(w)  Beenden (b)');
  outtextxy(60,450,'Geschwindigkeit der Žnderung verdoppeln (d)(w)  halbieren (h)(w)');
end;

procedure ueberlagerung3;
begin
  for k := 1 to 11000 do
  begin
    t:=0.05*k;
    putpixel(50+trunc(t),220+trunc(30*sin(w1*t)+ampl*sin(w2*t)),14)
  end;
    setcolor(15);
    str(w1:7:4,ortx);
    outtextxy(70,370,ortx);
    str(w2:7:4,orty);
    outtextxy(70,380,orty);
    str(ampl:7,ortz);
    outtextxy(70,390,ortz);

end;

procedure aendern3;
begin
  for k := 1 to 11000 do
  begin
    t:=0.05*k;
    putpixel(50+trunc(t),220+trunc(30*sin(w1*t)+ampl*sin(w2*t)),0)
  end;
        setcolor(0);
    outtextxy(70,370,ortx);
    outtextxy(70,380,orty);
    outtextxy(70,390,ortz);
end;


procedure auswahl3;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    'a':
    begin
      aendern3;
      ampl:=ampl-1;
      ueberlagerung3;
      wahl:=' ';
    end;
    'A':
    begin
      aendern3;
      ampl:=ampl+1;
      ueberlagerung3;
      wahl:=' ';
    end;
    'h':
    begin
      dw:=dw/2;
      wahl:=' ';
    end;
    'd':
    begin
      dw:=dw*2;
      wahl:=' ';
    end;
    'u':
    begin
      dw:=-dw;
      wahl:=' ';
    end;
    'w':
    begin
     aendern3;
  w2:=w2+dw;
     ueberlagerung3;
     wahl:=' ';
   end;
 end;
  until wahl='b';
end;


procedure ueb;
begin
  cleardevice;
  w1:=0.3;
  w2:=0.32;
  dw:=0.01;
  ampl:=30;
  grafik3;
  ueberlagerung3;
  auswahl3;
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
    '1':pen;
    '2':ged;
    '3':ueb;
  end;
  until wahl1='b';
end.