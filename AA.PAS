program aa;
uses crt,graph;
var
  farbe0,farbe1,farbe2,farbe3,k,treiber,modus:integer;
  phi,xa,xe,ya,ye,l,alpha,v,x,t,dt:real;
  ortx1,ortx2,ortx3:string;

  wahl1,wahl:char;

procedure menue;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(15);
  setcolor(1);
  farbe0:=15;
  farbe1:=8;
  farbe2:=12;
  farbe3:=10;
  outtextxy(150,200,'Pendel   ->  1');
  outtextxy(150,250,'Schaschlikspie·  -> 2');
  outtextxy(150,300,'RohrkrÅmmer  -> 3');
  outtextxy(400,400,'beenden  ->  b');
end;



procedure linie(L,alpha:real);
begin
  xa:=xe;
  ya:=ye;
  xe:=xa+L*cos(alpha);
  ye:=ya-L*sin(alpha);
  line(round(xa),round(ya),round(xe),round(ye));
end;

procedure left(phi:real);
begin
  alpha:=alpha+phi/180*pi;
end;

procedure right(phi:real);
begin
  alpha:=alpha-phi/180*pi;
end;
                                    
procedure graphik;
begin
  setbkcolor(15);
  setcolor(1);
  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  outtextxy(235,15,'Pendel ');
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

procedure figur2;
begin
  linie(150,alpha);
  left(90);
  linie(5,alpha);
  right(90);
  linie(40,alpha);
  right(90);
  linie(10,alpha);
  right(90);
  linie(40,alpha);
  right(90);
  linie(5,alpha);
end;

procedure graphik2;
begin
  setbkcolor(0);
  setcolor(15);
  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  outtextxy(235,15,'Schaschlikspie· ');
  circle(200,100,2);
  xe:=200;
  ye:=100;
  alpha:=-pi/2;
  figur2;
  xe:=200;
  ye:=100;
  alpha:=-pi/2-pi/6;
  setlinestyle(1,0,1);
  figur2;
  line(215,100,215,272);
  line(215,272,211,265);
  line(215,272,219,265);
  line(215,100,211,107);
  line(215,100,219,107);
  line(200,320,120,320);
  line(200,320,193,316);
  line(200,320,193,324);
  line(120,320,127,324);
  line(120,320,127,316);
  setlinestyle(0,0,1);
  outtextxy(155,330,'s');
  outtextxy(230,185,'1,50 m');
  line(300,275,350,275);
  line(300,275,305,270);
  line(300,275,305,280);
  line(305,275,310,280);
  line(305,275,310,270);
  line(350,272,350,278);
  line(350,272,360,272);
  line(350,278,360,278);
  line(360,272,360,278);
end;

procedure p1;
begin
  cleardevice;
    graphik;
    repeat until keypressed;
  menue;
end;

procedure p2;
begin
  cleardevice;
    graphik2;
    repeat until keypressed;
  menue;
end;

procedure graphik3;
begin
  setbkcolor(0);
  setcolor(15);
  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  outtextxy(235,15,'RohrkrÅmmer ');
  ellipse(200,100,0,360,50,10);
  line(150,100,150,250);
  line(250,100,250,250);
  arc(200,250,180,270,50);
  arc(270,250,180,270,20);
  line(270,270,400,270);
  line(200,300,400,300);
  ellipse(400,285,0,360,5,15);
  line(200,150,200,200);
  line(200,200,205,195);
  line(200,200,195,195);
end;

procedure p3;
begin
  cleardevice;
    graphik3;
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
    '1':p1;
    '2':p2;
    '3':p3;
  end;
  until wahl1='b';

end.