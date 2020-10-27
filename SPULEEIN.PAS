program ein_und_ausschaltvorgang_bei_spule;
uses crt,graph;

var
hilfe,treiber,modus,k:integer;
R,L,dL,dR,U0,u1,t:real;
wahl:char;
ortx,orty,ortz:string;

procedure grafik;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
setbkcolor(1);
  line(20,250,140,250);
  line(20,250,20,340);
  line(20,340,50,340);
  line(55,340,140,340);
  line(50,330,50,350);
  line(55,335,55,345);
  line(140,250,140,285);
  line(140,305,140,340);
  line(20,295,40,295);
  circle(45,295,5);
  circle(49,295,5);
  circle(53,295,5);
  circle(61,295,5);
  circle(57,295,5);
  line(66,295,75,295);
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
  outtextxy(180,70,'I');
  outtextxy(180,200,'U');
  outtextxy(610,180,'t');
  outtextxy(610,300,'t');
  line(300,185,300,180);
  outtextxy(283,188,'1 ms');
  outtextxy(283,283,'1 ms');
  line(250,185,250,180);
  line(350,185,350,180);
  line(250,295,250,300);
  line(300,295,300,300);
  line(350,295,350,300);

  line(195,100,200,100);
  outtextxy(130,95,'0,008 A');
  line(195,220,200,220);
  outtextxy(145,215,'0.8 V');
  line(195,380,200,380);
  outtextxy(140,375,'-0,8 V');
  outtextxy(150,20,'Ein- und Ausschaltvorgang bei einer Spule');
  outtextxy(495,365,'R = '); outtextxy(580,365,'Ohm');
  outtextxy(495,375,'L = '); outtextxy(580,375,'F');
  outtextxy(495,395,'T = '); outtextxy(580,395,'ms');
  outtextxy(100,430,'R erh”hen (1)       R verringern (2)   ');
  outtextxy(100,450,'L erh”hen (3)       L verringern (4)');
  outtextxy(450,440,'Beenden (b)');
  delay(15000);
end;

procedure ueberlagerung;
begin
  setcolor(15);
  line(200,180,600,180);
  line(200,300,600,300);

  for k := 1 to 2000 do
  begin
    t:=0.000001*k;
    putpixel(200+trunc(100000*t),180-trunc(10000*U0/R*(1-exp(-R/L*t))),14)
  end;
  u1:=U0*(1-exp(-R/L*t));
  for k := 1 to 2000 do
  begin
    t:=0.000001*k;
    putpixel(400+trunc(100000*t),180-trunc(10000*u1/R*(exp(-R/L*t))),14)
  end;

  setcolor(15);
  setlinestyle(1,1,1);
  line(200+trunc(ln(2)*L/R*100000),180-trunc(5000*U0/R),200+trunc(ln(2)*L/R*100000),180);
  line(200,180-trunc(5000*U0/R),200+trunc(ln(2)*L/R*100000),180-trunc(5000*U0/R));
  line(200,180-trunc(10000*U0/R),400,180-trunc(10000*U0/R));

  setlinestyle(0,1,1);


    for k := 1 to 2000 do
  begin
    t:=0.000001*k;
    putpixel(200+trunc(100000*t),300-trunc(100*U0*(-exp(-R/L*t))),14)
  end;
  for k := 1 to 2000 do
  begin
    t:=0.000001*k;
    putpixel(400+trunc(100000*t),300-trunc(100*u1*(exp(-R/L*t))),14)
  end;
  setcolor(15);
  setlinestyle(1,1,1);
  line(200+trunc(ln(2)*L/R*100000),300+trunc(50*U0),200+trunc(ln(2)*L/R*100000),300);
  line(200,300+trunc(50*U0),200+trunc(ln(2)*L/R*100000),300+trunc(50*U0));
  line(200+trunc(ln(2)*L/R*200000),300+trunc(25*U0),200+trunc(ln(2)*L/R*200000),300);
  line(200,300+trunc(25*U0),200+trunc(ln(2)*L/R*200000),300+trunc(25*U0));
  line(200+trunc(ln(2)*L/R*300000),300+trunc(12.5*U0),200+trunc(ln(2)*L/R*300000),300);
  line(200,300+trunc(12.5*U0),200+trunc(ln(2)*L/R*300000),300+trunc(12.5*U0));
  line(400,70,400,400);
  setlinestyle(0,1,1);

    str(R:6:0,ortx);
    outtextxy(520,365,ortx);
    str(L:6:3,orty);
    outtextxy(520,375,orty);
    str(ln(2)*L/R*1000:6:3,ortz);
    outtextxy(520,395,ortz);

end;

procedure aendern;
begin
  for k := 1 to 2000 do
  begin
    t:=0.000001*k;
    putpixel(200+trunc(100000*t),180-trunc(10000*U0/R*(1-exp(-R/L*t))),0)
  end;
  u1:=U0*(1-exp(-R/L*t));
  for k := 1 to 2000 do
  begin
    t:=0.000001*k;
    putpixel(400+trunc(100000*t),180-trunc(10000*u1/R*(exp(-R/L*t))),0)
  end;
    for k := 1 to 2000 do
  begin
    t:=0.000001*k;
    putpixel(200+trunc(100000*t),300-trunc(100*U0*(-exp(-R/L*t))),0)
  end;
  for k := 1 to 2000 do
  begin
    t:=0.000001*k;
    putpixel(400+trunc(100000*t),300-trunc(100*u1*(exp(-R/L*t))),0)
  end;

        setcolor(0);
    outtextxy(520,365,ortx);
    outtextxy(520,375,orty);
    outtextxy(520,395,ortz);
  setlinestyle(1,1,1);
  line(200+trunc(ln(2)*L/R*100000),180-trunc(5000*U0/R),200+trunc(ln(2)*L/R*100000),180);
  line(200,180-trunc(5000*U0/R),200+trunc(ln(2)*L/R*100000),180-trunc(5000*U0/R));
  line(200,180-trunc(10000*U0/R),400,180-trunc(10000*U0/R));

  line(200+trunc(ln(2)*L/R*100000),300+trunc(50*U0),200+trunc(ln(2)*L/R*100000),300);
  line(200,300+trunc(50*U0),200+trunc(ln(2)*L/R*100000),300+trunc(50*U0));
  line(200+trunc(ln(2)*L/R*200000),300+trunc(25*U0),200+trunc(ln(2)*L/R*200000),300);
  line(200,300+trunc(25*U0),200+trunc(ln(2)*L/R*200000),300+trunc(25*U0));
  line(200+trunc(ln(2)*L/R*300000),300+trunc(12.5*U0),200+trunc(ln(2)*L/R*300000),300);
  line(200,300+trunc(12.5*U0),200+trunc(ln(2)*L/R*300000),300+trunc(12.5*U0));
  setlinestyle(0,1,1);
end;

{MAIN}
begin

U0:=0.8;
R:=100;
dR:=5;
L:=0.035;
dL:=0.005;
grafik;
setbkcolor(1);
ueberlagerung;
repeat until keypressed;
repeat
    wahl:=' ';
    if keypressed then  wahl:=readkey;
    case wahl of
    '3':
    begin
     aendern;
      L:=L+dL;
     ueberlagerung;
      wahl:=' ';
    end;
    '4':
    begin
     aendern;
      L:=L-dL;
     ueberlagerung;
      wahl:=' ';
    end;

    'b':exit;
    '1':
    begin
     aendern;
     R:=R+dR;
     ueberlagerung;
      wahl:=' ';
   end;
   '2':
   begin
     aendern;
     R:=R-dR;
     ueberlagerung;
      wahl:=' ';
   end;
 end;
repeat until keypressed;
until wahl =' b';
end.