program planetenbewegunga;
uses crt,graph;
var
  i,k,l,treiber,modus:integer;
  k1,n,m,x1,x2,y1,y2:integer;
  xkoordi,xkoord5,bahnradi,bahnrad5,x,y,t1,t,dt:real;
  wahl:char;
  winkel3,winkel2,winkel1,zeit:string;

  fak1,fak2,fak3,fak4,fak5,faktor,x11,x12,y11,y12,r1,r2,r3,r4,r5,t2,t3,t4,t5,phi1,phi2,phi3,phi4,phi5,
  x3,x4,x5,y3,y4,y5:real;


  farbe:array[1..5]of integer;
  planame:array[1..5] of string[7];
  bahnrad1:array[1..5] of real;
  bahnrad:array[1..5] of real;
    groesse:array[1..4] of real;
  umlaufT:array[1..5] of real;
  bahnnei:array[1..5] of real;
  omega:  array[1..5] of real;
  xkoord: array[1..5] of real;
  ykoord: array[1..5] of real;
  xschein:array[1..4] of real;
  yschein:array[1..4] of real;
  winkel: array[1..4] of real;
  entf:   array[1..4] of real;
  yneig:  array[1..4] of real;
  sehw:   array[1..4] of real;

procedure feldfuellen;
  begin
    planame[1]:='Merkur';
    planame[2]:='Venus';
    planame[5]:='Erde';
    planame[3]:='Mars';
    planame[4]:='Jupiter';
    bahnrad[1]:=57.94;
    bahnrad[2]:=108.25;
    bahnrad[5]:=149.68;
    bahnrad[3]:=228.04;
    bahnrad[4]:=778.73;
    umlaufT[1]:=87.95;
    umlaufT[2]:=224.71;
    umlaufT[5]:=365.26;
    umlaufT[3]:=686.97;
    umlaufT[4]:=4332.61;
    bahnnei[1]:=7.0;
    bahnnei[2]:=3.4;
    bahnnei[5]:=0.0;
    bahnnei[3]:=1.8;
    bahnnei[4]:=1.3;
    farbe[1]:=14;
    farbe[2]:=13;
    farbe[3]:=12;
    farbe[4]:=11;
    farbe[5]:=6;
    for i:=1 to 5 do

    groesse[1]:=2420*2;
    groesse[2]:=6114*2;
    groesse[3]:=3385*2;
    groesse[4]:=70360*2;

    begin
      omega[i]:=2*pi/umlaufT[i];
    end;
  end;

procedure grafik;
  begin
    treiber:=detect;
    initgraph(treiber,modus,'');
    setbkcolor(1);
    setcolor(15);
  outtextxy(295,50,'(1)');
  outtextxy(590,50,'(2)');
  outtextxy(590,290,'(3)');
        
    outtextxy(538,470,'beenden -> b');
    outtextxy(7,470,'Bewegung starten (s) , verdoppeln (d) , halbieren (h)  pause (p)');
    outtextxy(10,450,'Tage:');
    line(25,40,615,40);
    line(25,410,615,410);
    line(25,280,615,280);
    line(25,340,615,340);
    line(410,310,550,310);
    line(25,40,25,410);
    line(615,40,615,410);
    line(320,40,320,280);
    outtextxy(468,50,'90ø');
    outtextxy(330,160,'0ø');
    outtextxy(580,160,'180ø');
    outtextxy(465,270,'270ø');
    outtextxy(300,310,'Ekliptik');
    outtextxy(310,350,'180ø');
    outtextxy(400,350,'270ø');
    outtextxy(130,350,'0ø');
    outtextxy(220,350,'90ø');
    outtextxy(40,350,'-90ø');

     outtextxy(35,160,'0ø');
    outtextxy(280,160,'180ø');
    outtextxy(160,50,'90ø');
    outtextxy(160,270,'270ø');
     line(410,310,550,310);
    outtextxy(450,375,'Ekliptik');

    line(320,400,320,410);
    line(410,387,410,410);
    line(230,400,230,410);
    line(140,400,140,410);
    line(50,387,50,410);
    outtextxy(55,400,'Ste Wa Fis');
    outtextxy(145,400,'Wid St Zwi');
    outtextxy(235,400,'Kre L” Jun');
    outtextxy(325,400,'Waa Sk Sch');
    end;

procedure grafik1;
begin
  setbkcolor(1);
  setcolor(15);
  outtextxy(30,50,'(0)');
  outtextxy(180,20,'Bewegung der Planeten um die Sonne');

      setcolor(farbe[1]);
      outtextxy(40+100*1,430,planame[1]+'(m)');

      setcolor(farbe[2]);
      outtextxy(40+100*2,430,planame[2]+'(v)');

      setcolor(farbe[3]);
      outtextxy(40+100*3,430,planame[3]+'(M)');

      setcolor(farbe[4]);
      outtextxy(40+100*4,430,planame[4]+'(j)');
end;

procedure grafik2;
begin
  setbkcolor(1);
  setcolor(15);
  outtextxy(220,20,'Schleifenbahn von '+planame[i]);
  outtextxy(48,430,'1: heliozentrisch  2: geozentrisch  3: Bahnneigung gegen die Ekliptik');
  outtextxy(243,65,'Winkel:');
  outtextxy(290,80,'ø');
  outtextxy(350,450,'zurck zur šbersicht: (p) , (e)');
  str(bahnnei[i]:4:1,winkel2);
  outtextxy(60,310,'Bahnneigung:'+winkel2+'ø  gegen die');
  setcolor(farbe[i]);
  outtextxy(260,255,planame[i]);
end;

procedure graphik;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(1);
  setcolor(15);
  outtextxy(180,30,'Bewegung der Planeten um die Sonne');
  outtextxy(470,430,'pause -> p');
  outtextxy(465,440,'weiter -> w');
  outtextxy(400,450,'doppelte Geschwindigkeit -> d');
  outtextxy(420,460,'halbe Geschwindigkeit -> h');
  outtextxy(460,470,'beenden -> b');
  outtextxy(10,470,'zurck zum Beginn -> e');
  outtextxy(10,450,'Tage:');
  line(60,60,60,425);
  line(580,60,580,425);
  line(60,60,580,60);
  line(60,425,580,425);
end;

procedure graphik1;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(1);
  setcolor(15);
  outtextxy(250,440,'pause -> p');
  outtextxy(465,440,'weiter -> w');
  outtextxy(400,450,'doppelte Geschwindigkeit -> d');
  outtextxy(420,460,'halbe Geschwindigkeit -> h');
  outtextxy(460,470,'beenden -> b');
  outtextxy(10,470,'zurck zum Beginn -> e');
  outtextxy(10,450,'Tage:');
  line(60,50,60,430);
  line(580,50,580,430);
  line(60,50,580,50);
  line(60,430,580,430);
end;

procedure graphik2;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(1);
  setcolor(15);
  outtextxy(250,440,'pause -> p');
  outtextxy(465,440,'weiter -> w');
  outtextxy(400,450,'doppelte Geschwindigkeit -> d');
  outtextxy(420,460,'halbe Geschwindigkeit -> h');
  outtextxy(460,470,'beenden -> b');
  outtextxy(10,470,'zurck zum Beginn -> e');
  outtextxy(10,450,'Tage:');
  
  line(48,50,48,430);
  line(592,50,592,430);
  line(48,50,592,50);
  line(48,430,592,430);
  line(48,240,592,240);
  line(48,400,592,400);
end;

procedure umlauf3;
begin
  r1:=57.94/3;
  r2:=108.27/3;
  r3:=149.68/3;
  r4:=228.06/3;
  r5:=414.20/3;
  t1:=87.95;
  t2:=224.71;
  t3:=365.26;
  t4:=686.97;
  t5:=4332.61;
  t:=0.01;
  dt:=0.01;
  wahl:=' ';
  x11:=0;x12:=0;x3:=0;x4:=0;x5:=0;
  y11:=r1;y12:=r2;y3:=r3;y4:=r4;y5:=r5;
  setcolor(15);setfillstyle(1,15);
  sector(320,240,0,360,5,5);
  
    setcolor(14);setfillstyle(1,14);
    outtextxy(100,410,'Merkur');

  sector(320+round(x11),240-round(y11),0,360,2,2);
  setcolor(13);setfillstyle(1,13);
  outtextxy(200,410,'Venus');
  sector(320+round(x12),240-round(y12),0,360,2,2);
  setcolor(6); setfillstyle(1,6);
  outtextxy(300,410,'Erde');

  sector(320+round(x3),240-round(y3),0,360,2,2);
  setcolor(12);setfillstyle(1,12);
  outtextxy(400,410,'Mars');
  sector(320+round(x4),240-round(y4),0,360,2,2);
  setcolor(11); setfillstyle(1,11);
  outtextxy(500,410,'Jupiter');
  sector(320+round(x5),240-round(y5),0,360,3,3);
  repeat until keypressed;
  repeat
    phi1:=2*pi/t1*t;phi2:=2*pi/t2*t;phi3:=2*pi/t3*t;phi4:=2*pi/t4*t;phi5:=2*pi/t5*t;

    setcolor(0);setfillstyle(1,0);

    sector(320+round(x11),240-round(y11),0,360,1,1);
    sector(320+round(x12),240-round(y12),0,360,1,1);
    sector(320+round(x3),240-round(y3),0,360,1,1);
    sector(320+round(x4),240-round(y4),0,360,1,1);
    sector(320+round(x5),240-round(y5),0,360,2,2);

    x11:=r1*sin(phi1);x12:=r2*sin(phi2);x3:=r3*sin(phi3);x4:=r4*sin(phi4);x5:=r5*sin(phi5);
    y11:=r1*cos(phi1);y12:=r2*cos(phi2);y3:=r3*cos(phi3);y4:=r4*cos(phi4);y5:=r5*cos(phi5);

  setcolor(14);setfillstyle(1,14);
  sector(320+round(x11),240-round(y11),0,360,2,2);
  setcolor(13);setfillstyle(1,13);
  sector(320+round(x12),240-round(y12),0,360,2,2);
  setcolor(6);setfillstyle(1,6);
  sector(320+round(x3),240-round(y3),0,360,2,2);
  setcolor(12);setfillstyle(1,12);
  sector(320+round(x4),240-round(y4),0,360,2,2);
  setcolor(11); setfillstyle(1,11);
  sector(320+round(x5),240-round(y5),0,360,3,3);
  setcolor(15); setfillstyle(1,15);
    sector(320,240,0,360,5,5);
    t:=t+dt;
    setcolor(0);
    outtextxy(50,450,Zeit);
    setcolor(15);
    str(t:5:0,Zeit);
    outtextxy(50,450,Zeit);
    if keypressed then wahl:=readkey;
    case wahl of
    'h':
    begin
      dt:=dt/2;
      wahl:=' ';
    end;
    'd':
    begin
      dt:=dt*2;
      wahl:=' ';
    end;
    'p':wahl:=readkey;
    'e':
    begin
      cleardevice;
      grafik;
      grafik1;
      exit;
    end;
  end;
  until wahl='b';
end;

procedure rechnung;
begin
    xkoord[5]:=bahnrad[5]*sin(omega[5]*t);
    ykoord[5]:=bahnrad[5]*cos(omega[5]*t);
    xkoord[i]:=bahnrad[i]*sin(omega[i]*t);
    ykoord[i]:=bahnrad[i]*cos(omega[i]*t)*cos(2*pi/360*bahnnei[i]);;

    yneig[i]:=bahnrad[i]*sin(2*pi*bahnnei[i]/360)*sin(omega[i]*t);
    entf[i]:=sqrt(sqr(xkoord[i]-xkoord[5])+sqr(ykoord[i]-ykoord[5])+sqr(yneig[i]));
    sehw[i]:=yneig[i]/entf[i]*180/pi;

    if xkoord[i]<>xkoord[5] then
    begin
      winkel[i]:=arctan((ykoord[i]-ykoord[5])/(xkoord[i]-xkoord[5]))*180/pi;
    end
    else
    begin
      winkel[i]:=90;
    end;
    if xkoord[i] < xkoord[5] then
    begin
      winkel[i]:=winkel[i]+180;
    end;
    yschein[i]:=sin(2*pi/360*winkel[i])*entf[i];
    xschein[i]:=cos(2*pi/360*winkel[i])*entf[i];
end;


procedure planeten;
begin
  graphik;
  umlauf3;
end;

procedure umlauf4a;
begin
  t:=0.1;
  dt:=0.1;
  wahl:=' ';

  rechnung;

  setcolor(6);setFillStyle(1,6);
  sector(320,240,0,360,2,2);
 setcolor(15);
 circle(530,380,37);
  outtextxy(220,30,'Schleifenmuster von '+planame[i]);

  setFillStyle(1,15);

    setFillStyle(1,15);
    sector(320-round(xkoord[5]*fak1),240+round(ykoord[5]*fak1),0,360,2,2);

    setcolor(farbe[i]); setFillStyle(1,farbe[i]);
    sector(320+round(xschein[i]*fak1),240-round(yschein[i]*fak1),0,360,1,1);

sector(530,380,0,360,round(36*abs(bahnrad[i]-bahnrad[5])/entf[i]),round(36*abs(bahnrad[i]-bahnrad[5])/entf[i]));

   repeat until keypressed;

  repeat
    setcolor(0); setfillstyle(1,0);

       circle(530,380,round(0.4+36*abs(bahnrad[i]-bahnrad[5])/entf[i]));
     circle(530,380,round(-0.4+36*abs(bahnrad[i]-bahnrad[5])/entf[i]));


    sector(320-round(xkoord[5]*fak1),240+round(ykoord[5]*fak1),0,360,2,2);

    setcolor(6); setfillstyle(1,6);
    sector(320,240,0,360,2,2);

    setcolor(15);  setfillstyle(1,15);

    rechnung;

    sector(320-round(xkoord[5]*fak1),240+round(ykoord[5]*fak1),0,360,2,2);

    setcolor(farbe[i]);setfillstyle(1,farbe[i]);
    sector(320+round(xschein[i]*fak1),240-round(yschein[i]*fak1),0,360,1,1);
    sector(530,380,0,360,round(36*abs(bahnrad[i]-bahnrad[5])/entf[i]),round(36*abs(bahnrad[i]-bahnrad[5])/entf[i]));

    t:=t+dt;

    setcolor(0);
    outtextxy(50,450,Zeit);

    setcolor(15);
    str(t:5:0,Zeit);
    outtextxy(50,450,Zeit);

    if keypressed then wahl:=readkey;
    case wahl of
    'h':
    begin
      dt:=dt/2;
      wahl:=' ';
    end;
    'd':
    begin
      dt:=dt*2;
      wahl:=' ';
    end;

    'p':wahl:=readkey;


  'e':
    begin
      cleardevice;
      grafik;
      grafik1;
      exit;
    end;
  end;
  until wahl='b';
end;


procedure umlauf4b;
begin

  t:=0.1;
  dt:=0.1;
  wahl:=' ';

  rechnung;

  setcolor(6);setFillStyle(1,6);
  sector(320,240,0,360,2,2);

 setcolor(15);
  outtextxy(220,30,'Schleifenmuster der Planeten ');


  setFillStyle(1,15);

    setFillStyle(1,15);
    sector(320-round(xkoord[5]*fak1),240+round(ykoord[5]*fak1),0,360,2,2);
for i := 1 to 4 do
begin
    setcolor(15);
      m:=round(0.15*groesse[i]/(abs(bahnrad[i]-bahnrad[5])));
   circle(580,100+70*i,m+1);

    setcolor(farbe[i]); setFillStyle(1,farbe[i]);
    sector(320+round(xschein[i]*fak1),240-round(yschein[i]*fak1),0,360,1,1);
sector(580,100+70*i,0,360,round(m*abs(bahnrad[i]-bahnrad[5])/entf[i]),round(m*abs(bahnrad[i]-bahnrad[5])/entf[i]));

end;

   repeat until keypressed;

  repeat
    for i:= 1 to 4 do
    begin
      m:=round(0.15*groesse[i]/(abs(bahnrad[i]-bahnrad[5])));

    setcolor(0); setfillstyle(1,0);

       circle(580,100+70*i,round(0.4+m*abs(bahnrad[i]-bahnrad[5])/entf[i]));
     circle(580,100+70*i,round(-0.4+m*abs(bahnrad[i]-bahnrad[5])/entf[i]));


    sector(320-round(xkoord[5]*fak1),240+round(ykoord[5]*fak1),0,360,2,2);

    setcolor(6); setfillstyle(1,6);
    sector(320,240,0,360,2,2);

    setcolor(15);  setfillstyle(1,15);

    rechnung;

    sector(320-round(xkoord[5]*fak1),240+round(ykoord[5]*fak1),0,360,2,2);

    setcolor(farbe[i]);setfillstyle(1,farbe[i]);
    sector(320+round(xschein[i]*fak1),240-round(yschein[i]*fak1),0,360,1,1);

    sector(580,100+70*i,0,360,round(m*abs(bahnrad[i]-bahnrad[5])/entf[i]),round(m*abs(bahnrad[i]-bahnrad[5])/entf[i]));

    end;
   
    t:=t+dt;

    setcolor(0);
    outtextxy(50,450,Zeit);

    setcolor(15);
    str(t:5:0,Zeit);
    outtextxy(50,450,Zeit);

    if keypressed then wahl:=readkey;
    case wahl of
    'h':
    begin
      dt:=dt/2;
      wahl:=' ';
    end;
    'd':
    begin
      dt:=dt*2;
      wahl:=' ';
    end;

    'p':wahl:=readkey;


  'e':
    begin
      cleardevice;
      grafik;
      grafik1;
      exit;
    end;
  end;
  until wahl='b';
end;

  {
  setcolor(15);
 circle(550,400,17);

    setcolor(farbe[i]); setFillStyle(1,farbe[i]);
     sector(550,400,0,360,round(16*abs(bahnradi-bahnrad5)/entf[i]),round(16*abs(bahnradi-bahnrad5)/entf[i]));

  setcolor(0); setfillstyle(1,0);
       circle(550,400,round(0.4+16*abs(bahnradi-bahnrad5)/entf[i]));
     circle(550,400,round(-0.4+16*abs(bahnradi-bahnrad5)/entf[i]));

    setcolor(farbe[i]); setFillStyle(1,farbe[i]);
    sector(550,400,0,360,round(16*abs(bahnradi-bahnrad5)/entf[i]),round(16*abs(bahnradi-bahnrad5)/entf[i]));
   }


procedure umlauf5;
begin
  t:=0.1;
  dt:=0.1;
  wahl:=' ';
  rechnung;
    setcolor(15);
      outtextxy(220,30,'Schleifenmuster von '+planame[i]);
  str(bahnnei[i]:4:1,winkel2);
  outtextxy(70,210,'Bahnneigung betr„gt: '+winkel2+' ø');
  outtextxy(400,210,'ist der gesehene Winkel');
  outtextxy(240,411,'Winkel:');

    line(190,150,590,150);
    line(50,320,590,320);

    k:=200;
    l:=round(k*1.9*sin(2*pi*bahnnei[i]/360));
    line(390+k,150-l,390-k,150+l);

    sector(390+round(fak3*xkoord[5]/3.8),150,0,360,3,3);

    circle(140,150,37);

   {  for k1 := 1 to 11 do
    begin
      line(50+k1*45,315,50+k1*45,325);
    end;
    outtextxy(43,330,'-90ø');
    outtextxy(45+3*45,330,'0ø');
    outtextxy(40+6*45,330,'90ø');
    outtextxy(36+9*45,330,'180ø');
    outtextxy(37+12*45,330,'270ø');
    }

        setcolor(farbe[i]); setFillStyle(1,farbe[i]);

    sector(140,150,0,360,round(36*abs(bahnrad[i]-bahnrad[5])/entf[i]),round(36*abs(bahnrad[i]-bahnrad[5])/entf[i]));

    sector(390+round(fak3*xkoord[i]/3.8),150-round(fak3*yneig[i]/2),0,360,3,3);
    line(390+round(fak3*xkoord[5]/3.8),150,390+round(fak3*xkoord[i]/3.8),150-round(fak3*yneig[i]/2));
    sector(455-round(1.5*winkel[i]),320-round(faktor*sehw[i]),0,360,1,1);


  repeat until keypressed;
    
  repeat
    setcolor(0); setfillstyle(1,0);
    sector(390+round(fak3*xkoord[5]/3.8),150,0,360,3,3);
    sector(390+round(fak3*xkoord[i]/3.8),150-round(fak3*yneig[i]/2),0,360,3,3);
    line(390+round(fak3*xkoord[5]/3.8),150,390+round(fak3*xkoord[i]/3.8),150-round(fak3*yneig[i]/2));

   { line(50,380,410,380);
   }
     circle(140,150,round(0.4+36*abs(bahnrad[i]-bahnrad[5])/entf[i]));
     circle(140,150,round(-0.4+36*abs(bahnrad[i]-bahnrad[5])/entf[i]));

   

    setcolor(15); setfillstyle(1,15);
 {   for k1 := 1 to 11 do
    begin
      line(50+k1*45,315,50+k1*45,325);
    end;
    outtextxy(43,330,'-90ø');
    outtextxy(45+3*45,330,'0ø');
    outtextxy(40+6*45,330,'90ø');
    outtextxy(36+9*45,330,'180ø');
    outtextxy(37+12*45,330,'270ø');
  }
    line(190,150,590,150);
    line(50,320,590,320);
    k:=200;
    l:=round(k*1.9*sin(2*pi*bahnnei[i]/360));
    line(390+k,150-l,390-k,150+l);
    

   rechnung;
    sector(390+round(fak3*xkoord[5]/3.8),150,0,360,3,3);
    setcolor(farbe[i]);setfillstyle(1,farbe[i]);
    sector(390+round(fak3*xkoord[i]/3.8),150-round(fak3*yneig[i]/2),0,360,3,3);
    sector(455-round(1.5*winkel[i]),320-round(faktor*sehw[i]),0,360,1,1);
    sector(140,150,0,360,round(36*abs(bahnrad[i]-bahnrad[5])/entf[i]),round(36*abs(bahnrad[i]-bahnrad[5])/entf[i]));
    line(390+round(fak3*xkoord[5]/3.8),150,390+round(fak3*xkoord[i]/3.8),150-round(fak3*yneig[i]/2));

    t:=t+dt;

    setcolor(0);
    outtextxy(50,450,Zeit);
    outtextxy(300,411,winkel1);
    outtextxy(340,210,winkel3);
    setcolor(15);
    str(t:5:0,Zeit);
    outtextxy(50,450,Zeit);
    str(180-winkel[i]:5:0,winkel1);
    outtextxy(300,411,winkel1+'ø');
    str(sehw[i]:5:1,winkel3);
    outtextxy(340,210,winkel3+'ø');

    if keypressed then wahl:=readkey;
    case wahl of
    'h':
    begin
      dt:=dt/2;
      wahl:=' ';
    end;
    'd':
    begin
      dt:=dt*2;
      wahl:=' ';
    end;

    'p':wahl:=readkey;
  'e':
    begin
      cleardevice;
      grafik;
      grafik1;
      exit;
    end;
  end;
  until wahl='b';
end;


procedure umlauf5a;
begin
  t:=0.1;
  dt:=0.1;
  wahl:=' ';
  rechnung;

    setcolor(15);
  outtextxy(220,30,'Schleifenmuster der Planeten');
  outtextxy(70,100,'Die Bahnneigungen');
    line(110,150,510,150);
    line(50,320,590,320);
for i:=1 to 4 do
begin
    circle(400+i*40,200,17);
    k:=200;
    l:=round(k*3.8*sin(2*pi*bahnnei[i]/360));
    line(310+k,150-l,310-k,150+l);
end;
    sector(310+round(fak3*xkoord[5]/3.8),150,0,360,3,3);

   {  for k1 := 1 to 11 do
    begin
      line(50+k1*45,315,50+k1*45,325);
    end;
    outtextxy(43,330,'-90ø');
    outtextxy(45+3*45,330,'0ø');
    outtextxy(40+6*45,330,'90ø');
    outtextxy(36+9*45,330,'180ø');
    outtextxy(37+12*45,330,'270ø');
    }

for i:=1 to 4 do
begin
    setcolor(farbe[i]); setFillStyle(1,farbe[i]);

    sector(400+i*40,200,0,360,round(16*abs(bahnrad[i]-bahnrad[5])/entf[i]),round(16*abs(bahnrad[i]-bahnrad[5])/entf[i]));

    sector(310+round(fak3*xkoord[i]/3.8),150-round(fak3*yneig[i]),0,360,3,3);
    line(310+round(fak3*xkoord[5]/3.8),150,310+round(fak3*xkoord[i]/3.8),150-round(fak3*yneig[i]/2));
    sector(455-round(1.5*winkel[i]),320-round(faktor/1.5*sehw[i]),0,360,1,1);
end;


  repeat until keypressed;
    
  repeat
  for i:=1 to 4 do
  begin
    setcolor(0); setfillstyle(1,0);

    sector(310+round(fak3*xkoord[5]/3.8),150,0,360,3,3);
    sector(310+round(fak3*xkoord[i]/3.8),150-round(fak3*yneig[i]),0,360,3,3);
    line(310+round(fak3*xkoord[5]/3.8),150,310+round(fak3*xkoord[i]/3.8),150-round(fak3*yneig[i]/2));

{    sector(455-round(1.5*winkel[i]),320-round(faktor/1.5*sehw[i]),0,360,3,3);
 }
   { line(50,380,410,380);
   }
     circle(400+i*40,200,round(0.4+16*abs(bahnrad[i]-bahnrad[5])/entf[i]));
     circle(400+i*40,200,round(-0.4+16*abs(bahnrad[i]-bahnrad[5])/entf[i]));



    setcolor(15); setfillstyle(1,15);
 {   for k1 := 1 to 11 do
    begin
      line(50+k1*45,315,50+k1*45,325);
    end;
    outtextxy(43,330,'-90ø');
    outtextxy(45+3*45,330,'0ø');
    outtextxy(40+6*45,330,'90ø');
    outtextxy(36+9*45,330,'180ø');
    outtextxy(37+12*45,330,'270ø');
  }
    line(110,150,590,150);
    line(50,320,590,320);
{    k:=200;
    l:=round(k*1.9*sin(2*pi*bahnnei[i]/360));
    line(390+k,150-l,390-k,150+l);
 }

   rechnung;
      sector(310+round(fak3*xkoord[5]/3.8),150,0,360,3,3);
    setcolor(farbe[i]);setfillstyle(1,farbe[i]);
    sector(310+round(fak3*xkoord[i]/3.8),150-round(fak3*yneig[i]),0,360,3,3);
    sector(455-round(1.5*winkel[i]),320-round(faktor/1.5*sehw[i]),0,360,1,1);
    sector(400+i*40,200,0,360,round(16*abs(bahnrad[i]-bahnrad[5])/entf[i]),round(16*abs(bahnrad[i]-bahnrad[5])/entf[i]));
    {
    line(310+round(fak3*xkoord[5]/3.8),150,310+round(fak3*xkoord[i]/3.8),150-round(fak3*yneig[i]/2));
   }
  end;

    t:=t+dt;

    setcolor(0);
    outtextxy(50,450,Zeit);
   {
    outtextxy(300,411,winkel1);
    outtextxy(340,210,winkel3);
   }
    setcolor(15);

    str(t:5:0,Zeit);
    outtextxy(50,450,Zeit);
   {
    str(180-winkel[i]:5:0,winkel1);
    outtextxy(300,411,winkel1+'ø');
    str(sehw[i]:5:1,winkel3);
    outtextxy(340,210,winkel3+'ø');
  }
    if keypressed then wahl:=readkey;
    case wahl of
    'h':
    begin
      dt:=dt/2;
      wahl:=' ';
    end;
    'd':
    begin
      dt:=dt*2;
      wahl:=' ';
    end;

    'p':wahl:=readkey;
  'e':
    begin
      cleardevice;
      grafik;
      grafik1;
      exit;
    end;
  end;
  until wahl='b';
end;



procedure umlauf2;
begin
  t:=0.1;
  dt:=0.1;
  wahl:=' ';

  rechnung;

  setcolor(6);setFillStyle(1,6);
  sector(480,160,0,360,2,2);
  setcolor(15);
  circle(340,260,17);
  setFillStyle(1,15);
  sector(160,160,0,360,3,3);
    setcolor(farbe[i]);
    x1:=160+round(xkoord[5]*fak2);
    x2:=160+round(xkoord[i]*fak2);
    y1:=160-round(ykoord[5]*fak2);
    y2:=160-round(ykoord[i]*fak2);
    setFillStyle(1,farbe[i]);
    sector(160+round(xkoord[i]*fak2),160-round(ykoord[i]*fak2),0,360,2,2);
    line(x1,y1,x1+m*(x2-x1),y1+m*(y2-y1));

    setcolor(6);setFillStyle(1,6);
    sector(160+round(xkoord[5]*fak2),160-round(ykoord[5]*fak2),0,360,2,2);
    setcolor(15);
    line(50,380,410,380);
    line(160+round(xkoord[5]*fak2),160-round(ykoord[5]*fak2),55,160-round(ykoord[5]*fak2));

      setFillStyle(1,15);
    sector(480-round(xkoord[5]*fak2),160+round(ykoord[5]*fak2),0,360,2,2);

    setcolor(farbe[i]); setFillStyle(1,farbe[i]);
    sector(480+round(xschein[i]*fak2),160-round(yschein[i]*fak2),0,360,1,1);
    
    sector(480+round(xkoord[i]*fak4),310-round(yneig[i]),0,360,1,1);
    sector(320-round(winkel[i]),380-round(fak5*sehw[i]),0,360,1,1);
    sector(340,260,0,360,round(16*abs(bahnrad[i]-bahnrad[5])/entf[i]),round(16*abs(bahnrad[i]-bahnrad[5])/entf[i]));

  repeat until keypressed;
    
  repeat
    setcolor(0); setfillstyle(1,0);
    sector(160+round(xkoord[5]*fak2),160-round(ykoord[5]*fak2),0,360,2,2);
    sector(480-round(xkoord[5]*fak2),160+round(ykoord[5]*fak2),0,360,2,2);

    line(50,380,410,380);

    line(x1,y1,x1+m*(x2-x1),y1+m*(y2-y1));

    sector(160+round(xkoord[i]*fak2),160-round(ykoord[i]*fak2),0,360,2,2);

    line(160+round(xkoord[5]*fak2),160-round(ykoord[5]*fak2),55,160-round(ykoord[5]*fak2));
   

     circle(340,260,round(0.4+16*abs(bahnrad[i]-bahnrad[5])/entf[i]));
     circle(340,260,round(-0.4+16*abs(bahnrad[i]-bahnrad[5])/entf[i]));

    rechnung;

    setcolor(6); setfillstyle(1,6);
    sector(480,160,0,360,2,2);
    sector(160+round(xkoord[5]*fak2),160-round(ykoord[5]*fak2),0,360,2,2);
   
    setcolor(15); setfillstyle(1,15);

      sector(160,160,0,360,3,3);line(470,310,490,310);

    line(50,380,410,380);
    setcolor(farbe[i]);  setfillstyle(1,farbe[i]);
    sector(160+round(xkoord[i]*fak2),160-round(ykoord[i]*fak2),0,360,2,2);

    x1:=160+round(xkoord[5]*fak2);
    x2:=160+round(xkoord[i]*fak2);
    y1:=160-round(ykoord[5]*fak2);
    y2:=160-round(ykoord[i]*fak2);

    line(x1,y1,x1+m*(x2-x1),y1+m*(y2-y1));

    sector(340,260,0,360,round(16*abs(bahnrad[i]-bahnrad[5])/entf[i]),round(16*abs(bahnrad[i]-bahnrad[5])/entf[i]));
    setcolor(6);setfillstyle(1,6);
    
    setcolor(15);setfillstyle(1,15);
    line(160+round(xkoord[5]*fak2),160-round(ykoord[5]*fak2),55,160-round(ykoord[5]*fak2));
    sector(480-round(xkoord[5]*fak2),160+round(ykoord[5]*fak2),0,360,2,2);

    setcolor(farbe[i]);setfillstyle(1,farbe[i]);
    

    sector(480+round(xschein[i]*fak2),160-round(yschein[i]*fak2),0,360,1,1);
    sector(480+round(xkoord[i]*fak4),310-round(yneig[i]),0,360,1,1);
    sector(320-round(winkel[i]),380-round(fak5*sehw[i]),0,360,1,1);

    t:=t+dt;

    setcolor(0);
    outtextxy(50,450,Zeit);
    outtextxy(250,80,winkel1);
    setcolor(15);
    str(t:5:0,Zeit);
    outtextxy(50,450,Zeit);
    str(180-winkel[i]:5:0,winkel1);
    outtextxy(250,80,winkel1);

    if keypressed then wahl:=readkey;
    case wahl of
    'h':
    begin
      dt:=dt/2;
      wahl:=' ';
    end;
    'd':
    begin
      dt:=dt*2;
      wahl:=' ';
    end;

    'p':wahl:=readkey;
    '1':planeten;
    '2':
     begin
       cleardevice;
       graphik1;
       umlauf4a;
      
     end;
     '3':
     begin
       cleardevice;
       graphik2;
       umlauf5;
     end;
  'e':
    begin
      cleardevice;
      grafik;
      grafik1;
      exit;
    end;
  end;
  until wahl='b';
end;

procedure merkur;
begin
  i:=1;
  k:=1;
  l:=1;
   m:=1;
   faktor:=20;
  fak1:=0.9;
  fak2:=0.45;
  fak3:=5;
  fak4:=0.1;
  fak5:=7;
  bahnradi:=3.5*bahnrad[i];
  bahnrad5:=3.5*bahnrad[5];
  grafik;
  grafik2;
  umlauf2;
end;

procedure venus;
begin
  i:=2;
  k:=2;
  l:=2;
   m:=1;
   faktor:=10;
   fak1:=0.72;
   fak2:=0.34;
   fak3:=5;
   fak4:=0.1;
   fak5:=3.5;
  bahnradi:=2.7*bahnrad[i];
  bahnrad5:=2.7*bahnrad[5];
  grafik;
  grafik2;
  umlauf2;
end;

procedure mars;
begin
  i:=3;
  k:=3;
  l:=3;
   m:=1;
   faktor:=15;
   fak1:=0.5;
   fak2:=0.25;
   fak3:=3.3;
   fak4:=0.1;
   fak5:=7;
  bahnradi:=2*bahnrad[i];
  bahnrad5:=2*bahnrad[5];
  grafik;
  grafik2;
  umlauf2;
end;

procedure jupiter;
begin
  i:=4;
  k:=4;
  l:=4;
  m:=1;
  faktor:=50;
  fak1:=0.2;
  fak2:=0.1;
  fak3:=0.95;
  fak4:=0.1;
  fak5:=15;
  bahnradi:=0.8*bahnrad[i];
  bahnrad5:=0.8*bahnrad[5];
  grafik;
  grafik2;
  setcolor(15-i);
  umlauf2;
end;


procedure umlauf1;
begin
  feldfuellen;
  t:=0.2;
  dt:=0.1;
  wahl:=' ';

 for i:= 1 to 4 do
 begin

  rechnung;
    setcolor(6);setfillstyle(1,6);
    sector(160+round(xkoord[5]/10),160-round(ykoord[5]/10),0,360,1,1);
  sector(480,160,0,360,2,2);
  setcolor(15);setfillstyle(1,15);
    line(50,380,410,380);
  sector(160,160,0,360,2,2);
     setcolor(farbe[i]);setfillstyle(1,farbe[i]);
    sector(160+round(xkoord[i]/10),160-round(ykoord[i]/10),0,360,1,1);
    sector(480+round(xschein[i]/10),160-round(yschein[i]/10),0,360,1,1);
    sector(480+round(xkoord[i]/10),310-round(yneig[i]),0,360,1,1);
    sector(320-round(winkel[i]),380-round(3*sehw[i]),0,360,1,1);
  end;
  repeat until keypressed;

  repeat

 
  for i:= 1 to 4 do
  begin
       rechnung;

    setcolor(6);setfillstyle(1,6);
    sector(480,160,0,360,2,2);
    setcolor(15);setfillstyle(1,15);
     line(50,380,410,380);
      sector(160,160,0,360,2,2);line(470,310,490,310);
    setcolor(6);setfillstyle(1,6);
    sector(160+round(xkoord[5]/10),160-round(ykoord[5]/10),0,360,1,1);

    setcolor(farbe[i]);setfillstyle(1,farbe[i]);
    sector(160+round(xkoord[i]/10),160-round(ykoord[i]/10),0,360,1,1);
    sector(480+round(xschein[i]/10),160-round(yschein[i]/10),0,360,1,1);
    sector(480+round(xkoord[i]/10),310-round(yneig[i]),0,360,1,1);
    sector(320-round(winkel[i]),380-round(3*sehw[i]),0,360,1,1);
  end;

    t:=t+dt;

    setcolor(0);
    outtextxy(50,450,Zeit);
    setcolor(15);
    str(t:5:0,Zeit);
    outtextxy(50,450,Zeit);
    if keypressed then wahl:=readkey;
    case wahl of
    'h':
    begin
      dt:=dt/2;
      wahl:=' ';
    end;
    'd':
    begin
      dt:=dt*2;
      wahl:=' ';
    end;
    'm':merkur;
    'v':venus;
    'M':mars;
    'j':jupiter;

    '1':planeten;
    '2':
     begin
       cleardevice;
       graphik1;
       fak1:=0.2;
      
       umlauf4b;

     end;
     '3':
     begin

       faktor:=15;
       fak3:=0.95;
       cleardevice;
       graphik2;
       umlauf5a;
     end;

    'p':wahl:=readkey;
  end;
  until wahl='b';
end;

{Main}
begin
  grafik;
  grafik1;
  umlauf1;
end.