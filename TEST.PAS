program test;
uses crt, u1, u3, graph;
var
   x,y,z :integer;
begin
x:=0;
y:=0;
z:=0;
graphfehler2;
setbkcolor(4);
setcolor (15);
for x:=0 to 1000 do
begin
repeat
cleardevice;
setfillstyle(y,15);
fillellipse (getmaxx div 2, getmaxy div 2,z,z);
z:=z+1;
until keypressed;
end;
closegraph;
end.