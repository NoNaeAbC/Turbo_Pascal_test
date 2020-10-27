program verkehrserziehung;
uses crt,graph;
var
  treiber,modus,k:integer;
  z,n,h1,h2,h3,s1,s2,s3,v:integer;
  wahl:char;
  t2,t3,dt,t1,b,b1,h,h4,reaktion,da,x,y,y1,dv,a,a4,v2,v1,a1,a2,a3,t:real;
  ortx,ortx1,ortx2,ortx3,ortx4,ortx5:string;

procedure grafik;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
 setbkcolor(1);
    str(a:4:1,ortx);
    outtextxy(200,210,ortx);outtextxy(235,210,' m/s˝');
  outtextxy(170,210,'a = ');
    str(v2:4:0,ortx1);
    outtextxy(200,220,ortx1);outtextxy(235,220,' km/h');
    outtextxy(170,220,'v = ');
  line(10,40,630,40);
  line(10,430,630,430);
  line(10,40,10,430);
  line(630,40,630,430);
  outtextxy(60,20,'Anhalteweg in AbhÑngigkeit von Geschwindigkeit und Bremsverzîgerung');
  outtextxy(20,60,'Erfahrungswerte fÅr die Bremsverzîgerung');
  outtextxy(50,80,'trockene Fahrbahn:');
  outtextxy(50,90,'6,5 bis 7,5 m/s˝');
  outtextxy(50,110,'nasse Fahrbahn');
  outtextxy(50,120,'Beton:    4 bis 5,5 m/s˝');
  outtextxy(50,130,'Asphalt:  5 bis 6,5 m/s˝');
  outtextxy(50,150,'Neuschnee');
  outtextxy(50,160,'2 bis 3 m/s˝');
  outtextxy(70,190,'eingestellte Werte:');
  outtextxy(20,210,'Bremsverzîgerung: ');
  outtextxy(20,220,'Geschwindigkeit:  ');
  outtextxy(125,250,'Bremsweg');
  outtextxy(80,260,'Optimum     jetzt');
  outtextxy(115,320,'Anhalteweg');
  outtextxy(80,330,'Optimum     jetzt');
  outtextxy(40,390,'Es wurde eine Reaktionszeit');
  outtextxy(60,400,'von  1 s  angenommen.');
  line(300,400,300,100);
  line(300,400,605,400);
  outtextxy(395,410,'50');
  line(400,400,400,405);
  outtextxy(490,410,'100');
  line(500,400,500,405);
  outtextxy(590,410,'150');
  line(600,400,600,405);
  outtextxy(614,395,'v');
  outtextxy(305,100,'Anhalteweg in m');
  line(300,300,305,300);
  outtextxy(310,295,'50');
  line(300,200,305,200);
  outtextxy(310,195,'100');
  line(15,180,280,180);
  line(15,180,15,370);
  line(15,370,280,370);
  line(280,180,280,370);

  outtextxy(90,440,'Bremsverzîgerung erhîhen (1)  verringern (2)  Beenden (z)');
  outtextxy(120,450,'Geschwindigkeit erhîhen (3)  verringern (4)');
  delay(1000);
end;

procedure graphik1;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
 setbkcolor(1);
    t1:=7.1;
    str(t1:4:1,ortx);

    outtextxy(100,390,ortx);outtextxy(135,390,' s');
  outtextxy(70,390,'t = ');
    str((360/t1):4:0,ortx1);

    outtextxy(100,400,ortx1);outtextxy(135,400,' km/h');
    outtextxy(70,400,'v = ');
  line(10,40,630,40);
  line(10,430,630,430);
  line(10,40,10,430);
  line(630,40,630,430);
  line(99,100,99,351);
  line(99,351,500,351);
  outtextxy(105,105,'Geschwindigkeit in km/h');
  outtextxy(510,346,'Zeit in s');
  outtextxy(100,20,'Bestimmung der Geschwindigkeit aus gemessenen Zeitwerten');
  outtextxy(70,297,'50');
  line(94,302,99,302);
  line(94,252,99,252);
  outtextxy(60,247,'100');
  line(94,202,99,202);
  outtextxy(60,197,'150');
  line(94,152,99,152);
  outtextxy(60,147,'200');
  line(200,351,200,355);
  outtextxy(198,360,'5');
  line(300,351,300,355);
  outtextxy(295,360,'10');
  line(400,351,400,355);
  outtextxy(395,360,'15');
  line(500,351,500,355);
  outtextxy(495,360,'20');
  line(450,351,450,355);
  line(350,351,350,355);
  line(250,351,250,355);
  line(94,177,99,177);
  line(94,227,99,227);
  line(94,277,99,277);
  line(94,327,99,327);
  line(150,351,150,355);
  outtextxy(90,360,'0');

  outtextxy(90,440,'grî·erer Zeitwert (1)  kleinerer Zeitwert (2)  Beenden (z)');
  delay(1000);
end;

procedure geschw_zeit;
begin
  graphik1;
  setcolor(15);
  t1:=7.1;
  t:=1.59;
  dt:=0.01;
  repeat
    t:=t+dt;
    putpixel(round(100+20*t),round(350-360/t),14);
  until t>=20;
setcolor(15);
  line(100+round(20*t1),348,100+round(20*t1),352-round(360/t1));
  line(98+round(20*t1),352-round(360/t1),102,352-round(360/t1));
     dt:=0.1;
repeat
    case wahl of
    '1':
    begin
      setcolor(1);
  line(100+round(20*t1),348,100+round(20*t1),352-round(360/t1));
  line(98+round(20*t1),352-round(360/t1),102,352-round(360/t1));
    str(t1:4:1,ortx);
    outtextxy(100,390,ortx);outtextxy(135,390,' s');
  outtextxy(70,390,'t = ');
    str((360/t1):4:0,ortx1);
    outtextxy(100,400,ortx1);outtextxy(135,400,' km/h');
if t1<=20 then
begin
      t1:=t1+dt;
      setcolor(15);
  line(100+round(20*t1),348,100+round(20*t1),352-round(360/t1));
  line(98+round(20*t1),352-round(360/t1),102,352-round(360/t1));
    str(t1:4:1,ortx);
    outtextxy(100,390,ortx);outtextxy(135,390,' s');
  outtextxy(70,390,'t = ');
    str((360/t1):4:0,ortx1);
    outtextxy(100,400,ortx1);outtextxy(135,400,' km/h');
end
else
begin
  t1:=20;
end;
      wahl:=' ';
    end;
    '2':
    begin
      setcolor(1);
  line(100+round(20*t1),348,100+round(20*t1),352-round(360/t1));
  line(98+round(20*t1),352-round(360/t1),102,352-round(360/t1));
    str(t1:4:1,ortx);
    outtextxy(100,390,ortx);outtextxy(135,390,' s');
  outtextxy(70,390,'t = ');
    str((360/t1):4:0,ortx1);
    outtextxy(100,400,ortx1);outtextxy(135,400,' km/h');
if t1>=1.7 then
begin
      t1:=t1-dt;
      setcolor(15);
  line(100+round(20*t1),348,100+round(20*t1),352-round(360/t1));
  line(98+round(20*t1),352-round(360/t1),102,352-round(360/t1));
    str(t1:4:1,ortx);
    outtextxy(100,390,ortx);outtextxy(135,390,' s');
  outtextxy(70,390,'t = ');
    str((360/t1):4:0,ortx1);
    outtextxy(100,400,ortx1);outtextxy(135,400,' km/h');
end
else
begin
  t1:=1.7;
end;
      wahl:=' ';
    end;
    'z':
    begin

      exit;
    end;
  end;
     repeat until keypressed;
     if keypressed then  wahl:=readkey;

until wahl='z';
end;

procedure graphik2;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
 setbkcolor(1);
    t1:=10;
  str(t1:4:1,ortx);
    outtextxy(100,390,ortx);outtextxy(135,390,' m/s');
    outtextxy(70,390,'v = ');
  str((3.6*t1):4:1,ortx1);
    outtextxy(100,400,ortx1);outtextxy(135,400,' km/h');
    outtextxy(70,400,'v = ');
  line(10,40,630,40);
  line(10,430,630,430);
  line(10,40,10,430);
  line(630,40,630,430);
  line(99,100,99,351);
  line(99,351,500,351);
  outtextxy(105,105,'Geschwindigkeit in km/h');
  outtextxy(480,336,'Geschwindigkeit');
  outtextxy(510,346,'in m/s');
  outtextxy(140,20,'Umrechnung von  m/s  in  km/h  und umgekehrt');
  outtextxy(70,297,'50');
  line(94,300,99,300);
  line(94,250,99,250);
  outtextxy(60,247,'100');
  line(94,200,99,200);
  outtextxy(60,197,'150');
  line(94,150,99,150);
  outtextxy(60,147,'200');
  line(175,351,175,355);
  outtextxy(170,360,'10');
  line(250,351,250,355);
  outtextxy(245,360,'20');
  line(325,351,325,355);
  outtextxy(320,360,'30');
  line(400,351,400,355);
  outtextxy(395,360,'40');
  line(475,351,475,355);
  outtextxy(470,360,'50');

  line(94,177,99,177);
  line(94,227,99,227);
  line(94,277,99,277);
  line(94,327,99,327);
  outtextxy(90,360,'0');

  outtextxy(90,440,'grî·erer m/s-Wert (1)  kleinerer m/s-Wert (2)  Beenden (z)');
  delay(1000);
end;

procedure geschw_umr;
begin
  graphik2;
  setcolor(15);
  t1:=10.1;
  t:=0;
  dt:=0.01;
  repeat
    t:=t+dt;
    putpixel(round(100+7.5*t),round(350-3.6*t),14);
  until t>=50;
setcolor(15);
  line(100+round(7.5*t1),348,100+round(7.5*t1),352-round(3.6*t1));
  line(98+round(7.5*t1),350-round(3.6*t1),102,350-round(3.6*t1));
     dt:=0.1;
repeat
    case wahl of
    '1':
    begin
      setcolor(1);
  line(100+round(7.5*t1),348,100+round(7.5*t1),352-round(3.6*t1));
  line(98+round(7.5*t1),350-round(3.6*t1),102,350-round(3.6*t1));
    str(t1:4:1,ortx);
    outtextxy(100,390,ortx);outtextxy(135,390,' m/s');
  outtextxy(70,390,'v = ');
    str((3.6*t1):4:1,ortx1);
    outtextxy(100,400,ortx1);outtextxy(135,400,' km/h');
if t1<=50 then
begin
  t1:=t1+dt;
  setcolor(15);
  line(100+round(7.5*t1),348,100+round(7.5*t1),352-round(3.6*t1));
  line(98+round(7.5*t1),350-round(3.6*t1),102,350-round(3.6*t1));
  str(t1:4:1,ortx);
  outtextxy(100,390,ortx);outtextxy(135,390,' m/s');
  outtextxy(70,390,'v = ');
  str((3.6*t1):4:1,ortx1);
  outtextxy(100,400,ortx1);outtextxy(135,400,' km/h');
end
else
begin
  t1:=50.1;
end;
      wahl:=' ';
    end;
    '2':
    begin
      setcolor(1);
  line(100+round(7.5*t1),348,100+round(7.5*t1),352-round(3.6*t1));
  line(98+round(7.5*t1),350-round(3.6*t1),102,350-round(3.6*t1));
    str(t1:4:1,ortx);
    outtextxy(100,390,ortx);outtextxy(135,390,' m/s');
  outtextxy(70,390,'v = ');
    str((3.6*t1):4:1,ortx1);
    outtextxy(100,400,ortx1);outtextxy(135,400,' km/h');
  if t1>=0.2 then
  begin
      t1:=t1-dt;
      setcolor(15);
      str(t1:4:1,ortx);
      outtextxy(100,390,ortx);outtextxy(135,390,' m/s');
      outtextxy(70,390,'v = ');
      str((3.6*t1):4:1,ortx1);
      outtextxy(100,400,ortx1);outtextxy(135,400,' km/h');

  line(100+round(7.5*t1),348,100+round(7.5*t1),352-round(3.6*t1));
  line(98+round(7.5*t1),350-round(3.6*t1),102,350-round(3.6*t1));
  end
  else
  begin
    t1:=0.1;
  end;
      wahl:=' ';
    end;
    'z':
    begin

      exit;
    end;
  end;
     repeat until keypressed;
     if keypressed then  wahl:=readkey;

until wahl='z';
end;

procedure rechnung;
begin
  clrscr;
  textbackground(7);
  textcolor(1);
  for z:=1 to 80 do
    begin
      for n:=1 to 25 do
      begin
        gotoxy(z,n);
        write(' ');
      end;
    end;
  gotoxy(17,3);write('Geschwindigkeit, Bremsweg und Anhalteweg');
  gotoxy(17,4);write('****************************************');
  gotoxy(17,6);write('Gib den gemessenen Zeitwert ein:   ');
  read(t);
  gotoxy(55,6);write(' s');
  v:=round(360/t);
  v1:=v/3.6;
  s1:=round(1/2*v1*v1/a1);
  s2:=round(1/2*v1*v1/a2);
  s3:=round(1/2*v1*v1/a3);
  h3:=round(v/3.6)+s3;
  h1:=round(v/3.6)+s1;
  h2:=round(v/3.6)+s2;
  gotoxy(13,8);write('Die Geschwindigkeit des Fahrzeuges betrug  ',v:4,' km/h');
  gotoxy(22,9);write('( Die Messstrecke betrug  100 m )');
  gotoxy(13,11);write('Der Bremsweg des Fahrzeuges hÑtte betragen ');
  gotoxy(15,12);write('bei trockener Fahrbahn:                   ',s1:4,' m');
  gotoxy(15,13);write('bei nasser Fahrbahn:                      ',s2:4,' m');
  gotoxy(15,14);write('bei Schnee:                               ',s3:4,' m');
  gotoxy(13,16);write('Der Anhalteweg hÑtte betragen              ');
  gotoxy(15,17);write('bei trockener Fahrbahn:                   ',h1:4,' m');
  gotoxy(15,18);write('bei nasser Fahrbahn:                      ',h2:4,' m');
  gotoxy(15,19);write('bei Schnee:                               ',h3:4,' m');
end;

procedure rechnung1;
begin
  clrscr;
  textbackground(7);
  textcolor(1);
  for z:=1 to 80 do
    begin
      for n:=1 to 25 do
      begin
        gotoxy(z,n);
        write(' ');
      end;
    end;
  gotoxy(12,3);write('Geschwindigkeit, Bremsweg, Anhalteweg und Zeitdauer');
  gotoxy(12,4);write('***************************************************');
  gotoxy(11,6);write('Gib einen Geschwindigkeitswert in  km/h  ein:   ');
  read(v);
  gotoxy(63,6);write(' km/h');

  v1:=v/3.6;
  s1:=round(1/2*v1*v1/a1);
  s2:=round(1/2*v1*v1/a2);
  s3:=round(1/2*v1*v1/a3);
  h3:=round(v/3.6)+s3;
  h1:=round(v/3.6)+s1;
  h2:=round(v/3.6)+s2;
  if v>0 then
  begin
  t1:=v1/a1+1;
  t2:=v1/a2+1;
  t3:=v1/a3+1;
  end
  else
  begin
  t1:=0;
  t2:=0;
  t3:=0;
  end;

  gotoxy(13,9);write('Der Bremsweg des Fahrzeuges wÅrde betragen ');
  gotoxy(15,10);write('bei trockener Fahrbahn:                   ',s1:4,' m');
  gotoxy(15,11);write('bei nasser Fahrbahn:                      ',s2:4,' m');
  gotoxy(15,12);write('bei Schnee:                               ',s3:4,' m');
  gotoxy(13,14);write('Der Anhalteweg wÅrde betragen              ');
  gotoxy(15,15);write('bei trockener Fahrbahn:                   ',h1:4,' m');
  gotoxy(15,16);write('bei nasser Fahrbahn:                      ',h2:4,' m');
  gotoxy(15,17);write('bei Schnee:                               ',h3:4,' m');
  gotoxy(13,19);write('Die Anhaltezeit wÅrde betragen');
  gotoxy(15,20);write('bei trockener Fahrbahn:                   ',t1:4:1,' s');
  gotoxy(15,21);write('bei nasser Fahrbahn:                      ',t2:4:1,' s');
  gotoxy(15,22);write('bei Schnee:                               ',t3:4:1,' s');
end;

procedure bild1;
begin
       y:=0;
       y1:=0;
       x:=299;
       b:=v2*v2/(2*a*3.6*3.6);
       b1:=v2*v2/(2*a4*3.6*3.6);
       h:=b+v2/3.6*reaktion;
       h4:=b1+v2/3.6*reaktion;
       str(b1:4:0,ortx2);
       outtextxy(80,280,ortx2);outtextxy(115,280,' m');
       str(h4:4:0,ortx4);
       outtextxy(80,350,ortx4);outtextxy(115,350,' m');
    outtextxy(170,220,'v = ');
       setcolor(12);
       str(h:4:0,ortx5);
       outtextxy(160,350,ortx5);outtextxy(195,350,' m');
       str(b:4:0,ortx3);
       outtextxy(160,280,ortx3);outtextxy(195,280,' m');
    str(a:4:1,ortx);
    outtextxy(200,210,ortx);outtextxy(235,210,' m/s˝');
    str(v2:4:0,ortx1);
    outtextxy(200,220,ortx1);outtextxy(235,220,' km/h');
    setcolor(12);
    if v2<=155 then
    begin
    if h<150 then
       line(round(300+v2*2),399,round(300+v2*2),round(400-2*h))
       else
       line(round(300+v2*2),399,round(300+v2*2),100);
    setcolor(15);
     if h4<150 then
       line(round(302+v2*2),399,round(302+v2*2),round(400-2*h4))
       else
       line(round(300+v2*2),399,round(300+v2*2),100);
    end;


       repeat
         x:=x+1;

         if y<150 then
         begin
           y:=(x-300)*(x-300)/(8*a*3.6*3.6)+(x-300)/7.2;
           putpixel(round(x),400-round(2*y),12);
         end;

         if y1<150 then
         begin
         y1:=(x-300)*(x-300)/(8*a4*3.6*3.6)+(x-300)/7.2;
         putpixel(round(x),400-round(2*y1),15);
         end;
       until x=600;
end;

procedure bild;
   begin
     a:=7.5;
     a4:=7.5;
     da:=0.1;
     v2:=50;
     dv:=1;
     reaktion:=1;
     grafik;
     bild1;
     repeat until keypressed;
     if keypressed then  wahl:=readkey;
repeat

       y:=0;
       y1:=0;
       x:=299;
       setcolor(1);
       outtextxy(80,280,ortx2);outtextxy(115,280,' m');
       outtextxy(160,280,ortx3);outtextxy(195,280,' m');
       outtextxy(80,350,ortx4);outtextxy(115,350,' m');
       outtextxy(160,350,ortx5);outtextxy(195,350,' m');
    outtextxy(200,210,ortx);outtextxy(235,210,' m/s˝');
    outtextxy(200,220,ortx1);outtextxy(235,220,' km/h');

    if v2<=155 then
    begin

   if h<150 then
       line(round(300+v2*2),399,round(300+v2*2),round(400-2*h))
       else
       line(round(300+v2*2),399,round(300+v2*2),100);
     if h4<150 then
       line(round(302+v2*2),399,round(302+v2*2),round(400-2*h4))
       else
       line(round(300+v2*2),399,round(300+v2*2),100);
   end;

       setcolor(15);
       repeat
         x:=x+1;

         if y<150 then
         begin
           y:=(x-300)*(x-300)/(8*a*3.6*3.6)+(x-300)/7.2;
           putpixel(round(x),400-round(2*y),1);
         end;

         if y1<150 then
         begin
         y1:=(x-300)*(x-300)/(8*a4*3.6*3.6)+(x-300)/7.2;
         putpixel(round(x),400-round(2*y1),1);
         end;
       until x=600;

    case wahl of
    '1':
    begin
      a:=a+da;
      bild1;
      wahl:=' ';
    end;
    '2':
    begin
      if a>=0.2 then
      begin
       a:=a-da;
      end
      else
      begin
       a:=0.1;
       end;
      bild1;
      wahl:=' ';

    end;
    '3':
    begin
      v2:=v2+dv;
      bild1;
      wahl:=' ';
    end;
    '4':
    begin
      if v2>=1 then
      begin
      v2:=v2-dv;
      end
      else
      v2:=0;
      bild1;
      wahl:=' ';
    end;
    'z':
    begin

      exit;
    end;
   end;


     repeat until keypressed;
     if keypressed then  wahl:=readkey;


until wahl='z';
end;

procedure bild2;
begin
clrscr;
  a1:=7.5;
  a2:=5;
  a3:=2.5;
  rechnung;
  repeat
  gotoxy(17,23);
  write('Beenden: "z"        Wiederholen: "w"   ');
  wahl:=' ';
  read(wahl);
  case wahl of
   'w':rechnung;
   'z':exit;
   end;
  until wahl='z';
end;

procedure bild3;
begin
clrscr;
  a1:=7.5;
  a2:=5;
  a3:=2.5;
  rechnung1;
  repeat
  gotoxy(17,24);
  write('Beenden: "z"        Wiederholen: "w"   ');
  wahl:=' ';
  read(wahl);
  case wahl of
   'w':rechnung1;
   'z':exit;
   end;
  until wahl='z';
end;

procedure menue;
begin
repeat
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(7);
  setcolor(1);
  outtextxy(200,100,'Graphische Darstellung von :');
  outtextxy(120,200,'Geschwindigkeitsberechnung aus Zeitmesswerten -> 1');
  outtextxy(170,250,'Umrechnung von  km/h  in  m/s  -> 2');
  outtextxy(50,300,'Anhaltewegen in AbhÑngigkeit von den Stra·enverhÑltnissen  -> 3');
  outtextxy(220,380,'Programm beenden -> b');
wahl:=' ';

  read(wahl);
  case wahl of
   '1':geschw_zeit;
   '2':geschw_umr;
   '3':bild;

   'b':
   begin
   closegraph;
   exit;
   end;
   end;
  until wahl='b';
end;

{MAIN}
begin
  repeat
  textbackground(7);
  textcolor(1);
  for z:=1 to 80 do
    begin
      for n:=1 to 25 do
      begin
        gotoxy(z,n);
        write(' ');
      end;
    end;
  gotoxy(17,3);write('Messen von Geschwindigkeiten / Anhalteweg');
  gotoxy(3,5);write('Zum Messen der Geschwindigkeit von Fahrzeugen wurde eine Strecke von 100 m');
  gotoxy(3,6);write('ausgemessen und die Zeit gemessen, die die Fahrzeuge fÅr diese Strecke');
  gotoxy(3,7);write('benîtigten. Die Geschwindigkeit berechnet sich dann als Quotient aus');
  gotoxy(3,8);write('Strecke und Zeit.');
  gotoxy(3,10);write('Der Anhalteweg eines Fahrzeuges ergibt sich als Summe des reinen Bremsweges');
  gotoxy(3,11);write('und der Strecke, die das Fahrzeug mit unverminderter Geschwindigkeit in der');
  gotoxy(3,12);write('sogenannten Schrecksekunde zurÅcklegt. Es wurde stets mit  1 s  gerechnet.');
  gotoxy(3,14);write('Die Bremsverzîgerung (z.B. 7,5 m/s˝) besagt, dass die Geschwindigkeit des');
  gotoxy(3,15);write('Fahrzeuges in jeder Sekunde um  7,5 m/s  abnimmt. Die Anhaltezeit ist die');
  gotoxy(3,16);write('Summe aus der hieraus resultierenden Bremszeit und der Reaktionszeit ( 1 s ).');
  gotoxy(15,18);write('Geschwindigkeitsberechnung       -> g');
  gotoxy(15,19);write('Geschwindigkeit und Anhaltezeit  -> h');
  gotoxy(15,20);write('Graphische Darstellungen         -> a');
  gotoxy(15,22);write('Programm beenden                 -> b           ');

wahl:=' ';
  read(wahl);
  case wahl of
   'g':bild2;
   'h':bild3;
   'a':menue;

   'b':exit;
   end;
  until wahl='b';
end.