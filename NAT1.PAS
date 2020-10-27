program nat1;
uses crt,graph;

var
  zx,zy,N,f1,f2,f3,hilfe,treiber,modus,k:integer;
  a,b,R,C,dC,dR,U0,u1,t:real;
  wahl,wahl1:char;
  ortx,orty,ortz,ortx1,ortx2,ortx3,ortx4:string;


procedure menue;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(7);
  setcolor(1);
  outtextxy(100,250,'Aufladevorgang beim Kondensator  ->  1');
  outtextxy(100,300,'I - t -  und  U - t - Graphen bei einem Kondensator -> 2');
  outtextxy(400,400,'beenden  ->  b');
  f1:=1;   { Hintergrundfarbe }
  f2:=15;  { Schriftfarbe }
  f3:=12;  { Graph }
end;

procedure grafik;
begin
setbkcolor(f1);
setcolor(f2);
  line(20,250,140,250);
  line(20,250,20,340);
  line(20,340,50,340);
  line(55,340,140,340);
  line(50,330,50,350);
  line(55,335,55,345);
  line(140,250,140,285);
  line(140,305,140,340);
  line(20,295,50,295);
  line(50,280,50,310);
  line(55,280,55,310);
  line(55,295,75,295);
  line(75,290,100,290);
  line(75,300,100,300);
  line(75,290,75,300);
  line(100,290,100,300);
  line(100,295,120,295);
  circle(122,295,2);
  circle(140,287,2);
  circle(140,303,2);
  line(123,295,141,298);

  line(10,40,630,40);
  line(10,420,630,420);
  line(10,40,10,420);
  line(630,40,630,420);
  line(200,180,600,180);
  line(200,300,600,300);
  line(200,180,200,70);
  line(200,200,200,400);
  outtextxy(285,220,'aufladen');
  outtextxy(485,220,'entladen');
  outtextxy(173,67,'U');
  outtextxy(173,197,'I');
  outtextxy(610,180,'t');
  outtextxy(610,300,'t');
  line(300,185,300,180);
  outtextxy(283,188,'20 s');
  outtextxy(283,310,'20 s');
  line(250,185,250,180);
  line(350,185,350,180);
  line(250,305,250,300);
  line(300,305,300,300);
  line(350,305,350,300);

  line(195,100,200,100);
  outtextxy(150,97,'10 V');
  line(195,220,200,220);
  outtextxy(155,218,'1 mA');
  line(195,380,200,380);
  outtextxy(145,378,'-1 mA');
  outtextxy(170,20,'Auf- und Entladevorgang beim Kondensator ');
  outtextxy(495,365,'R = '); outtextxy(580,365,'kOhm');
  outtextxy(495,375,'C = '); outtextxy(580,375,'æF');
  outtextxy(495,395,'T = '); outtextxy(580,395,'s');
  outtextxy(130,430,'R ver„ndern (r/R)          C ver„ndern (c/C)   ');
  outtextxy(10,445,'Linien fr Halbierungen setzen/l”schen (s/l)  Anzahl der Linien „ndern (n/N)');
  outtextxy(540,462,'Beenden (b)');
end;

procedure lin;
begin
  setlinestyle(1,1,1);
 for k:=0 to N do
 begin
  line(200+trunc(ln(2)*C*R*5*(k+1)),300-trunc(50000/exp(ln(2)*k)*U0/R),200+trunc(ln(2)*C*R*5*(k+1)),300);
  line(200,300-trunc(50000/exp(ln(2)*k)*U0/R),200+trunc(ln(2)*C*R*5*(k+1)),300-trunc(50000/exp(ln(2)*k)*U0/R));
  line(200+trunc(ln(2)*C*R*5*(k+1)),180-trunc(10*U0-5/exp(ln(2)*k)*U0),200+trunc(ln(2)*C*R*5*(k+1)),180);
  line(200,180-trunc(10*U0-5/exp(ln(2)*k)*U0),200+trunc(ln(2)*C*R*5*(k+1)),180-trunc(10*U0-5/exp(ln(2)*k)*U0));
 end;
  setlinestyle(0,1,1);
end;

procedure linien;
begin
  setcolor(f2);
  lin;
end;

procedure loeschlinien;
begin
  setcolor(f1);
  lin;
end;

procedure ueberlagerung;
begin
  setcolor(f2);
  line(200,180,600,180);
  line(200,300,600,300);
  setlinestyle(1,1,1);
  line(400,70,400,400);
  line(200,180-trunc(10*U0),400,180-trunc(10*U0));
  setlinestyle(0,1,1);
  for k := 1 to 2000 do
  begin
    t:=0.02*k;
    putpixel(200+trunc(5*t),180-trunc(10*U0*(1-exp(-1/R/C*t))),f3);
    putpixel(200+trunc(5*t),300+trunc(100000*U0/R*(-exp(-1/C/R*t))),f3);
  end;
  u1:=U0*(1-exp(-1/R/C*t));
  for k := 1 to 2000 do
  begin
    t:=0.02*k;
    putpixel(400+trunc(5*t),180-trunc(10*u1*(exp(-1/R/C*t))),f3);
    putpixel(400+trunc(5*t),300+trunc(100000*u1/R*(exp(-1/R/C*t))),f3);
  end;
    str((R/1000):6:2,ortx);
    outtextxy(520,365,ortx);
    str((C*1000000):6:0,orty);
    outtextxy(520,375,orty);
    str(ln(2)*C*R:6:3,ortz);
    outtextxy(520,395,ortz);

end;


procedure aendern;
begin
  loeschlinien;
    setcolor(f1);
    outtextxy(520,365,ortx);
    outtextxy(520,375,orty);
    outtextxy(520,395,ortz);
  for k := 1 to 2000 do
  begin
    t:=0.02*k;
    putpixel(200+trunc(5*t),180-trunc(10*U0*(1-exp(-1/R/C*t))),f1);
    putpixel(200+trunc(5*t),300+trunc(100000*U0/R*(-exp(-1/C/R*t))),f1);
  end;
  u1:=U0*(1-exp(-1/R/C*t));
  for k := 1 to 2000 do
  begin
    t:=0.02*k;
    putpixel(400+trunc(5*t),180-trunc(10*u1*(exp(-1/R/C*t))),f1);
    putpixel(400+trunc(5*t),300+trunc(100000*u1/R*(exp(-1/R/C*t))),f1);
  end;
  setcolor(f2);
  line(200,180,600,180);
  line(200,300,600,300);
  line(200,200,200,400);
  line(200,180,200,70);
  setlinestyle(1,1,1);
  line(400,70,400,400);
  setlinestyle(0,1,1);

{
   setfillstyle(1,f1);
    bar(100,50,600,400);
    grafik;
}
end;

procedure auswahl;
begin
  wahl:=' ';
  repeat
    if keypressed then  wahl:=readkey;
    case wahl of
    's':
    begin
      linien;
      wahl:=' ';
    end;
    'l':
    begin
      loeschlinien;
      wahl:=' ';
    end;
    'n':
    begin
    if n>=1 then
    begin
      loeschlinien;
      n:=n-1;
      linien;
    end;
      wahl:=' ';
    end;
    'N':
    begin
      loeschlinien;
      n:=n+1;
      linien;
      wahl:=' ';
    end;
    'C':
    begin
     aendern;
      C:=C+dC;
     ueberlagerung;
      wahl:=' ';
    end;
    'c':
    begin
     if c>=2*dC then
     begin
     aendern;
      C:=C-dC;
     ueberlagerung;
     end;
      wahl:=' ';
    end;

    'R':
    begin
     aendern;
     R:=R+dR;
     ueberlagerung;
      wahl:=' ';
   end;
   'r':
   begin
     if R>=2*dR then
     begin
     aendern;
     R:=R-dR;
     ueberlagerung;
     end;
      wahl:=' ';
   end;
  end;
  until wahl='b';
end;

procedure kond2;
begin
  cleardevice;
  U0:=8;
  R:=10000;
  dR:=250;
  C:=1000/1000000;
  dC:=25/1000000;
  N:=0;
  grafik;
  ueberlagerung;
  auswahl;
  menue;
end;

procedure grafik1;
begin
setbkcolor(f1);
setcolor(f2);
  line(470,95,470,140);
  line(470,140,500,140);
  line(505,140,523,140);
  line(554,140,570,140);
  line(500,130,500,150);
  line(505,135,505,145);
  line(570,95,570,140);
  line(470,95,500,95);
  line(500,80,500,110);
  line(505,80,505,110);
  line(505,95,525,95);
  line(525,90,550,90);
  line(525,100,550,100);
  line(525,90,525,100);
  line(550,90,550,100);
  line(550,95,570,95);
  circle(525,140,2);
  circle(552,140,2);
  line(527,140,548,133);

  line(10,40,630,40);
  line(10,420,630,420);
  line(10,40,10,420);
  line(630,40,630,420);

  outtextxy(50,60,'I');
  outtextxy(610,350,'t');

  outtextxy(73+zx,350,'10 s');
  outtextxy(73+zx*2,350,'20 s');
  outtextxy(73+zx*3,350,'30 s');
  line(80+zx,335,80+zx,330);
  line(80+zx*2,335,80+zx*2,330);
  line(80+zx*3,335,80+zx*3,330);

  line(75,330-round(zy*1/2),80,330-round(zy*1/2));
  line(75,330-zy,80,330-zy);
  line(75,330-round(zy*1/4),80,330-round(zy*1/4));
  line(75,330-round(zy*3/4),80,330-round(zy*3/4));
  outtextxy(25,327-zy,' 1 mA');

  outtextxy(210,20,'Aufladevorgang beim Kondensator ');
  outtextxy(95,395,'R = '); outtextxy(180,395,'kOhm');
  outtextxy(295,395,'C = '); outtextxy(380,395,'æF');
  outtextxy(495,395,'T = '); outtextxy(580,395,'s');
  outtextxy(510,407,'zy =');
  outtextxy(390,407,'zx =');
    str(zx:4,ortx1);
    outtextxy(420,407,ortx1);
    str(zy:4,ortx2);
    outtextxy(540,407,ortx2);
  outtextxy(10,430,'   R ver„ndern (r/R)   C ver„ndern (c/C)   zx „ndern (x/X)   zy „ndern (y/Y)  ');
  outtextxy(10,445,'Linien fr Halbierungen setzen/l”schen (s/l)    Anzahl der Linien „ndern (n/N)');
  outtextxy(10,462,'wiederherstellen(w)  erg„nzen (e)  alles l”schen (L)  Graphik (g)  beenden (b)');
end;


procedure lin1;
begin
  setlinestyle(1,1,1);
 for k:=0 to N do
 begin
  line(80+trunc(ln(2)*C*R*zx/10*(k+1)),330-trunc(a/2/exp(ln(2)*k)),80+trunc(ln(2)*C*R*zx/10*(k+1)),330);
  line(80,330-trunc(a/2/exp(ln(2)*k)),80+trunc(ln(2)*C*R*zx/10*(k+1)),330-trunc(a/2/exp(ln(2)*k)));
 end;
  setlinestyle(0,1,1);
end;

procedure linien1;
begin
  setcolor(f2);
  lin1;
end;

procedure loeschlinien1;
begin
  setcolor(f1);
  lin1;
end;

procedure setz4;
begin
  setcolor(f2);
    str(zx:4,ortx1);
    outtextxy(420,407,ortx1);
  outtextxy(73+zx,350,'10 s');
  outtextxy(73+zx*2,350,'20 s');
  outtextxy(73+zx*3,350,'30 s');
  line(80+zx,335,80+zx,330);
  line(80+zx*2,335,80+zx*2,330);
  line(80+zx*3,335,80+zx*3,330);
end;

procedure setz5;
begin
  setcolor(f2);
    str(zy:4,ortx2);
    outtextxy(540,407,ortx2);
  line(75,330-round(zy*1/2),80,330-round(zy*1/2));
  line(75,330-zy,80,330-zy);
  line(75,330-round(zy*1/4),80,330-round(zy*1/4));
  line(75,330-round(zy*3/4),80,330-round(zy*3/4));
  outtextxy(25,327-zy,' 1 mA');
end;

procedure setz1;
begin
  setcolor(f2);
    str((R/1000):6:2,ortx);
    outtextxy(120,395,ortx);
end;

procedure setz2;
begin
  setcolor(f2);
    str((C*1000000):6:0,orty);
    outtextxy(320,395,orty);
end;

procedure setz3;
begin
  setcolor(f2);
    str(ln(2)*C*R:6:3,ortz);
    outtextxy(520,395,ortz);
end;

procedure loesch4;
begin
  loeschlinien1;
  setcolor(f1);
    outtextxy(420,407,ortx1);
  outtextxy(73+zx,350,'10 s');
  outtextxy(73+zx*2,350,'20 s');
  outtextxy(73+zx*3,350,'30 s');
  line(80+zx,335,80+zx,330);
  line(80+zx*2,335,80+zx*2,330);
  line(80+zx*3,335,80+zx*3,330);
end;

procedure loesch5;
begin
  loeschlinien1;
  setcolor(f1);
    outtextxy(540,407,ortx2);
  line(75,330-round(zy*1/2),80,330-round(zy*1/2));
  line(75,330-zy,80,330-zy);
  line(75,330-round(zy*1/4),80,330-round(zy*1/4));
  line(75,330-round(zy*3/4),80,330-round(zy*3/4));
  outtextxy(25,327-zy,' 1 mA');
end;

procedure loesch1;
begin
  setcolor(f1);
    outtextxy(120,395,ortx);
end;

procedure loesch2;
begin
  setcolor(f1);
    outtextxy(320,395,orty);
end;

procedure loesch3;
begin
  setcolor(f1);
    outtextxy(520,395,ortz);
end;

procedure ueberlagerung1;
begin
  setcolor(f2);
  line(80,330,80,70);
  line(80,330,600,330);
  t:=0;
  a:=1000/R*U0*zy;
  b:=C*R;
  repeat
    t:=t+2.5/zx;
    putpixel(80+round(zx/10*t),330-round(a*(exp(-t/b))),f3);
  until (80+round(zx/10*t))>=600;
end;


procedure aendern1;
begin
  loeschlinien;
  t:=0;
  a:=1000/R*U0*zy;
  b:=C*R;
  repeat
    t:=t+2.5/zx;
    putpixel(80+round(zx/10*t),330-round(a*(exp(-t/b))),f1);
  until (80+round(zx/10*t))>=600;
  setcolor(f2);
  line(80,330,80,70);
  line(80,330,600,330);
end;

procedure loeschalles1;
begin
   setfillstyle(1,f1);
    bar(0,0,78,480);
    grafik1;
end;

procedure loeschalles;
begin
   setfillstyle(1,f1);
    bar(100,50,600,400);
    grafik1;
end;

procedure auswahl1;
begin
  wahl:=' ';
  setz1;
  setz2;
  setz3;
  repeat
    if keypressed then  wahl:=readkey;
    case wahl of
    's':
    begin
      linien1;
      wahl:=' ';
    end;
    'l':
    begin
      loeschlinien1;
      wahl:=' ';
    end;
    'n':
    begin
    if n>=1 then
    begin
      loeschlinien1;
      n:=n-1;
      linien1;
    end;
      wahl:=' ';
    end;
    'N':
    begin
      loeschlinien1;
      n:=n+1;
      linien1;
      wahl:=' ';
    end;
    'C':
    begin
     aendern1;
     loesch2;
     loesch3;
      C:=C+dC;
     ueberlagerung1;
     setz2;
     setz3;
      wahl:=' ';
    end;
    'c':
    begin
     if C>=4*dC then
     begin
     aendern1;
     loesch2;
     loesch3;
      C:=C-dC;
     ueberlagerung1;
     setz2;
     setz3;
     end;
      wahl:=' ';
    end;
    'R':
    begin
     aendern1;
     loesch1;
     loesch3;
     R:=R+dR;
     ueberlagerung1;
     setz1;
     setz3;
      wahl:=' ';
   end;
   'r':
   begin
     if R>=4*dR then
     begin
     aendern1;
     loesch1;
     loesch3;
     R:=R-dR;
     ueberlagerung1;
     setz1;
     setz3;
     end;
      wahl:=' ';
   end;
   'L':
   begin
     cleardevice;
     grafik1;
     setz1;
     setz2;
     setz3;
     ueberlagerung1;
     wahl:=' ';
   end;
   'w':
   begin
     cleardevice;
     zx:=120;
     zy:=200;
     R:=10000;
     C:=0.001;
     N:=0;
     grafik1;
     setz1;
     setz2;
     setz3;
     ueberlagerung1;
     wahl:=' ';
    end;
    'X':
    begin
     aendern1;
     loesch4;
      zx:=zx+10;
     ueberlagerung1;
     setz4;
      wahl:=' ';
    end;
    'x':
    begin
     if zx>=20 then
     begin
     aendern1;
     loesch4;
      zx:=zx-10;
     ueberlagerung1;
     setz4;
     end;
      wahl:=' ';
    end;
    'Y':
    begin
     aendern1;
     loesch5;
      zy:=zy+10;
     ueberlagerung1;
     setz5;
      wahl:=' ';
    end;
    'y':
    begin
     if zy>=20 then
     begin
     aendern1;
     loesch5;
      zy:=zy-10;
     ueberlagerung1;
     setz5;
     end;
      wahl:=' ';
    end;
    'g':
    begin
      grafik1;
      wahl:=' ';
    end;
    'e':
    begin
      setcolor(f1);
    outtextxy(320,385,ortx4);
    outtextxy(120,385,ortx3);
      outtextxy(40,407,'Farbe');
      outtextxy(80,407,'  eingeben');
      setcolor(14);
      outtextxy(80,407,'R eingeben');
      read(R);
    str((R/1000):6:2,ortx3);
    outtextxy(120,385,ortx3);
      setcolor(1);
      outtextxy(80,407,'R');
      setcolor(14);
      outtextxy(80,407,'C');
      read(C);
    str((C*1000000):6:0,ortx4);
    outtextxy(320,385,ortx4);
      setcolor(1);
      outtextxy(80,407,'C');
      setcolor(14);
      outtextxy(40,407,'Farbe');
      read(f3);
      loeschalles1;
      setcolor(1);
      outtextxy(80,407,'  eingeben');
      ueberlagerung1;
      f3:=12;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure kond1;
begin
  cleardevice;
  U0:=10;
  R:=10000;
  dR:=250;
  C:=1000/1000000;
  dC:=25/1000000;
  N:=0;
  zx:=120;
  zy:=200;
  grafik1;
  ueberlagerung1;
  auswahl1;
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
    '1':kond1;
    '2':kond2;
  end;
  until wahl1='b';
end.