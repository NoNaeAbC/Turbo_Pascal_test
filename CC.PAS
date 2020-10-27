program cc;
uses crt,graph;
var
  r,k,treiber,modus:integer;
  l,alpha,v,x,t,dt:real;
  wahl1,wahl:char;
  ortx1,ortx2,ortx3:string;

procedure menue;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(7);
  setcolor(1);
  outtextxy(150,200,'Pendel (Physikklausur 11)  ->  1');
  outtextxy(150,230,'Halbkreis (Physikklausur 11) ->  2');
  outtextxy(150,260,'Hohlspiegel (Arbeit 7)  ->  3');
  outtextxy(150,290,'W”lbspiegel (Arbeit 7)  ->  4');
  outtextxy(150,320,'Spiegelbild eines M„nnchens (Arbeit 7) ->  5');
  outtextxy(150,350,'Schaltung mit NTC  (Arbeit 9)  -> 6');
  outtextxy(400,400,'beenden  ->  b');
end;

procedure graphik;
begin
  setbkcolor(0);
  setcolor(15);
  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  outtextxy(255,15,'Pendel ');
  l:=200;
  alpha:=pi/5;
  line(300,100,300,100+round(l));
  line(300,100,300-round(l*sin(alpha)),100+round(l*cos(alpha)));
  line(300,140,300+round((l-40)*sin(1.1*alpha)),140+round((l-40)*cos(1.1*alpha)));
  sector(304,136,0,360,4,4);
  arc(300,100,round(270-alpha/pi*180),270,round(l));
  arc(300,140,270,round(270+1.1*alpha/pi*180),round(l-40));
  circle(300,100,2);
  circle(300,100+round(l),2);
  circle(300-round(l*sin(alpha)),100+round(l*cos(alpha)),5);
  circle(300+round((l-40)*sin(1.1*alpha)),140+round((l-40)*cos(1.1*alpha)),2);
  outtextxy(300-round(l*sin(alpha)),112+round(l*cos(alpha)),'C');
  outtextxy(300+round((l-40)*sin(1.1*alpha)),150+round((l-40)*cos(1.1*alpha)),'E');
  line(430,100+round(l),430,140+round((l-40)*cos(1.1*alpha)));
  line(425,100+round(l),435,100+round(l));
  line(425,140+round((l-40)*cos(1.1*alpha)),435,140+round((l-40)*cos(1.1*alpha)));
  outtextxy(440,80+round(l),'h');
  outtextxy(300,110+round(l),'D');
  outtextxy(315,100,'B');
  outtextxy(315,133,'A');
end;

procedure graphik1;
begin
  setbkcolor(0);
  setcolor(15);
  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  outtextxy(255,15,'Halbkreis ');
  line(100,350,300,350);
  arc(300,250,270,90,100);
  outtextxy(298,360,'A');
  circle(300,350,2);
  outtextxy(298,135,'B');
  circle(300,150,2);
  outtextxy(148,360,'C');
  circle(150,350,2);
  circle(250,343,6);
end;

procedure bewegung;
begin
  cleardevice;
    graphik;
    repeat until keypressed;
  menue;
end;

procedure bewegung1;
begin
  cleardevice;
    graphik1;
    repeat until keypressed;
  menue;
end;

procedure graphik3;
begin
  setbkcolor(0);
  setcolor(15);
  outtextxy(255,15,'Hohlspiegel ');
  line(380,300,380,200);
  line(377,205,380,200);
  line(383,205,380,200);
  arc(300,250,320,40,300);
  outtextxy(298,260,'M');
  circle(300,250,1);
  circle(380,300,2);
end;

procedure bewegung3;
begin
  cleardevice;
    graphik3;
    repeat until keypressed;
  menue;
end;

procedure graphik4;
begin
  setbkcolor(0);
  setcolor(15);
  outtextxy(255,15,'W”lbspiegel ');
  line(80,300,80,200);
  line(77,205,80,200);
  line(83,205,80,200);
  circle(80,300,2);

  arc(600,250,140,220,300);
  outtextxy(598,260,'M');
  circle(600,250,1);
end;

procedure bewegung4;
begin
  cleardevice;
    graphik4;
    repeat until keypressed;
  menue;
end;

procedure graphik5;
begin
  setbkcolor(0);
  setcolor(15);
  outtextxy(230,55,'Wand mit ebenem Spiegel ');
  line(80,400,560,400);
  line(320,400,320,100);
  line(100,400,120,300);
  line(130,400,140,350);

  line(140,350,120,300);
  line(120,300,120,190);
  line(130,398,148,398);
  line(100,398,118,398);

  circle(120,300,2);
  circle(120,200,2);
  line(120,200,90,260);
  line(90,260,140,270);
  circle(140,270,2);
  circle(90,260,2);
  circle(120,170,20);
  circle(125,170,2);
  line(140,168,142,173);
  line(142,173,140,173);
  line(133,180,136,182);
end;

procedure bewegung5;
begin
  cleardevice;
    graphik5;
    repeat until keypressed;
  menue;
end;


procedure birne(a,b:integer);
begin
  circle(a,b,r);
  line(a-round(r*cos(Pi/4)),b-round(r*sin(Pi/4)),a+round(r*cos(pi/4)),b+round(r*sin(pi/4)));
  line(a-round(r*cos(Pi/4)),b+round(r*sin(Pi/4)),a+round(r*cos(pi/4)),b-round(r*sin(pi/4)));
end;


procedure graphik6;
begin
  setbkcolor(0);
  setcolor(15);
  outtextxy(230,55,'Schaltung mit NTC ');
  r:=15;
  birne(450,215);
  line(450,200,450,150);
  line(450,230,450,280);
  line(450,150,360,150);

  line(400,150,400,200);
  line(400,200,355,200);
  line(305,200,260,200);
  line(260,200,260,150);
  line(305,200,345,185);
  circle(305,200,2);
  outtextxy(325,207,'S2');

  line(300,150,220,150);
  line(170,150,210,135);
  circle(170,150,2);
  outtextxy(190,157,'S1');

  circle(400,150,2);
  circle(260,150,2);

  line(360,140,300,140);
  line(360,160,300,160);
  line(360,140,360,160);
  line(300,140,300,160);
  outtextxy(320,147,'NTC');

  line(170,150,130,150);
  line(130,150,130,210);
  line(130,220,130,280);
  line(110,210,150,210);
  line(120,220,140,220);

  line(450,280,130,280);
end;

procedure bewegung6;
begin
  cleardevice;
    graphik6;
    repeat until keypressed;
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
    '2':bewegung1;
    '3':bewegung3;
    '4':bewegung4;
    '5':bewegung5;
    '6':bewegung6;
  end;
  until wahl1='b';
end.