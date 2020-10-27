
program verkehrsspiel;
uses crt,graph;
var
  treiber,modus,k:integer;
  a,ystart:integer;
  y,t0,t,dt,t1,a1,v:real;
  wahl:char;

procedure grafik;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
 setbkcolor(1);
  line(10,40,630,40);
  line(10,430,630,430);
  line(10,40,10,430);
  line(630,40,630,430);
  outtextxy(260,20,'Bremse frh genug !!!');
end;

procedure g1;
begin
  line(a,300,a+20,300);
  line(a,295,a+20,295);
  line(a,295,a,300);
  line(a+20,295,a+20,300);
end;

procedure spiel;
begin
  t0:=random(100)/100;
  t:=0;
  dt:=0.0001;
  t1:=v/a1;
  a:=30+round(3*v*t);
  repeat
    setcolor(1);
    g1;
    t:=t+dt;
  a:=30+round(3*v*t);
    setcolor(14);
    g1;
  until t>=t0;

  ystart:=a;
  t:=0;

  repeat
    setcolor(1);
    g1;
    t:=t+dt;
  y:=v*t-0.5*a1*t*t;
  a:=ystart+round(3*y);
    setcolor(14);
    g1;
  until t>=t1;

  repeat until keypressed;

end;


procedure farbe;
var
  m,n:integer;
  begin
    textbackground(1);
    for m:=1 to 80 do
    begin
      for n:=1 to 25 do
      begin
        gotoxy(m,n);write(' ');
      end;
    end;
  end;

{MAIN}
begin

repeat

closegraph;
farbe;
textcolor(14);
gotoxy(30,2);write('Verkehrsspiel');
gotoxy(2,4);writeln('Du musst die Geschwindigkeit  v  des Fahrzeuges und die ');
gotoxy(2,5);writeln('Bremsverz”gerung  a  eingeben.');
gotoxy(2,6);writeln('Sobald Du das Spiel mit Hilfe der Leertaste gestartet hast,');
gotoxy(2,7);writeln('musst Du darauf achten, wann ein Kind vor dem Fahrzeug auftaucht.');
gotoxy(2,8);writeln('In diesem Moment wird eine Marke gesetzt.');
gotoxy(2,9);writeln('Nun sollst Du m”glichst rasch die Bremse mit Hilfe der Taste  1');
gotoxy(2,10);writeln('bet„tigen. Im gleichen Moment wird eine zweite Marke gesetzt.');
gotoxy(2,11);writeln('Der Abstand der beiden Marken ist der Reaktionsweg.');
gotoxy(2,12);writeln('Gib zun„chst die Geschwindigkeit ein.  v = ');
readln(v);
gotoxy(10,23);write('Gib die Bremsverz”gerung ein.  a = ');
readln(a1);
repeat until keypressed;

grafik;
setcolor(14);
outtextxy(130,50,'Zum Starten  <s>  eingeben, zum Beenden  <b>');
wahl:=' ';

repeat
    setcolor(15);
    if keypressed then  wahl:=readkey;
    case wahl of
    's':
    begin
      cleardevice;
      grafik;
setcolor(14);
outtextxy(130,50,'Zum Wiederholen  <s>  eingeben, zum Beenden  <b>');
      spiel;
      wahl:=' ';
    end;
    'b':exit;
   end;



until wahl='b';
repeat until keypressed;
    if keypressed then  wahl:=readkey;

until wahl='b';

end.
