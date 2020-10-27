program schwimm5;
uses crt, u1, u2, u3, graph;
var
   x,dt,yhilfe,xhilfe,v,vf,vx,vy,a,b,y:real;
   wahl,st:Char;
   bhilfe, ahilfe,chilfe,dhilfe:string;

procedure menue;
begin
     graphfehler2;
     setbkcolor(7);
     settextjustify(1,1);
     settextstyle(4,0,5);
     setcolor(1);
     outtextxy(getmaxx div 2,getmaxy div 4,'Wir berqueren einen Fluá');
     melodie;
     cleardevice;
     setcolor(1);
     settextjustify(0,0);
     settextstyle(4,0,4);
     outtextxy(10,50,'Bitte geben Sie die erforderlichen Werte ein:');
     settextstyle(0,0,1);
     outtextxy(10,90,'Bitte geben Sie nur Zahlen zwischen 5 und 15 ein !!');
     outtextxy(10,110,'Geschwindigkeit des Flusses: ');
     read(a);
     str(a:6:2,ahilfe);
     outtextxy(400,110,ahilfe);
     outtextxy(10,130,'Geschwindigkeit des Schwimmers: ');
     read(b);
     str(b:6:2,bhilfe);
     outtextxy(400,130,bhilfe);
     outtextxy(10,190,'Danke.');
     delay(10000);
end;
procedure graphik;
begin
     graphfehler2;
     cleardevice;
     setbkcolor(2);
     setcolor(4);
     settextjustify(1,1);
     settextstyle(1,1,5);
     setcolor(4);
     setfillstyle(1,9);
     bar(1,getmaxx div 4,getmaxx,getmaxx div 4*2);
     outtextxy (600, getmaxy div 2,'FLUSS');
     line(10,getmaxx div 4,630,getmaxx div 4);
     line(10, getmaxx div 4*2,630,getmaxx div 4*2);
     setcolor(14);
     line(getmaxx div 2,318,getmaxx div 2, getmaxx div 4);
     setcolor(4);
     settextstyle(0,1,1);
     settextjustify(1,1);
     outtextxy(330, getmaxy div 2,'Senkrechte');
     settextjustify(0,0);
     settextstyle(0,0,1);
     outtextxy(10,getmaxy div 15,'Tastaturkomandos: ->:rechts, <-:links');
     outtextxy(10,getmaxy div 15*2,'d:doppelt so schnell, h:halb so schnell');
     outtextxy(10,getmaxy div 15*3,'p:Pause, Esc:Ende');
     outtextxy(350,getmaxy div 15,'Geschw. des Flusses: ');
     outtextxy(550,getmaxy div 15,ahilfe);
     outtextxy(350,getmaxy div 15*2,'Geschw. des Schwimmers: ');
     outtextxy(550,getmaxy div 15*2,bhilfe);
     delay (10000);
end;

procedure rest;
begin
     v:=b/5;
     vf:=a/5;
     dt:=0.0001;
     y:=0;
     x:=getmaxx div 2;
     yhilfe:=0;
     xhilfe:=0;
           vy:=v;
           vx:=vf;
     repeat
           
     wahl:=' ';
           if keypressed then wahl:= readkey;
           case wahl of
           'h':
           begin
                dt:=dt/2;
                wahl:= ' ';
           end;
           'd':
           begin
                dt:=dt*2;
                wahl:= ' ';
           end;
           'p':
           begin
               wahl:=readkey;
               wahl:=' ';
           end;
           chr(27):
           begin
                halt;
                wahl:=' ';
           end;
           end;
           putpixel(round(x),round(y-1),14);
           yhilfe:=yhilfe+vy*dt;
           xhilfe:=xhilfe+vx*dt;
           x:=x+vx*dt;
           y:=318-round(yhilfe);
           st:=' ';
           if keypressed then st:=readkey;
           case st of
           chr(77):
           begin
                if vx*vx < v*v then
                begin
                     vx:=vx+0.1;
                     vy:=sqrt(v*v-vx*vx);
                end
                else
                begin
                    vx:=vx-0.1;
                    vy:=sqrt(v*v-vx*vx);
                end;
           st:=' ';
           end;
           chr(75):
           begin
                if vx*vx < v*v then
                begin
                     vx:=vx-0.1;
                     vy:=sqrt(v*v-vx*vx);
                end
                else
                begin
                     vx:=vx+0.1;
                     vy:=sqrt(v*v-vx*vx);
                end;
           st:=' ';
           end;
           end;
           
           until y<=getmaxx div 4;
     delay (30000);
end;

(*Main*)
begin
     clrscr;
     (*vorschau;*)
     menue;
     graphik;
     rest;
     closegraph;
end.