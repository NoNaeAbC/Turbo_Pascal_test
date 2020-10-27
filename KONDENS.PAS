program kondensator;
uses crt,graph;

var
hilfe,treiber,modus,k:integer;
R,C,dC,dR,U0,u1,t:real;
wahl:char;
ortx,orty,ortz:string;

procedure grafik;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
setbkcolor(1);
setcolor(15);
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
  outtextxy(285,220,'Ein');
  outtextxy(485,220,'Aus');
  outtextxy(180,70,'U');
  outtextxy(180,200,'I');
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
  outtextxy(160,95,'8 V');
  line(195,220,200,220);
  outtextxy(135,215,'0.8 mA');
  line(195,380,200,380);
  outtextxy(130,375,'-0,8 mA');
  outtextxy(150,20,'Ein- und Ausschaltvorgang beim Kondensator ');
  outtextxy(495,365,'R = '); outtextxy(580,365,'kOhm');
  outtextxy(495,375,'C = '); outtextxy(580,375,'ÊF');
  outtextxy(495,395,'T = '); outtextxy(580,395,'s');
  outtextxy(100,430,'R erhîhen (R)       R verringern (r)   ');
  outtextxy(100,450,'C erhîhen (C)       C verringern (c)');
  outtextxy(450,440,'Beenden (b)');
end;

procedure ueberlagerung;
begin
  setcolor(15);
  line(200,180,600,180);
  line(200,300,600,300);

  for k := 1 to 2000 do
  begin
    t:=0.02*k;
    putpixel(200+trunc(5*t),180-trunc(10*U0*(1-exp(-1/R/C*t))),12);
  end;
  u1:=U0*(1-exp(-1/R/C*t));
  for k := 1 to 2000 do
  begin
    t:=0.02*k;
    putpixel(400+trunc(5*t),180-trunc(10*u1*(exp(-1/R/C*t))),12);
  end;

  setcolor(15);
  setlinestyle(1,1,1);
  line(200+trunc(ln(2)*C*R*5),180-trunc(5*U0),200+trunc(ln(2)*C*R*5),180);
  line(200,180-trunc(5*U0),200+trunc(ln(2)*C*R*5),180-trunc(5*U0));
  line(200,180-trunc(10*U0),400,180-trunc(10*U0));

  setlinestyle(0,1,1);


    for k := 1 to 2000 do
  begin
    t:=0.02*k;
    putpixel(200+trunc(5*t),300+trunc(100000*U0/R*(-exp(-1/C/R*t))),12);
  end;
  for k := 1 to 2000 do
  begin
    t:=0.02*k;
    putpixel(400+trunc(5*t),300+trunc(100000*u1/R*(exp(-1/R/C*t))),12);
  end;
  setcolor(15);
  setlinestyle(1,1,1);
  line(200+trunc(ln(2)*C*R*5),300-trunc(50000*U0/R),200+trunc(ln(2)*C*R*5),300);
  line(200,300-trunc(50000*U0/R),200+trunc(ln(2)*C*R*5),300-trunc(50000*U0/R));
  line(200+trunc(ln(2)*C*R*10),300-trunc(25000*U0/R),200+trunc(ln(2)*C*R*10),300);
  line(200,300-trunc(25000*U0/R),200+trunc(ln(2)*C*R*10),300-trunc(25000*U0/R));
  line(200+trunc(ln(2)*C*R*15),300-trunc(12500*U0/R),200+trunc(ln(2)*C*R*15),300);
  line(200,300-trunc(12500*U0/R),200+trunc(ln(2)*C*R*15),300-trunc(12500*U0/R));
  line(400,70,400,400);
  setlinestyle(0,1,1);

    str((R/1000):6:2,ortx);
    outtextxy(520,365,ortx);
    str((C*1000000):6:0,orty);
    outtextxy(520,375,orty);
    str(ln(2)*C*R:6:3,ortz);
    outtextxy(520,395,ortz);

end;

procedure aendern;
begin
        setcolor(1);
    outtextxy(520,365,ortx);
    outtextxy(520,375,orty);
    outtextxy(520,395,ortz);
    setfillstyle(1,1);
    bar(100,50,600,400);
    grafik;
end;





{MAIN}
begin

U0:=8;
R:=10000;
dR:=1000;
C:=1000/1000000;
dC:=100/1000000;
grafik;
setbkcolor(1);
ueberlagerung;
    wahl:=' ';
repeat
    if keypressed then  wahl:=readkey;
    case wahl of
    'C':
    begin
     aendern;
      C:=C+dC;
     ueberlagerung;
      wahl:=' ';
    end;
    'c':
    begin
     aendern;
      C:=C-dC;
     ueberlagerung;
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
     aendern;
     R:=R-dR;
     ueberlagerung;
      wahl:=' ';
   end;
    'b':exit;
 end;
until wahl =' b';
end.