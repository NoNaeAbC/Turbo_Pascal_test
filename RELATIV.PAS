program relativ;
uses crt,graph;
var
  t1,farbe,k0,l0,a,b,f0,f1,f2,f3,f4,f5,k,treiber,modus:integer;
  t3,t2,xstrich,ystrich,v,x,x0,y,y0,w,t0,t,dt:real;
  wahl2,wahl1,wahl:char;
  ortx10,ortx8,ortx7,ortx0,ortx1,ortx2,ortx3,ortx4,ortx5,ortx6:string;

procedure menue;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');

f1:=1;   {Hintergrundfarbe}
f0:=15;  {Schriftfarbe}
f2:=15;  {Hilfslinien von K}
f3:=11;  {Hilfslinien und Koordinaten von K`}
f4:=12;   {Meterstab}

  setbkcolor(7);
  setcolor(1);
  outtextxy(150,200,'Das Minkowski - Diagramm  ->  1');
  outtextxy(150,250,'Dopplereffekt  ->  2');
  outtextxy(400,400,'beenden  ->  b');
end;

procedure graphik1;
begin
  setbkcolor(f1);
  setcolor(f3);
  outtextxy(160,65,'x`= konst - Linien setzen/l”schen (S/L)');
  outtextxy(160,85,'t`= konst - Linien setzen/l”schen (s/l)  ');
  outtextxy(70,45,'t`-, x`-Achse setzen (t/x)    ');
  outtextxy(420,420,'x` = ');
  outtextxy(540,420,'t` = ');
  setcolor(f4);
  outtextxy(440,150,'Meterstab setzen/l”schen ');
  outtextxy(500,170,'(5/6/7/8)');
  outtextxy(440,270,'starten/ver„ndern (B/w/W)');
  outtextxy(500,250,'Bewegung w');
  outtextxy(20,420,'Uhr starten/Pause/stoppen (u/U/p/b)  ');
  setcolor(f0);
  str(v:3:2,ortx1);
  outtextxy(535,350,ortx1);
  outtextxy(500,350,'v =      * c');
  outtextxy(420,400,'x  = ');
  outtextxy(540,400,'t  = ');
  outtextxy(235,15,'Minkowski - Darstellung ');
  outtextxy(90,45,'                              Gitter K setzen/l”schen (1/2)   ');
  outtextxy(20,460,'v vergr”áern / verkleinern (V/v)   Cursor bewegen (Pfeiltasten)   beenden (b)');
end;


procedure s1;
begin
  line(100,400,400,400);
  line(100,400,100,100);
  outtextxy(375,410,'t');
  outtextxy(80,120,'x');
  for k:=1 to 5 do
  begin
    line(100+k*50,397,100+k*50,403);
    line(97,400-k*50,102,400-k*50);
    str(k:1,ortx0);
    outtextxy(97+k*50,407,ortx0);
    outtextxy(85,397-k*50,ortx0);
  end;
end;

procedure s2;
begin
  setcolor(f2);
  setlinestyle(1,0,1);
  for k:=1 to 5 do
  begin
    line(100+k*50,404,100+k*50,100);
    line(103,400-k*50,400,400-k*50);
  end;
  setlinestyle(0,0,1);
end;

procedure l2;
begin
  setcolor(f1);
  setlinestyle(1,0,1);
  for k:=1 to 5 do
  begin
    line(100+k*50,404,100+k*50,100);
    line(103,400-k*50,400,400-k*50);
  end;
  setlinestyle(0,0,1);
end;

procedure g1;
begin
  s1;
  line(100+a-5,400-b,100+a+5,400-b);
  line(100+a,400-b-5,100+a,400-b+5);
  t:=a/50;
  x:=b/50;
  t0:=(t-v*x)/sqrt(1-sqr(v));
  x0:=(x-v*t)/sqrt(1-sqr(v));
end;

procedure setz10;
begin
  setcolor(f3);
  str(t0:3:2,ortx4);
  outtextxy(585,420,ortx4+' s');
  str(x0:3:2,ortx5);
  outtextxy(465,420,ortx5+' Ls');
  setcolor(f0);
  str(t:3:2,ortx2);
  outtextxy(585,400,ortx2+' s');
  str(x:3:2,ortx3);
  outtextxy(465,400,ortx3+' Ls');
  g1;
end;

procedure loesch10;
begin
  setcolor(f1);
  outtextxy(585,400,ortx2+' s');
  outtextxy(465,400,ortx3+' Ls');
  outtextxy(585,420,ortx4+' s');
  outtextxy(465,420,ortx5+' Ls');
  g1;
end;

procedure setz11;
begin
  setcolor(f0);
  str(v:3:2,ortx1);
  outtextxy(535,350,ortx1);
end;

procedure loesch11;
begin
  setcolor(f1);
  outtextxy(535,350,ortx1);
end;

procedure setz13;
begin
  setcolor(f4);
  str(w:3:2,ortx8);
  outtextxy(535,300,ortx8+' * c');
  outtextxy(500,300,'w =');
  str((v+w)/(1+v*w):3:2,ortx10);
  outtextxy(535,320,ortx10+' * c');
  outtextxy(500,320,'W =');
end;

procedure loesch13;
begin
  setcolor(f1);
  outtextxy(535,300,ortx8+' * c');
  outtextxy(500,300,'w =');
  outtextxy(535,320,ortx10+' * c');
  outtextxy(500,320,'W =');
end;

procedure setz12;
begin
  setcolor(f4);
  str(t2:3:2,ortx7);
  outtextxy(585,440,ortx7+' s');
end;

procedure loesch12;
begin
  setcolor(f1);
  outtextxy(585,440,ortx7+' s');
end;

procedure rechnung1;
begin
  xstrich:=v*t+sqrt(1-sqr(v))*k0;
  ystrich:=1/v*t+1/v*sqrt(1-sqr(v))*l0;
{  t:=0;
  xstrich0:=round(xstrich);
  ystrich0:=round(ystrich);
  t:=5;
  xstrich1:=round(xstrich);
  ystrich1:=round(ystrich);
}
end;

procedure s50;
begin
for k0:=-trunc(6/sqrt(1-sqr(v))) to trunc(6/sqrt(1-sqr(v))) do
begin
  t1:=0;
  repeat
    t1:=t1+2;
    xstrich:=v*t1+sqrt(1-sqr(v))*50*k0;
    if xstrich>=0 then putpixel(100+t1,400-round(xstrich),farbe);
  until (t1>=300) or (xstrich>=300);
end;
end;

procedure s500;
begin
for l0:=-trunc(6/sqrt(1-sqr(v))) to trunc(6/sqrt(1-sqr(v))) do
begin
  t1:=0;
  repeat
    t1:=t1+2;
    ystrich:=1/v*t1+1/v*sqrt(1-sqr(v))*50*l0;
    if ystrich>=0 then putpixel(100+t1,400-round(ystrich),farbe);
  until (t1>=300) or (ystrich>=300);
end;
end;

procedure s51;
begin
  farbe:=f3;
  s500;
end;

procedure l51;
begin
  farbe:=f1;
  s500;
end;

procedure s5;
begin
  farbe:=f3;
  s50;
end;

procedure l5;
begin
  farbe:=f1;
  s50;
end;

procedure s30;
begin
  line(100,400,400,400-round(v*300));
  outtextxy(395,410-round(v*300),'t`');
  for k:=1 to trunc(5.8*sqrt(1-sqr(v))) do
  begin
    circle(100+round(k*50/sqrt(1-sqr(v))),400-round(k*50*v/sqrt(1-sqr(v))),2);
    str(k:1,ortx0);
    outtextxy(100+round(k*50/sqrt(1-sqr(v))),410-round(k*50*v/sqrt(1-sqr(v))),ortx0);
  end;
end;

procedure s70;
begin
  setlinestyle(0,0,3);
  line(100,400,100+round(50*v/sqrt(1-sqr(v))),400-round(50/sqrt(1-sqr(v))));
  setlinestyle(1,0,3);
  line(100,400-round(50*sqrt(1-sqr(v))),100+round(50*v/sqrt(1-sqr(v))),400-round(50/sqrt(1-sqr(v))));
  setlinestyle(0,0,1);
  str((sqrt(1-sqr(v))):3:2,ortx7);
  outtextxy(10,400-round(50*sqrt(1-sqr(v))),ortx7+' Ls');
  outtextxy(15,380-round(50*sqrt(1-sqr(v))),'l(v) =');
end;

procedure s80;
begin
  setlinestyle(1,0,1);
  line(100,350,100+round(50*v),350);
  setlinestyle(0,0,1);
  line(100,400,100,350);
  setlinestyle(0,0,1);
end;

procedure s8;
begin
  setcolor(f4);
  s80;
end;

procedure l8;
begin
  setcolor(f1);
  s80;
end;


procedure s7;
begin
  setcolor(f4);
  s70;
end;

procedure l7;
begin
  setcolor(f1);
  s70;
end;

procedure s3;
begin
  setcolor(f3);
  s30;
end;

procedure s40;
begin
  line(100,400,100+round(v*300),100);
  outtextxy(80+round(v*300),100,'x`');
  for k:=1 to trunc(5.8*sqrt(1-sqr(v))) do
  begin
    circle(100+round(k*50*v/sqrt(1-sqr(v))),400-round(k*50/sqrt(1-sqr(v))),2);
    str(k:1,ortx0);
    outtextxy(85+round(k*50*v/sqrt(1-sqr(v))),398-round(k*50/sqrt(1-sqr(v))),ortx0);
  end;
end;

procedure s4;
begin
  setcolor(f3);
  s40
end;

procedure l3;
begin
  setcolor(f1);
  s30;
  s40;
end;

procedure s55;
begin
  setcolor(f4);
  setlinestyle(1,0,1);
  for k:=1 to 5 do
  begin
    line(100+k*50,404,100+k*50,100);
    line(103,400-k*50,400,400-k*50);
  end;
  setlinestyle(0,0,1);
end;

procedure s6;
begin
  setcolor(f4);
  setlinestyle(1,0,1);
  for k:=1 to 5 do
  begin
    line(100+k*50,404,100+k*50,100);
    line(103,400-k*50,400,400-k*50);
  end;
  setlinestyle(0,0,1);
end;

procedure g2;
begin
  sector(100+round(t1/2),400-round(v*t1/2),0,360,3,3);
  line(100+round(t1/2),400-round(v*t1/2),100+round(t1/2),400);
  t0:=sqrt(1-sqr(v))*t1/100;
  x:=v*t1/100;
  t:=v*x+t0*sqrt(1-sqr(v));
  t2:=t0;
end;


procedure g200;
begin
  line(100+round((1-sqr(v))*t1/2),400,100+round(t1/2),400-round(v*t1/2));
  sector(100+round((1-sqr(v))*t1/2),400,0,360,3,3);
  x:=0;
  t:=(1-sqr(v))*t1/100;
  t0:=(t-v*x)/sqrt(1-sqr(v));
  x0:=(x-v*t)/sqrt(1-sqr(v));
  t2:=t0*sqrt(1-sqr(v));
end;

procedure g3;
begin
  sector(100+round(t1*(1+v*w)/2),400-round(t1*(v+w)/2),0,360,3,3);
  t:=t1*(1+v*w)/100;
  x:=t1*(v+w)/100;
  t0:=(t-v*x)/sqrt(1-sqr(v));
  x0:=(x-v*t)/sqrt(1-sqr(v));
  line(100+round(t0*50/sqrt(1-sqr(v))),400-round(50*t0*v/sqrt(1-sqr(v))),100+round(t*50),400-round(50*x));
  line(100+round(x0*50*v/sqrt(1-sqr(v))),400-round(50*x0/sqrt(1-sqr(v))),100+round(t*50),400-round(50*x));
  setlinestyle(1,0,1);
  line(100,400-round(50*x),100+round(t*50),400-round(50*x));
  line(100+round(t*50),400,100+round(t*50),400-round(50*x));
  setlinestyle(0,0,1);
end;


procedure auswahl1;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of

    'u':
    begin
      t1:=0;
      setfillstyle(0,f1);
      cleardevice;
      graphik1;
      setz10;
      g2;
      setcolor(f4);
      outtextxy(1,440,'Von K aus gesehen ist die bzgl K`ruhende Uhr bewegt und zeigt an:');
      outtextxy(530,440,'t(v) =');
      g2;
      setz12;
      wahl2:=' ';
      repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
          end;
        setfillstyle(0,f1);
        loesch10;
        loesch12;
        g2;
        t1:=t1+1;
        s3;
        s4;
        setz10;
        setz12;
        setcolor(f4);
        g2;
        delay(200);
      until (wahl2='b') or (t1>=601);
    wahl:=' ';
    end;
    'U':
    begin
      t1:=0;
      setfillstyle(0,f1);
      cleardevice;
      graphik1;
      setz10;
      g200;
      setcolor(f4);
      outtextxy(1,440,'Von K`aus gesehen ist die bzgl. K ruhende Uhr bewegt und zeigt an:');
      outtextxy(530,440,'t(v) =');
      g200;
      setz12;
      wahl2:=' ';
      repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
          end;
        setfillstyle(0,f1);
        loesch10;
        loesch12;
        g200;
        t1:=t1+1;
        s3;
        s4;
        setz10;
        setz12;
        setcolor(f4);
        g200;
        delay(200);
      until (wahl2='b') or (t1>=600);
    wahl:=' ';
    end;
    'B':
    begin
      cleardevice;
      graphik1;
      setz10;
      setfillstyle(0,f1);
      t1:=0;
      setz13;
      setcolor(f4);
      g3;
      wahl2:=' ';
      repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
          end;
        setfillstyle(0,f1);
        loesch10;
        loesch12;
        g3;
        t1:=t1+1;
        s3;
        s4;
        setz10;
        setcolor(f4);
        g3;
        delay(300);
      until (wahl2='b') or (t>=6);
    wahl:=' ';
    end;
    'w':
    begin
    if w>=0.02 then
      begin
      loesch13;
      w:=w-0.01;
      setz13;
      end;
      wahl:=' ';
    end;
    'W':
    begin
    if w<=0.99 then
      begin
      loesch13;
      w:=w+0.01;
      setz13;
      end;
      wahl:=' ';
    end;

    '0':
    begin
      cleardevice;
      graphik1;
      setz10;
      s1;
      g1;
      wahl:=' ';
    end;
    '1':
    begin
      s2;
      wahl:=' ';
    end;
    '2':
    begin
      l2;
      setcolor(f0);
      s1;
      wahl:=' ';
    end;
    't':
    begin
      s3;
      wahl:=' ';
    end;
    'x':
    begin
      s4;
      wahl:=' ';
    end;
    's':
    begin
      s5;
      wahl:=' ';
    end;
    'l':
    begin
      l5;
      setcolor(f0);
      s1;
      s3;
      wahl:=' ';
    end;
    'S':
    begin
      s51;
      wahl:=' ';
    end;
    'L':
    begin
      l51;
      setcolor(f0);
      s1;

      s4;
      wahl:=' ';
    end;
    '5':
    begin
      s7;
      wahl:=' ';
    end;
    '7':
    begin
      l7;
      s4;
      setcolor(f0);
      s1;
      wahl:=' ';
    end;
    '6':
    begin
      s8;
      wahl:=' ';
    end;
    '8':
    begin
      l8;
      s4;
      setcolor(f0);
      s1;
      wahl:=' ';
    end;
    'v':
    begin
      if v>=0.01 then
      begin
        l3;
        loesch11;
        v:=v-0.01;
        setz11;
        s1;
        s3;
        s4;
      end;
      wahl:=' ';
    end;
    'V':
    begin
      if v<=0.99 then
      begin
        l3;
        loesch11;
        v:=v+0.01;
        setz11;
        s1;
        s3;
        s4;
      end;
      wahl:=' ';
    end;
    chr(75):
    begin
      if a>1 then
      begin
        loesch10;
        a:=a-1;
        s3;
        s4;
        setz10;
      end;
      wahl:=' ';
    end;
    chr(77):
    begin
      if a<=300 then
      begin
        loesch10;
        a:=a+1;
        s3;
        s4;
        setz10;
      end;
      wahl:=' ';
    end;
    chr(80):
    begin
      if b>1 then
      begin
        loesch10;
        b:=b-1;
        s3;
        s4;
        setz10;
      end;
      wahl:=' ';
    end;
    chr(72):
    begin
      if b<=300 then
      begin
        loesch10;
        b:=b+1;
        s3;
        s4;
        setz10;
      end;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure rel;
begin
  cleardevice;
    v:=0.6;
    t:=0;
    x:=0;
    x0:=0;
    y0:=0;
    a:=0;
    b:=0;
    w:=0.5;
    dt:=0.001;
    graphik1;
    setz10;
    g1;
    auswahl1;
  menue;
end;

procedure graphik2;
begin
  setbkcolor(f1);
  setcolor(f3);
  outtextxy(160,65,'x`= konst - Linien setzen/l”schen (S/L)');
  outtextxy(160,85,'t`= konst - Linien setzen/l”schen (s/l)  ');
  outtextxy(70,45,'t`-, x`-Achse setzen (t/x)    ');
  outtextxy(420,420,'x` = ');
  outtextxy(540,420,'t` = ');
  setcolor(f0);
  str(v:3:2,ortx1);
  outtextxy(535,350,ortx1);
  outtextxy(500,350,'v =      * c');
  outtextxy(420,400,'x  = ');
  outtextxy(540,400,'t  = ');
  outtextxy(255,15,'Dopplereffekt ');
  outtextxy(250,440,'Bewegung starten (u)');
  outtextxy(90,45,'                              Gitter K setzen/l”schen (1/2)   ');
  outtextxy(20,460,'v vergr”áern / verkleinern (V/v)   Cursor bewegen (Pfeiltasten)   beenden (b)');
end;


procedure s21;
begin
  line(100,250,400,250);
  line(250,400,250,100);
  outtextxy(375,260,'t');
  outtextxy(230,120,'x');
  for k:=1 to 5 do
  begin
    line(100+k*50,247,100+k*50,253);
    line(247,400-k*50,252,400-k*50);
  end;
  for k:=4 to 5 do
  begin
    str((k-3):1,ortx0);
    outtextxy(97+k*50,257,ortx0);
    outtextxy(235,397-k*50,ortx0);
  end;
  for k:=1 to 2 do
  begin
    str((k-3):1,ortx0);
    outtextxy(94+k*50,257,ortx0);
    outtextxy(230,397-k*50,ortx0);
  end;
end;

procedure g21;
begin
  s21;
  line(250+a-5,250-b,250+a+5,250-b);
  line(250+a,250-b-5,250+a,250-b+5);
  t:=a/50;
  x:=b/50;
  t0:=(t-v*x)/sqrt(1-sqr(v));
  x0:=(x-v*t)/sqrt(1-sqr(v));
end;

procedure setz210;
begin
  setcolor(f3);
  str(t0:3:2,ortx4);
  outtextxy(585,420,ortx4+' s');
  str(x0:3:2,ortx5);
  outtextxy(465,420,ortx5+' Ls');
  setcolor(f0);
  str(t:3:2,ortx2);
  outtextxy(585,400,ortx2+' s');
  str(x:3:2,ortx3);
  outtextxy(465,400,ortx3+' Ls');
  g21;
end;

procedure loesch210;
begin
  setcolor(f1);
  outtextxy(585,400,ortx2+' s');
  outtextxy(465,400,ortx3+' Ls');
  outtextxy(585,420,ortx4+' s');
  outtextxy(465,420,ortx5+' Ls');
  g21;
end;

procedure setz211;
begin
  setcolor(f0);
  str(v:3:2,ortx1);
  outtextxy(535,350,ortx1);
end;

procedure loesch211;
begin
  setcolor(f1);
  outtextxy(535,350,ortx1);
end;

procedure setz213;
begin
  setcolor(f4);
  str(w:3:2,ortx8);
  outtextxy(535,320,ortx8+' * c');
      outtextxy(500,320,'w =');
end;

procedure loesch213;
begin
  setcolor(f1);
  outtextxy(535,320,ortx8+' * c');
      outtextxy(500,320,'w =');
end;

procedure setz212;
begin
  setcolor(f4);
  str(t2:3:2,ortx7);
  outtextxy(585,440,ortx7+' s');
end;

procedure loesch212;
begin
  setcolor(f1);
  outtextxy(585,440,ortx7+' s');
end;

procedure rechnung21;
begin
  xstrich:=v*t+sqrt(1-sqr(v))*k0;
  ystrich:=1/v*t+1/v*sqrt(1-sqr(v))*l0;
end;

procedure s250;
begin
for k0:=-trunc(6/sqrt(1-sqr(v))) to trunc(6/sqrt(1-sqr(v))) do
begin
  t1:=-150;
  repeat
    t1:=t1+2;
    xstrich:=v*t1+sqrt(1-sqr(v))*50*k0;
    if xstrich>=-150 then putpixel(250+t1,250-round(xstrich),farbe);
  until (t1>=150) or (xstrich>=150);
end;
end;

procedure s2500;
begin
for l0:=-trunc(6/sqrt(1-sqr(v))) to trunc(6/sqrt(1-sqr(v))) do
begin
  t1:=-150;
  repeat
    t1:=t1+2;
    ystrich:=1/v*t1+1/v*sqrt(1-sqr(v))*50*l0;
    if ystrich>=-150 then putpixel(250+t1,250-round(ystrich),farbe);
  until (t1>=150) or (ystrich>=150);
end;
end;

procedure s251;
begin
  farbe:=f3;
  s2500;
end;

procedure l251;
begin
  farbe:=f1;
  s2500;
end;

procedure s25;
begin
  farbe:=f3;
  s250;
end;

procedure l25;
begin
  farbe:=f1;
  s250;
end;

procedure s270;
begin
  setlinestyle(0,0,3);
  line(100,400,100+round(50*v/sqrt(1-sqr(v))),400-round(50/sqrt(1-sqr(v))));
  setlinestyle(1,0,3);
  line(100,400-round(50*sqrt(1-sqr(v))),100+round(50*v/sqrt(1-sqr(v))),400-round(50/sqrt(1-sqr(v))));
  setlinestyle(0,0,1);
  str((sqrt(1-sqr(v))):3:2,ortx7);
  outtextxy(10,400-round(50*sqrt(1-sqr(v))),ortx7+' Ls');
  outtextxy(15,380-round(50*sqrt(1-sqr(v))),'l(v) =');
end;

procedure s280;
begin
  setlinestyle(1,0,1);
  line(100,350,100+round(50*v),350);
  setlinestyle(0,0,1);
  line(100,400,100,350);
  setlinestyle(0,0,1);
end;

procedure s28;
begin
  setcolor(f4);
  s280;
end;

procedure l28;
begin
  setcolor(f1);
  s280;
end;


procedure s27;
begin
  setcolor(f4);
  s270;
end;

procedure l27;
begin
  setcolor(f1);
  s270;
end;

procedure s230;
begin
  line(100,250+round(v*150),400,250-round(v*150));
  outtextxy(395,260-round(v*150),'t`');
  for k:=-trunc(2.9*sqrt(1-sqr(v))) to trunc(2.9*sqrt(1-sqr(v))) do
  begin
    circle(250+round(k*50/sqrt(1-sqr(v))),250-round(k*50*v/sqrt(1-sqr(v))),2);
    str(k:1,ortx0);
    outtextxy(250+round(k*50/sqrt(1-sqr(v))),260-round(k*50*v/sqrt(1-sqr(v))),ortx0);
  end;
end;


procedure s23;
begin
  setcolor(f3);
  s230;
end;

procedure s240;
begin
  line(250+round(v*150),100,250-round(v*150),400);
  outtextxy(230+round(v*150),100,'x`');
  for k:=-trunc(2.9*sqrt(1-sqr(v))) to trunc(2.9*sqrt(1-sqr(v))) do
  begin
    circle(250+round(k*50*v/sqrt(1-sqr(v))),250-round(k*50/sqrt(1-sqr(v))),2);
    str(k:1,ortx0);
    outtextxy(225+round(k*50*v/sqrt(1-sqr(v))),248-round(k*50/sqrt(1-sqr(v))),ortx0);
  end;
end;

procedure s24;
begin
  setcolor(f3);
  s240
end;

procedure l23;
begin
  setcolor(f1);
  s230;
  s240;
end;

procedure s255;
begin
  setcolor(f4);
  setlinestyle(1,0,1);
  for k:=1 to 5 do
  begin
    line(100+k*50,404,100+k*50,100);
    line(103,400-k*50,400,400-k*50);
  end;
  setlinestyle(0,0,1);
end;

procedure s26;
begin
  setcolor(f4);
  setlinestyle(1,0,1);
  for k:=1 to 5 do
  begin
    line(100+k*50,404,100+k*50,100);
    line(103,400-k*50,400,400-k*50);
  end;
  setlinestyle(0,0,1);
end;

procedure g22;
begin
  sector(250+round(t1/2),250-round(v*t1/2),0,360,3,3);
  t0:=sqrt(1-sqr(v))*t1/100;
  x:=v*t1/100;
  t:=v*x+t0*sqrt(1-sqr(v));
  t2:=t0*sqrt(1-sqr(v));
end;

procedure g23;
begin
  sector(100+round(t1*(1+v*w)),400-round(t1*(v+w)),0,360,3,3);
  t:=t1*(1+v*w)/50;
  x:=t1*(v+w)/50;
  t0:=(t-v*x)/sqrt(1-sqr(v));
  x0:=(x-v*t)/sqrt(1-sqr(v));
  line(100+round(t0*50/sqrt(1-sqr(v))),400-round(50*t0*v/sqrt(1-sqr(v))),100+round(t*50),400-round(50*x));
  line(100+round(x0*50*v/sqrt(1-sqr(v))),400-round(50*x0/sqrt(1-sqr(v))),100+round(t*50),400-round(50*x));
  setlinestyle(1,0,1);
  line(100,400-round(50*x),100+round(t*50),400-round(50*x));
  line(100+round(t*50),400,100+round(t*50),400-round(50*x));
  setlinestyle(0,0,1);
end;


procedure auswahl2;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of

    'u':
    begin
      t1:=-300;
      setfillstyle(0,f1);
      loesch210;
      loesch212;
      cleardevice;
      graphik2;
      setz210;
      g21;
      g22;
      setcolor(14);
      str((sqrt(1-v)/sqrt(1+v)):4:2,ortx0);
      str((sqrt(1+v)/sqrt(1-v)):4:2,ortx10);
      outtextxy(190,420,ortx0+' s');
      outtextxy(340,420,ortx10+' s');
      outtextxy(100,420,'t(blau) =');
      outtextxy(260,420,'t(rot) =');
      setcolor(f4);
      g22;
      wahl2:=' ';
      repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
          end;
        setfillstyle(0,f1);
        loesch210;
        loesch212;
        g22;
        if (t0>=-2) and (250-round((100*(-v+1)/sqrt(1-sqr(v)))+(t*50))>=100) then
        begin
          if (250+round((100*(v+1)/sqrt(1-sqr(v)))+(t*50))<=400)
          then putpixel(250+round(t1/2),250+round((100*(v+1)/sqrt(1-sqr(v)))+(t*50)),14);
          putpixel(250+round(t1/2),250-round((100*(-v+1)/sqrt(1-sqr(v)))+(t*50)),14);
        end;
        if (t0>=-1) and (250-round((50*(-v+1)/sqrt(1-sqr(v)))+(t*50))>=100)  then
        begin
          if  250+round((50*(v+1)/sqrt(1-sqr(v)))+(t*50))<=400 then
          putpixel(250+round(t1/2),250+round((50*(v+1)/sqrt(1-sqr(v)))+(t*50)),14);
          putpixel(250+round(t1/2),250-round((50*(-v+1)/sqrt(1-sqr(v)))+(t*50)),14);
        end;
        if t0>=2 then
        begin
          putpixel(250+round(t1/2),250+round((100*(-v+1)/sqrt(1-sqr(v)))-(t*50)),14);
          putpixel(250+round(t1/2),250-round((100*(v+1)/sqrt(1-sqr(v)))-(t*50)),14);
        end;
        if t0>=1 then
        begin
          putpixel(250+round(t1/2),250+round((50*(-v+1)/sqrt(1-sqr(v)))-(t*50)),14);
          putpixel(250+round(t1/2),250-round((50*(v+1)/sqrt(1-sqr(v)))-(t*50)),14);
        end;
        if t0>=0 then
        begin
          putpixel(250+round(t1/2),250+round((0*(-v+1)/sqrt(1-sqr(v)))-(t*50)),14);
          putpixel(250+round(t1/2),250-round((0*(v+1)/sqrt(1-sqr(v)))-(t*50)),14);
        end;
        t1:=t1+1;
        s23;
        s24;
        setz210;
        setcolor(f4);
        g22;
        delay(160);
      until (wahl2='b') or (t1>=300);
    wahl:=' ';
    end;
    'B':
    begin
      setfillstyle(0,f1);
      loesch210;
      loesch212;
      g23;
      setz213;
      t1:=0;
      setcolor(f4);
      g23;
      wahl2:=' ';
      repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
          end;
        setfillstyle(0,f1);
        loesch210;
        loesch212;
        g23;
        t1:=t1+1;
        s23;
        s24;
        setz210;
        setcolor(f4);
        g23;
        delay(300);
      until (wahl2='b') or (t>=6);
    wahl:=' ';
    end;
    'w':
    begin
    if w>=0.02 then
      begin
      loesch213;
      w:=w-0.01;
      setz213;
      end;
      wahl:=' ';
    end;
    'W':
    begin
    if w<=0.99 then
      begin
      loesch213;
      w:=w+0.01;
      setz213;
      end;
      wahl:=' ';
    end;

    '0':
    begin
      cleardevice;
      graphik2;
      setz210;
      s21;
      g21;
      wahl:=' ';
    end;
    '1':
    begin
      s2;
      wahl:=' ';
    end;
    '2':
    begin
      l2;
      setcolor(f0);
      s21;
      wahl:=' ';
    end;
    't':
    begin
      s23;
      wahl:=' ';
    end;
    'x':
    begin
      s24;
      wahl:=' ';
    end;
    's':
    begin
      s25;
      wahl:=' ';
    end;
    'l':
    begin
      l25;
      setcolor(f0);
      s21;
      s23;
      wahl:=' ';
    end;
    'S':
    begin
      s251;
      wahl:=' ';
    end;
    'L':
    begin
      l251;
      setcolor(f0);
      s21;

      s24;
      wahl:=' ';
    end;
    '5':
    begin
      s27;
      wahl:=' ';
    end;
    '7':
    begin
      l27;
      s24;
      setcolor(f0);
      s21;
      wahl:=' ';
    end;
    '6':
    begin
      s28;
      wahl:=' ';
    end;
    '8':
    begin
      l28;
      s24;
      setcolor(f0);
      s21;
      wahl:=' ';
    end;
    'v':
    begin
      if v>=0.01 then
      begin
        l23;
        loesch211;
        v:=v-0.01;
        setz211;
        s21;
        s23;
        s24;
      end;
      wahl:=' ';
    end;
    'V':
    begin
      if v<=0.99 then
      begin
        l23;
        loesch211;
        v:=v+0.01;
        setz211;
        s21;
        s23;
        s24;
      end;
      wahl:=' ';
    end;
    chr(75):
    begin
      if a>-151 then
      begin
        loesch210;
        a:=a-1;
        s23;
        s24;
        setz210;
      end;
      wahl:=' ';
    end;
    chr(77):
    begin
      if a<=150 then
      begin
        loesch210;
        a:=a+1;
        s23;
        s24;
        setz210;
      end;
      wahl:=' ';
    end;
    chr(80):
    begin
      if b>-151 then
      begin
        loesch210;
        b:=b-1;
        s23;
        s24;
        setz210;
      end;
      wahl:=' ';
    end;
    chr(72):
    begin
      if b<=150 then
      begin
        loesch210;
        b:=b+1;
        s23;
        s24;
        setz210;
      end;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure rel2;
begin
  cleardevice;
    v:=0.6;
    t:=0;
    x:=0;
    x0:=0;
    y0:=0;
    a:=0;
    b:=0;
    w:=0.5;
    dt:=0.001;
    graphik2;
    setz210;
    g21;
    auswahl2;
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
    '1':rel;
    '2':rel2;
  end;
  until wahl1='b';
end.