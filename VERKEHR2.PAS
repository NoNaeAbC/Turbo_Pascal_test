program verkehrserziehung;
uses crt,graph;
var
  treiber,modus,k:integer;
  z,n,h1,h2,h3,s1,s2,s3,v:integer;
  wahl:char;
  b,b1,h,h4,reaktion,da,x,y,y1,dv,a,a4,v2,v1,a1,a2,a3,t:real;
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

  outtextxy(90,440,'Bremsverzîgerung erhîhen (1)  verringern (2)  Beenden (b)');
  outtextxy(120,450,'Geschwindigkeit erhîhen (3)  verringern (4)');
  delay(1000);
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
  gotoxy(13,8);write('Die Geschwindigkeit des Fahrzeuges betrug  ',v,' km/h');
  gotoxy(22,9);write('( Die Messstrecke betrug  100 m )');
  gotoxy(13,11);write('Der Bremsweg des Fahrzeuges hÑtte betragen ');
  gotoxy(15,12);write('bei trockener Fahrbahn:                   ',s1,' m');
  gotoxy(15,13);write('bei nasser Fahrbahn:                      ',s2,' m');
  gotoxy(15,14);write('bei Schnee:                               ',s3,' m');
  gotoxy(13,16);write('Der Anhalteweg hÑtte betragen              ');
  gotoxy(15,17);write('bei trockener Fahrbahn:                   ',h1,' m');
  gotoxy(15,18);write('bei nasser Fahrbahn:                      ',h2,' m');
  gotoxy(15,19);write('bei Schnee:                               ',h3,' m');
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
       str(b:4:0,ortx3);
       outtextxy(160,280,ortx3);outtextxy(195,280,' m');
       str(h4:4:0,ortx4);
       outtextxy(80,350,ortx4);outtextxy(115,350,' m');
       str(h:4:0,ortx5);
       outtextxy(160,350,ortx5);outtextxy(195,350,' m');
    str(a:4:1,ortx);
    outtextxy(200,210,ortx);outtextxy(235,210,' m/s˝');
    str(v2:4:0,ortx1);
    outtextxy(200,220,ortx1);outtextxy(235,220,' km/h');
    outtextxy(170,220,'v = ');
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
    'b':
    begin
      closegraph;
      exit;
    end;
   end;


     repeat until keypressed;
     if keypressed then  wahl:=readkey;


until wahl='b';
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
  gotoxy(15,5);write('Messen von Geschwindigkeiten / Anhalteweg');
  gotoxy(5,8);write('Zum Messen der Geschwindigkeit von Fahrzeugen wurde eine Strecke von 100 m');
  gotoxy(5,9);write('ausgemessen und die Zeit gemessen, die die Fahrzeuge fÅr diese Strecke');
  gotoxy(5,10);write('benîtigten. Die Geschwindigkeit berechnet sich dann als Quotient aus');
  gotoxy(5,11);write('Strecke und Zeit.');
  gotoxy(5,14);write('Der Anhalteweg eines Fahrzeuges ergibt sich als Summe des reinen Bremsweges');
  gotoxy(5,15);write('und der Strecke, die das Fahrzeug mit unverminderter Geschwindigkeit in der');
  gotoxy(5,16);write('sogenannten Schrecksekunde zurÅcklegt.');
  gotoxy(5,19);write('Geschwindigkeitsberechnung -> g');
  gotoxy(5,20);write('Graphische Darstellung des Anhalteweges -> a');
  gotoxy(5,22);write('Programm beenden -> b                      ');

wahl:=' ';
  read(wahl);
  case wahl of
   'g':bild2;
   'a':bild;
   'b':exit;
   end;
  until wahl='b';
end.