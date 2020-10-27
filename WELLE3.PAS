program welle3;
uses crt,graph;
var
  m,k,l,treiber,modus:integer;
  dalpha,x0,y0,r,a,alpha,v,x,t,dt:real;
  wahl2,wahl1,wahl:char;
  ortx1,ortx2,ortx3,ortx4:string;

procedure menue;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(7);
  setcolor(1);
  outtextxy(50,200,'Wellenausbreitung bei sinusf”rmig schwingenden Oszillatoren  -> 0');
  outtextxy(150,250,'Entstehung von Wasserwellen  ->  1');
  outtextxy(400,400,'beenden  ->  b');
end;

procedure graphik;
begin
  setbkcolor(1);
  setcolor(15);
  line(10,30,630,30);
  line(10,440,630,440);
  line(10,30,10,440);
  line(630,30,630,440);
  outtextxy(50,420,'dt =          ver„ndern (T/t)');
  str(dt:4:2,ortx4);
  outtextxy(90,420,ortx4+' s');
  str(r:4:2,ortx1);
  outtextxy(490,380,ortx1+' cm');
  str(a:4:2,ortx2);
  outtextxy(490,400,ortx2+' cm');
  str((alpha*360/pi):4:2,ortx3);
  outtextxy(490,420,ortx3+' ø');
  outtextxy(400,380,'      r =         ');
  outtextxy(400,400,'Abstand =         ');
  outtextxy(400,420,'  Phase =        ');
  if m=1 then
  outtextxy(235,15,'Entstehung von Wasserwellen ')
  else
  outtextxy(85,15,'Wellenausbreitung bei sinusf”rmig schwingenden Oszillatoren');
  outtextxy(5,450,'Abstand vergr”áern (A) verkleinern (a)    Radius vergr”áern (R) verkleinern (r) ');
  outtextxy(25,460,'starten (s)       Phase vergr”áern (P)    verkleinern (p)       beenden (b)');
end;

procedure setz;
begin
 for l:=1 to round(550/a) do
 begin
  if m=1 then
  begin
   setcolor(15);
   for k:=1 to 36 do
   begin
    putpixel(round(x0+l*a+r*sin(k*pi/18)),round(y0+r*cos(k*pi/18)),9)
   end;
   setfillstyle(1,12);
   sector(round(x0+l*a+r*sin(l*alpha-alpha*t)),round(y0+r*cos(l*alpha-alpha*t)),0,360,2,2);
  end
  else
  begin
   setcolor(9);
   line(round (x0+l*a),round(y0-r),round(x0+l*a),round(y0+r));
   setcolor(15);
   setfillstyle(1,12);
   sector(round(x0+l*a),round(y0+r*cos(l*alpha-alpha*t)),0,360,2,2);
  end;
 end;
end;

procedure loesch0;
begin
 for l:=1 to round(550/a) do
 begin
  if m=1 then
  begin
   setcolor(1);
   for k:=1 to 36 do
   begin
    putpixel(round(x0+l*a+r*sin(k*pi/18)),round(y0+r*cos(k*pi/18)),9)
   end;
   setfillstyle(1,1);
   sector(round(x0+l*a+r*sin(l*alpha-alpha*t)),round(y0+r*cos(l*alpha-alpha*t)),0,360,2,2);
  end
  else
  begin
   setcolor(9);
   line(round (x0+l*a),round(y0-r),round(x0+l*a),round(y0+r));
   setcolor(1);
   setfillstyle(1,1);
   sector(round(x0+l*a),round(y0+r*cos(l*alpha-alpha*t)),0,360,2,2);
  end;
 end;
end;

procedure loesch;
begin
 for l:=1 to round(550/a) do
 begin
  if m=1 then
  begin
   setcolor(1);
   for k:=1 to 36 do
   begin
    putpixel(round(x0+l*a+r*sin(k*pi/18)),round(y0+r*cos(k*pi/18)),1)
   end;
   setfillstyle(1,1);
   sector(round(x0+l*a+r*sin(l*alpha-alpha*t)),round(y0+r*cos(l*alpha-alpha*t)),0,360,2,2);
  end
  else
  begin
   setcolor(1);
   line(round (x0+l*a),round(y0-r),round(x0+l*a),round(y0+r));
   setfillstyle(1,1);
   sector(round(x0+l*a),round(y0+r*cos(l*alpha-alpha*t)),0,360,2,2);
  end;
 end;
end;

procedure setz1;
begin
  setcolor(15);
  str(r:4:2,ortx1);
  outtextxy(490,380,ortx1+' cm');
end;

procedure loesch1;
begin
  setcolor(1);
  outtextxy(490,380,ortx1+' cm');
end;

procedure setz2;
begin
  setcolor(15);
  str(a:4:2,ortx2);
  outtextxy(490,400,ortx2+' cm');
end;

procedure loesch2;
begin
  setcolor(1);
  outtextxy(490,400,ortx2+' cm');
end;

procedure setz3;
begin
  setcolor(15);
  str((alpha*360/pi):4:2,ortx3);
  outtextxy(490,420,ortx3+' ø');
end;

procedure loesch3;
begin
  setcolor(1);
  outtextxy(490,420,ortx3+' ø');
end;

procedure setz4;
begin
  setcolor(15);
  str(dt:4:2,ortx4);
  outtextxy(90,420,ortx4+' s');
end;

procedure loesch4;
begin
  setcolor(1);
  outtextxy(90,420,ortx4+' s');
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
      setz;
      wahl2:=' ';
      delay(1000);
      repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
          end;
        loesch0;
        t:=t+dt;
        setz;
      until wahl2='b';
    wahl:=' ';
    end;
    'r':
    begin
      if r>=0.2 then
      begin
        loesch1;
        loesch;
        r:=r-0.5;
        setz1;
        setz;
      end;
      wahl:=' ';
    end;
    'R':
    begin
      loesch1;
      loesch;
      r:=r+0.5;
      setz1;
      setz;
      wahl:=' ';
    end;
    'a':
    begin
      if a>=0.2 then
      begin
        loesch2;
        loesch;
        a:=a-0.5;
        setz2;
        setz;
      end;
      wahl:=' ';
    end;
    'A':
    begin
      loesch2;
      loesch;
      a:=a+0.5;
      setz2;
      setz;
      wahl:=' ';
    end;
    'p':
    begin
        loesch3;
        loesch;
        alpha:=alpha-0.25/50*pi;
        setz3;
        setz;
      wahl:=' ';
    end;
    'P':
    begin
      loesch3;
      loesch;
      alpha:=alpha+0.25/50*pi;
      setz3;
      setz;
      wahl:=' ';
    end;
    't':
    begin
      if dt>=0.1 then
      begin
        loesch4;
        loesch;
        dt:=dt-0.05;
        setz4;
        setz;
      end;
      wahl:=' ';
    end;
    'T':
    begin
      loesch4;
      loesch;
      dt:=dt+0.05;
      setz4;
      setz;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure bewegung1;
begin
  cleardevice;
    m:=1;
    r:=20;
    alpha:=5/50*pi;
    dalpha:=1/50*pi;
    a:=20;
    t:=0;
    x0:=40;
    y0:=250;
    dt:=0.5;
    graphik;
    setz;
    auswahl;
  menue;
end;

procedure bewegung0;
begin
  cleardevice;
    m:=0;
    r:=20;
    alpha:=5/50*pi;
    dalpha:=1/50*pi;
    a:=20;
    t:=0;
    x0:=40;
    y0:=250;
    dt:=0.25;
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
    '0':bewegung0;
    '1':bewegung1;
  end;
  until wahl1='b';
end.