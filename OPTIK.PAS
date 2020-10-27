program optik;
uses crt,graph;
var
  k,treiber,modus:integer;
  oben,unten,oben1,unten1,bx1,s,x,y,bx,b0,b,sx:integer;
  wahl1,wahl:char;
  ortx1,ortx2,ortx3:string;

procedure menue;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(7);
  setcolor(1);
  outtextxy(150,200,'Lichtausbreitung  ->  1');
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

  outtextxy(235,15,'Lichtausbreitung ');
  outtextxy(10,460,'Lampe verschieben (l/r/o/u)   Blendenposition „ndern (p/P)  beenden (e)');
  outtextxy(10,470,'Blendengr”áe „ndern (b/B)  Schirmabstand „ndern (s/S)');
end;

procedure setz;
begin
  setcolor(14);
  setfillstyle(1,14);
  bar(12,32,bx,448);

  for s:=bx to sx do
  begin
    oben:=round(y-(s-x)/(bx-x)*(y-(b0-b)));
    unten:=round(y-(s-x)/(bx-x)*(y-(b0+b)));
    line(s,oben,s,unten);
  end;
  setcolor(12);
  circle(x,y,7);
      line(sx+1,35,sx+1,445);
end;

procedure setz1;
begin
  setcolor(14);

  for s:=bx to sx do
  begin
    oben:=round(y-(s-x)/(bx-x)*(y-(b0-b)));
    unten:=round(y-(s-x)/(bx-x)*(y-(b0+b)));
    line(s,oben,s,unten);
  end;
  setcolor(12);
  circle(x,y,7);
      line(sx+1,35,sx+1,445);
end;

procedure setz2;
begin
      setcolor(1);
  for s:=bx to sx do
  begin
      oben:=round(y-(s-x)/(bx-x)*(y-(b0-b)));
      unten:=round(y-(s-x)/(bx-x)*(y-(b0+b)));
      oben1:=round(y-(s-x)/(bx1-x)*(y-(b0-b)));
      unten1:=round(y-(s-x)/(bx1-x)*(y-(b0+b)));
      line(s,oben,s,oben1);
      line(s,unten,s,unten1);
  end;
end;

procedure loesch1;
begin
  setcolor(1);

  for s:=bx to sx do
  begin
    oben:=round(y-(s-x)/(bx-x)*(y-(b0-b)));
    unten:=round(y-(s-x)/(bx-x)*(y-(b0+b)));
    line(s,oben,s,unten);
  end;
end;

procedure loesch2;
begin
  setcolor(1);

  for s:=bx to sx do
  begin
    oben:=round(y-(s-x)/(bx-x)*(y-(b0-b)));
    unten:=round(y-(s-x)/(bx-x)*(y-(b0+b)));
    line(s,oben,s,unten);
  end;
  setcolor(14);
  circle(x,y,7);
end;

procedure loesch;
begin
  setcolor(1);
  setfillstyle(1,1);
  bar(12,32,628,448);
end;

procedure auswahl;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    's':
    begin
      setcolor(1);
      line(sx,32,sx,448);
      line(sx+1,35,sx+1,445);
      sx:=sx-2;
      setcolor(12);
      line(sx+1,35,sx+1,445);
    wahl:=' ';
    end;
    'S':
    begin
      setcolor(1);
      line(sx+1,35,sx+1,445);
      sx:=sx+2;
      setcolor(14);
      s:=sx;
      oben:=round(y-(s-x)/(bx-x)*(y-(b0-b)));
      unten:=round(y-(s-x)/(bx-x)*(y-(b0+b)));
      line(s,oben,s,unten);
      setcolor(12);
      line(sx+1,35,sx+1,445);
    wahl:=' ';
    end;
    'b':
    begin
      loesch1;
      setcolor(14);
      line(bx,32,bx,b0-b);
      line(bx,b0+b,bx,448);
      b:=b-1;
      setz1;
      setcolor(12);
      line(bx+1,32,bx+1,b0-b);
      line(bx+1,b0+b,bx+1,448);
    wahl:=' ';
    end;
    'B':
    begin
      loesch1;
      setcolor(14);
      line(bx+1,32,bx+1,b0-b);
      line(bx+1,b0+b,bx+1,448);
      b:=b+1;
      setz1;
      setcolor(12);
      line(bx+1,32,bx+1,b0-b);
      line(bx+1,b0+b,bx+1,448);
    wahl:=' ';
    end;
    'p':
    begin
      setcolor(1);
      line(bx,32,bx,448);
      line(bx+1,32,bx+1,448);
      bx:=bx-2;
      setz1;
      setcolor(14);
      line(bx,32,bx,448);
      setcolor(12);
      line(bx+1,32,bx+1,b0-b);
      line(bx+1,b0+b,bx+1,448);
    wahl:=' ';
    end;
    'P':
    begin
    if y=240 then
    begin
      setcolor(14);
      line(bx,32,bx,448);
      line(bx+1,32,bx+1,448);
      setz2;
      bx1:=bx;
      bx:=bx+2;

      setcolor(14);
      line(bx,32,bx,448);
      setcolor(12);
      line(bx+2,32,bx+2,b0-b);
      line(bx+2,b0+b,bx+2,448);
    end
    else
    begin
      loesch1;
      setcolor(1);
      line(bx,32,bx,448);
      line(bx+1,32,bx+1,448);
      bx:=bx+2;
      setz1;
      setcolor(14);
      line(bx,32,bx,448);
      setcolor(12);
      line(bx+1,32,bx+1,b0-b);
      line(bx+1,b0+b,bx+1,448);
    end;
    wahl:=' ';
    end;
    'r':
    begin
      loesch2;
      x:=x+2;
      setz1;
    wahl:=' ';
    end;
    'l':
    begin
      loesch2;
      x:=x-2;
      setz1;
    wahl:=' ';
    end;
    'o':
    begin
      loesch2;
      y:=y-2;
      setz1;
    wahl:=' ';
    end;
    'u':
    begin
      loesch2;
      y:=y+2;
      setz1;
    wahl:=' ';
    end;
  end;
  until wahl='e';
end;

procedure licht1;
begin
  cleardevice;
    x:=100;
    y:=240;
    bx:=200;
    b0:=240;
    b:=10;
    sx:=500;
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
    '1':licht1;
  end;
  until wahl1='b';
end.