program nat3;
uses crt,graph;
var
  f0,f1,f2,f3,r,k,treiber,modus:integer;
  x0,x1,y0,y1,alpha:real;
  wahl1,wahl:char;
  ortx1,ortx2,ortx3:string;

procedure birne(a,b:integer);
begin
  circle(a,b,r);
  line(a-round(r*cos(Pi/4)),b-round(r*sin(Pi/4)),a+round(r*cos(pi/4)),b+round(r*sin(pi/4)));
  line(a-round(r*cos(Pi/4)),b+round(r*sin(Pi/4)),a+round(r*cos(pi/4)),b-round(r*sin(pi/4)));
end;

procedure diode(a,b:integer);
begin
  x0:=r*sqrt(1.5)*cos(alpha+arctan(0.5));
  y0:=r*sqrt(1.5)*sin(alpha+arctan(0.5));
  x1:=r*sqrt(1.5)*cos(alpha-arctan(0.5));
  y1:=r*sqrt(1.5)*sin(alpha-arctan(0.5));
  line(a,b,a+round(x0),b+round(y0));
  line(a+round(x0),b+round(y0),a+round(x1),b+round(y1));
  line(a+round(x1),b+round(y1),a,b);
  x0:=alpha-pi/2;
  y0:=alpha+pi/2;
  line(a+round(0.7*r*cos(x0)),b+round(0.7*r*sin(x0)),a+round(0.7*r*cos(y0)),b+round(0.7*r*sin(y0)));
end;

procedure led(a,b:integer);
var
  x0,x1,x2,x3,y0,y1,y2,y3:real;
begin
  x0:=r*sqrt(1.5)*cos(alpha+arctan(0.5));
  y0:=r*sqrt(1.5)*sin(alpha+arctan(0.5));
  x1:=r*sqrt(1.5)*cos(alpha-arctan(0.5));
  y1:=r*sqrt(1.5)*sin(alpha-arctan(0.5));
  line(a,b,a+round(x0),b-round(y0));
  line(a+round(x0),b-round(y0),a+round(x1),b-round(y1));
  line(a+round(x1),b-round(y1),a,b);
  x0:=alpha-pi/2;
  y0:=alpha+pi/2;
  line(a+round(0.7*r*cos(x0)),b-round(0.7*r*sin(x0)),a+round(0.7*r*cos(y0)),b-round(0.7*r*sin(y0)));
  x0:=r*sqrt(2)*cos(alpha-pi/4);
  y0:=r*sqrt(2)*sin(alpha-pi/4);
  x1:=r*sqrt(2.98)*cos(alpha+arctan(-17/3));
  y1:=r*sqrt(2.98)*sin(alpha+arctan(-17/3));
  x2:=r*sqrt(3.14)*cos(alpha+arctan(-3.4));
  y2:=r*sqrt(3.14)*sin(alpha+arctan(-3.4));
  x3:=r*sqrt(2.34)*cos(alpha+arctan(-5));
  y3:=r*sqrt(2.34)*sin(alpha+arctan(-5));
  line(a+round(x0),b-round(y0),a+round(x1),b-round(y1));
  line(a+round(x1),b-round(y1),a+round(x2),b-round(y2));
  line(a+round(x3),b-round(y3),a+round(x1),b-round(y1));
  x0:=x0-r*0.5*cos(alpha);
  y0:=y0-r*0.5*sin(alpha);
  x1:=x1-r*0.5*cos(alpha);
  y1:=y1-r*0.5*sin(alpha);
  x2:=x2-r*0.5*cos(alpha);
  y2:=y2-r*0.5*sin(alpha);
  x3:=x3-r*0.5*cos(alpha);
  y3:=y3-r*0.5*sin(alpha);
  line(a+round(x0),b-round(y0),a+round(x1),b-round(y1));
  line(a+round(x1),b-round(y1),a+round(x2),b-round(y2));
  line(a+round(x3),b-round(y3),a+round(x1),b-round(y1));
end;

procedure transistor(a,b:integer);
begin
  a:=a-round(0.5*r);
  circle(a,b,r);
  line(a-round(0.5*r),b-round(0.5*r),a-round(0.5*r),b+round(0.5*r));
  line(a-round(0.5*r),b+round(0.25*r),a+round(0.5*r),b+round(0.87*r));
  line(a+round(0.5*r),b+round(0.87*r),a+round(0.325*r),b+round(0.55*r));
  line(a+round(0.5*r),b+round(0.87*r),a+round(0.15*r),b+round(0.8*r));
  line(a-round(0.5*r),b-round(0.25*r),a+round(0.5*r),b-round(0.8*r));
  line(a-50,b,a-round(0.5*r),b);
  line(a+round(0.5*r),b+round(0.87*r),a+round(0.5*r),b+50);
  line(a+round(0.5*r),b-round(0.87*r),a+round(0.5*r),b-50);
end;

procedure widw(a,b:integer);
begin
  line(a,b-round(0.5*r),a,b+round(0.5*r));
  line(a,b-round(0.5*r),a+3*r,b-round(0.5*r));
  line(a,b+round(0.5*r),a+3*r,b+round(0.5*r));
  line(a+3*r,b-round(0.5*r),a+3*r,b+round(0.5*r));
end;

procedure wids(a,b:integer);
begin
  line(a-round(0.5*r),b,a+round(0.5*r),b);
  line(a-round(0.5*r),b,a-round(0.5*r),b+3*r);
  line(a-round(0.5*r),b+3*r,a+round(0.5*r),b+3*r);
  line(a+round(0.5*r),b,a+round(0.5*r),b+3*r);
end;

procedure menue;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(1);
  setcolor(15);
  f0:=0;            {Hintergrundfarbe}
  f2:=11;           {LED-Farbe}
  f3:=13;           {Glhbirnenfarbe}
  f1:=15;           {Schriftfarbe}

  outtextxy(150,100,'Der Transistor als Schalter  ->  1');
  outtextxy(150,150,'Basis- und Kollektorstromst„rke im Vergleich  ->  2');
  outtextxy(150,200,'Der Transistor als steuerbarer Widerrstand  ->  3');
  outtextxy(150,250,'Der Transistor als Verst„rker  ->  4');
  outtextxy(150,300,'Ausschaltverz”gerung -> 5');
  outtextxy(400,400,'beenden  ->  b');
end;

procedure graphik1;
begin
  setbkcolor(f0);
  setcolor(f1);
  outtextxy(230,15,'Der Transistor als Schalter ');
      outtextxy(450,460,'  beenden (b)');
end;

procedure graphik2;
begin
  setbkcolor(f0);
  setcolor(f1);
  outtextxy(200,15,'Basis- und Kollektorstromst„rke im Vergleich ');
      outtextxy(450,460,'  beenden (b)');
end;

procedure graphik3;
begin
  setbkcolor(f0);
  setcolor(f1);
  outtextxy(200,15,'Der Transistor als steuerbarer Widerrstand ');
      outtextxy(450,460,'  beenden (b)');
end;

procedure graphik4;
begin
  setbkcolor(f0);
  setcolor(f1);
  outtextxy(220,15,'Der Transistor als Verst„rker ');
      outtextxy(450,460,'  beenden (b)');
end;

procedure graphik5;
begin
  setbkcolor(f0);
  setcolor(f1);
  outtextxy(230,15,'Ausschaltverz”gerung ');
      outtextxy(450,460,'  beenden (b)');
end;

procedure auswahl1;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    r:=20;
    line(150,100,150,215);
    line(150,225,150,340);
    line(130,215,170,215);
    line(140,225,160,225);
    line(150,340,550,340);
    line(550,340,550,300);
    line(550,150,550,100);
    line(550,100,360,100);
    line(150,100,300,100);
    line(550,190,550,200);
    birne(550,170);
    birne(450,250);
    line(470,250,490,250);
    line(360,250,430,250);
    circle(358,250,2);
    line(302,250,350,230);
    circle(302,250,2);
    circle(358,100,2);
    line(302,100,350,80);
    circle(302,100,2);
    line(225,250,300,250);
    line(225,250,225,100);
    outtextxy(135,202,'+');
    outtextxy(135,232,'-');
    outtextxy(80,217,'4,5 V');
    circle(225,100,2);
    transistor(550,250);
    outtextxy(507,255,'B');
    outtextxy(560,265,'E');
    outtextxy(560,230,'C');
    outtextxy(505,167,'L2');
    outtextxy(325,120,'S2');
    outtextxy(325,280,'S1');
    outtextxy(445,280,'L1');
  until wahl='b';
end;


procedure auswahl2;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    r:=20;
    line(150,100,150,215);
    line(150,225,150,340);
    line(130,215,170,215);
    line(140,225,160,225);
    line(150,340,550,340);
    line(550,340,550,300);
    line(550,150,550,100);
    line(550,100,360,100);
    line(150,100,360,100);
    line(550,190,550,200);

    birne(550,170);
    birne(450,250);
    line(470,250,490,250);
    line(400,250,430,250);

    circle(398,200,2);
    line(342,200,390,180);
    circle(342,200,2);

    circle(308,250,2);
    line(252,250,300,230);
    circle(252,250,2);
    outtextxy(265,220,'S1');

    line(310,250,340,250);
    line(325,250,325,200);
    line(325,200,340,200);
    line(400,200,415,200);
    line(415,200,415,250);
    circle(415,250,2);
    circle(325,250,2);

    line(225,250,250,250);
    line(225,250,225,100);
    outtextxy(135,202,'+');
    outtextxy(135,232,'-');
    outtextxy(80,217,'4,5 V');
    circle(225,100,2);
    transistor(550,250);
    outtextxy(507,255,'B');
    outtextxy(560,265,'E');
    outtextxy(560,230,'C');
    outtextxy(505,167,'L2');

    widw(340,250);
    outtextxy(355,170,'S2');
    outtextxy(445,280,'L1');
  until wahl='b';
end;



procedure auswahl3;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    r:=20;
    line(150,100,150,215);
    line(150,225,150,340);

    line(130,215,170,215);
    line(140,225,160,225);
    outtextxy(135,202,'+');
    outtextxy(135,232,'-');
    outtextxy(80,217,'4,5 V');

    line(150,340,550,340);
    line(550,340,550,300);
    line(550,150,550,100);
    line(550,100,360,100);
    line(150,100,360,100);
    line(550,190,550,200);

    birne(550,170);
    birne(400,250);
    line(420,250,490,250);
    line(360,250,380,250);

    line(200,200,210,205);
    line(200,200,205,210);
    line(250,250,200,200);
    line(250,250,360,250);
    line(225,200,225,100);
    wids(225,200);
    line(225,260,225,340);
    circle(225,340,2);

    circle(225,100,2);
    transistor(550,250);
    outtextxy(507,255,'B');
    outtextxy(560,265,'E');
    outtextxy(560,230,'C');
    outtextxy(505,167,'L2');
    outtextxy(395,280,'L1');
  until wahl='b';
end;

procedure auswahl4;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    r:=20;
    line(150,100,150,215);
    line(150,225,150,340);

    line(130,215,170,215);
    line(140,225,160,225);
    outtextxy(135,202,'+');
    outtextxy(135,232,'-');
    outtextxy(80,217,'4,5 V');

    line(150,340,550,340);
    line(550,340,550,300);
    line(550,150,550,100);
    line(550,100,360,100);
    line(150,100,360,100);
    line(550,190,550,200);

    birne(550,170);
    birne(400,250);
    line(420,250,490,250);
    line(360,250,380,250);

    line(200,200,210,205);
    line(200,200,205,210);
    line(250,250,200,200);
    line(250,250,360,250);
    line(225,200,225,100);
    wids(225,200);
    line(225,260,225,340);
    circle(225,340,2);

    wids(480,265);
    line(480,265,480,250);
    line(480,325,480,340);
    circle(480,250,2);
    circle(480,340,2);

    circle(225,100,2);
    transistor(550,250);
    outtextxy(507,255,'B');
    outtextxy(560,265,'E');
    outtextxy(560,230,'C');
    outtextxy(505,167,'L2');
    outtextxy(395,280,'L1');
  until wahl='b';
end;

procedure auswahl5;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    r:=20;
    line(150,100,150,215);
    line(150,225,150,340);
    line(130,215,170,215);
    line(140,225,160,225);
    line(150,340,550,340);
    line(550,340,550,300);
    line(550,150,550,100);
    line(550,100,300,100);
    line(150,100,300,100);
    line(550,190,550,200);
    birne(550,170);
    widw(430,250);
    widw(300,250);
    line(360,250,430,250);
    circle(225,152,2);
    line(205,159,225,208);
    circle(225,208,2);
    line(225,250,300,250);
    line(225,250,225,210);
    line(225,100,225,150);
    line(395,250,395,290);
    line(365,290,425,290);
    line(365,300,425,300);
    line(395,300,395,340);
    outtextxy(135,202,'+');
    outtextxy(135,232,'-');
    outtextxy(80,217,'4,5 V');
    circle(225,100,2);
    transistor(550,250);
    outtextxy(325,220,'R1');
    outtextxy(450,220,'R2');
    outtextxy(345,292,'C');
  until wahl='b';
end;



procedure schalt1;
begin
  cleardevice;
    graphik1;
    auswahl1;
  menue;
end;

procedure schalt2;
begin
  cleardevice;
    graphik2;
    auswahl2;
  menue;
end;

procedure schalt3;
begin
  cleardevice;
    graphik3;
    auswahl3;
  menue;
end;

procedure schalt4;
begin
  cleardevice;
    graphik4;
    auswahl4;
  menue;
end;

procedure schalt5;
begin
  cleardevice;
    graphik5;
    auswahl5;
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
    '1':schalt1;
    '2':schalt2;
    '3':schalt3;
    '4':schalt4;
    '5':schalt5;
  end;
  until wahl1='b';
end.