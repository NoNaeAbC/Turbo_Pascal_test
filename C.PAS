program c;
uses crt,graph;
var
  k,treiber,modus:integer;
  v,x,t,dt:real;
  wahl1,wahl:char;
  ortx1,ortx2,ortx3:string;

procedure menue;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(7);
  setcolor(1);
  outtextxy(150,200,'Geradlinig gleichf�rmige Bewegung  ->  1');
  outtextxy(400,400,'beenden  ->  b');
end;

procedure graphik;
begin
  setbkcolor(1);
  setcolor(15);
  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  str(v:4:2,ortx1);
  outtextxy(445,380,ortx1);
  outtextxy(400,380,'v =        m/s');
  outtextxy(400,400,'t =        s');
  outtextxy(400,420,'x =        m');
  outtextxy(235,15,'Gleichf�rmige Bewegung ');
      outtextxy(50,460,'v vergr��ern (V)   v verkleinern (v)       starten (s)   beenden (b)');
end;

procedure setz;
begin
  setcolor(15);
  str(t:4:2,ortx2);
  outtextxy(445,400,ortx2);
  str(x:4:2,ortx3);
  outtextxy(445,420,ortx3);
  setfillstyle(1,12);
  sector(120+round(80*x),240,0,360,3,3);
end;

procedure loesch;
begin
  setcolor(1);
  outtextxy(445,400,ortx2);
  outtextxy(445,420,ortx3);
  setfillstyle(1,1);
  sector(120+round(80*x),240,0,360,3,3);
end;

procedure setz1;
begin
  setcolor(15);
  str(v:4:2,ortx1);
  outtextxy(445,380,ortx1);
end;

procedure loesch1;
begin
  setcolor(1);
  outtextxy(445,380,ortx1);
end;


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

{MAIN}
begin
  wahl1:=' ';
  menue;
  repeat
  wahl1:=' ';
  if keypressed then wahl1:=readkey;
  case wahl1 of
    '1':bewegung;
  end;
  until wahl1='b';
end.