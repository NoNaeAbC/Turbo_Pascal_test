program s0;
uses crt,graph;
var
  r,k,treiber,modus:integer;
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
  setbkcolor(0);
  setcolor(15);
  outtextxy(150,200,'Schaltsymbole  ->  1');
  outtextxy(400,400,'beenden  ->  b');
end;

procedure graphik;
begin
  setbkcolor(0);
  setcolor(15);
  outtextxy(270,15,'Schaltsymbole ');
      outtextxy(450,460,'  beenden (b)');
end;


procedure auswahl;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    r:=20;
    birne(300,150);
    alpha:=0;
    diode(100,200);
    led(500,200);
    alpha:=pi/4;
    diode(200,200);
    led(400,300);
    transistor(300,250);
    widw(150,250);
    wids(300,320);
  until wahl='b';
end;

procedure schalt1;
begin
  cleardevice;
    graphik;
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
    '1':schalt1;
  end;
  until wahl1='b';
end.