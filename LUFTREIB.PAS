program luftreibung;
uses crt,graph;
var
  l,k,treiber,modus:integer;
  h,h1,h2,v0,ax1,ax2,ay1,ay2,vy1,vy2,alpha:real;
  F,m,konst,a1,a2,v1,v2,vx1,vx2,y,cw,rho,A0,v,x1,x2,y1,y2,x,t,dt:real;
  wahl1,wahl,wahl2:char;
  ortx1,ortx2,ortx3,ortx4,ortx5,ortx6,ortx7,ortx8,ortx9,ortx10,ortx11:string;
  ortx12,ortx13,ortx14,ortx15,ortx16,ortx17,ortx18:string;

procedure menue;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(7);
  setcolor(1);
  outtextxy(150,150,'Freier Fall mit und ohne Luftreibung  ->  1');
  outtextxy(150,200,'Fahrzeugbeschleunigung mit Luftreibung  ->  2');
  outtextxy(150,250,'Schr„ger Wurf mit und ohne Luftreibung  ->  3');
  outtextxy(400,400,'beenden  ->  b');
end;

procedure graphik1;
begin
  setbkcolor(1);
  setcolor(15);
  line(200,350,350,350);
  line(200,350,200,90);
  line(400,350,550,350);
  line(400,350,400,90);
  outtextxy(175,75,'v in m/s');
  outtextxy(345,355,'t/s');
  outtextxy(375,75,'s in m/s');
  outtextxy(545,355,'t/s');
  for k:=1 to 5 do
  begin
  str(k:1,ortx10);
  outtextxy(198+k*25,360,ortx10);
  line(200+k*25,350,200+k*25,355);
  outtextxy(398+k*25,360,ortx10);
  line(400+k*25,350,400+k*25,355);
  str(10*k:1,ortx10);
  outtextxy(170,348-k*50,ortx10);
  line(195,350-k*50,200,350-k*50);
  str(25*k:1,ortx10);
  outtextxy(370,348-k*50,ortx10);
  line(395,350-k*50,400,350-k*50);

  end;

  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  str(m:4:2,ortx6);
  outtextxy(200,440,ortx6+' kg');
  str(A0:4:2,ortx7);
  outtextxy(300,440,ortx7+' mý');
  str(cw:4:2,ortx8);
  outtextxy(400,440,'cw = '+ortx8);
  str(rho:4:2,ortx9);
  outtextxy(500,440,ortx9+' kg/mü');
  outtextxy(200,400,'t =       ');
  setcolor(14);
  outtextxy(350,400,'v1 =      ');
  outtextxy(350,420,'s1 =      ');
  setcolor(12);
  outtextxy(500,400,'v2 =      ');
  outtextxy(500,420,'s2 =      ');
  setcolor(15);
  outtextxy(210,15,'Freier Fall mit Luftreibung ');
  outtextxy(7,460,'m, A, cw, rho ver„ndern (m/M/a/A/c/C/r/R)     starten / pause / beenden (s/p/b)');
end;

procedure setz1;
begin
  setcolor(14);
  str(x1:4:2,ortx3);
  outtextxy(395,420,ortx3+' m');
  str(v1:4:2,ortx1);
  outtextxy(395,400,ortx1+' m/s');
  setcolor(12);
  str(x2:4:2,ortx4);
  outtextxy(545,420,ortx4+' m');
  str(v2:4:2,ortx5);
  outtextxy(545,400,ortx5+' m/s');
  setcolor(15);
  str(t:4:2,ortx2);
  outtextxy(235,400,ortx2+' s');
  setfillstyle(1,12);
  sector(50,100+round(4*x2),0,360,3,3);
  setfillstyle(1,14);
  sector(70,100+round(4*x1),0,360,3,3);
end;

procedure loesch1;
begin
  setcolor(1);
  outtextxy(235,400,ortx2+' s');
  outtextxy(395,420,ortx3+' m');
  outtextxy(395,400,ortx1+' m/s');
  outtextxy(545,420,ortx4+' m');
  outtextxy(545,400,ortx5+' m/s');
  setfillstyle(1,1);
  sector(50,100+round(4*x2),0,360,3,3);
  sector(70,100+round(4*x1),0,360,3,3);
end;

procedure setz11;
begin
  setcolor(15);
  str(m:4:2,ortx6);
  outtextxy(200,440,ortx6+' kg');
  str(A0:4:2,ortx7);
  outtextxy(300,440,ortx7+' mý');
  str(cw:4:2,ortx8);
  outtextxy(400,440,'cw = '+ortx8);
  str(rho:4:2,ortx9);
  outtextxy(500,440,ortx9+' kg/mü');
end;

procedure loesch11;
begin
  setcolor(1);
  outtextxy(200,440,ortx6+' kg');
  outtextxy(300,440,ortx7+' mý');
  outtextxy(400,440,'cw = '+ortx8);
  outtextxy(500,440,ortx9+' kg/mü');
end;

procedure rechnung1;
begin
  a2:=9.81-konst*v2*v2;
  v2:=v2+a2*dt;
  v1:=v1+a1*dt;
  x1:=x1+v1*dt;
  x2:=x2+v2*dt;
end;

procedure auswahl1;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    's':
    begin
      cleardevice;
      t:=0;
      x1:=0;
      x2:=0;
      v2:=0;
      v1:=0;
      a1:=9.81;
      konst:=0.5*cw*A0*rho/m;
      graphik1;

      rechnung1;
      setz1;
      wahl2:=' ';
      repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
          end;

        loesch1;

        t:=t+dt;
        rechnung1;
        setz1;
        if t<=5 then
        begin
        putpixel(400+round(25*t),350-round(x2*2),12);
        putpixel(400+round(25*t),350-round(x1*2),14);
        putpixel(200+round(25*t),350-round(5*v2),12);
        putpixel(200+round(25*t),350-round(5*v1),14);
        end;
        delay(80);
      until (x2>=80) or (wahl2='b');
    wahl:=' ';
    end;
    'a':
    begin
      if A0>=2 then
      begin
        loesch11;
        A0:=A0-1;
        setz11;
      end;
      wahl:=' ';
    end;
    'A':
    begin
      loesch11;
      A0:=A0+1;
      setz11;
      wahl:=' ';
    end;
    'T':
    begin
      dt:=dt*2;
      wahl:=' ';
    end;
    't':
    begin
      dt:=dt/2;
      wahl:=' ';
    end;
    'c':
    begin
      if cw>=0.02 then
      begin
        loesch11;
        cw:=cw-0.01;
        setz11;
      end;
      wahl:=' ';
    end;
    'C':
    begin
      loesch11;
      cw:=cw+0.01;
      setz11;
      wahl:=' ';
    end;
    'r':
    begin
      if rho>=0.02 then
      begin
        loesch11;
        rho:=rho-0.01;
        setz11;
      end;
      wahl:=' ';
    end;
    'R':
    begin
      loesch11;
      rho:=rho+0.01;
      setz11;
      wahl:=' ';
    end;
    'm':
    begin
      if m>=2 then
      begin
        loesch11;
        m:=m-1;
        setz11;
      end;
      wahl:=' ';
    end;
    'M':
    begin
      loesch11;
      m:=m+1;
      setz11;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure bewegung1;
begin
  cleardevice;
    v1:=0;
    v2:=0;
    x1:=0;
    x2:=0;
    A0:=35;
    rho:=1.25;
    cw:=1.5;
    m:=80;
  a1:=9.81;
  konst:=0.5*cw*A0*rho/m;
    t:=0;
    dt:=0.02;
    graphik1;
    setz1;
    auswahl1;
  menue;
end;

procedure graphik2;
begin
  setbkcolor(1);
  setcolor(15);
  line(200,350,350,350);
  line(200,350,200,90);
  line(400,350,550,350);
  line(400,350,400,90);
  outtextxy(175,75,'v in m/s');
  outtextxy(345,355,'t/s');
  outtextxy(375,75,'s in m/s');
  outtextxy(545,355,'t/s');
  for k:=1 to 5 do
  begin
  str(25*k:1,ortx10);
  outtextxy(190+k*25,360,ortx10);
  line(200+k*25,350,200+k*25,355);
  outtextxy(390+k*25,360,ortx10);
  line(400+k*25,350,400+k*25,355);
  end;
  for k:=1 to 4 do
  begin
  str(100*k:1,ortx10);
  outtextxy(170,348-round(k*200/3.6),ortx10);
  line(195,350-round(k*200/3.6),200,350-round(k*200/3.6));
  end;
  for k:=1 to 6 do
  begin
  str(1000*k:1,ortx10);
  outtextxy(360,348-k*40,ortx10);
  line(395,350-k*40,400,350-k*40);

  end;

  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  str(F:4:0,ortx11);
  outtextxy(150,440,ortx11+' N');
  str(m:4:0,ortx6);
  outtextxy(250,440,ortx6+' kg');
  str(A0:4:2,ortx7);
  outtextxy(350,440,ortx7+' mý');
  str(cw:4:2,ortx8);
  outtextxy(450,440,'cw = '+ortx8);
  str(rho:4:2,ortx9);
  outtextxy(550,440,ortx9+' kg/mü');
  outtextxy(200,400,'t =       ');
  setcolor(14);
  outtextxy(350,400,'v1 =      ');
  outtextxy(350,420,'s1 =      ');
  setcolor(12);
  outtextxy(500,400,'v2 =      ');
  outtextxy(500,420,'s2 =      ');
  setcolor(15);
  outtextxy(200,15,'Fahrzeugbeschleunigung mit Luftreibung ');
  outtextxy(7,460,'F, m, A, cw, rho ver„ndern (f/F/m/M/a/A/c/C/r/R)  starten/pause/beenden (s/p/b)');
end;

procedure setz2;
begin
  setcolor(14);
  str(x1:4:0,ortx3);
  outtextxy(395,420,ortx3+' m');
  str(3.6*v1:4:1,ortx1);
  outtextxy(395,400,ortx1+' km/h');
  setcolor(12);
  str(x2:4:0,ortx4);
  outtextxy(545,420,ortx4+' m');
  str(3.6*v2:4:1,ortx5);
  outtextxy(545,400,ortx5+' km/h');
  setcolor(15);
  str(t:4:0,ortx2);
  outtextxy(235,400,ortx2+' s');
  setfillstyle(1,12);
  bar(50,403-round(0.05*x2),53,397-round(0.05*x2));
  setfillstyle(1,14);
  bar(70,403-round(0.05*x1),73,397-round(0.05*x1));
end;

procedure loesch2;
begin
  setcolor(1);
  outtextxy(235,400,ortx2+' s');
  outtextxy(395,420,ortx3+' m');
  outtextxy(395,400,ortx1+' km/h');
  outtextxy(545,420,ortx4+' m');
  outtextxy(545,400,ortx5+' km/h');
  setfillstyle(1,1);
  bar(50,403-round(0.05*x2),53,397-round(0.05*x2));
  bar(70,403-round(0.05*x1),73,397-round(0.05*x1));
end;

procedure setz21;
begin
  setcolor(15);
  str(F:4:0,ortx11);
  outtextxy(150,440,ortx11+' N');
  str(m:4:0,ortx6);
  outtextxy(250,440,ortx6+' kg');
  str(A0:4:2,ortx7);
  outtextxy(350,440,ortx7+' mý');
  str(cw:4:2,ortx8);
  outtextxy(450,440,'cw = '+ortx8);
  str(rho:4:2,ortx9);
  outtextxy(550,440,ortx9+' kg/mü');
end;

procedure loesch21;
begin
  setcolor(1);
  outtextxy(150,440,ortx11+' N');
  outtextxy(250,440,ortx6+' kg');
  outtextxy(350,440,ortx7+' mý');
  outtextxy(450,440,'cw = '+ortx8);
  outtextxy(550,440,ortx9+' kg/mü');
end;

procedure rechnung2;
begin
  a2:=F/m-konst*v2*v2;
  v2:=v2+a2*dt;
  a1:=F/m;
  v1:=v1+a1*dt;
  x1:=x1+v1*dt;
  x2:=x2+v2*dt;
end;

procedure auswahl2;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    's':
    begin
      cleardevice;
      t:=0;
      x1:=0;
      x2:=0;
      v2:=0;
      v1:=0;

      konst:=0.5*cw*A0*rho/m;
      graphik2;

      rechnung2;
      setz2;
      wahl2:=' ';
      repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
          end;

        loesch2;

        t:=t+dt;
        rechnung2;
        setz2;
        if t<=150 then
        begin
        putpixel(400+round(t),350-round(x2/25),12);
        if x1<6200 then
        putpixel(400+round(t),350-round(x1/25),14);
        putpixel(200+round(t),350-round(2*v2),12);
        if v1<120 then
        putpixel(200+round(t),350-round(2*v1),14);
        end;
        delay(80);
      until (x2>=6000) or (wahl2='b');
    wahl:=' ';
    end;
    'T':
    begin
      dt:=dt*2;
      wahl:=' ';
    end;
    't':
    begin
      dt:=dt/2;
      wahl:=' ';
    end;
    'a':
    begin
      if A0>=0.2 then
      begin
        loesch21;
        A0:=A0-0.1;
        setz21;
      end;
      wahl:=' ';
    end;
    'A':
    begin
      loesch21;
      A0:=A0+0.1;
      setz21;
      wahl:=' ';
    end;
    'f':
    begin
      if F>=200 then
      begin
        loesch21;
        F:=F-100;
        setz21;
      end;
      wahl:=' ';
    end;
    'F':
    begin
      loesch21;
      F:=F+100;
      setz21;
      wahl:=' ';
    end;
    'c':
    begin
      if cw>=0.02 then
      begin
        loesch21;
        cw:=cw-0.01;
        setz21;
      end;
      wahl:=' ';
    end;
    'C':
    begin
      loesch21;
      cw:=cw+0.01;
      setz21;
      wahl:=' ';
    end;
    'r':
    begin
      if rho>=0.02 then
      begin
        loesch21;
        rho:=rho-0.01;
        setz21;
      end;
      wahl:=' ';
    end;
    'R':
    begin
      loesch21;
      rho:=rho+0.01;
      setz21;
      wahl:=' ';
    end;
    'm':
    begin
      if m>=200 then
      begin
        loesch21;
        m:=m-100;
        setz21;
      end;
      wahl:=' ';
    end;
    'M':
    begin
      loesch21;
      m:=m+100;
      setz21;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure bewegung2;
begin
  cleardevice;
    v1:=0;
    v2:=0;
    x1:=0;
    x2:=0;
    A0:=2;
    rho:=1.25;
    cw:=0.35;
    m:=1000;
    F:=1100;
  a1:=F/m;
  konst:=0.5*cw*A0*rho/m;
    t:=0;
    dt:=0.2;
    graphik2;
    setz2;
    auswahl2;
  menue;
end;

procedure g3;
begin
  setbkcolor(1);
  setcolor(15);
  line(100,250,300,250);
  line(100,360,100,110);
  line(400,300,600,300);
  line(400,300,400,110);
  outtextxy(75,95,'v in m/s');
  outtextxy(280,265,'t in s');
  outtextxy(375,95,'h in m');
  outtextxy(545,325,'x in m');
  for k:=1 to 3 do
  begin
  str(k:1,ortx10);
  outtextxy(98+k*50,260,ortx10);
  line(100+k*50,250,100+k*50,255);
  end;
  for k:=1 to 9 do
  begin
  str(2*k:1,ortx10);
  outtextxy(396+k*20,310,ortx10);
  line(400+k*20,300,400+k*20,305);
  end;
  for k:=1 to 9 do
  begin
  str(2*k:1,ortx10);
  outtextxy(370,298-k*20,ortx10);
  line(395,300-k*20,400,300-k*20);
  end;
  for k:=-2 to 2 do
  begin
  str(5*k:1,ortx10);
  outtextxy(70,248-k*50,ortx10);
  line(95,250-k*50,100,250-k*50);
  end;
end;

procedure g33;
begin
  setcolor(7);
  line(30,345,610,345);
  line(50,345,50,40);
  for k:=1 to 6 do
  begin
    str(k:1,ortx10);
    outtextxy(30,343-50*k,ortx10);
    line(45,345-50*k,50,345-50*k);
  end;
  for k:=1 to 11 do
  begin
    str(k:1,ortx10);
    outtextxy(47+50*k,355,ortx10);
    line(50+50*k,345,50+50*k,350);
  end;
end;

procedure graphik3;
begin
  setbkcolor(1);
  setcolor(15);

  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  str(alpha:3:0,ortx13);
  outtextxy(50,440,ortx13+' ø');
  str(v0:3:0,ortx12);
  outtextxy(110,440,ortx12+' m/s');
  str(m:4:2,ortx6);
  outtextxy(200,440,ortx6+' kg');
  str(A0:4:2,ortx7);
  outtextxy(300,440,ortx7+' mý');
  str(cw:4:2,ortx8);
  outtextxy(400,440,'cw = '+ortx8);
  str(rho:4:2,ortx9);
  outtextxy(500,440,ortx9+' kg/mü');
  outtextxy(450,380,'h =');
  str(h:4:2,ortx18);
  outtextxy(485,380,ortx18+' m');
  outtextxy(300,380,'t =       ');
  setcolor(14);
  outtextxy(350,400,'h1 =      ');
  outtextxy(350,420,'x1 =      ');
  outtextxy(40,400,'vx1 =      ');
  outtextxy(40,420,'vy1 =      ');
  setcolor(12);
  outtextxy(500,400,'h2 =      ');
  outtextxy(500,420,'x2 =      ');
  outtextxy(190,400,'vx2 =      ');
  outtextxy(190,420,'vy2 =      ');
  setcolor(15);
  outtextxy(210,15,'Schiefer Wurf mit Luftreibung ');
  outtextxy(5,460,'alpha,v0,m,A,cw,rho „ndern (w/W/v/V/m/M/a/A/c/C/r/R) start/pause/beenden(s/p/b)');
  outtextxy(110,470,'h und dt ver„ndern (h/H/t/T)  K”rper (0)  Graphen (1)');
end;

procedure setz3;
begin
  setcolor(14);
  str(vx1:4:2,ortx14);
  outtextxy(90,400,ortx14+' m/s');
  str(vy1:4:2,ortx15);
  outtextxy(90,420,ortx15+' m/s');
  str(x1:4:2,ortx3);
  outtextxy(395,420,ortx3+' m');
  str(h1:4:2,ortx1);
  outtextxy(395,400,ortx1+' m');
  setcolor(15);
  str(t:4:2,ortx2);
  outtextxy(335,380,ortx2+' s');
end;

procedure setz3000;
begin
  setcolor(12);
  str(vx2:4:2,ortx16);
  outtextxy(240,400,ortx16+' m/s');
  str(vy2:4:2,ortx17);
  outtextxy(240,420,ortx17+' m/s');
  str(x2:4:2,ortx4);
  outtextxy(545,420,ortx4+' m');
  str(h2:4:2,ortx5);
  outtextxy(545,400,ortx5+' m');
  setcolor(15);
end;

procedure s3;
begin
  setfillstyle(1,14);
  sector(50+round(x1*50),345-round(h1*50),0,360,3,3);
  setfillstyle(1,12);
  sector(50+round(50*x2),345-round(50*h2),0,360,3,3);
end;

procedure loesch3;
begin
  setcolor(1);
  outtextxy(335,380,ortx2+' s');
  outtextxy(395,420,ortx3+' m');
  outtextxy(395,400,ortx1+' m');
  outtextxy(90,400,ortx14+' m/s');
  outtextxy(90,420,ortx15+' m/s');
end;

procedure loesch3000;
begin
  setcolor(1);
  outtextxy(240,400,ortx16+' m/s');
  outtextxy(240,420,ortx17+' m/s');
  outtextxy(545,420,ortx4+' m');
  outtextxy(545,400,ortx5+' m');
end;

procedure l3;
begin
  setcolor(1);
  setfillstyle(1,1);
  sector(50+round(50*x1),345-round(50*h1),0,360,3,3);
  sector(50+round(50*x2),345-round(50*h2),0,360,3,3);
end;

procedure setz31;
begin
  setcolor(15);
  str(h:4:2,ortx18);
  outtextxy(485,380,ortx18+' m');
  str(m:4:2,ortx6);
  outtextxy(200,440,ortx6+' kg');
  str(A0:4:2,ortx7);
  outtextxy(300,440,ortx7+' mý');
  str(cw:4:2,ortx8);
  outtextxy(400,440,'cw = '+ortx8);
  str(rho:4:2,ortx9);
  outtextxy(500,440,ortx9+' kg/mü');
  str(alpha:3:0,ortx13);
  outtextxy(50,440,ortx13+' ø');
  str(v0:3:0,ortx12);
  outtextxy(110,440,ortx12+' m/s');
end;

procedure loesch31;
begin
  setcolor(1);
  outtextxy(200,440,ortx6+' kg');
  outtextxy(300,440,ortx7+' mý');
  outtextxy(400,440,'cw = '+ortx8);
  outtextxy(500,440,ortx9+' kg/mü');
  outtextxy(50,440,ortx13+' ø');
  outtextxy(110,440,ortx12+' m/s');
  outtextxy(485,380,ortx18+' m');
end;

procedure rechnung3;
begin
  if vy2>=0 then
  ay2:=-9.81-konst*vy2*vy2;
  if vy2<0 then
  ay2:=-9.81+konst*vy2*vy2;
  ax2:=-konst*vx2*vx2;
  vy2:=vy2+ay2*dt;
  vx2:=vx2+ax2*dt;
  ay1:=-9.81;
  vy1:=vy1+ay1*dt;
  x1:=x1+vx1*dt;
  x2:=x2+vx2*dt;
  h1:=h1+vy1*dt;
  h2:=h2+vy2*dt;
end;

procedure auswahl3;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    if l=0 then
    begin
     g33;
     s3;
    end;
    case wahl of
    's':
    begin
      cleardevice;
      t:=0;
      x1:=0;
      x2:=0;
      h1:=h;
      h2:=h;
      vx2:=v0*cos(pi/180*alpha);
      vx1:=v0*cos(pi/180*alpha);
      vy1:=v0*sin(pi/180*alpha);
      vy2:=vy1;
      ay1:=-9.81;
      konst:=0.5*cw*A0*rho/m;
      graphik3;
      if l=0 then
      begin
       g33;
       s3;
       delay(5000);
      end;
      l3;
      if l=1 then
      begin
       g3;
      end;
      rechnung3;
      setz3;
      setz3000;
      wahl2:=' ';
      repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
          end;

        if h1+vy1*dt>0 then loesch3;
        if h2+vy2*dt>0 then loesch3000;

        if l=0 then l3;

        t:=t+dt;
        rechnung3;
        if h1>0 then setz3;
        if h2>0 then setz3000;

        if l=1 then
        begin
        if h2>0 then
        begin
        putpixel(400+round(10*x2),300-round(h2*10),12);
        putpixel(100+round(50*t),250-round(10*vy2),12);
        putpixel(100+round(50*t),250-round(10*vx2),12);
        end;
        putpixel(400+round(10*x1),300-round(h1*10),14);
        putpixel(100+round(50*t),250-round(10*vy1),14);
        putpixel(100+round(50*t),250-round(10*vx1),14);
        end;
        if l=0 then s3;

        delay(50);
      until (h1<=0) or (wahl2='b');
    wahl:=' ';
    end;
    '0':
    begin
      l:=0;
      cleardevice;
      graphik3;
      s3;
      g33;
      setz3;
      setz3000;
      wahl:=' ';
    end;
    '1':
    begin
      l:=1;
      cleardevice;
      g3;
      graphik3;
      setz3;
      setz3000;
      wahl:=' ';
    end;
    'a':
    begin
      if A0>=0.02 then
      begin
        loesch31;
        A0:=A0-0.01;
        setz31;
      end;
      wahl:=' ';
    end;
    'A':
    begin
      loesch31;
      A0:=A0+0.01;
      setz31;
      wahl:=' ';
    end;
    'h':
    begin
      if h>=0.02 then
      begin
        loesch31;
        h:=h-0.01;
        setz31;
      end;
      wahl:=' ';
    end;
    'H':
    begin
      loesch31;
      h:=h+0.01;
      setz31;
      wahl:=' ';
    end;
    't':
    begin
        dt:=dt/2;
      wahl:=' ';
    end;
    'T':
    begin

      dt:=dt*2;

      wahl:=' ';
    end;
    'c':
    begin
      if cw>=0.02 then
      begin
        loesch31;
        cw:=cw-0.01;
        setz31;
      end;
      wahl:=' ';
    end;
    'C':
    begin
      loesch31;
      cw:=cw+0.01;
      setz31;
      wahl:=' ';
    end;
    'r':
    begin
      if rho>=0.02 then
      begin
        loesch31;
        rho:=rho-0.01;
        setz31;
      end;
      wahl:=' ';
    end;
    'R':
    begin
      loesch31;
      rho:=rho+0.01;
      setz31;
      wahl:=' ';
    end;
    'm':
    begin
      if m>=2 then
      begin
        loesch31;
        m:=m-1;
        setz31;
      end;
      wahl:=' ';
    end;
    'M':
    begin
      loesch31;
      m:=m+1;
      setz31;
      wahl:=' ';
    end;
    'w':
    begin
      if alpha>=2 then
      begin
        loesch31;
        alpha:=alpha-1;
        setz31;
      end;
      wahl:=' ';
    end;
    'W':
    begin
      loesch31;
      alpha:=alpha+1;
      setz31;
      wahl:=' ';
    end;
    'v':
    begin
      if v0>=2 then
      begin
        loesch31;
        v0:=v0-1;
        setz31;
      end;
      wahl:=' ';
    end;
    'V':
    begin
      loesch31;
      v0:=v0+1;
      setz31;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure bewegung3;
begin
  cleardevice;
    alpha:=30;
    v0:=10;
    vx1:=v0*cos(pi/180*alpha);
    vx2:=vx1;
    x1:=0;
    x2:=0;
    vy1:=v0*sin(pi/180*alpha);
    vy2:=vy1;
    h:=1.7;
    h1:=h;
    h2:=h;
    A0:=0.05;
    rho:=1.25;
    cw:=0.45;
    m:=10;
  ay1:=9.81;
  konst:=0.5*cw*A0*rho/m;
    t:=0;
    dt:=0.0025;
    graphik3;
    setz3;
    setz3000;
    l:=0;
    auswahl3;
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
    '1':bewegung1;
    '2':bewegung2;
    '3':bewegung3;
  end;
  until wahl1='b';
end.