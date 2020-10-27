program chaos;
uses crt,graph;
var
  f1,f,l,n,k,treiber,modus:integer;
  a0,xzoom,yzoom,anf0,xanf0,oben0,unten0,xend0,oben,unten,anf,xend,da,a,start,y,dy,grenze:real;
  wahl1,wahl:char;
  ortx1,ortx2,ortx3,ortx4,ortx5,ortx6,ortx7,ortx8,ortx9:string;

procedure menue;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(15);
  setcolor(8);
  outtextxy(150,200,'Bev”lkerungsentwicklung   ->  1');
  outtextxy(150,300,'Periodenverdopplung  ->  2');
  outtextxy(400,400,'beenden  ->  b');
end;

procedure g1;
begin
  str(grenze:4:0,ortx3);
  outtextxy(30,360,ortx3);
  str((grenze+250):4:0,ortx3);
  outtextxy(530,360,ortx3);
  line(50,352,50,355);
  line(550,352,550,355);
end;

procedure g1hin;
begin
  setcolor(8);
  g1;
end;

procedure g1weg;
begin
  setcolor(15);
  g1;
end;


procedure g0;
begin
  n:=-1;
  repeat
    n:=n+1;
    line(45,350-25*n,48,350-25*n);
    str(n/10:2:1,ortx3);
    outtextxy(20,347-25*n,ortx3);
  until n>=10;
  g1;
end;


procedure graphik1;
begin
  setbkcolor(15);
  setcolor(8);
  g0;
  outtextxy(30,80,'y[n]');
  outtextxy(560,350,'n');
  line(10,30,630,30);
  line(10,430,630,430);
  line(10,30,10,430);
  line(630,30,630,430);
  str(a:8:6,ortx1);
  outtextxy(445,380,ortx1);
  str(start:8:6,ortx2);
  outtextxy(445,400,ortx2);
  str(da:8:6,ortx4);
  outtextxy(245,380,ortx4);
  outtextxy(200,380,'da =');
  str(dy:8:6,ortx5);
  outtextxy(245,400,ortx5);
  outtextxy(200,400,'dy =');
  outtextxy(400,380,'a = ');
  outtextxy(340,400,'Startwert : ');
  line(48,352,550,352);
  line(48,352,48,100);
  outtextxy(150,15,'Bev”lkerungsmodell  y[n+1] = a*y[n]*(1-y[n])');
  outtextxy(40,440,'a vergr”áern/verkleinern (A/a)   Startwert vergr”áern/verkleinern (V/v)');
  outtextxy(10,450,'da / dy vergr”áern/verkleinern (D/d//Y/y)  nach rechts/links verschieben (r/l)');
  outtextxy(15,460,'wiederherstellen (w)   Tabelle einfgen/weg (T/t)   starten (s)   beenden (b)');
end;


procedure setz1;
begin
  setcolor(8);
  str(a:8:6,ortx1);
  outtextxy(445,380,ortx1);
end;

procedure setz2;
begin
  setcolor(8);
  str(start:8:6,ortx2);
  outtextxy(445,400,ortx2);
end;

procedure setz3;
begin
  setcolor(8);
  str(da:8:6,ortx4);
  outtextxy(245,380,ortx4);
end;

procedure loesch3;
begin
  setcolor(15);
  outtextxy(245,380,ortx4);
end;

procedure setz4;
begin
  setcolor(8);
  str(dy:8:6,ortx5);
  outtextxy(245,400,ortx5);
end;

procedure loesch4;
begin
  setcolor(15);
  outtextxy(245,400,ortx5);
end;

procedure loesch1;
begin
  setcolor(15);
  outtextxy(445,380,ortx1);
end;

procedure loesch2;
begin
  setcolor(15);
  outtextxy(445,400,ortx2);
end;


procedure rechnung;
begin
  n:=0;
  y:=start;
  if l=1 then outtextxy(563,63,'n  y[n]');
  if grenze=0 then
   begin
    setcolor(f);
    circle(50,350-round(250*start),1);
    setcolor(f1);
   end;
  if (grenze=0) and (l=1) then
    begin
      str(n:4,ortx6);
      outtextxy(545,80+(n-round(grenze))*10,ortx6);
      str(y:4:3,ortx6);
      outtextxy(585,80+(n-round(grenze))*10,ortx6);
    end;
  repeat
    n:=n+1;
    y:=a*y*(1-y);
    if n>=grenze then
     begin
      setcolor(f);
      circle(50+2*(n-round(grenze)),350-round(250*y),1);
      setcolor(f1);
     end;
    if (n>=grenze) and (l=1) and (n<=grenze+25) then
    begin
      str(n:4,ortx6);
      outtextxy(545,80+(n-round(grenze))*10,ortx6);
      str(y:4:3,ortx6);
      outtextxy(585,80+(n-round(grenze))*10,ortx6);
    end;
  until n>=grenze+250;
end;

procedure bev;
begin
  setcolor(8);
  f:=12;
  f1:=8;
  rechnung;
end;

procedure bevweg;
begin
  setcolor(15);
  f:=15;
  f1:=15;
  rechnung;
end;



procedure auswahl1;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    's':
    begin
      bev;
    wahl:=' ';
    end;
    'r':
    begin
        g1weg;
        bevweg;
        grenze:=grenze+1;
        g1hin;
        bev;
      wahl:=' ';
    end;
    'l':
    begin
      if grenze>=1 then
      begin
        g1weg;
        bevweg;
        grenze:=grenze-1;
        g1hin;
        bev;
      end;
      wahl:=' ';
    end;
    'v':
    begin
      if start>=dy then
      begin
        loesch2;
        bevweg;
        start:=start-dy;
        setz2;
        bev;
      end;
      wahl:=' ';
    end;
    'V':
    begin
      if start<=1-dy then
      begin
        loesch2;
        bevweg;
        start:=start+dy;
        setz2;
        bev;
      end;
      wahl:=' ';
    end;
    'a':
    begin
      if a>=da then
      begin
        loesch1;
        bevweg;
        a:=a-da;
        setz1;
        bev;
      end;
      wahl:=' ';
    end;
    'A':
    begin
      if a<=4-da then
      begin
        loesch1;
        bevweg;
        a:=a+da;
        setz1;
        bev;
      end;
      wahl:=' ';
    end;
    't':
    begin
      bevweg;
      l:=0;
      bev;
      wahl:=' ';
    end;
    'T':
    begin
      l:=1;
      bev;
      wahl:=' ';
    end;
    'w':
    begin
      cleardevice;
      start:=0.4;
      grenze:=0;
      a:=3;
      da:=0.01;
      dy:=0.1;
      n:=0;
      l:=0;
      graphik1;
      bev;
      wahl:=' ';
    end;
    'd':
    begin
      loesch3;
      da:=da/10;
      setz3;
      wahl:=' ';
    end;
    'D':
    begin
      loesch3;
      da:=da*10;
      setz3;
      wahl:=' ';
    end;
    'y':
    begin
      loesch4;
      dy:=dy/10;
      setz4;
      wahl:=' ';
    end;
    'Y':
    begin
      loesch4;
      dy:=dy*10;
      setz4;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;



procedure p1;
begin
  cleardevice;
    start:=0.0003;
    grenze:=0;
    a:=1.3;
    da:=0.01;
    dy:=0.1;
    n:=0;
    l:=0;
    graphik1;
    bev;
    auswahl1;
  menue;
end;


procedure g2;
begin
  str(anf:4:3,ortx3);
  outtextxy(30,360,ortx3);
  str((anf+125/xzoom):4:3,ortx3);
  outtextxy(155,360,ortx3);
  str((anf+250/xzoom):4:3,ortx3);
  outtextxy(280,360,ortx3);
  str((anf+375/xzoom):4:3,ortx3);
  outtextxy(405,360,ortx3);
  str((anf+500/xzoom):4:3,ortx3);
  outtextxy(530,360,ortx3);
  line(50,352,50,355);
  line(175,352,175,355);
  line(300,352,300,355);
  line(425,352,425,355);
  line(550,352,550,355);
  outtextxy(30,80,'y[n]');
  outtextxy(560,350,'a');
end;

procedure g2hin;
begin
  setcolor(8);
  g2;
end;

procedure g2weg;
begin
  setcolor(15);
  g2;
end;


procedure g20;
begin
  if (unten=0) and (oben=1) then
  begin
  n:=-1;
  repeat
    n:=n+1;
    line(45,350-25*n,48,350-25*n);
    str(n/10:2:1,ortx3);
    outtextxy(20,347-25*n,ortx3);
  until n>=10;
  end
  else
  begin
    line(45,350,48,350);
    str(unten:3:2,ortx3);
    outtextxy(15,347,ortx3);
    line(45,100,48,100);
    str(oben:3:2,ortx3);
    outtextxy(15,97,ortx3);
  end;
  g2;
end;


procedure graphik2;
begin
  setbkcolor(15);
  setcolor(8);
  g20;
  line(10,30,630,30);
  line(10,430,630,430);
  line(10,30,10,430);
  line(630,30,630,430);

  str(anf:8:6,ortx1);
  outtextxy(395,380,ortx1);
  str(start:8:6,ortx2);
  outtextxy(245,420,ortx2);
  str(a0:8:0,ortx4);
  outtextxy(245,380,ortx4);
  outtextxy(100,380,'Aufl”sung:  a0 =');
  str(grenze:4:0,ortx5);
  outtextxy(275,400,ortx5);
  outtextxy(100,400,'Genauigkeitsgrenze =');
  outtextxy(350,380,'anf = ');
  outtextxy(100,420,'Startwert : ');
  str(xend:8:6,ortx7);
  outtextxy(545,380,ortx7);
  outtextxy(500,380,'end =');
  str(unten:8:6,ortx8);
  outtextxy(395,400,ortx8);
  outtextxy(335,400,'unten =');
  str(oben:8:6,ortx9);
  outtextxy(545,400,ortx9);
  outtextxy(493,400,'oben =');

  line(48,352,550,352);
  line(48,352,48,100);
  outtextxy(150,15,'Bev”lkerungsmodell  y[n+1] = a*y[n]*(1-y[n]) ');
  outtextxy(40,440,'da vergr”áern/verkleinern (D/d)   Startwert vergr”áern/verkleinern (V/v)');
  outtextxy(40,450,'Zoomgrenzen eingeben (E)   Zoomrahmen setzen/zoomen (l/L/r/R/o/O/u/U//z)');
  outtextxy(15,460,'wiederherstellen (w)  Genauigkeitsgrenze „ndern (g/G)  starten/beenden (s/b)');
  outtextxy(150,470,'a0  und  Genauigkeitsgrenze eingeben (e)');
end;


procedure setz21;
begin
  setcolor(8);
  str(anf:8:6,ortx1);
  outtextxy(395,380,ortx1);
  str(xend:8:6,ortx7);
  outtextxy(545,380,ortx7);
  str(unten:8:6,ortx8);
  outtextxy(395,400,ortx8);
  str(oben:8:6,ortx9);
  outtextxy(545,400,ortx9);
end;

procedure setz22;
begin
  setcolor(8);
  str(start:8:6,ortx2);
  outtextxy(245,420,ortx2);
end;

procedure setz23;
begin
  setcolor(8);
  str(a0:8:0,ortx4);
  outtextxy(245,380,ortx4);
end;

procedure loesch23;
begin
  setcolor(15);
  outtextxy(245,380,ortx4);
end;

procedure setz24;
begin
  setcolor(8);
  str(grenze:4:0,ortx5);
  outtextxy(275,400,ortx5);
end;

procedure loesch24;
begin
  setcolor(15);
  outtextxy(275,400,ortx5);
end;

procedure loesch21;
begin
  setcolor(15);
  outtextxy(395,380,ortx1);
  outtextxy(545,380,ortx7);
  outtextxy(395,400,ortx8);
  outtextxy(545,400,ortx9);
end;

procedure loesch22;
begin
  setcolor(15);
  outtextxy(245,420,ortx2);
end;

procedure rech;
begin
  xzoom:=round(500/abs(xend-anf));
  yzoom:=round(250/abs(oben-unten));
end;

procedure linieR;
begin
  setlinestyle(1,0,1);
  line(50+round(xzoom*(xend0-anf)),110,50+round(xzoom*(xend0-anf)),340);
  setlinestyle(0,0,1);
  outtextxy(50+round(xzoom*(xend0-anf)),100,'rechts');
end;

procedure rhin;
begin
  setcolor(1);
  linieR;
end;

procedure rweg;
begin
  setcolor(15);
  linieR;
end;

procedure linieL;
begin
  setlinestyle(1,0,1);
  line(50+round(xzoom*(anf0-anf)),110,50+round(xzoom*(anf0-anf)),340);
  setlinestyle(0,0,1);
  outtextxy(50+round(xzoom*(anf0-anf)),100,'links');
end;

procedure lhin;
begin
  setcolor(2);
  linieL;
end;

procedure lweg;
begin
  setcolor(15);
  linieL;
end;

procedure linieO;
begin
  setlinestyle(1,0,1);
  line(70,350-round(yzoom*(oben0-unten)),530,350-round(yzoom*(oben0-unten)));
  setlinestyle(0,0,1);
  outtextxy(60,360-round(yzoom*(oben0-unten)),'oben');
end;

procedure ohin;
begin
  setcolor(2);
  linieO;
end;

procedure oweg;
begin
  setcolor(15);
  linieO;
end;

procedure linieU;
begin
  setlinestyle(1,0,1);
  line(70,350-round(yzoom*(unten0-unten)),530,350-round(yzoom*(unten0-unten)));
  setlinestyle(0,0,1);
  outtextxy(60,360-round(yzoom*(unten0-unten)),'unten');
end;

procedure uhin;
begin
  setcolor(1);
  linieU;
end;

procedure uweg;
begin
  setcolor(15);
  linieU;
end;

procedure rechnung2;
begin
 a:=anf-da;
 repeat
 a:=a+da;
  n:=0;
  y:=start;
  repeat
    n:=n+1;
    if a<4 then y:=a*y*(1-y);
    if (n>=grenze) and (yzoom*(y-unten)>=0) and (yzoom*(y-unten)<=250) then
     putpixel(50+round(xzoom*(a-anf)),350-round(yzoom*(y-unten)),f);
  until n>=grenze+250;
 until xzoom*(a-anf)>=500;
end;

procedure bev2;
begin
  setcolor(8);
  f:=12;
  rechnung2;
end;

procedure bevweg2;
begin
  setcolor(15);
  f:=15;
  rechnung2;
end;



procedure auswahl2;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    's':
    begin
      da:=(xend-anf)/a0;
      rech;
      cleardevice;
      graphik2;
      bev2;
    wahl:=' ';
    end;
    'E':
    begin
      setcolor(12);
      outtextxy(420,420,'anf eingeben');
      read(anf);
      setcolor(15);
      outtextxy(420,420,'anf eingeben');
      setcolor(12);
      outtextxy(420,420,'end eingeben');
      read(xend);
      setcolor(15);
      outtextxy(420,420,'end eingeben');
      setcolor(12);
      outtextxy(420,420,'unten eingeben');
      read(unten);
      setcolor(15);
      outtextxy(420,420,'unten eingeben');
      setcolor(12);
      outtextxy(420,420,'oben eingeben');
      read(oben);
      da:=(xend-anf)/a0;
      unten0:=unten;
      oben0:=oben;
      xend0:=xend;
      anf0:=anf;
      rech;
      cleardevice;
      graphik2;
      bev2;
      wahl:=' ';
    end;
    'e':
    begin
      setcolor(12);
      outtextxy(420,420,'a0 eingeben');
      read(a0);
      setcolor(15);
      outtextxy(420,420,'a0 eingeben');
      setcolor(12);
      outtextxy(420,420,'grenze eingeben');
      read(grenze);
      da:=(xend-anf)/a0;
      cleardevice;
      graphik2;
      bev2;
      wahl:=' ';
    end;
    'o':
    begin
        oweg;
        oben0:=oben0-5/yzoom;
        ohin;
      wahl:=' ';
    end;
    'O':
    begin
        oweg;
        oben0:=oben0+5/yzoom;
        ohin;
      wahl:=' ';
    end;
    'u':
    begin
        uweg;
        unten0:=unten0+5/yzoom;
        uhin;
      wahl:=' ';
    end;
    'U':
    begin
        uweg;
        unten0:=unten0-5/yzoom;
        uhin;
      wahl:=' ';
    end;
    'r':
    begin
        rweg;
        xend0:=xend0-5/xzoom;
        rhin;
      wahl:=' ';
    end;
    'R':
    begin
        rweg;
        xend0:=xend0+5/xzoom;
        rhin;
      wahl:=' ';
    end;
    'z':
    begin
      unten:=unten0;
      oben:=oben0;
      anf:=anf0;
      xend:=xend0;
      da:=(xend-anf)/a0;
      rech;
      cleardevice;
      graphik2;
      bev2;
      wahl:=' ';
    end;
    'l':
    begin
        lweg;
        anf0:=anf0+5/xzoom;
        lhin;
      wahl:=' ';
    end;
    'L':
    begin
        lweg;
        anf0:=anf0-5/xzoom;
        lhin;
      wahl:=' ';
    end;
    'v':
    begin
      if start>=dy then
      begin
        loesch22;
        start:=start-dy;
        setz22;
      end;
      wahl:=' ';
    end;
    'V':
    begin
      if start<=1-dy then
      begin
        loesch22;
        start:=start+dy;
        setz22;
      end;
      wahl:=' ';
    end;
    'g':
    begin
      loesch24;
      grenze:=grenze/2;
      setz24;
      wahl:=' ';
    end;
    'G':
    begin
      loesch24;
      grenze:=grenze*2;
      setz24;
      wahl:=' ';
    end;
    'w':
    begin
      cleardevice;
      xzoom:=125;
      yzoom:=250;
      start:=0.4;
      grenze:=500;
      anf:=0;
      anf0:=anf;
      xend:=4;
      xend0:=xend;
      unten:=0;
      unten0:=unten;
      oben:=1;
      oben0:=oben;
      a0:=1000;
      da:=(xend-anf)/a0;
      dy:=0.1;
      n:=0;
      graphik2;
      bev2;
      wahl:=' ';
    end;
    'd':
    begin
      loesch23;
      a0:=a0*0.9;
      setz23;
      wahl:=' ';
    end;
    'D':
    begin
      loesch23;
      a0:=a0*1.1;
      setz23;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;



procedure p2;
begin
  cleardevice;
    xzoom:=125;
    yzoom:=250;
    start:=0.0003;
    grenze:=500;
    anf:=0;
    anf0:=anf;
    xend:=4;
    xend0:=xend;
    unten:=0;
    unten0:=unten;
    oben:=1;
    oben0:=oben;
    a0:=1000;
    da:=(xend-anf)/a0;
    dy:=0.1;
    n:=0;
    graphik2;
    bev2;
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
    '1':p1;
    '2':p2;
  end;
  until wahl1='b';
end.