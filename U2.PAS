unit u2;
interface
uses crt, u1, graph, u3;
procedure vorschau1;
procedure vorschau2;
procedure vorschau3;
procedure vorschau4;
procedure vorschau5;
procedure vorschau; (*BÅndelung der einzelnen Vorschauen*)
implementation

procedure vorschau1;
begin
     clrscr;
     writeln ('DOS/4GW Protected Mode Run-time Version 1.97');
     writeln ('Copyright (c) Schîps Chaoten - Software, Inc. 1997');
     delay(10000);
     writeln ('Loading sound efects');
     delay(10000);
     writeln ('Loading graph results');
     delay(10000);
     writeln ('Install Mouse');
     delay(6000);
     writeln ('Mouse type: serial');
     delay(4000);
     writeln ('Mouse on COM - Port 1 detected');
     delay(10000);
     sound(500);
     delay(1800);
     nosound;
     writeln ('Driver already installed');
     delay(10000);
     clrscr;
     sound (500);
     delay (1800);
     nosound;
     writeln ('Fehler beim Initialisieren der Maus, Programm wird ohne Maus');
     writeln ('ausgefÅhrt.');
     pause;
     clrscr;
end;

procedure vorschau2;
var
   xx, yy, sp, z1, i: integer;
begin
randomize;
graphfehler2;
setfillstyle (1,12);
bar(1,1,getmaxx,getmaxy);
for i:=1 to 400 do
begin
     setfillstyle (1,random(15)+1);
     sp:= random(getmaxx);
     z1:= random(getmaxy);
     bar(sp,z1,sp+random(90)+10,z1+random(70)+10);
end;
setfillstyle(1,10);
bar (getmaxx div 6+5, getmaxy div 6*4+5, getmaxx div 6*5+5, getmaxy div 6*5+5);
setfillstyle(1,10);
bar (getmaxx div 6, getmaxy div 6*4, getmaxx div 6*5, getmaxy div 6*5);
setcolor (0);
settextjustify (1,1);
settextstyle(3,0,4);
outtextxy (getmaxx div 2, getmaxy div 12*9,'We proudly present');
melodie;
delay (10000);
cleardevice;
closegraph;
end;

procedure vorschau3;
var
   xx, yy, i: integer;
begin
clrscr;
graphfehler2;
randomize;
for i:= 1 to 500 do
begin
     setcolor (random(15));
     line (getmaxx div 2, getmaxy div 2, random(getmaxx), random (getmaxy));
end;
delay (5000);
setcolor(12);
setfillstyle (1,4);
bar (getmaxx div 9,getmaxy div 3, getmaxx div 9*8, getmaxy div 3*2);
setcolor(15);
settextjustify(1,1);
settextstyle(4,0,8);
outtextxy (getmaxx div 2, getmaxy div 2,'Unser neustes');
delay (10000);;
closegraph;
end;

procedure vorschau4;
var
   xx, yy, i: integer;
begin
clrscr;
graphfehler2;
randomize;
for i:= 1 to 500 do
begin
     setcolor (random(15));
     line (getmaxx div 2, getmaxy div 2, random(getmaxx), random (getmaxy));
end;
delay (5000);
setcolor(12);
setfillstyle (1,4);
bar (getmaxx div 9,getmaxy div 3, getmaxx div 9*8, getmaxy div 3*2);
setcolor(15);
settextjustify(1,1);
settextstyle(4,0,5);
outtextxy (getmaxx div 2, getmaxy div 2,'High - Tech - Programm');
delay (10000);;
closegraph;
end;

procedure vorschau5;
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
until a=4;
cleardevice;
setbkcolor (4);
settextstyle (4,0,5);
settextjustify (1,1);
outtextxy (getmaxx div 2, getmaxy div 2, 'Diese geniale Video - Animation');
melodie;
delay (10000);
cleardevice;
outtextxy (getmaxx div 2, getmaxy div 2,'entstand bei :');
settextstyle (4,0,5);
delay (10000);
cleardevice;
outtextxy (getmaxx div 2, getmaxy div 2,'Schîps - Chaoten - Software');
delay (10000);
cleardevice;
outtextxy (getmaxx div 2, getmaxy div 2, 'und : Enjoy Soft');
delay (10000);
cleardevice;
outtextxy (getmaxx div 2, getmaxy div 2, 'Copyright 1998');
delay (10000);
closegraph;
end;

procedure vorschau;
begin
     vorschau1;
     vorschau2;
     vorschau3;
     vorschau4;
     vorschau5;
end;

end.