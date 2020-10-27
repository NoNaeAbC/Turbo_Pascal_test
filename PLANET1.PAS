program planetenbewegunga;
uses crt,graph;
var
  i,k,l,treiber,modus:integer;
  jahr,k1,n,m,x1,x2,y1,y2:integer;
  hilfe,winkel5, thilfe,xkoordi,xkoord5,bahnradi,bahnrad5,x,y,t1,t,dt:real;
  wahl:char;
  winkelh1,winkel3,winkel2,winkel1,zeit:string;

  fak1,fak2,fak3,fak4,fak5,faktor,x11,x12,y11,y12,r1,r2,r3,r4,r5,t2,t3,t4,t5,
  phi1,phi2,phi3,phi4,phi5,
  x3,x4,x5,y3,y4,y5:real;
  std:real;
  Zeit1,Zeit2:string;

  farbe:array[1..5]of integer;
  planame:array[1..5] of string[7];
  bahnrad1:array[1..5] of real;
  bahnrad:array[1..5] of real;
  umlaufT:array[1..5] of real;
  bahnnei:array[1..5] of real;
  groesse:array[1..4] of real;
  omega:  array[1..5] of real;
  xkoord: array[1..5] of real;
  ykoord: array[1..5] of real;
  xschein:array[1..4] of real;
  yschein:array[1..4] of real;
{
  winkelh: array[1..5] of real;
}
  winkel: array[1..4] of real;
  entf:   array[1..4] of real;
  yneig:  array[1..4] of real;
  sehw:   array[1..4] of real;
  faku2:  array[1..4] of real;

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
    groesse[1]:=2420*2;
    groesse[2]:=6114*2;
    groesse[3]:=3385*2;
    groesse[4]:=70360*2;
    faku2[1]:=0.45;
    faku2[2]:=0.34;
    faku2[3]:=0.25;
    faku2[4]:=0.1;

    for i:=1 to 5 do
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
    line(5,445,200,445);
    line(5,460,200,460);
    line(5,445,5,460);
    line(200,445,200,460);
    outtextxy(538,470,'beenden -> b');
    outtextxy(7,470,'Bewegung starten (s) , verdoppeln (d) , halbieren (h)  pause (p)');
    outtextxy(10,450,'Jahre:');
    outtextxy(105,450,' Tage:');
    outtextxy(240,450,'Zeitumkehr (u)');
    line(25,40,615,40);
    line(25,410,615,410);
    line(25,280,615,280);
    line(25,340,615,340);
    line(410,310,550,310);
    line(25,40,25,410);
    line(615,40,615,410);
    line(320,40,320,280);
    outtextxy(460,50,'270¯');
    outtextxy(330,160,'0¯');
    outtextxy(575,160,'180¯');
    outtextxy(470,270,'90¯');
    outtextxy(300,310,'Ekliptik');
    outtextxy(315,350,'0¯');
    outtextxy(400,350,'-90¯');
    outtextxy(130,350,'180¯');
    outtextxy(220,350,'90¯');
    outtextxy(40,350,'270¯');

     outtextxy(35,160,'0¯');
    outtextxy(270,160,'180¯');
    outtextxy(155,50,'270¯');
    outtextxy(150,270,'90¯');
     line(410,310,550,310);
    outtextxy(450,375,'Ekliptik');

    line(320,400,320,410);
    line(410,387,410,410);
    line(230,400,230,410);
    line(140,400,140,410);
    line(50,387,50,410);
    outtextxy(55,400,'Sch Sk Waa');
    outtextxy(145,400,'Jun Lî Kre');
    outtextxy(235,400,'Zwi St Wid');
    outtextxy(325,400,'Fis Wa Ste');
  outtextxy(290,50,'(1)');
  outtextxy(590,50,'(2)');
  outtextxy(590,290,'(3)');
  outtextxy(590,400,'(4)');
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
  outtextxy(380,450,'zurÅck zur öbersicht: (p) , (e)');
  outtextxy(482,350,'Jupitermonde (5)');
  line(477,343,477,360);
  line(477,343,612,343);
  line(477,360,612,360);
  line(612,360,612,343);

  outtextxy(243,65,'Winkel:');
  outtextxy(290,80,'¯');
  outtextxy(380,450,'zurÅck zur öbersicht: (p) , (e)');
  str(bahnnei[i]:4:1,winkel2);
  outtextxy(60,310,'Bahnneigung:'+winkel2+'¯  gegen die');
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
  outtextxy(10,470,'zurÅck zur öbersicht -> e');
  outtextxy(10,450,'Jahre:');
  outtextxy(105,450,' Tage:');
    outtextxy(240,450,'Zeitumkehr -> u');
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
  outtextxy(10,470,'zurÅck zur öbersicht -> e');
  outtextxy(10,440,'Jahre:');
  outtextxy(105,440,' Tage:');
    outtextxy(240,460,'Zeitumkehr -> u');
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
  outtextxy(10,470,'zurÅck zum Beginn -> e');
  outtextxy(10,440,'Jahre:');
  outtextxy(105,440,' Tage:');
    outtextxy(240,460,'Zeitumkehr -> u');
  line(45,50,45,430);
  line(595,50,595,430);
  line(45,50,595,50);
  line(45,430,595,430);
  line(45,240,595,240);
  line(45,400,595,400);
end;

procedure umlauf3;
begin
  r1:=57.94/5;
  r2:=108.27/5;
  r3:=149.68/5;
  r4:=228.06/5;
  r5:=778.73/5;
  t1:=87.95;
  t2:=224.71;
  t3:=365.26;
  t4:=686.97;
  t5:=4332.61;
  t:=0.01;
  thilfe:=t;
  jahr:=0;
  dt:=0.04;
  wahl:=' ';
  x11:=0;x12:=0;x3:=0;x4:=0;x5:=0;
  y11:=r1;y12:=r2;y3:=r3;y4:=r4;y5:=r5;
  setcolor(15);setfillstyle(1,15);
  sector(320,240,0,360,5,5);
  setcolor(14);setfillstyle(1,14);
  outtextxy(100,410,'Merkur');
  sector(320+round(x11),240+round(y11),0,360,1,1);
  setcolor(9);setfillstyle(1,9);
  outtextxy(200,410,'Venus');
  sector(320+round(x12),240+round(y12),0,360,2,2);
  setcolor(6); setfillstyle(1,6);
  outtextxy(300,410,'Erde');

  sector(320+round(x3),240+round(y3),0,360,2,2);
  setcolor(12);setfillstyle(1,12);
  outtextxy(400,410,'Mars');
  sector(320+round(x4),240+round(y4),0,360,1,1);
  setcolor(11); setfillstyle(1,11);
  outtextxy(500,410,'Jupiter');
  sector(320+round(x5),240+round(y5),0,360,3,3);
  repeat until keypressed;
  repeat
    phi1:=2*pi/t1*t;phi2:=2*pi/t2*t;phi3:=2*pi/t3*t;phi4:=2*pi/t4*t;phi5:=2*pi/t5*t;

    setcolor(0);setfillstyle(1,0);

    sector(320+round(x11),240+round(y11),0,360,1,1);
    sector(320+round(x12),240+round(y12),0,360,2,2);
    sector(320+round(x3),240+round(y3),0,360,2,2);
    sector(320+round(x4),240+round(y4),0,360,1,1);
    sector(320+round(x5),240+round(y5),0,360,3,3);

    x11:=r1*sin(phi1);x12:=r2*sin(phi2);x3:=r3*sin(phi3);x4:=r4*sin(phi4);x5:=r5*sin(phi5);
    y11:=r1*cos(phi1);y12:=r2*cos(phi2);y3:=r3*cos(phi3);y4:=r4*cos(phi4);y5:=r5*cos(phi5);

  setcolor(14);setfillstyle(1,14);
  sector(320+round(x11),240+round(y11),0,360,1,1);
  setcolor(9);setfillstyle(1,9);
  sector(320+round(x12),240+round(y12),0,360,2,2);
  setcolor(6);setfillstyle(1,6);
  sector(320+round(x3),240+round(y3),0,360,2,2);
  setcolor(12);setfillstyle(1,12);
  sector(320+round(x4),240+round(y4),0,360,1,1);
  setcolor(11); setfillstyle(1,11);
  sector(320+round(x5),240+round(y5),0,360,3,3);
  setcolor(15); setfillstyle(1,15);
    sector(320,240,0,360,5,5);
    delay(20);
    t:=t+dt;

    thilfe:=thilfe+dt;
    if thilfe >= umlaufT[5] then
    begin
      jahr:=jahr+1;
      thilfe := thilfe - umlaufT[5];
    end;

    setcolor(0);
    outtextxy(150,450,Zeit);
    outtextxy(50,450,Zeit1);

    setcolor(15);
    str(thilfe:5:0,Zeit);
    str(jahr:5,Zeit1);
    outtextxy(150,450,Zeit);
    outtextxy(50,450,Zeit1);

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
     'u':
     begin
       dt:=-dt;
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

    if xkoord[5]<>0 then
    begin
      winkel5:=arctan(ykoord[5]/xkoord[5])*180/pi;
    end
    else
    begin
      winkel5:=90;
    end;
    if xkoord[5] < 0 then
    begin
      winkel5:=winkel5-180;
    end;

    yschein[i]:=sin(2*pi/360*winkel[i])*entf[i];
    xschein[i]:=cos(2*pi/360*winkel[i])*entf[i];
end;


procedure planeten;
begin
  graphik;
  umlauf3;
end;

procedure tierkreis4;
begin
  circle(320,240,190);
  outtextxy(155,410,'Zwillinge');
  outtextxy(120,350,'Stier');
  outtextxy(80,280,'Widder');
  outtextxy(75,210,'Fische');
  outtextxy(70,140,'Wassermann');
  outtextxy(130,80,'Steinbock');
  outtextxy(445,80,'SchÅtze');
  outtextxy(490,140,'Skorpion');
  outtextxy(515,210,'Waage');
  outtextxy(510,280,'Jungfrau');
  outtextxy(480,350,'Lîwe');
  outtextxy(415,410,'Krebs');
end;


procedure umlauf4;
begin
  jahr:=0;
  t:=0.1;
  thilfe:=t;
  dt:=0.4;
  wahl:=' ';
  outtextxy(220,30,'Schleifenmuster von '+planame[i]);
  outtextxy(10,460,'zurÅck zum Planeten -> z');

  rechnung;

  setcolor(6);setFillStyle(1,6);
  sector(320,240,0,360,3,3);
 setcolor(15);
 circle(530,380,37);
 tierkreis4;

  setFillStyle(1,15);

    setFillStyle(1,15);
    sector(320-round(xkoord[5]*fak1),240-round(ykoord[5]*fak1),0,360,3,3);

    setcolor(farbe[i]); setFillStyle(1,farbe[i]);
    sector(320+round(xschein[i]*fak1),240+round(yschein[i]*fak1),0,360,2,2);

sector(530,380,0,360,round(36*abs(bahnrad[i]-bahnrad[5])/entf[i]),round(36*abs(bahnrad[i]-bahnrad[5])/entf[i]));

  repeat until keypressed;

  repeat
    setcolor(0); setfillstyle(1,0);

    circle(530,380,round(0.4+36*abs(bahnrad[i]-bahnrad[5])/entf[i]));
    circle(530,380,round(-0.4+36*abs(bahnrad[i]-bahnrad[5])/entf[i]));
    sector(320-round(xkoord[5]*fak1),240-round(ykoord[5]*fak1),0,360,3,3);
    sector(320,240,0,360,3,3);
    sector(320+round(xschein[i]*fak1),240+round(yschein[i]*fak1),0,360,2,2);

    rechnung;

    setcolor(6); setfillstyle(1,6);
    sector(320,240,0,360,3,3);

    setcolor(15);  setfillstyle(1,15);
    sector(320-round(xkoord[5]*fak1),240-round(ykoord[5]*fak1),0,360,3,3);

    setcolor(farbe[i]);setfillstyle(1,farbe[i]);
    sector(320+round(xschein[i]*fak1),240+round(yschein[i]*fak1),0,360,2,2);
    sector(530,380,0,360,round(36*abs(bahnrad[i]-bahnrad[5])/entf[i]),round(36*abs(bahnrad[i]-bahnrad[5])/entf[i]));
    delay(80);

    t:=t+dt;
    thilfe:=thilfe+dt;
    if thilfe >= umlaufT[5] then
    begin
      jahr:=jahr+1;
      thilfe := thilfe - umlaufT[5];
    end;

    setcolor(0);
    outtextxy(150,440,Zeit);
    outtextxy(50,440,Zeit1);

    setcolor(15);
    str(thilfe:5:0,Zeit);
    str(jahr:5,Zeit1);
    outtextxy(150,440,Zeit);
    outtextxy(50,440,Zeit1);

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
     'u':
     begin
       dt:=-dt;
       wahl:=' ';
     end;

    'p':wahl:=readkey;
    'z':
      begin
        cleardevice;
        grafik;
        grafik2;
        setcolor(15);
        circle(340,260,17);
        dt:=1;
        setcolor(farbe[i]);
        
        exit;
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


procedure umlauf4a;
begin
  jahr:=0;
  t:=0.1;
  thilfe:=t;
  dt:=1.6;
  wahl:=' ';
  outtextxy(220,30,'Schleifenmuster der Planeten ');
tierkreis4;

  rechnung;

  setcolor(6);setFillStyle(1,6);
  sector(320,240,0,360,3,3);
 setcolor(15);
 

  setFillStyle(1,15);

    setFillStyle(1,15);
    sector(320-round(xkoord[5]*fak1),240-round(ykoord[5]*fak1),0,360,3,3);
for i:=1 to 4 do
begin
  setcolor(15);
  m:=round(0.09*groesse[i]/(abs(bahnrad[i]-bahnrad[5])));
   circle(610,210+50*i,m+1);
    setcolor(farbe[i]); setFillStyle(1,farbe[i]);
    sector(320+round(xschein[i]*fak1),240+round(yschein[i]*fak1),0,360,2,2);

sector(610,210+50*i,0,360,round(m*abs(bahnrad[i]-bahnrad[5])/entf[i]),round(m*abs(bahnrad[i]-bahnrad[5])/entf[i]));
end;
  repeat until keypressed;

  repeat
        for i:= 1 to 4 do
    begin

    setcolor(0); setfillstyle(1,0);
      m:=round(0.09*groesse[i]/(abs(bahnrad[i]-bahnrad[5])));

    circle(610,210+50*i,round(0.4+m*abs(bahnrad[i]-bahnrad[5])/entf[i]));
    circle(610,210+50*i,round(-0.4+m*abs(bahnrad[i]-bahnrad[5])/entf[i]));
    sector(320-round(xkoord[5]*fak1),240-round(ykoord[5]*fak1),0,360,3,3);
    sector(320,240,0,360,3,3);
    sector(320+round(xschein[i]*fak1),240+round(yschein[i]*fak1),0,360,2,2);

    rechnung;

    setcolor(6); setfillstyle(1,6);
    sector(320,240,0,360,3,3);

    setcolor(15);  setfillstyle(1,15);
    sector(320-round(xkoord[5]*fak1),240-round(ykoord[5]*fak1),0,360,3,3);

    setcolor(farbe[i]);setfillstyle(1,farbe[i]);
    sector(320+round(xschein[i]*fak1),240+round(yschein[i]*fak1),0,360,2,2);
    sector(610,210+50*i,0,360,round(m*abs(bahnrad[i]-bahnrad[5])/entf[i]),round(m*abs(bahnrad[i]-bahnrad[5])/entf[i]));

    end;
    delay(80);

    t:=t+dt;

    thilfe:=thilfe+dt;
    if thilfe >= umlaufT[5] then
    begin
      jahr:=jahr+1;
      thilfe := thilfe - umlaufT[5];
    end;

    setcolor(0);
    outtextxy(150,440,Zeit);
    outtextxy(50,440,Zeit1);

    setcolor(15);
    str(thilfe:5:0,Zeit);
    str(jahr:5,Zeit1);
    outtextxy(150,440,Zeit);
    outtextxy(50,440,Zeit1);

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
     'u':
     begin
       dt:=-dt;
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

procedure tierkreis5;
begin
  outtextxy(55,380,'SchÅ');
  outtextxy(55+45,380,'Skor');
  outtextxy(55+2*45,380,'Waag');
  outtextxy(55+3*45,380,'Jung');
  outtextxy(55+4*45,380,'Lîwe');
  outtextxy(55+5*45,380,'Kreb');
  outtextxy(55+6*45,380,'Zwil');
  outtextxy(55+7*45,380,'Stie');
  outtextxy(55+8*45,380,'Widd');
  outtextxy(55+9*45,380,'Fisc');
  outtextxy(55+10*45,380,'Wass');
  outtextxy(55+11*45,380,'Stei');
end;

procedure graphik3;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(1);
  setcolor(15);
  outtextxy(250,470,'pause -> p');
  outtextxy(465,440,'weiter -> w');
  outtextxy(400,450,'doppelte Geschwindigkeit -> d');
  outtextxy(420,460,'halbe Geschwindigkeit -> h');
  outtextxy(460,470,'beenden -> b');
  outtextxy(10,470,'zurÅck zum Beginn -> e');
  outtextxy(10,440,'Jahre:');
  outtextxy(105,440,' Tage:');
  line(45,50,45,430);
  line(595,50,595,430);
  line(45,50,595,50);
  line(45,430,595,430);
  line(45,170,595,170);
  line(45,180,595,180);
  line(45,300,595,300);
  line(45,310,595,310);
end;

procedure umlauf5b;
begin
  jahr:=0;
  t:=0.1;
  thilfe:=t;
  dt:=0.4;
  wahl:=' ';
  rechnung;
  outtextxy(220,30,'Schleifenmuster von '+planame[i]);
      outtextxy(10,460,'zurÅck zum Planeten -> z');
    outtextxy(230,440,'Sehwinkel: ');

    setcolor(15);
line(45,110,595,110);
line(45,240,595,240);
line(45,370,595,370);
     for k1 := 1 to 3 do
    begin
      line(50+k1*45*3,50,50+k1*45*3,170);
      line(50+k1*45*3,180,50+k1*45*3,300);
      line(50+k1*45*3,310,50+k1*45*3,430);
    end;

  outtextxy(55,160,'SchÅtze');
  outtextxy(55+45*3,160,'Skorpion');
  outtextxy(55+2*45*3,160,'Waage');
  outtextxy(55+3*45*3,160,'Jungfrau');

  outtextxy(55,290,'Lîwe');
  outtextxy(55+3*45,290,'Krebs');
  outtextxy(55+6*45,290,'Zwillinge');
  outtextxy(55+9*45,290,'Stier');

  outtextxy(55,420,'Widder');
  outtextxy(55+3*45,420,'Fische');
  outtextxy(55+6*45,420,'Wassermann');
  outtextxy(55+9*45,420,'Steinbock');

       sector(590,370,0,360,3,3);
        setcolor(farbe[i]); setFillStyle(1,farbe[i]);

    if (-90 <= winkel[i]) and (winkel[i] <= 30) then
    begin
       sector(455+round(4.5*winkel[i]),110-round(4.5*sehw[i]),0,360,3,3);
    end;

    if (30 < winkel[i]) and (winkel[i] <= 150) then
    begin
       sector(-85+round(4.5*winkel[i]),240-round(4.5*sehw[i]),0,360,3,3);
    end;

    if (150 <= winkel[i]) and (winkel[i] < 270) then
    begin
       sector(-625+round(4.5*winkel[i]),370-round(4.5*sehw[i]),0,360,3,3);
    end;


  repeat until keypressed;
    
  repeat
  
    setcolor(0); setfillstyle(1,0);
    
    if (0 <= thilfe) and (thilfe <= umlaufT[5]/3) then
    begin
     
      sector(590-round(4.5*360),110,0,360,3,3);
      sector(590-round(4.5*(thilfe-dt)/umlaufT[5]*360),370,0,360,3,3);
     sector(50,370,0,360,3,3);
      sector(50,110,0,360,3,3);
       sector(50,240,0,360,3,3);
    end;
    if (-90 <= winkel[i]) and (winkel[i] <= 30) then
    begin
       sector(455+round(4.5*winkel[i]),110-round(4.5*sehw[i]),0,360,3,3);
    end;

    if (umlaufT[5]/3 < thilfe) and (thilfe <= 2*umlaufT[5]/3) then
    begin
      sector(590-round(4.5*360),240,0,360,3,3);
      sector(590-round(4.5*(thilfe-umlaufT[5]/3-dt)/umlaufT[5]*360),240,0,360,3,3);
      sector(50,240,0,360,3,3);
       sector(50,370,0,360,3,3);
        sector(50,110,0,360,3,3);
    end;
    if (30 < winkel[i]) and (winkel[i] <= 150) then
    begin
       sector(-85+round(4.5*winkel[i]),240-round(4.5*sehw[i]),0,360,3,3);
    end;

     if (2*umlaufT[5]/3 < thilfe) and (thilfe < umlaufT[5]) then
    begin
   
      sector(590-round(4.5*360),370,0,360,3,3);
      sector(590-round(4.5*(thilfe-2*umlaufT[5]/3-dt)/umlaufT[5]*360),110,0,360,3,3);
       sector(50,370,0,360,3,3);
        sector(50,110,0,360,3,3);
         sector(50,240,0,360,3,3);
    end;
    if (150 <= winkel[i]) and (winkel[i] < 270) then
    begin
       sector(-625+round(4.5*winkel[i]),370-round(4.5*sehw[i]),0,360,3,3);
    end;

    setcolor(15); setfillstyle(1,15);

line(45,110,595,110);
line(45,240,595,240);
line(45,370,595,370);
     for k1 := 1 to 3 do
    begin
      line(50+k1*45*3,50,50+k1*45*3,170);
      line(50+k1*45*3,180,50+k1*45*3,300);
      line(50+k1*45*3,310,50+k1*45*3,430);
    end;

  outtextxy(55,160,'SchÅtze');
  outtextxy(55+45*3,160,'Skorpion');
  outtextxy(55+2*45*3,160,'Waage');
  outtextxy(55+3*45*3,160,'Jungfrau');

  outtextxy(55,290,'Lîwe');
  outtextxy(55+3*45,290,'Krebs');
  outtextxy(55+6*45,290,'Zwillinge');
  outtextxy(55+9*45,290,'Stier');

  outtextxy(55,420,'Widder');
  outtextxy(55+3*45,420,'Fische');
  outtextxy(55+6*45,420,'Wassermann');
  outtextxy(55+9*45,420,'Steinbock');


   rechnung;
    if (0 <= thilfe) and (thilfe <= umlaufT[5]/3) then
    begin
      sector(590-round(4.5*(thilfe)/umlaufT[5]*360),370,0,360,3,3);
    end;

   if (umlaufT[5]/3 < thilfe) and (thilfe <= 2*umlaufT[5]/3) then
    begin
      sector(590-round(4.5*(thilfe-umlaufT[5]/3)/umlaufT[5]*360),240,0,360,3,3);
    end;

     if (2*umlaufT[5]/3 < thilfe) and (thilfe < umlaufT[5]) then
    begin
      sector(590-round(4.5*(thilfe-2*umlaufT[5]/3)/umlaufT[5]*360),110,0,360,3,3);
    end;
 
    setcolor(farbe[i]);setfillstyle(1,farbe[i]);

    if (-90 <= winkel[i]) and (winkel[i] <= 30) then
    begin
       sector(455+round(4.5*winkel[i]),110-round(4.5*sehw[i]),0,360,3,3);
    end;

    if (30 < winkel[i]) and (winkel[i] <= 150) then
    begin
       sector(-85+round(4.5*winkel[i]),240-round(4.5*sehw[i]),0,360,3,3);
    end;

    if (150 <= winkel[i]) and (winkel[i] < 270) then
    begin
       sector(-625+round(4.5*winkel[i]),370-round(4.5*sehw[i]),0,360,3,3);
    end;

    delay(20);


    t:=t+dt;
    hilfe:=hilfe+dt;
    thilfe:=thilfe+dt;
    if thilfe >= umlaufT[5] then
    begin
      jahr:=jahr+1;
      thilfe := thilfe - umlaufT[5];
    end;

    setcolor(0);
    outtextxy(150,440,Zeit);
    outtextxy(50,440,Zeit1);
    outtextxy(310,440,winkel3+'¯');

    setcolor(15);
    str(thilfe:5:0,Zeit);
    str(jahr:5,Zeit1);
    outtextxy(150,440,Zeit);
    outtextxy(50,440,Zeit1);
    str(sehw[i]:5:1,winkel3);
    outtextxy(310,440,winkel3+'¯');

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
     'u':
     begin
       dt:=-dt;
       wahl:=' ';
     end;
    'p':wahl:=readkey;
       'z':
      begin
        cleardevice;
        grafik;
        grafik2;
        setcolor(15);
        circle(340,260,17);
        dt:=1;
        setcolor(farbe[i]);

        exit;
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

procedure umlauf5c;
begin
  jahr:=0;
  t:=0.1;
  thilfe:=t;
  dt:=0.4;
  wahl:=' ';
  rechnung;
  outtextxy(220,30,'Schleifenmuster der Planeten');

    setcolor(15);
line(45,110,595,110);
line(45,240,595,240);
line(45,370,595,370);
setlinestyle(1,0,1);
line(45,110+18,595,110+18);
line(45,110-18,595,110-18);
line(45,240+18,595,240+18);
line(45,240-18,595,240-18);
line(45,370+18,595,370+18);
line(45,370-18,595,370-18);
setlinestyle(0,0,1);
outtextxy(600,110+18,'4¯');
outtextxy(600,110-18,'4¯');
outtextxy(600,240+18,'4¯');
outtextxy(600,240-18,'4¯');
outtextxy(600,370+18,'4¯');
outtextxy(600,370-18,'4¯');





     for k1 := 1 to 3 do
    begin
      line(50+k1*45*3,50,50+k1*45*3,170);
      line(50+k1*45*3,180,50+k1*45*3,300);
      line(50+k1*45*3,310,50+k1*45*3,430);
    end;

  outtextxy(55,160,'SchÅtze');
  outtextxy(55+45*3,160,'Skorpion');
  outtextxy(55+2*45*3,160,'Waage');
  outtextxy(55+3*45*3,160,'Jungfrau');

  outtextxy(55,290,'Lîwe');
  outtextxy(55+3*45,290,'Krebs');
  outtextxy(55+6*45,290,'Zwillinge');
  outtextxy(55+9*45,290,'Stier');

  outtextxy(55,420,'Widder');
  outtextxy(55+3*45,420,'Fische');
  outtextxy(55+6*45,420,'Wassermann');
  outtextxy(55+9*45,420,'Steinbock');

       sector(590,370,0,360,3,3);
for i:=1 to 4 do
begin
        setcolor(farbe[i]); setFillStyle(1,farbe[i]);

    if (-90 <= winkel[i]) and (winkel[i] <= 30) then
    begin
       sector(455+round(4.5*winkel[i]),110-round(4.5*sehw[i]),0,360,3,3);
    end;

    if (30 < winkel[i]) and (winkel[i] <= 150) then
    begin
       sector(-85+round(4.5*winkel[i]),240-round(4.5*sehw[i]),0,360,3,3);
    end;

    if (150 <= winkel[i]) and (winkel[i] < 270) then
    begin
       sector(-625+round(4.5*winkel[i]),370-round(4.5*sehw[i]),0,360,3,3);
    end;
end;

  repeat until keypressed;
    
  repeat
for i:= 1 to 4 do
begin

    setcolor(0); setfillstyle(1,0);
    
    if (0 <= thilfe) and (thilfe <= umlaufT[5]/3) then
    begin
     
      sector(590-round(4.5*360),110,0,360,3,3);
      sector(590-round(4.5*(thilfe-dt)/umlaufT[5]*360),370,0,360,3,3);
     sector(50,370,0,360,3,3);
      sector(50,110,0,360,3,3);
       sector(50,240,0,360,3,3);
    end;
    if (-90 <= winkel[i]) and (winkel[i] <= 30) then
    begin
       sector(455+round(4.5*winkel[i]),110-round(4.5*sehw[i]),0,360,3,3);
    end;

    if (umlaufT[5]/3 < thilfe) and (thilfe <= 2*umlaufT[5]/3) then
    begin
      sector(590-round(4.5*360),240,0,360,3,3);
      sector(590-round(4.5*(thilfe-umlaufT[5]/3-dt)/umlaufT[5]*360),240,0,360,3,3);
      sector(50,240,0,360,3,3);
       sector(50,370,0,360,3,3);
        sector(50,110,0,360,3,3);
    end;
    if (30 < winkel[i]) and (winkel[i] <= 150) then
    begin
       sector(-85+round(4.5*winkel[i]),240-round(4.5*sehw[i]),0,360,3,3);
    end;

     if (2*umlaufT[5]/3 < thilfe) and (thilfe < umlaufT[5]) then
    begin
   
      sector(590-round(4.5*360),370,0,360,3,3);
      sector(590-round(4.5*(thilfe-2*umlaufT[5]/3-dt)/umlaufT[5]*360),110,0,360,3,3);
       sector(50,370,0,360,3,3);
        sector(50,110,0,360,3,3);
         sector(50,240,0,360,3,3);
    end;
    if (150 <= winkel[i]) and (winkel[i] < 270) then
    begin
       sector(-625+round(4.5*winkel[i]),370-round(4.5*sehw[i]),0,360,3,3);
    end;

    setcolor(15); setfillstyle(1,15);

line(45,110,595,110);
line(45,240,595,240);
line(45,370,595,370);
setlinestyle(1,0,1);
line(45,110+18,595,110+18);
line(45,110-18,595,110-18);
line(45,240+18,595,240+18);
line(45,240-18,595,240-18);
line(45,370+18,595,370+18);
line(45,370-18,595,370-18);
setlinestyle(0,0,1);

     for k1 := 1 to 3 do
    begin
      line(50+k1*45*3,50,50+k1*45*3,170);
      line(50+k1*45*3,180,50+k1*45*3,300);
      line(50+k1*45*3,310,50+k1*45*3,430);
    end;

  outtextxy(55,160,'SchÅtze');
  outtextxy(55+45*3,160,'Skorpion');
  outtextxy(55+2*45*3,160,'Waage');
  outtextxy(55+3*45*3,160,'Jungfrau');

  outtextxy(55,290,'Lîwe');
  outtextxy(55+3*45,290,'Krebs');
  outtextxy(55+6*45,290,'Zwillinge');
  outtextxy(55+9*45,290,'Stier');

  outtextxy(55,420,'Widder');
  outtextxy(55+3*45,420,'Fische');
  outtextxy(55+6*45,420,'Wassermann');
  outtextxy(55+9*45,420,'Steinbock');


   rechnung;
    if (0 <= thilfe) and (thilfe <= umlaufT[5]/3) then
    begin
      sector(590-round(4.5*(thilfe)/umlaufT[5]*360),370,0,360,3,3);
    end;

   if (umlaufT[5]/3 < thilfe) and (thilfe <= 2*umlaufT[5]/3) then
    begin
      sector(590-round(4.5*(thilfe-umlaufT[5]/3)/umlaufT[5]*360),240,0,360,3,3);
    end;

     if (2*umlaufT[5]/3 < thilfe) and (thilfe < umlaufT[5]) then
    begin
      sector(590-round(4.5*(thilfe-2*umlaufT[5]/3)/umlaufT[5]*360),110,0,360,3,3);
    end;


    setcolor(farbe[i]);setfillstyle(1,farbe[i]);

    if (-90 <= winkel[i]) and (winkel[i] <= 30) then
    begin
       sector(455+round(4.5*winkel[i]),110-round(4.5*sehw[i]),0,360,3,3);
    end;

    if (30 < winkel[i]) and (winkel[i] <= 150) then
    begin
       sector(-85+round(4.5*winkel[i]),240-round(4.5*sehw[i]),0,360,3,3);
    end;

    if (150 <= winkel[i]) and (winkel[i] < 270) then
    begin
       sector(-625+round(4.5*winkel[i]),370-round(4.5*sehw[i]),0,360,3,3);
    end;
end;

    delay(20);

    t:=t+dt;
    hilfe:=hilfe+dt;
    thilfe:=thilfe+dt;
    if thilfe >= umlaufT[5] then
    begin
      jahr:=jahr+1;
      thilfe := thilfe - umlaufT[5];
    end;

    setcolor(0);
    outtextxy(150,440,Zeit);
    outtextxy(50,440,Zeit1);

    setcolor(15);
    str(thilfe:5:0,Zeit);
    str(jahr:5,Zeit1);
    outtextxy(150,440,Zeit);
    outtextxy(50,440,Zeit1);

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
     'u':
     begin
       dt:=-dt;
       wahl:=' ';
     end;
    'p':wahl:=readkey;
       'z':
      begin
        cleardevice;
        grafik;
        grafik2;
        setcolor(15);
        circle(340,260,17);
        dt:=1;
        setcolor(farbe[i]);

        exit;
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

procedure umlauf5;
begin
  jahr:=0;
  t:=0.1;
  thilfe:=t;
  dt:=0.4;
  wahl:=' ';
  rechnung;
  outtextxy(220,30,'Schleifenmuster von '+planame[i]);
      outtextxy(10,460,'zurÅck zum Planeten -> z');

  str(bahnnei[i]:4:1,winkel2);
  outtextxy(70,210,'Bahnneigung betrÑgt: '+winkel2+'¯');
  outtextxy(70,220,'Winkelabstand zur Sonne: ');
  outtextxy(400,210,'ist der gesehene Winkel');
  outtextxy(120,411,'Rektaszension in Grad:');
 tierkreis5;
    setcolor(15);
    line(190,150,590,150);
    line(50,320,590,320);

    k:=200;
    l:=round(k*1.9*sin(2*pi*bahnnei[i]/360));
    line(390+k,150-l,390-k,150+l);

    sector(390+round(fak3*xkoord[5]/3.8),150,0,360,3,3);

    circle(140,150,37);

     for k1 := 1 to 11 do
    begin
      line(50+k1*45,240,50+k1*45,400);
    end;
    outtextxy(43,330,'270¯');
    outtextxy(35+3*45,330,'180¯');
    outtextxy(40+6*45,330,'90¯');
    outtextxy(46+9*45,330,'0¯');
    outtextxy(37+12*45,330,'-90¯');

    sector(590-round(1.5*360),320,0,360,3,3);

        setcolor(farbe[i]); setFillStyle(1,farbe[i]);

    sector(140,150,0,360,round(36*abs(bahnrad[i]-bahnrad[5])/entf[i]),round(36*abs(bahnrad[i]-bahnrad[5])/entf[i]));

    sector(390+round(fak3*xkoord[i]/3.8),150-round(fak3*yneig[i]/2),0,360,3,3);
    line(390+round(fak3*xkoord[5]/3.8),150,390+round(fak3*xkoord[i]/3.8),150-round(fak3*yneig[i]/2));
    sector(185+round(1.5*winkel[i]),320-round(faktor/1.5*sehw[i]),0,360,3,3);


  repeat until keypressed;
    
  repeat
    setcolor(0); setfillstyle(1,0);
    sector(390+round(fak3*xkoord[5]/3.8),150,0,360,3,3);
    sector(390+round(fak3*xkoord[i]/3.8),150-round(fak3*yneig[i]/2),0,360,3,3);
    line(390+round(fak3*xkoord[5]/3.8),150,390+round(fak3*xkoord[i]/3.8),150-round(fak3*yneig[i]/2));
    sector(185+round(1.5*winkel[i]),320-round(faktor/1.5*sehw[i]),0,360,3,3);

   { line(50,380,410,380);
   }
     circle(140,150,round(0.4+36*abs(bahnrad[i]-bahnrad[5])/entf[i]));
     circle(140,150,round(-0.4+36*abs(bahnrad[i]-bahnrad[5])/entf[i]));
  sector(590-round(1.5*360),320,0,360,4,4);
      sector(590-round(1.5*(thilfe-dt)/umlaufT[5]*360),320,0,360,3,3);

    setcolor(15); setfillstyle(1,15);
    tierkreis5;
    for k1 := 1 to 11 do
    begin
      line(50+k1*45,240,50+k1*45,400);
    end;
    outtextxy(43,330,'270¯');
    outtextxy(35+3*45,330,'180¯');
    outtextxy(40+6*45,330,'90¯');
    outtextxy(46+9*45,330,'0¯');
    outtextxy(37+12*45,330,'-90¯');

    line(190,150,590,150);
    line(50,320,590,320);
    k:=200;
    l:=round(k*1.9*sin(2*pi*bahnnei[i]/360));
    line(390+k,150-l,390-k,150+l);
    

   rechnung;
    sector(390+round(fak3*xkoord[5]/3.8),150,0,360,3,3);

    sector(590-round(1.5*thilfe/umlaufT[5]*360),320,0,360,3,3);

    setcolor(farbe[i]);setfillstyle(1,farbe[i]);
    sector(390+round(fak3*xkoord[i]/3.8),150-round(fak3*yneig[i]/2),0,360,3,3);
    sector(185+round(1.5*winkel[i]),320-round(faktor/1.5*sehw[i]),0,360,3,3);
    sector(140,150,0,360,round(36*abs(bahnrad[i]-bahnrad[5])/entf[i]),round(36*abs(bahnrad[i]-bahnrad[5])/entf[i]));
    line(390+round(fak3*xkoord[5]/3.8),150,390+round(fak3*xkoord[i]/3.8),150-round(fak3*yneig[i]/2));

    delay(10);

    t:=t+dt;
    hilfe:=hilfe+dt;
    thilfe:=thilfe+dt;
    if thilfe >= umlaufT[5] then
    begin
      jahr:=jahr+1;
      thilfe := thilfe - umlaufT[5];
    end;

    setcolor(0);
    outtextxy(150,440,Zeit);
    outtextxy(50,440,Zeit1);
    outtextxy(300,411,winkel1);
    outtextxy(340,210,winkel3);
    outtextxy(260,220,winkelh1);

    setcolor(15);
    str(thilfe:5:0,Zeit);
    str(jahr:5,Zeit1);
    outtextxy(150,440,Zeit);
    outtextxy(50,440,Zeit1);

    setcolor(15);
    str(180-winkel[i]:5:0,winkel1);
    outtextxy(300,411,winkel1+'¯');
    str(sehw[i]:5:1,winkel3);
    outtextxy(340,210,winkel3+'¯');
    str(180-winkel[i]+winkel5:5:0,winkelh1);
    outtextxy(260,220,winkelh1+'¯');

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
     'u':
     begin
       dt:=-dt;
       wahl:=' ';
     end;
    'p':wahl:=readkey;
       'z':
      begin
        cleardevice;
        grafik;
        grafik2;
        setcolor(15);
        circle(340,260,17);
        dt:=1;
        setcolor(farbe[i]);

        exit;
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

procedure umlauf5a;
begin
  jahr:=0;
  t:=0.1;
  thilfe:=t;
  dt:=0.4;
  wahl:=' ';
    setcolor(15);
  outtextxy(220,30,'Schleifenmuster der Planeten');
  outtextxy(70,100,'Die Bahnneigungen');
  outtextxy(190,220,'Gesehene Grî·e');
tierkreis5;
  rechnung;

    setcolor(15);
    line(110,150,510,150);
    line(50,320,590,320);
for i:=1 to 4 do
begin
      m:=round(0.13*groesse[i]/(abs(bahnrad[i]-bahnrad[5])));
   circle(260+i*60,195,m+1);

    k:=200;
    l:=round(k*3.8*sin(2*pi*bahnnei[i]/360));
    line(310+k,150-l,310-k,150+l);
end;
    sector(310+round(fak3*xkoord[5]/3.8),150,0,360,3,3);

   

     for k1 := 1 to 11 do
    begin
      line(50+k1*45,240,50+k1*45,400);
    end;
    outtextxy(43,330,'270¯');
    outtextxy(33+3*45,330,'180¯');
    outtextxy(40+6*45,330,'90¯');
    outtextxy(46+9*45,330,'0¯');
    outtextxy(37+12*45,330,'-90¯');
    outtextxy(43+3*45,290,'4¯');
    outtextxy(36+3*45,370,'-4¯');
    setlinestyle(1,0,1);
    line(45,360,595,360);
    line(45,280,595,280);
    setlinestyle(0,0,0);
for i:=1 to 4 do
begin
    setcolor(farbe[i]); setFillStyle(1,farbe[i]);
      m:=round(0.13*groesse[i]/(abs(bahnrad[i]-bahnrad[5])));

    sector(260+i*60,195,0,360,round(m*abs(bahnrad[i]-bahnrad[5])/entf[i]),round(m*abs(bahnrad[i]-bahnrad[5])/entf[i]));

    sector(310+round(fak3*xkoord[i]/3.8),150-round(fak3*yneig[i]),0,360,3,3);
    line(310+round(fak3*xkoord[5]/3.8),150,310+round(fak3*xkoord[i]/3.8),150-round(fak3*yneig[i]/2));
    sector(185+round(1.5*winkel[i]),320-round(faktor/1.5*sehw[i]),0,360,3,3);
end;

  repeat until keypressed;
    
  repeat
  for i:=1 to 4 do
  begin
    setcolor(0); setfillstyle(1,0);
      m:=round(0.13*groesse[i]/(abs(bahnrad[i]-bahnrad[5])));
   sector(590-round(1.5*360),320,0,360,4,4);
 sector(590-round(1.5*(thilfe-dt)/umlaufT[5]*360),320,0,360,3,3);
    sector(310+round(fak3*xkoord[5]/3.8),150,0,360,3,3);
    sector(310+round(fak3*xkoord[i]/3.8),150-round(fak3*yneig[i]),0,360,3,3);
    line(310+round(fak3*xkoord[5]/3.8),150,310+round(fak3*xkoord[i]/3.8),150-round(fak3*yneig[i]/2));

    sector(185+round(1.5*winkel[i]),320-round(faktor/1.5*sehw[i]),0,360,3,3);

   { line(50,380,410,380);
   }
     circle(260+i*60,195,round(0.4+m*abs(bahnrad[i]-bahnrad[5])/entf[i]));
     circle(260+i*60,195,round(-0.4+m*abs(bahnrad[i]-bahnrad[5])/entf[i]));

   

    setcolor(15); setfillstyle(1,15);

    for k1 := 1 to 11 do
    begin
      line(50+k1*45,240,50+k1*45,400);
    end;

    outtextxy(43,330,'270¯');
    outtextxy(33+3*45,330,'180¯');
    outtextxy(40+6*45,330,'90¯');
    outtextxy(46+9*45,330,'0¯');
    outtextxy(37+12*45,330,'-90¯');
tierkreis5;
    line(110,150,510,150);
    line(50,320,590,320);
    {
    k:=200;
    l:=round(k*3.8*sin(2*pi*bahnnei[i]/360));
    line(310+k,150-l,310-k,150+l);
     }
    outtextxy(43+3*45,290,'4¯');
    outtextxy(36+3*45,370,'-4¯');
    setlinestyle(1,0,1);
    line(45,360,595,360);
    line(45,280,595,280);
    setlinestyle(0,0,0);
   rechnung;

    sector(310+round(fak3*xkoord[5]/3.8),150,0,360,3,3);
 sector(590-round(1.5*thilfe/umlaufT[5]*360),320,0,360,3,3);
    setcolor(farbe[i]);setfillstyle(1,farbe[i]);
    sector(310+round(fak3*xkoord[i]/3.8),150-round(fak3*yneig[i]),0,360,3,3);
    sector(185+round(1.5*winkel[i]),320-round(faktor/1.5*sehw[i]),0,360,3,3);
    sector(260+i*60,195,0,360,round(m*abs(bahnrad[i]-bahnrad[5])/entf[i]),round(m*abs(bahnrad[i]-bahnrad[5])/entf[i]));

    {
    line(310+round(fak3*xkoord[5]/3.8),150,310+round(fak3*xkoord[i]/3.8),150-round(fak3*yneig[i]/2));
   }
  end;

    delay(20);

    t:=t+dt;
    thilfe:=thilfe+dt;
    if thilfe >= umlaufT[5] then
    begin
      jahr:=jahr+1;
      thilfe := thilfe - umlaufT[5];
    end;

    setcolor(0);
    outtextxy(150,440,Zeit);
    outtextxy(50,440,Zeit1);

    setcolor(15);
    str(thilfe:5:0,Zeit);
    str(jahr:5,Zeit1);
    outtextxy(150,440,Zeit);
    outtextxy(50,440,Zeit1);
  {
    outtextxy(300,411,winkel1);
    outtextxy(340,210,winkel3);
  }
  {
    str(180-winkel[i]:5:0,winkel1);
    outtextxy(300,411,winkel1+'¯');
    str(sehw[i]:5:1,winkel3);
    outtextxy(340,210,winkel3+'¯');
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
     'u':
     begin
       dt:=-dt;
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




  
procedure graphikj;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(1);
  setcolor(15);
  outtextxy(120,15,'Bewegung der Galileischen Monde um den Jupiter');
  outtextxy(420,430,'pause -> p');
  outtextxy(415,440,'weiter -> w');
  outtextxy(350,450,'doppelte Geschwindigkeit -> d');
  outtextxy(370,460,'halbe Geschwindigkeit -> h');
  outtextxy(410,470,'beenden -> b');
    outtextxy(60,430,'zurÅck zum Planeten -> z');
  outtextxy(60,440,'zurÅck zur öbersicht -> e');

  outtextxy(450,350,'Tage:');
  outtextxy(450,360,'Stunden:');
  setcolor(14);
  outtextxy(90,320,'(1) : Io');
  setcolor(12);
  outtextxy(90,330,'(2) : Europa');
  setcolor(11);
  outtextxy(90,340,'(3) : Ganymed');
  setcolor(9);
  outtextxy(90,350,'(4) : Kallisto');
  setcolor(15);
  line(70,30,570,30);
  line(70,420,570,420);
  line(70,30,70,420);
  line(570,30,570,420);
  line(70,380,570,380);
end;


procedure umlaufj;
begin
  r1:=42.2/1.2;
  r2:=67.1/1.2;
  r3:=107.1/1.2;
  r4:=188.3/1.2;

  t1:=1.769;
  t2:=3.551;
  t3:=7.155;
  t4:=16.69;

  t:=0;
  dt:=0.008;
  wahl:=' ';
  x11:=0;x12:=0;x3:=0;x4:=0;
  y11:=r1;y12:=r2;y3:=r3;y4:=r4;
  setcolor(15);setfillstyle(1,15);
  sector(320,200,0,360,7,7);
  sector(320,400,0,360,7,7);

  setcolor(14);setfillstyle(1,14);
  sector(320+round(x11),200+round(y11),0,360,2,2);
  sector(320+round(x11),400,0,360,2,2);

  setcolor(12);setfillstyle(1,12);
  sector(320+round(x12),200+round(y12),0,360,2,2);
  sector(320+round(x12),400,0,360,2,2);

  setcolor(11);setfillstyle(1,11);
  sector(320+round(x3),200+round(y3),0,360,2,2);
  sector(320+round(x3),400,0,360,2,2);

  setcolor(9);setfillstyle(1,9);
  sector(320+round(x4),200+round(y4),0,360,2,2);
  sector(320+round(x4),400,0,360,2,2);

  repeat until keypressed;

  repeat
    phi1:=2*pi/t1*t;phi2:=2*pi/t2*t;phi3:=2*pi/t3*t;phi4:=2*pi/t4*t;
    setcolor(0);setfillstyle(1,0);
    sector(320+round(x11),200+round(y11),0,360,2,2);
    sector(320+round(x12),200+round(y12),0,360,2,2);
    sector(320+round(x3),200+round(y3),0,360,2,2);
    sector(320+round(x4),200+round(y4),0,360,2,2);

    sector(320+round(x11),400,0,360,2,2);
    sector(320+round(x12),400,0,360,2,2);
    sector(320+round(x3),400,0,360,2,2);
    sector(320+round(x4),400,0,360,2,2);

    setcolor(15);

    line(313,400,327,400);

    x11:=r1*sin(phi1);x12:=r2*sin(phi2);x3:=r3*sin(phi3);x4:=r4*sin(phi4);
    y11:=r1*cos(phi1);y12:=r2*cos(phi2);y3:=r3*cos(phi3);y4:=r4*cos(phi4);
    setcolor(14);setfillstyle(1,14);
    sector(320+round(x11),200+round(y11),0,360,2,2);
    sector(320+round(x11),400,0,360,2,2);

    setcolor(12);setfillstyle(1,12);
    sector(320+round(x12),200+round(y12),0,360,2,2);
    sector(320+round(x12),400,0,360,2,2);

    setcolor(11);setfillstyle(1,11);
    sector(320+round(x3),200+round(y3),0,360,2,2);
    sector(320+round(x3),400,0,360,2,2);

    setcolor(9);setfillstyle(1,9);
    sector(320+round(x4),200+round(y4),0,360,2,2);
    sector(320+round(x4),400,0,360,2,2);

    setcolor(15);

{    t:=t+dt;
    thilfe:=thilfe+dt;
    if thilfe >= 24 then
    begin
      std:=std+1;
      thilfe := thilfe - 24;
    end;
}

    delay(80);

    t:=t+dt;
    std:=frac(t)*24;

    setcolor(0);
    outtextxy(510,350,Zeit1);
    outtextxy(510,360,Zeit2);
    setcolor(15);
    str(trunc(t):5,Zeit1);
    str(trunc(std):5,Zeit2);
    outtextxy(510,350,Zeit1);
    outtextxy(510,360,Zeit2);
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
     'u':
     begin
       dt:=-dt;
       wahl:=' ';
     end;

    'p':wahl:=readkey;
    'z':
      begin
        cleardevice;
        grafik;
        grafik2;
        setcolor(15);
        circle(340,260,17);
        dt:=1;
        setcolor(farbe[i]);
        
        exit;
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

procedure jupmond;
begin
  graphikj;
  umlaufj;
end;

procedure umlauf2a;
begin
  jahr:=0;
  t:=0.1;
  thilfe:=t;
  dt:=0.4;
  wahl:=' ';
  outtextxy(410,70,'Rektaszension in Grad');
  outtextxy(440,100,'Winkelabstand zur');
  outtextxy(480,110,'Sonne');
  outtextxy(90,30,'Winkelabstand von '+planame[i]+' zur Sonne und zum FrÅhlingspunkt');
  rechnung;
        outtextxy(10,460,'zurÅck zum Planeten -> z');

  setcolor(15);
  circle(610,390,21);
  setFillStyle(1,15);
  sector(340,230,0,360,3,3);
    setcolor(farbe[i]);
    x1:=340+round(xkoord[5]*2*faku2[i]);
    x2:=340+round(xkoord[i]*2*faku2[i]);
    y1:=230+round(ykoord[5]*2*faku2[i]);
    y2:=230+round(ykoord[i]*2*faku2[i]);
    setFillStyle(1,farbe[i]);
    sector(340+round(xkoord[i]*2*faku2[i]),230+round(ykoord[i]*2*faku2[i]),0,360,2,2);
    line(x1,y1,x2,y2);
    setcolor(6);setFillStyle(1,6);
    sector(340+round(xkoord[5]*2*faku2[i]),230+round(ykoord[5]*2*faku2[i]),0,360,2,2);
    setcolor(15);
    line(340+round(xkoord[5]*2*faku2[i]),230+round(ykoord[5]*2*faku2[i]),150,230+round(ykoord[5]*2*faku2[i]));
    setlinestyle(1,0,1);
    line(x1,y1,340,230);
    setlinestyle(0,0,1);
    setcolor(farbe[i]); setFillStyle(1,farbe[i]);

    sector(610,390,0,360,round(20*abs(bahnrad[i]-bahnrad[5])/entf[i]),round(20*abs(bahnrad[i]-bahnrad[5])/entf[i]));

  repeat until keypressed;
    
  repeat
    setcolor(0); setfillstyle(1,0);

    sector(340+round(xkoord[5]*2*faku2[i]),230+round(ykoord[5]*2*faku2[i]),0,360,2,2);
    line(x1,y1,x2,y2);

    line(x1,y1,340,230);
    sector(340+round(xkoord[i]*2*faku2[i]),230+round(ykoord[i]*2*faku2[i]),0,360,2,2);

    line(340+round(xkoord[5]*2*faku2[i]),230+round(ykoord[5]*2*faku2[i]),150,230+round(ykoord[5]*2*faku2[i]));

     circle(610,390,round(0.4+20*abs(bahnrad[i]-bahnrad[5])/entf[i]));
     circle(610,390,round(-0.4+20*abs(bahnrad[i]-bahnrad[5])/entf[i]));

    rechnung;

    setcolor(15); setfillstyle(1,15);

      sector(340,230,0,360,3,3);

    setcolor(farbe[i]);  setfillstyle(1,farbe[i]);
    sector(340+round(xkoord[i]*2*faku2[i]),230+round(ykoord[i]*2*faku2[i]),0,360,2,2);

    x1:=340+round(xkoord[5]*2*faku2[i]);
    x2:=340+round(xkoord[i]*2*faku2[i]);
    y1:=230+round(ykoord[5]*2*faku2[i]);
    y2:=230+round(ykoord[i]*2*faku2[i]);

    line(x1,y1,x2,y2);
    
    sector(610,390,0,360,round(20*abs(bahnrad[i]-bahnrad[5])/entf[i]),round(20*abs(bahnrad[i]-bahnrad[5])/entf[i]));
      setcolor(6);setfillstyle(1,6);
    sector(340+round(xkoord[5]*2*faku2[i]),230+round(ykoord[5]*2*faku2[i]),0,360,2,2);

    setcolor(15);setfillstyle(1,15);
    line(340+round(xkoord[5]*2*faku2[i]),230+round(ykoord[5]*2*faku2[i]),150,230+round(ykoord[5]*2*faku2[i]));
    setlinestyle(1,0,1);
    line(x1,y1,340,230);
    setlinestyle(0,0,1);
    setcolor(farbe[i]);setfillstyle(1,farbe[i]);

    delay(80);

    t:=t+dt;

    thilfe:=thilfe+dt;
    if thilfe >= umlaufT[5] then
    begin
      jahr:=jahr+1;
      thilfe := thilfe - umlaufT[5];
    end;

    setcolor(0);
    outtextxy(150,440,Zeit);
    outtextxy(50,440,Zeit1);
    outtextxy(530,110,winkelh1);
    outtextxy(530,80,winkel1);
    setcolor(15);
    str(thilfe:5:0,Zeit);
    str(jahr:5,Zeit1);
    outtextxy(150,440,Zeit);
    outtextxy(50,440,Zeit1);
    str(180-winkel[i]:5:0,winkel1);
    str(180-winkel[i]+winkel5:5:0,winkelh1);
    outtextxy(530,80,winkel1+'¯');

    outtextxy(530,110,winkelh1+'¯');
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
     'u':
     begin
       dt:=-dt;
       wahl:=' ';
     end;

    'p':wahl:=readkey;
      'z':
      begin
        cleardevice;
        grafik;
        grafik2;
        setcolor(15);
        circle(340,260,17);
        dt:=1;
        setcolor(farbe[i]);
        
        exit;
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


procedure umlauf2;
begin
  jahr:=0;
  t:=0.1;
  thilfe:=t;
  dt:=0.4;
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
    y1:=160+round(ykoord[5]*fak2);
    y2:=160+round(ykoord[i]*fak2);
    setFillStyle(1,farbe[i]);
    sector(160+round(xkoord[i]*fak2),160+round(ykoord[i]*fak2),0,360,2,2);
    line(x1,y1,x1+m*(x2-x1),y1+m*(y2-y1));

    setcolor(6);setFillStyle(1,6);
    sector(160+round(xkoord[5]*fak2),160+round(ykoord[5]*fak2),0,360,2,2);
    setcolor(15);
    line(50,380,410,380);
    line(160+round(xkoord[5]*fak2),160+round(ykoord[5]*fak2),55,160+round(ykoord[5]*fak2));

      setFillStyle(1,15);
    sector(480-round(xkoord[5]*fak2),160-round(ykoord[5]*fak2),0,360,2,2);

    setcolor(farbe[i]); setFillStyle(1,farbe[i]);
    sector(480+round(xschein[i]*fak2),160+round(yschein[i]*fak2),0,360,2,2);

    sector(480-round(xkoord[i]*fak4),310+round(yneig[i]),0,360,2,2);
    sector(140+round(winkel[i]),380+round(fak5*sehw[i]),0,360,2,2);
    sector(340,260,0,360,round(16*abs(bahnrad[i]-bahnrad[5])/entf[i]),round(16*abs(bahnrad[i]-bahnrad[5])/entf[i]));

  repeat until keypressed;
    
  repeat
    setcolor(0); setfillstyle(1,0);

    sector(160+round(xkoord[5]*fak2),160+round(ykoord[5]*fak2),0,360,2,2);
    sector(480-round(xkoord[5]*fak2),160-round(ykoord[5]*fak2),0,360,2,2);

    line(x1,y1,x1+m*(x2-x1),y1+m*(y2-y1));

    sector(160+round(xkoord[i]*fak2),160+round(ykoord[i]*fak2),0,360,2,2);

    line(160+round(xkoord[5]*fak2),160+round(ykoord[5]*fak2),55,160+round(ykoord[5]*fak2));

     circle(340,260,round(0.4+16*abs(bahnrad[i]-bahnrad[5])/entf[i]));
     circle(340,260,round(-0.4+16*abs(bahnrad[i]-bahnrad[5])/entf[i]));
    sector(480-round(xkoord[5]*fak2),160-round(ykoord[5]*fak2),0,360,2,2);
    sector(480+round(xschein[i]*fak2),160+round(yschein[i]*fak2),0,360,2,2);
    sector(480-round(xkoord[i]*fak4),310+round(yneig[i]),0,360,2,2);
    sector(140+round(winkel[i]),380+round(fak5*sehw[i]),0,360,2,2);

    rechnung;

    setcolor(6); setfillstyle(1,6);
    sector(480,160,0,360,2,2);

    setcolor(15); setfillstyle(1,15);

      sector(160,160,0,360,3,3);line(470,310,490,310);

    line(50,380,410,380);
    setcolor(farbe[i]);  setfillstyle(1,farbe[i]);
    sector(160+round(xkoord[i]*fak2),160+round(ykoord[i]*fak2),0,360,2,2);

    x1:=160+round(xkoord[5]*fak2);
    x2:=160+round(xkoord[i]*fak2);
    y1:=160+round(ykoord[5]*fak2);
    y2:=160+round(ykoord[i]*fak2);

    line(x1,y1,x1+m*(x2-x1),y1+m*(y2-y1));

    sector(340,260,0,360,round(16*abs(bahnrad[i]-bahnrad[5])/entf[i]),round(16*abs(bahnrad[i]-bahnrad[5])/entf[i]));
    setcolor(6);setfillstyle(1,6);
    sector(160+round(xkoord[5]*fak2),160+round(ykoord[5]*fak2),0,360,2,2);

    setcolor(15);setfillstyle(1,15);
    line(160+round(xkoord[5]*fak2),160+round(ykoord[5]*fak2),55,160+round(ykoord[5]*fak2));
    sector(480-round(xkoord[5]*fak2),160-round(ykoord[5]*fak2),0,360,2,2);

    setcolor(farbe[i]);setfillstyle(1,farbe[i]);


    sector(480+round(xschein[i]*fak2),160+round(yschein[i]*fak2),0,360,2,2);
    sector(480-round(xkoord[i]*fak4),310+round(yneig[i]),0,360,2,2);
    sector(140+round(winkel[i]),380+round(fak5*sehw[i]),0,360,2,2);

    delay(50);

    t:=t+dt;

    thilfe:=thilfe+dt;
    if thilfe >= umlaufT[5] then
    begin
      jahr:=jahr+1;
      thilfe := thilfe - umlaufT[5];
    end;

    setcolor(0);
    outtextxy(150,450,Zeit);
    outtextxy(50,450,Zeit1);

    outtextxy(250,80,winkel1);
    setcolor(15);
    str(thilfe:5:0,Zeit);
    str(jahr:5,Zeit1);
    outtextxy(150,450,Zeit);
    outtextxy(50,450,Zeit1);
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
     'u':
     begin
       dt:=-dt;
       wahl:=' ';
     end;

    'p':wahl:=readkey;
    '1':
     begin
       cleardevice;
       graphik1;
       umlauf2a;
     end;

    '2':
     begin
       cleardevice;
       graphik1;
       umlauf4;
     end;
     '3':
     begin
       cleardevice;
       graphik2;
       umlauf5;
     end;
     '5':jupmond;
     '4':
     begin
       cleardevice;
       graphik3;
       umlauf5b;
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
 
  setcolor(farbe[i]);
  umlauf2;
end;

procedure umlauf1a;
begin
  jahr:=0;
  t:=0.1;
  thilfe:=t;
  dt:=0.4;
  wahl:=' ';
  setcolor(15);
  outtextxy(190,30,'Bewegung der Planeten um die Sonne');
 for i:= 1 to 4 do
 begin
  setlinestyle(0,0,1);
  rechnung;
    setcolor(6);setfillstyle(1,6);
    sector(320+round(xkoord[5]/5),230+round(ykoord[5]/5),0,360,2,2);
  setcolor(15); setfillstyle(1,15);
  m:=round(0.09*groesse[i]/(abs(bahnrad[i]-bahnrad[5])));
   circle(610,210+50*i,m+1);

  sector(320,230,0,360,4,4);
     setcolor(farbe[i]);setfillstyle(1,farbe[i]);
      outtextxy(50+i*100,400,planame[i]);
 {
    line(320+round(xkoord[5]/5),230+round(ykoord[5]/5),320+round(xkoord[i]/5),230+round(ykoord[i]/5));
  }
    sector(320+round(xkoord[i]/5),230+round(ykoord[i]/5),0,360,2,2);
    sector(610,210+50*i,0,360,round(m*abs(bahnrad[i]-bahnrad[5])/entf[i]),round(m*abs(bahnrad[i]-bahnrad[5])/entf[i]));
 end;
  repeat until keypressed;

  repeat

 
  for i:= 1 to 4 do
  begin
       setcolor(0);setfillstyle(1,0);
    setlinestyle(0,0,3);
   line(320+round(xkoord[5]/5),230+round(ykoord[5]/5),320+round(xkoord[i]/5),230+round(ykoord[i]/5));
setlinestyle(0,0,1);
       setfillstyle(1,0);
       m:=round(0.09*groesse[i]/(abs(bahnrad[i]-bahnrad[5])));
    circle(610,210+50*i,round(0.4+m*abs(bahnrad[i]-bahnrad[5])/entf[i]));
    circle(610,210+50*i,round(-0.4+m*abs(bahnrad[i]-bahnrad[5])/entf[i]));
    sector(320+round(xkoord[i]/5),230+round(ykoord[i]/5),0,360,2,2);
    sector(320+round(xkoord[5]/5),230+round(ykoord[5]/5),0,360,2,2);

       rechnung;

    setcolor(15);setfillstyle(1,15);
      sector(320,230,0,360,4,4);
    setcolor(farbe[i]);
         setlinestyle(1,0,1);
 
    line(320+round(xkoord[5]/5),230+round(ykoord[5]/5),320+round(xkoord[i]/5),230+round(ykoord[i]/5));
         setlinestyle(0,0,1);
 
     setfillstyle(1,farbe[i]);
    sector(320+round(xkoord[i]/5),230+round(ykoord[i]/5),0,360,2,2);
    sector(610,210+50*i,0,360,round(m*abs(bahnrad[i]-bahnrad[5])/entf[i]),round(m*abs(bahnrad[i]-bahnrad[5])/entf[i]));

    setcolor(6);setfillstyle(1,6);
    sector(320+round(xkoord[5]/5),230+round(ykoord[5]/5),0,360,2,2);

  end;

    delay(20);

    t:=t+dt;
    thilfe:=thilfe+dt;
    if thilfe >= umlaufT[5] then
    begin
      jahr:=jahr+1;
      thilfe := thilfe - umlaufT[5];
    end;

    setcolor(0);
    outtextxy(150,440,Zeit);
    outtextxy(50,440,Zeit1);

    setcolor(15);
    str(thilfe:5:0,Zeit);
    str(jahr:5,Zeit1);
    outtextxy(150,440,Zeit);
    outtextxy(50,440,Zeit1);

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
     'u':
     begin
       dt:=-dt;
       wahl:=' ';
     end;

     'e':
     begin
       cleardevice;
       grafik;
       grafik1;
       exit;
     end;
    'p':wahl:=readkey;
  end;
  until wahl='b';
end;



procedure umlauf1;
begin
  feldfuellen;
  jahr:=0;
  t:=0.1;
  thilfe:=t;
  dt:=0.4;
  wahl:=' ';

 for i:= 1 to 4 do
 begin

  rechnung;
    setcolor(6);setfillstyle(1,6);
    sector(160+round(xkoord[5]/10),160+round(ykoord[5]/10),0,360,2,2);
  sector(480,160,0,360,2,2);
  setcolor(15);setfillstyle(1,15);
    line(50,380,410,380);
  sector(160,160,0,360,2,2);
     setcolor(farbe[i]);setfillstyle(1,farbe[i]);
    sector(160+round(xkoord[i]/10),160+round(ykoord[i]/10),0,360,2,2);

    sector(480+round(xschein[i]/10),160+round(yschein[i]/10),0,360,2,2);
    sector(480-round(xkoord[i]/10),310+round(yneig[i]),0,360,2,2);
    sector(140+round(winkel[i]),380+round(3*sehw[i]),0,360,2,2);
  end;
  repeat until keypressed;

  repeat

 
  for i:= 1 to 4 do
  begin
       setcolor(0);setfillstyle(1,0);
    sector(160+round(xkoord[i]/10),160+round(ykoord[i]/10),0,360,2,2);
    sector(160+round(xkoord[5]/10),160+round(ykoord[5]/10),0,360,2,2);
    sector(480+round(xschein[i]/10),160+round(yschein[i]/10),0,360,2,2);
    sector(480-round(xkoord[i]/10),310+round(yneig[i]),0,360,2,2);
    sector(140+round(winkel[i]),380+round(3*sehw[i]),0,360,2,2);

       rechnung;

    setcolor(6);setfillstyle(1,6);
    sector(480,160,0,360,2,2);
    setcolor(15);setfillstyle(1,15);
     line(50,380,410,380);
      sector(160,160,0,360,2,2);line(470,310,490,310);
    setcolor(farbe[i]); setfillstyle(1,farbe[i]);
    sector(160+round(xkoord[i]/10),160+round(ykoord[i]/10),0,360,2,2);

    setcolor(6);setfillstyle(1,6);
    sector(160+round(xkoord[5]/10),160+round(ykoord[5]/10),0,360,2,2);

  
    setcolor(farbe[i]);setfillstyle(1,farbe[i]);
    sector(480+round(xschein[i]/10),160+round(yschein[i]/10),0,360,2,2);
    sector(480-round(xkoord[i]/10),310+round(yneig[i]),0,360,2,2);
    sector(140+round(winkel[i]),380+round(3*sehw[i]),0,360,2,2);
  end;

    delay(20);

    t:=t+dt;

    thilfe:=thilfe+dt;
    if thilfe >= umlaufT[5] then
    begin
      jahr:=jahr+1;
      thilfe := thilfe - umlaufT[5];
    end;

    setcolor(0);
    outtextxy(150,450,Zeit);
    outtextxy(50,450,Zeit1);

    setcolor(15);
    str(thilfe:5:0,Zeit);
    str(jahr:5,Zeit1);
    outtextxy(150,450,Zeit);
    outtextxy(50,450,Zeit1);

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
     'u':
     begin
       dt:=-dt;
       wahl:=' ';
     end;

    'm':merkur;
    'v':venus;
    'M':mars;
    'j':jupiter;

    '0':planeten;
    '1':
       begin
         cleardevice;
         graphik1;
         umlauf1a;
       end;
    '2':
     begin
       fak1:=0.2;
       cleardevice;
       graphik1;
       umlauf4a;
     end;
     '3':
          begin
       faktor:=15;
       fak3:=0.95;
       cleardevice;
       graphik2;
       umlauf5a;
     end;

     '4':
     begin
       cleardevice;
       graphik3;
       umlauf5c;
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