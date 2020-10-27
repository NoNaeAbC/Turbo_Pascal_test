program vorschau2;
uses crt, u1, u3, graph;
var
   a, b, c, d, e: integer;

begin
graphfehler2;
a:=0;
b:=0;
c:=0;
d:=0;
repeat
a:=a+1;
randomize;
b:= random (12)+1;
setbkcolor(4);
randomize;
e:= random (17);
setfillstyle (b,e);
repeat
repeat
c:=c+1;
until c=1000;
d:=d+1;
fillellipse (getmaxx div 2, getmaxy div 2, d,d);
c:=0;
until d=240;
repeat
repeat
c:=c+1;
until c=1000;
d:=d-1;
fillellipse (getmaxx div 2, getmaxy div 2, d,d);
c:=0;
until d=0;
until a=10;
cleardevice;
setbkcolor (4);
settextstyle (4,0,5);
settextjustify (1,1);
outtextxy (getmaxx div 2, getmaxy div 2, 'Diese geniale Video - Animation');
melodie;
delay (10000);
cleardevice;
outtextxy (getmaxx div 2, getmaxy div 2,'entstand bei:');
settextstyle (4,0,5);
delay (10000);
cleardevice;
outtextxy (getmaxx div 2, getmaxy div 2,'Sch”ps - Chaoten - Software');
delay (10000);
cleardevice;
outtextxy (getmaxx div 2, getmaxy div 2, 'Copyright 1998');
delay (10000);
closegraph;
end.