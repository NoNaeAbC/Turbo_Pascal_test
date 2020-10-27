program maxwell;
uses crt,graph;
var
  k,treiber,modus:integer;
  wahl2,wahl1,wahl:char;
  ortx1,ortx2,ortx3:string;

  h,dh,E,dE:array[0..600] of real;
  l,farbe1,farbe2,i:integer;
  eps,s,dt,t:real;

procedure menue;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(7);
  setcolor(1);
  outtextxy(150,150,'Darstellung der Integrationen  ->  1');
  outtextxy(150,200,'Rechenbeispiel  ->  2');
  outtextxy(150,250,'Simulation von E- und B- Feld  ->  3');
  outtextxy(150,300,'Brechung ( zwei Medien )  ->  4');
  outtextxy(400,400,'beenden  ->  b');
end;

procedure rechenbeispiel;
begin
closegraph;
clrscr;
textbackground(0);
textcolor(7);
  for i:= 0 to 40 do
  begin
    E[i]:=0;
    dE[i]:=0;
    h[i]:=0;
    dh[i]:=0;
  end;
   E[0]:=1;
   for i:=0 to 12 do
   begin
    gotoxy(3*i+42,7);
    write(' ',round(E[i]));
   end;

  gotoxy(2,1);write('dh[i]:=E[i]-E[i+1]    h[i]:=h[i]+dh[i]');
  gotoxy(42,2);write('dE[i+1]:=h[i]-h[i+1]  E[i]:=E[i]+dE[i]');

  textcolor(14);
  gotoxy(10,4);
  write('Werte fr  h[i] mit  i =');
  gotoxy(50,4);
  write('Werte fr  E[i] mit  i =');

  for i:=0 to 12 do
  begin
    gotoxy(3*i+1,6);
    write(i);
    gotoxy(3*i+43,6);
    write(i);
  end;

  gotoxy(5,7);write('Zahlen „ndern („), weiter (w)');
  l:=7;
  repeat until keypressed;

  textcolor(7);

  wahl2:=' ';
  repeat
    if keypressed then wahl2:=readkey;
    case wahl2 of
    '„':
    begin
      textcolor(0);
      gotoxy(5,7);write('Zahlen „ndern („), weiter (w)');
      for i:=0 to 12 do
      begin
        gotoxy(3*i+42,7);
        write(' ',round(E[i]));
      end;
      textcolor(7);
      gotoxy(5,7);write('Zahlen eingeben:');

      for i:=0 to 12 do
      begin
        gotoxy(3*i+43,7);
        read(E[i]);
      end;
      textcolor(0);
      gotoxy(5,7);write('Zahlen eingeben:');

      wahl2:=' ';
    end;
    'w':
    begin
      textcolor(0);
      gotoxy(5,7);write('Zahlen „ndern („), weiter (w)');
      textcolor(7);
      gotoxy(10,25);write('h[i] - Werte (w)    E[i] - Werte (Taste)     beenden (b)');


      l:=l+1;

      for i:=0 to 40 do
      begin
        dh[i]:=E[i]-E[i+1];
      end;
      for i:=0 to 12 do
      begin
        h[i]:=h[i]+dh[i];
        gotoxy(3*i+1,l);
      write(round(h[i]),' ');
     end;
     repeat until keypressed;

     l:=l+1;
     for i:=0 to 40 do
     begin
      dE[i+1]:=h[i]-h[i+1];
     end;
     for i:=0 to 12 do
     begin
      E[i]:=E[i]+dE[i];
      gotoxy(3*i+42,l);
      write(' ',round(E[i]));
     end;
     writeln;
     repeat until keypressed;
     wahl2:=' ';
    end;
  end;
  until wahl2='b';
menue;
end;

procedure achse;
begin
  line(100,360,150,360);
  line(148,362,150,360);
  line(148,358,150,360);
  line(100,360,100,330);
  line(98,332,100,330);
  line(102,332,100,330);
  line(80,380,100,360);
  line(80,378,80,380);
  line(82,380,80,380);
  outtextxy(155,358,'x');
  outtextxy(88,325,'y ');
  outtextxy(106,325,'E');
  outtextxy(68,380,'z ');
  outtextxy(88,380,'H');
end;

procedure ausw0;
begin
    if E[i]>3 then
    begin
      line(20+3*i,240-round(E[i]),19+3*i,241-round(E[i]));
      line(20+3*i,240-round(E[i]),21+3*i,241-round(E[i]));
    end;
    if E[i]<-3 then
    begin
      line(20+3*i,240-round(E[i]),19+3*i,239-round(E[i]));
      line(20+3*i,240-round(E[i]),21+3*i,239-round(E[i]));
    end;
end;


procedure graphik1;
begin
  setbkcolor(1);
  setcolor(15);
  achse;

  outtextxy(400,100,'t =');
  str(t:4:0,ortx2);
  outtextxy(445,100,ortx2+' æs');

  line(120,100,180,100);
  line(120,99,120,101);
  line(180,99,180,101);
  outtextxy(137,90,'6 km');

  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  outtextxy(180,15,'Ausbreitung von Wellen (nach Maxwell) ');
  outtextxy(40,410,'Nach rechts wandernde St”rung (1)    Trapezsignal (2)   Sinuswelle (3/4)');
  outtextxy(260,430,'Original (0)');
  outtextxy(30,460,'l”schen (l)    selber w„hlen (g/k/G/K/u)     starten (s)     beenden (b)');
end;


procedure l0;
begin
  for i:= 0 to 600 do
  begin
    E[i]:=0;
    dE[i]:=0;
    h[i]:=0;
    dh[i]:=0;
  end;
end;

procedure r1;
begin
   t:=t+dt;
   s:=0.3*t;
   for i:=0 to 199 do
   begin
    dh[i]:=E[i]-E[i+1];
   end;
   setcolor(farbe1);
   for i:=0 to 199 do
   begin
    h[i]:=h[i]+dh[i];
    line(21+3*i,240,21+3*i-round(0.7*h[i]),240+round(0.7*h[i]));
    if h[i]>3 then
    begin
      line(21+3*i-round(0.7*h[i]),240+round(0.7*h[i]),22+3*i-round(0.7*h[i]),240+round(0.7*h[i]));
      line(21+3*i-round(0.7*h[i]),240+round(0.7*h[i]),21+3*i-round(0.7*h[i]),239+round(0.7*h[i]));
    end;
    if h[i]<-3 then
    begin
      line(21+3*i-round(0.7*h[i]),240+round(0.7*h[i]),20+3*i-round(0.7*h[i]),240+round(0.7*h[i]));
      line(21+3*i-round(0.7*h[i]),240+round(0.7*h[i]),21+3*i-round(0.7*h[i]),241+round(0.7*h[i]));
    end;
   end;
   for i:=0 to 199 do
   begin
    dE[i+1]:=h[i]-h[i+1];
   end;
end;

procedure r2;
begin
   setcolor(farbe2);
   for i:=0 to 200 do
   begin
    E[i]:=E[i]+dE[i];
    line(20+3*i,240,20+3*i,240-round(E[i]));
    ausw0;
   end;
end;

procedure rechnung;
begin
 r1;
 r2;
end;

procedure setz;
begin
  farbe1:=10;
  farbe2:=12;
  rechnung;
  setcolor(15);
  outtextxy(400,100,'t =');
  str(t:4:0,ortx2);
  outtextxy(445,100,ortx2+' æs');
end;

procedure loesch;
begin
  farbe1:=1;
  farbe2:=1;
  setfillstyle(0,1);
  bar(0,140,640,340);
  setcolor(15);
  achse;
  line(10,30,10,450);
  line(630,30,630,450);
  setcolor(1);
  outtextxy(445,100,ortx2);
end;

procedure auswahl;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    's':
    begin
      delay(5000);
      loesch;
      t:=0;

      setz;
      wahl2:=' ';
      repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
          end;
        loesch;

        setz;
      delay(250);
      until wahl2='b';
    wahl:=' ';
    end;
    '1':
    begin
      loesch;
      l0;
      E[0]:=30;
      setcolor(12);
      for i:=0 to 200 do
      begin
        line(20+3*i,240,20+3*i,240-round(E[i]));
        ausw0;
      end;
      wahl:=' ';
    end;
    '0':
    begin
      loesch;
      l0;
  E[100]:=10;
  E[101]:=30;
  E[102]:=50;
  E[103]:=70;
  E[104]:=80;
  E[104]:=80;
  E[105]:=80;
  E[106]:=80;
  E[107]:=80;
  E[108]:=80;
  E[109]:=80;
  E[110]:=70;
  E[111]:=50;
  E[112]:=30;
  E[113]:=10;
      setcolor(12);
      for i:=1 to 200 do
      begin
        line(20+3*i,240,20+3*i,240-round(E[i]));
        ausw0;
      end;
      wahl:=' ';
    end;
    '3':
    begin
      loesch;
      l0;
      for i:=50 to 100 do
      begin
        E[i]:=40*sin(2*pi/50*(i-50));
      end;
      setcolor(12);
      for i:=1 to 200 do
      begin
        line(20+3*i,240,20+3*i,240-round(E[i]));
        ausw0;
      end;
      wahl:=' ';
    end;
    '4':
    begin
      loesch;
      l0;
      for i:=50 to 120 do
      begin
        E[i]:=100*sin(2*pi/140*(i-50));
      end;
      setcolor(12);
      for i:=1 to 200 do
      begin
        line(20+3*i,240,20+3*i,240-round(E[i]));
        ausw0;
      end;
      wahl:=' ';
    end;
    'l':
    begin
      loesch;
      l0;
      setcolor(12);
      for i:=0 to 200 do
      begin
        line(20+3*i,240,20+3*i,240-round(E[i]));
        ausw0;
      end;
      i:=0;
      wahl:=' ';
    end;
    'g':
    begin
      i:=i+1;
      E[i]:=E[i-1]+3;
      setcolor(12);
      line(20+3*i,240,20+3*i,240-round(E[i]));
        ausw0;
      wahl:=' ';
    end;
    'k':
    begin
      i:=i+1;
      E[i]:=E[i-1]-3;
      setcolor(12);
      line(20+3*i,240,20+3*i,240-round(E[i]));
        ausw0;
      wahl:=' ';
    end;
    'G':
    begin
      i:=i+1;
      E[i]:=E[i-1]+10;
      setcolor(12);
      line(20+3*i,240,20+3*i,240-round(E[i]));
        ausw0;
      wahl:=' ';
    end;
    'K':
    begin
      i:=i+1;
      E[i]:=E[i-1]-10;
      setcolor(12);
      line(20+3*i,240,20+3*i,240-round(E[i]));
        ausw0;
      wahl:=' ';
    end;
    'u':
    begin
      i:=i+1;
      E[i]:=E[i-1];
      setcolor(12);
      line(20+3*i,240,20+3*i,240-round(E[i]));
        ausw0;
      wahl:=' ';
    end;
    '2':
    begin
      loesch;
      l0;
      for i:=41 to 49 do
      begin
        E[i]:=(i-40)*5;
      end;
      for i:= 50 to 100 do
      begin
        E[i]:=50;
      end;
      for i:=101 to 109 do
      begin
        E[i]:=(110-i)*5;
      end;
      setcolor(12);
      for i:=1 to 199 do
      begin
        line(20+3*i,240,20+3*i,240-round(E[i]));
        ausw0;
      end;

      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure max;
begin
  cleardevice;
    t:=0;
    dt:=1;
    s:=0;
    graphik1;
  l0;
  E[100]:=10;
  E[101]:=30;
  E[102]:=50;
  E[103]:=70;
  E[104]:=80;
  E[104]:=80;
  E[105]:=80;
  E[106]:=80;
  E[107]:=80;
  E[108]:=80;
  E[109]:=80;
  E[110]:=70;
  E[111]:=50;
  E[112]:=30;
  E[113]:=10;
      setcolor(12);
      for i:=1 to 200 do
      begin
        line(20+3*i,240,20+3*i,240-round(E[i]));
        ausw0;
      end;

    auswahl;
    closegraph;
  menue;
end;

procedure graphik2;
begin
  setbkcolor(1);
      setcolor(12);
      outtextxy(10,160,'E[0]  E[1]');
      setcolor(10);
      outtextxy(10,140,'   H[0]  H[1]');
  setcolor(15);
  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  achse;
  outtextxy(180,15,'Ausbreitung von Wellen (nach Maxwell) ');
  outtextxy(120,40,'Integration l„ngs H bzw. E   setzen/l”schen (H/h//E/e)  ');
  outtextxy(190,60,'beide Integrationswege anzeigen (I)');
  outtextxy(40,410,'Nach rechts wandernde St”rung (1)    Trapezsignal (2)   Sinuswelle (3)');
  outtextxy(260,430,'Original (0)');
  outtextxy(30,460,'l”schen (l)    selber w„hlen (g/k/G/K/u)     starten (s)     beenden (b)');
end;

procedure l2;
begin
  for i:= 0 to 600 do
  begin
    E[i]:=0;
    dE[i]:=0;
    h[i]:=0;
    dh[i]:=0;
  end;
end;

procedure ausw;
begin
    if E[i]>3 then
    begin
      line(20+50*i,240-round(E[i]),17+50*i,243-round(E[i]));
      line(20+50*i,240-round(E[i]),23+50*i,243-round(E[i]));
    end;
    if E[i]<-3 then
    begin
      line(20+50*i,240-round(E[i]),17+50*i,237-round(E[i]));
      line(20+50*i,240-round(E[i]),23+50*i,237-round(E[i]));
    end;
end;

procedure r21;
begin
   for i:=0 to 12 do
   begin
    dh[i]:=E[i]-E[i+1];
   end;
   setcolor(farbe2);
   for i:=0 to 12 do
   begin
    h[i]:=h[i]+dh[i];
    line(45+50*i,240,45+50*i-round(0.7*h[i]),240+round(0.7*h[i]));
    if h[i]>3 then
    begin
      line(45+50*i-round(0.7*h[i]),240+round(0.7*h[i]),48+50*i-round(0.7*h[i]),240+round(0.7*h[i]));
      line(45+50*i-round(0.7*h[i]),240+round(0.7*h[i]),45+50*i-round(0.7*h[i]),237+round(0.7*h[i]));
    end;
    if h[i]<-3 then
    begin
      line(45+50*i-round(0.7*h[i]),240+round(0.7*h[i]),42+50*i-round(0.7*h[i]),240+round(0.7*h[i]));
      line(45+50*i-round(0.7*h[i]),240+round(0.7*h[i]),45+50*i-round(0.7*h[i]),243+round(0.7*h[i]));
    end;
   end;
end;

procedure r22;
begin
   for i:=0 to 12 do
   begin
    dE[i+1]:=h[i]-h[i+1];
   end;
   setcolor(farbe1);
   for i:=0 to 13 do
   begin
    E[i]:=E[i]+dE[i];
    line(20+50*i,240,20+50*i,240-round(E[i]));
    ausw;
   end;
end;

procedure rechnung2;
begin
  r21;
  r22;
end;

procedure setz2;
begin
  farbe1:=12;
  farbe2:=10;
  rechnung2;
end;

procedure loesch2;
begin
  farbe1:=1;
  farbe2:=1;
  setfillstyle(0,1);
  bar(0,100,640,400);
  setcolor(15);
  achse;
  line(10,30,10,450);
  line(630,30,630,450);
      setcolor(12);
      outtextxy(10,160,'E[0]  E[1]');
      setcolor(10);
      outtextxy(10,140,'   H[0]  H[1]');
end;

procedure h0;
begin
      line(393-18,240+18,447-18,240+18);
      line(425-18,258,420-18,253);
      line(425-18,258,420-18,263);

      line(393-18,240+18,393+18,240-18);
      line(393,240,393,235);
      line(393,240,400,240);

      line(393+18,240-18,447+18,240-18);
      line(420+18,222,425+18,227);
      line(420+18,222,425+18,217);

      line(447-18,240+18,447+18,240-18);
      line(447,240,447,245);
      line(447,240,440,240);
      setcolor(farbe1);
      outtextxy(350,160,'E[i]  E[i+1]');
      outtextxy(360,310,'= x*z*e0*dE[i+1]/dt');
      setcolor(farbe2);
      outtextxy(350,140,'    H[i]  H[i+1]');
      outtextxy(340,290,'z*H[i]+x*0-z*H[i+1]+x*0');
end;

procedure e0;
begin
      line(368,265,422,265);
      line(400,265,395,260);
      line(400,265,395,270);
      line(368,265,368,215);
      line(368,240,363,235);
      line(368,240,373,235);
      line(368,215,422,215);
      line(400,215,405,210);
      line(400,215,405,220);
      line(422,215,422,265);
      line(422,240,427,245);
      line(422,240,417,245);
      setcolor(farbe1);
      outtextxy(350,160,'E[i]  E[i+1]');
      outtextxy(270,340,'-y*E[i]+x*0+y*E[i+1]+x*0');
      setcolor(farbe2);
      outtextxy(350,140,'    H[i]  H[i+1]');
      outtextxy(300,360,'= -x*y*æ0*dH[i]/dt');
end;

procedure auswahl2;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    's':
    begin
      delay(5000);
      loesch2;
      l:=1;
      setz2;
      wahl2:=' ';
      repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
          end;
        loesch2;
        l:=l+1;
        setz2;
      delay(500);
      until wahl2='b';
    wahl:=' ';
    end;
    '1':
    begin
      loesch2;
      l2;
      E[0]:=50;
      setcolor(12);
      for i:=0 to 200 do
      begin
        line(20+50*i,240,20+50*i,240-round(E[i]));
        ausw;
      end;
      wahl:=' ';
    end;
    '0':
    begin
      loesch2;
      l2;
  E[1]:=10;
  E[2]:=30;
  E[3]:=50;
  E[4]:=70;
  E[5]:=80;
  E[6]:=80;
  E[7]:=80;
  E[8]:=70;
  E[9]:=50;
  E[10]:=30;
  E[11]:=10;
      setcolor(12);
      for i:=1 to 200 do
      begin
        line(20+50*i,240,20+50*i,240-round(E[i]));
        ausw;
      end;
      wahl:=' ';
    end;
    '3':
    begin
      loesch2;
      l2;
      for i:=0 to 20 do
      begin
        E[i]:=120*sin(2*pi/20*i);
      end;
      setcolor(12);
      for i:=1 to 200 do
      begin
        line(20+50*i,240,20+50*i,240-round(E[i]));
        ausw;
      end;
      wahl:=' ';
    end;
    'l':
    begin
      loesch2;
      l2;
      setcolor(12);
      for i:=0 to 200 do
      begin
        line(20+50*i,240,20+50*i,240-round(E[i]));
        ausw;
      end;
      i:=0;
      wahl:=' ';
    end;
    'E':
    begin
      loesch2;
   setcolor(12);
   for i:=0 to 13 do
   begin
    line(20+50*i,240,20+50*i,240-round(E[i]));
    ausw;
   end;
      farbe1:=12;
      farbe2:=10;
      r21;
      setcolor(14);
      e0;
      repeat until keypressed;
      loesch2;
      farbe1:=12;
      farbe2:=10;
   for i:=0 to 12 do
   begin
    line(45+50*i,240,45+50*i-round(0.7*h[i]),240+round(0.7*h[i]));
    if h[i]>3 then
    begin
      line(45+50*i-round(0.7*h[i]),240+round(0.7*h[i]),48+50*i-round(0.7*h[i]),240+round(0.7*h[i]));
      line(45+50*i-round(0.7*h[i]),240+round(0.7*h[i]),45+50*i-round(0.7*h[i]),237+round(0.7*h[i]));
    end;
    if h[i]<-3 then
    begin
      line(45+50*i-round(0.7*h[i]),240+round(0.7*h[i]),42+50*i-round(0.7*h[i]),240+round(0.7*h[i]));
      line(45+50*i-round(0.7*h[i]),240+round(0.7*h[i]),45+50*i-round(0.7*h[i]),243+round(0.7*h[i]));
    end;
   end;
      r22;
      wahl:=' ';
    end;
    'H':
    begin
      setcolor(14);
      farbe1:=12;
      farbe2:=10;
      h0;
      wahl:=' ';
    end;
    'h':
    begin
      setcolor(1);
      farbe1:=1;
      farbe2:=1;
      h0;
      wahl:=' ';
    end;
    'I':
    begin
      setcolor(14);
      farbe1:=12;
      farbe2:=10;
      h0;
      setcolor(14);
      e0;
      wahl:=' ';
    end;
    'e':
    begin
      setcolor(1);
      farbe1:=1;
      farbe2:=1;
      e0;
      wahl:=' ';
    end;
    'g':
    begin
      i:=i+1;
      E[i]:=E[i-1]+10;
      setcolor(12);
      line(20+50*i,240,20+50*i,240-round(E[i]));
        ausw;
      wahl:=' ';
    end;
    'k':
    begin
      i:=i+1;
      E[i]:=E[i-1]-10;
      setcolor(12);
      line(20+50*i,240,20+50*i,240-round(E[i]));
        ausw;
      wahl:=' ';
    end;
    'G':
    begin
      i:=i+1;
      E[i]:=E[i-1]+30;
      setcolor(12);
      line(20+50*i,240,20+50*i,240-round(E[i]));
        ausw;
      wahl:=' ';
    end;
    'K':
    begin
      i:=i+1;
      E[i]:=E[i-1]-30;
      setcolor(12);
      line(20+50*i,240,20+50*i,240-round(E[i]));
        ausw;
      wahl:=' ';
    end;
    'u':
    begin
      i:=i+1;
      E[i]:=E[i-1];
      setcolor(12);
      line(20+50*i,240,20+50*i,240-round(E[i]));
        ausw;
      wahl:=' ';
    end;
    '2':
    begin
      loesch2;
      l2;
      for i:=1 to 4 do
      begin
        E[i]:=i*25;
      end;
      for i:= 5 to 6 do
      begin
        E[i]:=125;
      end;
      for i:=7 to 10 do
      begin
        E[i]:=(11-i)*25;
      end;
      setcolor(12);
      for i:=1 to 199 do
      begin
        line(20+50*i,240,20+50*i,240-round(E[i]));
        ausw;
      end;

      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure max22;
begin
  cleardevice;
    graphik2;
  l2;
  E[1]:=10;
  E[2]:=30;
  E[3]:=50;
  E[4]:=70;
  E[5]:=80;
  E[6]:=80;
  E[7]:=80;
  E[8]:=70;
  E[9]:=50;
  E[10]:=30;
  E[11]:=10;
    setz2;
    auswahl2;
    closegraph;
  menue;
end;

procedure achse4;
begin
  line(100,360,150,360);
  line(148,362,150,360);
  line(148,358,150,360);
  line(100,360,100,330);
  line(98,332,100,330);
  line(102,332,100,330);
  line(80,380,100,360);
  line(80,378,80,380);
  line(82,380,80,380);
  outtextxy(155,358,'x');
  outtextxy(88,325,'y ');
  outtextxy(106,325,'E');
  outtextxy(68,380,'z ');
  outtextxy(88,380,'H');
end;

procedure ausw04;
begin
    if E[i]>3 then
    begin
      line(20+3*i,240-round(E[i]),19+3*i,241-round(E[i]));
      line(20+3*i,240-round(E[i]),21+3*i,241-round(E[i]));
    end;
    if E[i]<-3 then
    begin
      line(20+3*i,240-round(E[i]),19+3*i,239-round(E[i]));
      line(20+3*i,240-round(E[i]),21+3*i,239-round(E[i]));
    end;
end;


procedure graphik4;
begin
  setbkcolor(1);
  setcolor(14);
  outtextxy(455,100,'Medium 2');
  outtextxy(350,370,'e[r] verkleinern/vergr”áern (e/E)');
  setcolor(15);
  achse;

  outtextxy(400,70,'t =');
  str(t:4:0,ortx2);
  outtextxy(445,70,ortx2+' æs');

  line(120,70,180,70);
  line(120,69,120,71);
  line(180,69,180,71);
  outtextxy(137,60,'6 km');

  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  outtextxy(120,100,'Medium 1');
  setlinestyle(1,0,1);
  line(320,90,320,360);
  setlinestyle(0,0,1);
  outtextxy(180,15,'Brechung von Wellen (nach Maxwell) ');
  outtextxy(40,410,'Nach rechts wandernde St”rung (1)    Trapezsignal (2)   Sinuswelle (3/4)');
  outtextxy(260,430,'Original (0)');
  outtextxy(30,460,'l”schen (l)    selber w„hlen (g/k/G/K/u)     starten (s)     beenden (b)');
end;


procedure l04;
begin
  for i:= 0 to 200 do
  begin
    E[i]:=0;
    dE[i]:=0;
    h[i]:=0;
    dh[i]:=0;
  end;
end;

procedure r14;
begin
   t:=t+dt;
   s:=0.3*t;
   for i:=0 to 100 do
   begin
    dh[i]:=E[i]-E[i+1];
   end;
   for i:=101 to 199 do
   begin
     dh[i]:=(E[i]-E[i+1]);
   end;
   setcolor(farbe1);
   for i:=0 to 199 do
   begin
    h[i]:=h[i]+dh[i];
    line(21+3*i,240,21+3*i-round(0.7*h[i]),240+round(0.7*h[i]));
    if h[i]>3 then
    begin
      line(21+3*i-round(0.7*h[i]),240+round(0.7*h[i]),22+3*i-round(0.7*h[i]),240+round(0.7*h[i]));
      line(21+3*i-round(0.7*h[i]),240+round(0.7*h[i]),21+3*i-round(0.7*h[i]),239+round(0.7*h[i]));
    end;
    if h[i]<-3 then
    begin
      line(21+3*i-round(0.7*h[i]),240+round(0.7*h[i]),20+3*i-round(0.7*h[i]),240+round(0.7*h[i]));
      line(21+3*i-round(0.7*h[i]),240+round(0.7*h[i]),21+3*i-round(0.7*h[i]),241+round(0.7*h[i]));
    end;
   end;
   for i:=0 to 100 do
   begin
    dE[i+1]:=h[i]-h[i+1];
   end;
   for i:=101 to 199 do
   begin
     dE[i+1]:=(h[i]-h[i+1])/eps;
   end;
end;

procedure r24;
begin
   setcolor(farbe2);
   for i:=0 to 200 do
   begin
    E[i]:=E[i]+dE[i];
    line(20+3*i,240,20+3*i,240-round(E[i]));
    ausw04;
   end;
end;

procedure rechnung4;
begin
 r14;
 r24;
end;

procedure setz4;
begin
  farbe1:=10;
  farbe2:=12;
  rechnung4;
  setcolor(15);
  outtextxy(400,70,'t =');
  str(t:4:0,ortx2);
  outtextxy(445,70,ortx2+' æs');
end;


procedure setz44;
begin
  setcolor(14);
  outtextxy(440,350,'e[r] =');
  str(eps:3:1,ortx1);
  outtextxy(500,350,ortx1);
end;

procedure loesch44;
begin
  setcolor(1);
  outtextxy(500,350,ortx1);
end;

procedure loesch4;
begin
  farbe1:=1;
  farbe2:=1;
  setfillstyle(0,1);
  bar(0,140,640,340);
  setcolor(15);
  achse4;
  line(10,30,10,450);
  line(630,30,630,450);
  setlinestyle(1,0,1);
  line(320,90,320,360);
  setlinestyle(0,0,1);
  setcolor(1);
  outtextxy(445,70,ortx2);
end;

procedure auswahl4;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    's':
    begin
      delay(5000);
      loesch4;
      t:=0;

      setz4;
      wahl2:=' ';
      repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
          end;
        loesch4;

        setz4;
      delay(250);
      until wahl2='b';
    wahl:=' ';
    end;
    '1':
    begin
      loesch4;
      l04;
      E[0]:=30;
      setcolor(12);
      for i:=0 to 200 do
      begin
        line(20+3*i,240,20+3*i,240-round(E[i]));
        ausw04;
      end;
      wahl:=' ';
    end;
    '0':
    begin
      loesch4;
      l04;
  E[30]:=10;
  E[31]:=30;
  E[32]:=50;
  E[33]:=70;
  E[34]:=80;
  E[35]:=80;
  E[36]:=80;
  E[37]:=80;
  E[38]:=80;
  E[39]:=80;
  E[40]:=70;
  E[41]:=50;
  E[42]:=30;
  E[43]:=10;
      setcolor(12);
      for i:=1 to 200 do
      begin
        line(20+3*i,240,20+3*i,240-round(E[i]));
        ausw04;
      end;
      wahl:=' ';
    end;
    '3':
    begin
      loesch4;
      l04;
      for i:=25 to 75 do
      begin
        E[i]:=40*sin(2*pi/50*(i-25));
      end;
      setcolor(12);
      for i:=1 to 200 do
      begin
        line(20+3*i,240,20+3*i,240-round(E[i]));
        ausw04;
      end;
      wahl:=' ';
    end;
    '4':
    begin
      loesch4;
      l04;
      for i:=25 to 60 do
      begin
        E[i]:=80*sin(2*pi/70*(i-25));
      end;
      setcolor(12);
      for i:=1 to 200 do
      begin
        line(20+3*i,240,20+3*i,240-round(E[i]));
        ausw04;
      end;
      wahl:=' ';
    end;
    'l':
    begin
      loesch4;
      l04;
      setcolor(12);
      for i:=0 to 200 do
      begin
        line(20+3*i,240,20+3*i,240-round(E[i]));
        ausw04;
      end;
      i:=0;
      wahl:=' ';
    end;
    'g':
    begin
      i:=i+1;
      E[i]:=E[i-1]+3;
      setcolor(12);
      line(20+3*i,240,20+3*i,240-round(E[i]));
        ausw04;
      wahl:=' ';
    end;
    'k':
    begin
      i:=i+1;
      E[i]:=E[i-1]-3;
      setcolor(12);
      line(20+3*i,240,20+3*i,240-round(E[i]));
        ausw04;
      wahl:=' ';
    end;
    'E':
    begin
      loesch44;
      eps:=eps+0.1;
      setz44;
      wahl:=' ';
    end;
    'e':
    begin
    if eps>=1.1 then
    begin
      loesch44;
      eps:=eps-0.1;
      setz44;
    end;
      wahl:=' ';
    end;
    'G':
    begin
      i:=i+1;
      E[i]:=E[i-1]+10;
      setcolor(12);
      line(20+3*i,240,20+3*i,240-round(E[i]));
        ausw04;
      wahl:=' ';
    end;
    'K':
    begin
      i:=i+1;
      E[i]:=E[i-1]-10;
      setcolor(12);
      line(20+3*i,240,20+3*i,240-round(E[i]));
        ausw04;
      wahl:=' ';
    end;
    'u':
    begin
      i:=i+1;
      E[i]:=E[i-1];
      setcolor(12);
      line(20+3*i,240,20+3*i,240-round(E[i]));
        ausw04;
      wahl:=' ';
    end;
    '2':
    begin
      loesch4;
      l04;
      for i:=21 to 29 do
      begin
        E[i]:=(i-20)*5;
      end;
      for i:= 30 to 50 do
      begin
        E[i]:=50;
      end;
      for i:=51 to 59 do
      begin
        E[i]:=(60-i)*5;
      end;
      setcolor(12);
      for i:=1 to 199 do
      begin
        line(20+3*i,240,20+3*i,240-round(E[i]));
        ausw04;
      end;

      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure max4;
begin
  cleardevice;
    t:=0;
    dt:=1;
    s:=0;
    eps:=4;
    graphik4;
  l04;
  E[30]:=10;
  E[31]:=30;
  E[32]:=50;
  E[33]:=70;
  E[34]:=80;
  E[35]:=80;
  E[36]:=80;
  E[37]:=80;
  E[38]:=80;
  E[39]:=80;
  E[40]:=70;
  E[41]:=50;
  E[42]:=30;
  E[43]:=10;
      setcolor(12);
      for i:=1 to 200 do
      begin
        line(20+3*i,240,20+3*i,240-round(E[i]));
        ausw04;
      end;
    setz44;
    auswahl4;
    closegraph;
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
    '1':max22;
    '2':rechenbeispiel;
    '3':max;
    '4':max4;
  end;
  until wahl1='b';
end.