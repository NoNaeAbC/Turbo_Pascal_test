program gedaempfteSchwingung;

uses crt,graph;
var
  k,treiber,modus:integer;
  alpha,delta1,i1,zeit,dL,dC,dR,taus,dt0,i,i0,R,C,L,t,dt,x0,y0,delta,omega,omega0,x,y:real;
  wahl:char;
  ortx6,ortx1,ortx2,ortx3,ortx4,ortx5:string;

procedure graphik;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
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

procedure rechnung;
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


procedure setz;
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
    rechnung;
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


procedure loesch;
begin
  t:=0;
    setcolor(1);
    outtextxy(230,405,ortx1);
    outtextxy(380,405,ortx2);
    outtextxy(530,405,ortx3);
    outtextxy(270,380,ortx6);
  repeat
    t:=t+dt;
    rechnung;
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



procedure ausgabe;
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
  setz;
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    'a':
    begin
      loesch;
      k:=k-1;
      alpha:=alpha-0.1*pi;
      setz;
      wahl:=' ';
    end;
    'A':
    begin
      loesch;
      k:=k+1;
      alpha:=alpha+0.1*pi;
      setz;
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
        loesch;
        R:=R-dR;
        setz;
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
      loesch;
      R:=R+dR;
      setz;
      wahl:=' ';
    end;
    'i':
    begin
      loesch;
      I0:=I0/2;
      setz;
      wahl:=' ';
    end;
    'I':
    begin
      loesch;
      I0:=I0*2;
      setz;
      wahl:=' ';
    end;
    'c':
    begin
      if C>=2*dC then
      begin
        loesch;
        C:=C-dC;
        setz;
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
      loesch;
      C:=C+dC;
      setz;
      wahl:=' ';
    end;
    'l':
    begin
      if L>=2*dL then
      begin
        loesch;
        L:=L-dL;
        setz;
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
      loesch;
      L:=L+dL;
      setz;
      wahl:=' ';
    end;
    'p':wahl:=readkey;
  end;
  until wahl='b';
end;

{Main}
begin
  graphik;
  ausgabe;
end.