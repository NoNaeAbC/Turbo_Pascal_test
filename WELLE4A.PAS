program welle4a;
uses crt,graph;
var
  k2,k1,farbe,farbe1,farbe2,N,l,m,k,treiber,modus,zeit:integer;
  z1,z2,s,lambda1,x4,x5,y4,y5,a,ares,alpha,x0,xres,y0,yres,f,arg,arg1,z,lambda,phi,b,g,x,y,y1:real;
  x1,xres1,yres1,ares1,a1,f1,f2,f3,f4:real;
  wahl1,wahl:char;
  ortx1,ortx2,ortx3,ortx4,ortx5,ortx6,ortx7,ortx9,ortampl:string;

procedure menue;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(7);
  setcolor(1);
  outtextxy(100,100,'Intensit„t beim Einfachspalt  ->  1');
  outtextxy(100,150,'Intensit„t beim Doppelspalt  -> 2');
  outtextxy(100,200,'Intensit„t beim Gitter  -> 3');
  outtextxy(100,250,'Amplitudenaddition beim Gitter  -> 4');
  outtextxy(100,300,'Amplitudenaddition beim Einfachspalt  -> 5');
  outtextxy(100,350,'Amplitude beim Gitter ( genauer )  -> 6');
  outtextxy(100,400,'Ornamente  -> 7  und  8');
  outtextxy(400,450,'beenden  ->  b');
end;

procedure graphik;
begin
  setbkcolor(1);
  setcolor(12);
  outtextxy(350,40,'weitere Farbe setzen/l”schen (1/0)');
  setcolor(15);
  line(10,30,630,30);
  line(10,440,630,440);
  line(10,30,10,440);
  line(630,30,630,440);
  line(120,251,520,251);
  line(320-round(z),251,320-round(z),256);
  line(320-round(2*z),251,320-round(2*z),256);
  line(320+round(z),251,320+round(z),256);
  line(320+round(2*z),251,320+round(2*z),256);
  outtextxy(315+round(2*z),261,'2ø');
  outtextxy(315+round(z),261,'1ø');
  outtextxy(310-round(2*z),261,'-2ø');
  outtextxy(310-round(z),261,'-1ø');
  outtextxy(315,261,'0ø');
  outtextxy(540,270,'phi');
  line(320,251,320,256);
  str(z:4:0,ortx1);
  outtextxy(130,420,ortx1);
  outtextxy(30,420,'Zoomfaktor = ');
  str(lambda:5:3,ortx2);
  outtextxy(330,420,ortx2+' æm');
  outtextxy(250,420,'lambda =');
  str(b:4:0,ortx3);
  outtextxy(530,420,ortx3+' æm');
  outtextxy(500,420,'b = ');
  outtextxy(30,450,'lambda ver„ndern (l/L)   b ver„ndern (b/B)   Zoomfaktor ver„ndern (z/Z) ');
 if l=1 then
 begin
  line(320-round(3*z),251,320-round(3*z),256);
  line(320+round(3*z),251,320+round(3*z),256);
  outtextxy(315+round(3*z),261,'3ø');
  outtextxy(310-round(3*z),261,'-3ø');
  outtextxy(175,15,'Intensit„tskurve eines Einzelspaltes ');
  outtextxy(110,470,'alles ver„ndern (v)   wiederherstellen (w)   beenden (e)');
 end;
 if l=2 then
 begin
  str(g:4:0,ortx4);
  outtextxy(530,400,ortx4+' æm');
  outtextxy(500,400,'g = ');
  outtextxy(175,15,'Intensit„tskurve eines Doppelspaltes ');
  outtextxy(15,470,'alles ver„ndern (v)   wiederherstellen (w)   g ver„ndern (g/G)   beenden (e)');
 end;
 if l=3 then
 begin
  str(g:4:0,ortx4);
  outtextxy(530,400,ortx4+' æm');
  outtextxy(500,400,'g = ');
  str(N:4,ortx5);
  outtextxy(305,400,ortx5+' Spalte');
  outtextxy(290,400,'k = ');
  outtextxy(205,15,'Intensit„tskurve eines Gitters ');
  outtextxy(20,470,'wiederherstellen (w)   k ver„ndern (k/K)  g ver„ndern (g/G)   beenden (e)');
  outtextxy(50,305,'Gitter');
  outtextxy(20,345,'Doppelspalt');
 end;
end;

procedure setz0;
begin
    x:=-200/z;
    setcolor(14);
    repeat
      x:=x+2/z;
       if x<>0 then
       begin
        phi:=x/180*pi;
        arg:=pi*b/lambda*sin(phi);
      if l=1 then
        y:=f*200*sin(arg)*sin(arg)/arg/arg;
      if (l=2) or (l=3) then
      begin
       arg1:=pi*g/lambda*sin(phi);
         if sin(arg1)<>0 then
       y:=f*200*sin(arg)*sin(arg)/arg/arg*sin(N*arg1)*sin(N*arg1)/sin(arg1)/sin(arg1);
      end;
        if y>160 then line(round(320+z*x),299,round(320+z*x),313);
        if (90<y) and (y<=160) then
          line(round(320+z*x),300,round(320+z*x),312);
        if (50<y) and (y<=90) then
          line(round(320+z*x),301,round(320+z*x),311);
        if (20<y) and (y<=50) then
          line(round(320+z*x),302,round(320+z*x),310);
        if (5<y) and (y<=20) then
          line(round(320+z*x),303,round(320+z*x),309);
        if (2.5<y) and (y<=5) then
          line(round(320+z*x),304,round(320+z*x),308);
        if (1<=y) and (y<=2.5) then
          line(round(320+z*x),305,round(320+z*x),307);
      end;
    until x>=200/z;
end;

procedure setz03;
begin
    x:=-200/z;
    setcolor(14);
    repeat
      x:=x+2/z;
       if x<>0 then
       begin
        phi:=x/180*pi;
        arg:=pi*b/lambda*sin(phi);
        arg1:=pi*g/lambda*sin(phi);
          if sin(arg1)<>0 then
          y:=50*sin(arg)*sin(arg)/arg/arg*sin(2*arg1)*sin(2*arg1)/sin(arg1)/sin(arg1);

        if y>160 then line(round(320+z*x),339,round(320+z*x),353);
        if (90<y) and (y<=160) then
          line(round(320+z*x),340,round(320+z*x),352);
        if (50<y) and (y<=90) then
          line(round(320+z*x),341,round(320+z*x),351);
        if (20<y) and (y<=50) then
          line(round(320+z*x),342,round(320+z*x),350);
        if (5<y) and (y<=20) then
          line(round(320+z*x),343,round(320+z*x),349);
        if (2.5<y) and (y<=5) then
          line(round(320+z*x),344,round(320+z*x),348);
        if (1<=y) and (y<=2.5) then
          line(round(320+z*x),345,round(320+z*x),347);
      end;
    until x>=200/z;
end;

procedure setz000;
begin
    x:=-199/z;
    setcolor(12);
    repeat
      x:=x+2/z;
       if x<>0 then
       begin
        phi:=x/180*pi;
        arg:=pi*b/lambda1*sin(phi);
      if l=1 then
        y:=f*200*sin(arg)*sin(arg)/arg/arg;
      if (l=2) or (l=3) then
      begin
       arg1:=pi*g/lambda1*sin(phi);
         if sin(arg1)<>0 then
       y:=f*200*sin(arg)*sin(arg)/arg/arg*sin(N*arg1)*sin(N*arg1)/sin(arg1)/sin(arg1);
      end;
        if y>160 then line(round(320+z*x),299,round(320+z*x),313);
        if (90<y) and (y<=160) then
          line(round(320+z*x),300,round(320+z*x),312);
        if (50<y) and (y<=90) then
          line(round(320+z*x),301,round(320+z*x),311);
        if (20<y) and (y<=50) then
          line(round(320+z*x),302,round(320+z*x),310);
        if (5<y) and (y<=20) then
          line(round(320+z*x),303,round(320+z*x),309);
        if (2.5<y) and (y<=5) then
          line(round(320+z*x),304,round(320+z*x),308);
        if (1<=y) and (y<=2.5) then
          line(round(320+z*x),305,round(320+z*x),307);
      end;
    until x>=200/z;
end;

procedure setz003;
begin
    x:=-199/z;
    setcolor(12);
    repeat
      x:=x+2/z;
       if x<>0 then
       begin
        phi:=x/180*pi;
        arg:=pi*b/lambda1*sin(phi);
        arg1:=pi*g/lambda1*sin(phi);
          if sin(arg1)<>0 then
          y:=50*sin(arg)*sin(arg)/arg/arg*sin(2*arg1)*sin(2*arg1)/sin(arg1)/sin(arg1);

        if y>160 then line(round(320+z*x),339,round(320+z*x),353);
        if (90<y) and (y<=160) then
          line(round(320+z*x),340,round(320+z*x),352);
        if (50<y) and (y<=90) then
          line(round(320+z*x),341,round(320+z*x),351);
        if (20<y) and (y<=50) then
          line(round(320+z*x),342,round(320+z*x),350);
        if (5<y) and (y<=20) then
          line(round(320+z*x),343,round(320+z*x),349);
        if (2.5<y) and (y<=5) then
          line(round(320+z*x),344,round(320+z*x),348);
        if (1<=y) and (y<=2.5) then
          line(round(320+z*x),345,round(320+z*x),347);
      end;
    until x>=200/z;
end;

procedure s1;
begin
    x:=-200/z;
    repeat
      x:=x+1/z;
       if x<>0 then
       begin
        phi:=x/180*pi;
        arg:=pi*b/lambda*sin(phi);
          y:=f*200*sin(arg)*sin(arg)/arg/arg;
          putpixel(round(320+z*x),250-round(N*N*y),14);
       end;
    until x>=200/z;
end;

procedure s01;
begin
    x:=-200/z;
    repeat
      x:=x+1/z;
       if x<>0 then
       begin
        phi:=x/180*pi;
        arg:=pi*b/lambda1*sin(phi);
          y:=f*200*sin(arg)*sin(arg)/arg/arg;
          putpixel(round(320+z*x),250-round(N*N*y),12);
       end;
    until x>=200/z;
end;

procedure setz;
begin
    setz0;
    if (l=2) or (l=3) then s1;
    if l=3 then setz03;
    x:=-200/z;
    repeat
      if l=1 then
      x:=x+0.5/z;
      if l=2 then
      x:=x+0.2/z;
      if l=3 then
      x:=x+0.05/z;
       if x<>0 then
       begin
        phi:=x/180*pi;
        arg:=pi*b/lambda*sin(phi);
          y:=f*200*sin(arg)*sin(arg)/arg/arg;
        if l=1 then
        begin
          putpixel(round(320+z*x),250-round(y),14);
        end;
        if (l=2) or (l=3) then
        begin
         arg1:=pi*g/lambda*sin(phi);
         if sin(arg1)<>0 then
         y1:=f*200*sin(arg)*sin(arg)/arg/arg*sin(N*arg1)*sin(N*arg1)/sin(arg1)/sin(arg1);
          putpixel(round(320+z*x),250-round(y1),14);
        end;
       end;
    until x>=200/z;
end;

procedure setz001;
begin
    setz000;
    if (l=2) or (l=3) then s01;
    if l=3 then setz003;
    x:=-200/z;
    repeat
      if l=1 then
      x:=x+0.5/z;
      if l=2 then
      x:=x+0.2/z;
      if l=3 then
      x:=x+0.05/z;
       if x<>0 then
       begin
        phi:=x/180*pi;
        arg:=pi*b/lambda1*sin(phi);
          y:=f*200*sin(arg)*sin(arg)/arg/arg;
        if l=1 then
        begin
          putpixel(round(320+z*x),250-round(y),12);
        end;
        if (l=2) or (l=3) then
        begin
         arg1:=pi*g/lambda1*sin(phi);
         if sin(arg1)<>0 then
         y1:=f*200*sin(arg)*sin(arg)/arg/arg*sin(N*arg1)*sin(N*arg1)/sin(arg1)/sin(arg1);
          putpixel(round(320+z*x),250-round(y1),12);
        end;
       end;
    until x>=200/z;
end;

procedure loesch;
begin
  setfillstyle(1,1);
  bar(0,50,640,300);
  bar(120,300,520,360);
  setcolor(15);
  outtextxy(540,270,'phi');
  line(10,50,10,300);
  line(630,50,630,300);
end;

procedure setz1;
begin
  setcolor(15);
  str(z:4:0,ortx1);
  outtextxy(130,420,ortx1);
 if l=1 then
 begin
  line(320-round(3*z),251,320-round(3*z),256);
  line(320+round(3*z),251,320+round(3*z),256);
  outtextxy(315+round(3*z),261,'3ø');
  outtextxy(310-round(3*z),261,'-3ø');
 end;
  line(320-round(z),251,320-round(z),256);
  line(320-round(2*z),251,320-round(2*z),256);
  line(320+round(z),251,320+round(z),256);
  line(320+round(2*z),251,320+round(2*z),256);
  outtextxy(315+round(2*z),261,'2ø');
  outtextxy(315+round(z),261,'1ø');
  outtextxy(310-round(2*z),261,'-2ø');
  outtextxy(310-round(z),261,'-1ø');
  outtextxy(315,261,'0ø');
  line(320,251,320,256);
  line(120,251,520,251);
end;

procedure loesch1;
begin
  setcolor(1);
  outtextxy(130,420,ortx1);
end;

procedure setz2;
begin
  setz1;
  str(lambda:5:3,ortx2);
  outtextxy(330,420,ortx2+' æm');
end;

procedure loesch2;
begin
  setcolor(1);
  outtextxy(330,420,ortx2+' æm');
end;

procedure setz3;
begin
  setz1;
  str(b:4:0,ortx3);
  outtextxy(530,420,ortx3+' æm');
end;

procedure loesch3;
begin
  setcolor(1);
  outtextxy(530,420,ortx3+' æm');
end;

procedure setz4;
begin
  setz1;
  str(g:4:0,ortx4);
  outtextxy(530,400,ortx4+' æm');
end;

procedure loesch4;
begin
  setcolor(1);
  outtextxy(530,400,ortx4+' æm');
end;

procedure setz5;
begin
  setz1;
  str(N:4,ortx5);
  outtextxy(305,400,ortx5+' Spalte');
end;

procedure loesch5;
begin
  setcolor(1);
  outtextxy(305,400,ortx5+' Spalte');
end;

procedure setz9;
begin
  setcolor(12);
  str(lambda1:5:3,ortx9);
  outtextxy(545,60,ortx9+' æm');
  outtextxy(530,80,'„ndern (m/M)');
end;


procedure auswahl;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    'z':
    begin
      if z>=11 then
      begin
        loesch;
        loesch1;
        if l=1 then
        z:=z-1
        else
        z:=z-10;
        setz1;
    setz;
      end;
      wahl:=' ';
    end;
    'Z':
    begin
      loesch;
      loesch1;
      if l=1 then
      z:=z+1
      else
      z:=z+10;
      setz1;
    setz;
      wahl:=' ';
    end;
    'l':
    begin
      if lambda>=0.02 then
      begin
        loesch2;
        loesch;
        lambda:=lambda-0.01;
        setz2;
    setz;
      end;
      wahl:=' ';
    end;
    'L':
    begin
      loesch;
      loesch2;
      lambda:=lambda+0.01;
      setz2;
    setz;
      wahl:=' ';
    end;
    'm':
    begin
      if lambda1>=0.02 then
      begin
        loesch;
        lambda1:=lambda1-0.01;
        setz9;
    setz;
      graphik;
    setz000;
    setz001;
      end;
      wahl:=' ';
    end;
    'M':
    begin
      loesch;
      lambda1:=lambda1+0.01;
      setz9;
    setz;
      graphik;
    setz000;
    setz001;
      wahl:=' ';
    end;
    '1':
    begin
        setz000;
        setz001;
        setz9;
      wahl:=' ';
    end;
    '0':
    begin
      loesch;

      graphik;
      setz;
      wahl:=' ';
    end;
    'b':
    begin
      if b>=2 then
      begin
        loesch3;
        loesch;
        b:=b-1;
        setz3;
    setz;
      end;
      wahl:=' ';
    end;
    'B':
    begin
      loesch3;
      loesch;
      b:=b+1;
      setz3;
      setz;
      wahl:=' ';
    end;
    'v':
    begin
      loesch1;
      setcolor(14);
      outtextxy(40,390,'z eingeben');
      read(z);
      setz1;
      loesch2;
      outtextxy(40,390,'z eingeben');
      setcolor(14);
      outtextxy(40,390,'l eingeben');
      read(lambda);
      setz2;
      loesch3;
      outtextxy(40,390,'l eingeben');
      setcolor(14);
      outtextxy(40,390,'b eingeben');
      read(b);
      if (l=2) or (l=3) then
      begin
      setz3;
      loesch4;
      outtextxy(40,390,'b eingeben');
      setcolor(14);
      outtextxy(40,390,'g eingeben');
      read(g);
      end;
      if l=3 then
      begin
      setz4;
      loesch5;
      outtextxy(40,390,'g eingeben');
      setcolor(14);
      outtextxy(40,390,'n eingeben');
      read(n);
      f:=1/N/N;
      end;
      cleardevice;
      graphik;
      setz;
      wahl:=' ';
    end;
    'w':
    begin
      cleardevice;
      if l=1 then
      begin
        z:=50;
        f:=1;
        lambda:=0.6;
        lambda1:=0.8;
        b:=30;
        x:=-200/z;
        graphik;
        setz;
      end;
      if l=2 then
      begin
        N:=2;
        f:=1/N/N;
        z:=100;
        lambda:=0.6;
        lambda1:=0.8;
        b:=30;
        g:=150;
        x:=-200/z;
        graphik;
        setz;
      end;
      if l=3 then
      begin
        N:=3;
        f:=1/N/N;
        z:=200;
        lambda:=0.6;
        lambda1:=0.8;
        b:=30;
        g:=150;
        x:=-200/z;
        graphik;
        setz;
      end;
      wahl:=' ';
    end;
    'g':
    begin
      if (l=2) or (l=3) and (g>=10) then
      begin
        loesch;
        loesch4;
        g:=g-5;
        setz4;
    setz;
      end;
      wahl:=' ';
    end;
    'G':
    begin
    if (l=2) or (l=3) then
    begin
      loesch4;
      loesch;
      g:=g+5;
      setz4;
    setz;
      end;
      wahl:=' ';
    end;
    'k':
    begin
    if (l=3) and (n>=3) then
    begin
      loesch5;
      loesch;
      n:=n-1;
      f:=1/n/n;
      setz5;
    setz;
      end;
      wahl:=' ';
    end;
    'K':
    begin
    if (l=3) then
    begin
      loesch;
      loesch5;
      n:=n+1;
      f:=1/n/n;
      setz5;
    setz;
      end;
      wahl:=' ';
    end;
  end;
  until wahl='e';
end;

procedure graphik4;
begin
  setbkcolor(1);
  setcolor(15);
  line(10,30,630,30);
  line(10,430,630,430);
  line(10,30,10,430);
  str(k1:4,ortx3);
  outtextxy(200,410,ortx3);
  line(630,30,630,430);
  outtextxy(180,410,'k =');
  outtextxy(280,410,'beta =');
  outtextxy(70,410,'A[res]ı');
  outtextxy(20,410,'A[o]ı');
  outtextxy(20,120,'Intensit„t');
  outtextxy(420,120,'Intensit„t');
  line(485,405,485,401);
  line(530,405,530,401);
  line(575,405,575,401);
  line(620,405,620,401);
  outtextxy(437,410,'0');
  outtextxy(473,410,'pi/2');
  outtextxy(525,410,'pi');
  outtextxy(555,410,'3pi/4');
  outtextxy(605,410,'2pi');
  setcolor(9);
  outtextxy(20,40,'Der Phasenwinkel zwischen benachbarten Spalten betrage betaø. Daher ist der');
  outtextxy(97,55,'Gesamtphasenunterschied bei k Spalten gleich betaø mal k. ');
  outtextxy(23,70,'Bekanntermaáen geh”rt zu einem Gangunterschied von lambda ein Phasenwinkel  ');
  outtextxy(180,85,'von 2pi sowie das erste Hauptmaximum');
  setcolor(15);
  outtextxy(170,15,'Addition der Amplituden beim Gitter');
  outtextxy(10,450,'Anzahl der Spalte ver„ndern (k/K)  Phasenwinkel ver„ndern (p/P)    beenden (e)');
  outtextxy(200,465,'Phasenwinkel auf 0ø setzen (0)');
end;

procedure setz40;
begin
  setcolor(15);
  line(160,240,360,240);
  line(260,140,260,340);
  outtextxy(350,250,'R');
  outtextxy(235,140,'iR');
  setcolor(14);
  a:=ares/k1;
  a1:=ares1/k1;
  xres:=0;
  xres1:=0;
  yres1:=0;
  yres:=0;
  for k:=1 to k1 do
  begin
    x:=10*a*cos(k*alpha);
    x1:=10*a1*cos(k*alpha);
    x0:=xres;
    xres1:=xres1+x1;
    xres:=xres+x;
    y1:=10*a1*sin(k*alpha);
    y:=10*a*sin(k*alpha);
    y0:=yres;
    yres1:=yres1+y1;
    yres:=yres+y;
  x4:=0.95*(xres-x0)-0.05*(yres-y0);
  y4:=0.95*(yres-y0)+0.05*(xres-x0);
  x5:=0.95*(xres-x0)+0.05*(yres-y0);
  y5:=0.95*(yres-y0)-0.05*(xres-x0);
    line(round(260+x0),round(240-y0),round(260+xres),round(240-yres));
    line(round(260+x0+x4),round(240-y0-y4),round(260+xres),round(240-yres));
    line(round(260+x0+x5),round(240-y0-y5),round(260+xres),round(240-yres));
  end;

  line(40,400,40,round(400-ares1*ares1));
  line(43,round(403-ares1*ares1),40,round(400-ares1*ares1));
  line(37,round(403-ares1*ares1),40,round(400-ares1*ares1));

  setcolor(12);
  line(90,400,90,round(400-xres1*xres1/100-yres1*yres1/100));
  line(93,round(403-xres1*xres1/100-yres1*yres1/100),90,round(400-xres1*xres1/100-yres1*yres1/100));
  line(87,round(403-xres1*xres1/100-yres1*yres1/100),90,round(400-xres1*xres1/100-yres1*yres1/100));

    x4:=0.975*xres-0.025*yres;
    y4:=0.975*yres+0.025*xres;
    x5:=0.975*xres+0.025*yres;
    y5:=0.975*yres-0.025*xres;
    line(round(260+x4),round(240-y4),round(260+xres),round(240-yres));
    line(round(260+x5),round(240-y5),round(260+xres),round(240-yres));

    line(260,240,round(260+xres),round(240-yres));
if alpha<=pi*2 then
    putpixel(440+round(alpha/2/pi*180),400-round(xres1*xres1/100+yres1*yres1/100),12);
end;

procedure loesch00;
begin
  setfillstyle(1,1);
  bar(430,130,627,400);
  setcolor(15);
  line(435,401,625,401);
  line(440,405,440,401);
  setlinestyle(1,0,1);
  line(440,400,440,140);
  line(620,400,620,140);
  setlinestyle(0,0,1);
end;

procedure loesch40;
begin
  setcolor(1);
  a:=ares/k1;
  a1:=ares1/k1;
  xres:=0;
  xres1:=0;
  yres1:=0;
  yres:=0;
  for k:=1 to k1 do
  begin
    x:=10*a*cos(k*alpha);
    x1:=10*a1*cos(k*alpha);
    x0:=xres;
    xres1:=xres1+x1;
    xres:=xres+x;
    y1:=10*a1*sin(k*alpha);
    y:=10*a*sin(k*alpha);
    y0:=yres;
    yres1:=yres1+y1;
    yres:=yres+y;
  x4:=0.95*(xres-x0)-0.05*(yres-y0);
  y4:=0.95*(yres-y0)+0.05*(xres-x0);
  x5:=0.95*(xres-x0)+0.05*(yres-y0);
  y5:=0.95*(yres-y0)-0.05*(xres-x0);
    line(round(260+x0),round(240-y0),round(260+xres),round(240-yres));
    line(round(260+x0+x4),round(240-y0-y4),round(260+xres),round(240-yres));
    line(round(260+x0+x5),round(240-y0-y5),round(260+xres),round(240-yres));
  end;

  line(40,400,40,round(400-ares1*ares1));
  line(43,round(403-ares1*ares1),40,round(400-ares1*ares1));
  line(37,round(403-ares1*ares1),40,round(400-ares1*ares1));

  line(90,400,90,round(400-xres1*xres1/100-yres1*yres1/100));
  line(93,round(403-xres1*xres1/100-yres1*yres1/100),90,round(400-xres1*xres1/100-yres1*yres1/100));
  line(87,round(403-xres1*xres1/100-yres1*yres1/100),90,round(400-xres1*xres1/100-yres1*yres1/100));

    x4:=0.975*xres-0.025*yres;
    y4:=0.975*yres+0.025*xres;
    x5:=0.975*xres+0.025*yres;
    y5:=0.975*yres-0.025*xres;
    line(round(260+x4),round(240-y4),round(260+xres),round(240-yres));
    line(round(260+x5),round(240-y5),round(260+xres),round(240-yres));

    line(260,240,round(260+xres),round(240-yres));

end;

procedure setz41;
begin
  setcolor(15);
  str((alpha/pi*180):4:0,ortx4);
  outtextxy(330,410,ortx4+' ø');
end;

procedure loesch41;
begin
  setcolor(1);
  outtextxy(330,410,ortx4+' ø');
end;

procedure setz42;
begin
  setcolor(15);
  str(k1:4,ortx3);
  outtextxy(200,410,ortx3);
end;


procedure loesch42;
begin
  setcolor(1);
  outtextxy(200,410,ortx3);
end;


procedure auswahl4;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    'k':
    begin
      if k1>=3 then
      begin
        loesch40;
        loesch42;
        loesch00;
        k1:=k1-1;
        setz42;
    setz40;
      end;
      wahl:=' ';
    end;
    'K':
    begin
      loesch40;
      loesch42;
      loesch00;
      k1:=k1+1;
      setz42;
    setz40;
      wahl:=' ';
    end;
    'p':
    begin
      if alpha>=1/180*pi then
      begin
        loesch40;
        loesch41;
        alpha:=alpha-1/180*pi;
        setz41;
    setz40;
      end;
      wahl:=' ';
    end;
    'P':
    begin
      loesch40;
      loesch41;
      alpha:=alpha+1/180*pi;
      setz41;
    setz40;
      wahl:=' ';
    end;
    'V':
    begin
      loesch40;
      ares:=ares+0.5;
    setz40;
      wahl:=' ';
    end;
    'v':
    begin
      loesch40;
      ares:=ares-0.5;
    setz40;
      wahl:=' ';
    end;
    'g':
    begin
      graphik4;
      wahl:=' ';
    end;
    'z':
    begin
      loesch40;
      ares:=16;
    setz40;
      wahl:=' ';
    end;
    '0':
    begin
      loesch40;
      loesch41;
      loesch00;
      alpha:=0;
      setz41;
      setz40;
      wahl:=' ';
    end;
  end;
  until wahl='e';
end;

procedure graphik5;
begin
  setbkcolor(1);
  setcolor(15);
  line(10,30,630,30);
  line(10,430,630,430);
  line(10,30,10,430);
  str(N:4,ortx3);
  outtextxy(200,410,ortx3);
  line(630,30,630,430);
  outtextxy(180,410,'N =');
  outtextxy(270,410,'alpha =');
  outtextxy(70,410,'A[res]ı');
  outtextxy(20,410,'A[o]ı');
  outtextxy(20,120,'Intensit„t');
  outtextxy(420,120,'Intensit„t');
  line(485,405,485,401);
  line(530,405,530,401);
  line(575,405,575,401);
  line(620,405,620,401);
  outtextxy(437,410,'0');
  outtextxy(478,410,'pi');
  outtextxy(515,410,'2pi');
  outtextxy(560,410,'3pi');
  outtextxy(605,410,'4pi');
  setcolor(9);
  outtextxy(20,40,'Der Phasenwinkel zwischen dem oberen und unteren Randstrahl betrage alphaø.');
  outtextxy(27,55,'Wird der Spalt in N Bereiche unterteilt, so ist der Phasenwinkel zwischen');
  outtextxy(70,70,'benachbarten Bereichen gleich dem Quotienten aus alphaø und N. ');
  outtextxy(20,85,'Bei einem Winkel von alpha = 2pi  [ entsprechend einem Gangunterschied von ');
  outtextxy(190,100,'lambda ]  liegt das erste Minimum.');
  setcolor(15);
  outtextxy(170,15,'Addition der Amplituden beim Einfachspalt');
  outtextxy(10,450,'Anzahl der Bereiche ver„ndern (n/N)  Phasenwinkel ver„ndern (p/P)  beenden (e)');
  outtextxy(200,465,'Phasenwinkel auf 0ø setzen (0)');
end;

procedure setz500;
begin
  a:=ares/N;
  a1:=ares1/N;
  xres1:=0;
  yres1:=0;
  xres:=0;
  yres:=0;
  for k:=1 to N do
  begin
    x1:=10*a1*cos(k*alpha/N);
    xres1:=xres1+x1;
    y1:=10*a1*sin(k*alpha/N);
    yres1:=yres1+y1;
    x:=10*a*cos(k*alpha/N);

    x0:=xres;
    xres:=xres+x;
    y:=10*a*sin(k*alpha/N);
    y0:=yres;
    yres:=yres+y;
  x4:=0.95*(xres-x0)-0.05*(yres-y0);
  y4:=0.95*(yres-y0)+0.05*(xres-x0);
  x5:=0.95*(xres-x0)+0.05*(yres-y0);
  y5:=0.95*(yres-y0)-0.05*(xres-x0);
    line(round(260+x0),round(240-y0),round(260+xres),round(240-yres));
    line(round(260+x0+x4),round(240-y0-y4),round(260+xres),round(240-yres));
    line(round(260+x0+x5),round(240-y0-y5),round(260+xres),round(240-yres));
  end;

  line(40,400,40,round(400-ares1*ares1));
  line(43,round(403-ares1*ares1),40,round(400-ares1*ares1));
  line(37,round(403-ares1*ares1),40,round(400-ares1*ares1));
end;

procedure setz501;
begin
  line(90,400,90,round(400-xres1*xres1/100-yres1*yres1/100));
  line(93,round(403-xres1*xres1/100-yres1*yres1/100),90,round(400-xres1*xres1/100-yres1*yres1/100));
  line(87,round(403-xres1*xres1/100-yres1*yres1/100),90,round(400-xres1*xres1/100-yres1*yres1/100));

    x4:=0.975*xres-0.025*yres;
    y4:=0.975*yres+0.025*xres;
    x5:=0.975*xres+0.025*yres;
    y5:=0.975*yres-0.025*xres;
    line(round(260+x4),round(240-y4),round(260+xres),round(240-yres));
    line(round(260+x5),round(240-y5),round(260+xres),round(240-yres));

    line(260,240,round(260+xres),round(240-yres));
end;

procedure setz50;
begin
  setcolor(15);
  line(160,240,360,240);
  line(260,140,260,340);
  outtextxy(350,250,'R');
  outtextxy(235,140,'iR');
  setcolor(14);
setz500;
  setcolor(12);
setz501;
if alpha<=pi*4 then
    putpixel(440+round(alpha/4/pi*180),400-round(xres1*xres1/100+yres1*yres1/100),12);
end;

procedure loesch50;
begin
  setcolor(1);
  setz500;
  setz501;
end;


procedure setz51;
begin
  setcolor(15);
  str((alpha/pi*180):4:0,ortx4);
  outtextxy(330,410,ortx4+' ø');
end;

procedure loesch51;
begin
  setcolor(1);
  outtextxy(330,410,ortx4+' ø');
end;

procedure setz52;
begin
  setcolor(15);
  str(N:4,ortx3);
  outtextxy(200,410,ortx3);
end;


procedure loesch52;
begin
  setcolor(1);
  outtextxy(200,410,ortx3);
end;


procedure setz5ampl;
begin
  setcolor(15);
  str((xres1*xres1/100+yres1*yres1/100):7:5,ortampl);
  outtextxy(200,390,ortampl);
end;


procedure loesch5ampl;
begin
  setcolor(1);
  outtextxy(200,390,ortampl);
end;



procedure auswahl5;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    'n':
    begin
      if n>=3 then
      begin
        loesch50;
        loesch52;
        loesch00;
        n:=n-1;
        setz52;
    setz50;
      end;
      wahl:=' ';
    end;
    'N':
    begin
      loesch50;
      loesch52;
      loesch00;
      n:=n+1;
      setz52;
    setz50;
      wahl:=' ';
    end;
    'p':
    begin
      if alpha>=5/180*pi then
      begin
        loesch50;
        loesch51;
        loesch5ampl;
        alpha:=alpha-5/180*pi;
        setz51;
        setz5ampl;
    setz50;
      end;
      wahl:=' ';
    end;
    'P':
    begin
      loesch50;
      loesch51;
      loesch5ampl;
      alpha:=alpha+5/180*pi;
      setz51;
      setz5ampl;
    setz50;
      wahl:=' ';
    end;
    'V':
    begin
      loesch50;
      ares:=ares+0.5;
    setz50;
      wahl:=' ';
    end;
    'v':
    begin
      loesch50;
      ares:=ares-0.5;
    setz50;
      wahl:=' ';
    end;
    'g':
    begin
      graphik5;
      wahl:=' ';
    end;
    'z':
    begin
      loesch50;
      ares:=16;
    setz50;
      wahl:=' ';
    end;
    '0':
    begin
      loesch50;
      loesch51;
      loesch00;
      alpha:=0;
      setz51;
      setz50;
      wahl:=' ';
    end;
  end;
  until wahl='e';
end;

procedure graphik6;
begin
  setbkcolor(1);
  setcolor(15);
  line(10,30,630,30);
  line(10,430,630,430);
  line(10,30,10,430);
  str(N:4,ortx3);
  outtextxy(140,395,ortx3);
  str(k1:4,ortx6);
  outtextxy(220,395,ortx6);
  str(s:4:2,ortx7);
  outtextxy(210,410,ortx7);
  line(630,30,630,430);
  outtextxy(200,395,'k =');
  outtextxy(120,395,'N =');
  outtextxy(150,410,'g/b =');
  outtextxy(270,395,'alpha =');
  outtextxy(270,410,'beta =');
  outtextxy(70,410,'A[res]ı');
  outtextxy(20,410,'A[o]ı');
  outtextxy(20,120,'Intensit„t');
  outtextxy(420,120,'Intensit„t');
  line(485,405,485,401);
  line(530,405,530,401);
  line(575,405,575,401);
  line(620,405,620,401);
  outtextxy(437,410,'0');
  outtextxy(478,410,'pi');
  outtextxy(515,410,'2pi');
  outtextxy(560,410,'3pi');
  outtextxy(605,410,'4pi');
  setcolor(9);
  outtextxy(20,40,'Der Phasenwinkel zwischen dem oberen und unteren Randstrahl betrage alphaø.');
  outtextxy(23,50,'Wird der Spalt in N Bereiche unterteilt, so ist der Phasenwinkel zwischen');
  outtextxy(20,60,'benachbarten Bereichen gleich  alphaø : N. Ist die Gitterkonstante z.B. vier');
  outtextxy(13,70,'mal so groá wie die Spaltbreite,so betr„gt der Phasenunterschied zwischen den  ');
  outtextxy(20,80,'benachbarten Spalten  beta = 4 alpha und der Gesamtunterschied   4k alpha . ');
  outtextxy(13,90,'Bei  alpha = 2pi ist das erste Einzelspaltminimum und bei alpha = 2pi : 4 das');
  outtextxy(150,100,'erste Gittermaximum [ entspricht  beta = 2pi ].');
  setcolor(15);
  outtextxy(12,15,'Addition der Amplituden beim Gitter unter Bercksichtigung des Einfachspaltes');
  outtextxy(10,440,'Anzahl der Spalte ver„ndern (k/K)  Phasenwinkel ver„ndern (p/P)    beenden (e)');
  outtextxy(200,455,'Verh„ltnis  g/b  ver„ndern (s/S)');
  outtextxy(30,470,'Anzahl der Bereiche ver„ndern (n/N)    Phasenwinkel auf 0ø setzen (0)');
end;

procedure setz600;
begin
    x1:=10*a1*cos(k*alpha/N+k2*s*alpha);
    xres1:=xres1+x1;
    y1:=10*a1*sin(k*alpha/N+k2*s*alpha);
    yres1:=yres1+y1;

    x:=10*a*cos(k*alpha/N+k2*s*alpha);
    x0:=xres;
    xres:=xres+x;
    y:=10*a*sin(k*alpha/N+k2*s*alpha);
    y0:=yres;
    yres:=yres+y;

    x4:=0.95*(xres-x0)-0.05*(yres-y0);
    y4:=0.95*(yres-y0)+0.05*(xres-x0);
    x5:=0.95*(xres-x0)+0.05*(yres-y0);
    y5:=0.95*(yres-y0)-0.05*(xres-x0);
    line(round(260+x0),round(240-y0),round(260+xres),round(240-yres));
    line(round(260+x0+x4),round(240-y0-y4),round(260+xres),round(240-yres));
    line(round(260+x0+x5),round(240-y0-y5),round(260+xres),round(240-yres));

end;

procedure setz601;
begin
    x4:=0.975*xres-0.025*yres;
    y4:=0.975*yres+0.025*xres;
    x5:=0.975*xres+0.025*yres;
    y5:=0.975*yres-0.025*xres;
    line(round(260+x4),round(240-y4),round(260+xres),round(240-yres));
    line(round(260+x5),round(240-y5),round(260+xres),round(240-yres));
    line(round(260+z1),round(240-z2),round(260+xres),round(240-yres));
end;

procedure setz60;
begin
  setcolor(15);
  line(160,240,360,240);
  line(260,140,260,340);
  outtextxy(350,250,'R');
  outtextxy(235,140,'iR');
  setcolor(10);
  a1:=ares1/N/k1;
  xres1:=0;
  yres1:=0;
  a:=ares/N/k1;
  xres:=0;
  yres:=0;

for k2:=1 to k1 do
begin
  setcolor(14);
  z1:=xres;
  z2:=yres;
  for k:=1 to N do
  begin
    setz600;
  end;
    setcolor(10);
    setz601;
  end;

  line(40,400,40,round(400-ares1*ares1));
  line(43,round(403-ares1*ares1),40,round(400-ares1*ares1));
  line(37,round(403-ares1*ares1),40,round(400-ares1*ares1));

  setcolor(12);
  line(90,400,90,round(400-xres1*xres1/100-yres1*yres1/100));
  line(93,round(403-xres1*xres1/100-yres1*yres1/100),90,round(400-xres1*xres1/100-yres1*yres1/100));
  line(87,round(403-xres1*xres1/100-yres1*yres1/100),90,round(400-xres1*xres1/100-yres1*yres1/100));

  x4:=0.975*xres-0.025*yres;
  y4:=0.975*yres+0.025*xres;
  x5:=0.975*xres+0.025*yres;
  y5:=0.975*yres-0.025*xres;
  line(round(260+x4),round(240-y4),round(260+xres),round(240-yres));
  line(round(260+x5),round(240-y5),round(260+xres),round(240-yres));

  line(260,240,round(260+xres),round(240-yres));
if alpha<=pi*4 then
    putpixel(440+round(alpha/4/pi*180),400-round(xres1*xres1/100+yres1*yres1/100),12);
end;

procedure loesch60;
begin
  setcolor(1);
  a1:=ares1/N/k1;
  xres1:=0;
  yres1:=0;
  a:=ares/N/k1;
  xres:=0;
  yres:=0;

for k2:=1 to k1 do
begin
  z1:=xres;
  z2:=yres;
  for k:=1 to N do
  begin
    setz600;
  end;
    setz601;
end;
  line(90,400,90,round(400-xres1*xres1/100-yres1*yres1/100));
  line(93,round(403-xres1*xres1/100-yres1*yres1/100),90,round(400-xres1*xres1/100-yres1*yres1/100));
  line(87,round(403-xres1*xres1/100-yres1*yres1/100),90,round(400-xres1*xres1/100-yres1*yres1/100));

    x4:=0.975*xres-0.025*yres;
    y4:=0.975*yres+0.025*xres;
    x5:=0.975*xres+0.025*yres;
    y5:=0.975*yres-0.025*xres;
    line(round(260+x4),round(240-y4),round(260+xres),round(240-yres));
    line(round(260+x5),round(240-y5),round(260+xres),round(240-yres));

    line(260,240,round(260+xres),round(240-yres));
end;

procedure setz61;
begin
  setcolor(15);
  str((alpha/pi*180):4:0,ortx1);
  outtextxy(330,395,ortx1+' ø');
  str((s*alpha/pi*180):4:0,ortx4);
  outtextxy(330,410,ortx4+' ø');
end;

procedure loesch61;
begin
  setcolor(1);
  outtextxy(330,395,ortx1+' ø');
  outtextxy(330,410,ortx4+' ø');
end;

procedure setz62;
begin
  setcolor(15);
  str(N:4,ortx3);
  outtextxy(140,395,ortx3);
end;


procedure loesch62;
begin
  setcolor(1);
  outtextxy(140,395,ortx3);
end;

procedure setz63;
begin
  setcolor(15);
  str(k1:4,ortx6);
  outtextxy(220,395,ortx6);
end;


procedure loesch63;
begin
  setcolor(1);
  outtextxy(220,395,ortx6);
end;

procedure setz64;
begin
  setcolor(15);
  str(s:4:2,ortx7);
  outtextxy(210,410,ortx7);
end;


procedure loesch64;
begin
  setcolor(1);
  outtextxy(210,410,ortx7);
end;


procedure auswahl6;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    'n':
    begin
      if n>=3 then
      begin
        loesch60;
        loesch62;
        loesch00;
        n:=n-1;
        setz62;
    setz60;
      end;
      wahl:=' ';
    end;
    'N':
    begin
      loesch60;
      loesch62;
      loesch00;
      n:=n+1;
      setz62;
    setz60;
      wahl:=' ';
    end;
    's':
    begin
      if s>=1.2 then
      begin
        loesch60;
        loesch64;
        loesch00;
        s:=s-0.2;
        setz64;
    setz60;
      end;
      wahl:=' ';
    end;
    'S':
    begin
      loesch60;
      loesch64;
      loesch00;
      s:=s+0.2;
      setz64;
    setz60;
      wahl:=' ';
    end;
    'k':
    begin
      if k1>=3 then
      begin
        loesch60;
        loesch63;
        loesch00;
        k1:=k1-1;
        setz63;
    setz60;
      end;
      wahl:=' ';
    end;
    'K':
    begin
      loesch60;
      loesch63;
      loesch00;
      k1:=k1+1;
      setz63;
    setz60;
      wahl:=' ';
    end;
    'p':
    begin
      if alpha>=1/180*pi then
      begin
        loesch60;
        loesch61;
        alpha:=alpha-0.25/180*pi;
        setz61;
    setz60;
      end;
      wahl:=' ';
    end;
    'P':
    begin
      loesch60;
      loesch61;
      alpha:=alpha+0.25/180*pi;
      setz61;
    setz60;
      wahl:=' ';
    end;
    'v':
    begin
      loesch60;
      ares:=ares-0.5;
    setz60;
      wahl:=' ';
    end;
    'V':
    begin
      loesch60;
      ares:=ares+0.5;
    setz60;
      wahl:=' ';
    end;
    'z':
    begin
      loesch60;
      ares:=16;
    setz60;
      wahl:=' ';
    end;
    'g':
    begin
      graphik6;
      wahl:=' ';
    end;
    '0':
    begin
      loesch60;
      loesch61;
      loesch00;
      alpha:=0;
      setz61;
      setz60;
      wahl:=' ';
    end;
  end;
  until wahl='e';
end;



procedure spalt;
begin
  cleardevice;
    l:=1;
    z:=50;
    f:=1;
    lambda:=0.6;
    lambda1:=0.8;
    b:=30;
    x:=-200/z;
    graphik;
    setz;
    auswahl;
  menue;
end;

procedure amplitude2;
begin
  cleardevice;
  N:=10;
  k1:=3;
  s:=4;
  alpha:=0;
  ares:=16;
  ares1:=16;
  loesch00;
  graphik6;
  setz60;
  setz61;
  auswahl6;
  menue;
end;

procedure amplitude1;
begin
  cleardevice;
  N:=10;
  alpha:=0;
  ares:=16;
  ares1:=16;
  loesch00;
  graphik5;
  setz50;
  setz51;
  auswahl5;
  menue;
end;


procedure amplitude;
begin
  cleardevice;
  k1:=3;
  alpha:=0;
  ares:=16;
  ares1:=16;
  loesch00;
  graphik4;
  setz40;
  setz41;
  auswahl4;
  menue;
end;

procedure doppelspalt;
begin
  cleardevice;
    l:=2;
    N:=2;
    f:=1/N/N;
    z:=100;
    lambda:=0.6;
    lambda1:=0.8;
    b:=30;
    g:=120;
    x:=-200/z;
    graphik;
    setz;
    auswahl;
  menue;
end;

procedure gitter;
begin
  cleardevice;
    l:=3;
    N:=3;
    f:=1/N/N;
    z:=200;
    lambda:=0.6;
    lambda1:=0.8;
    b:=30;
    g:=120;
    x:=-200/z;
    graphik;
    setz;
    auswahl;
  menue;
end;

procedure setz70;
begin
  setcolor(farbe);
  if l=1 then a:=ares/k1;
  if l=2 then a:=ares/k1*(1+alpha/2*(alpha-2*pi));

  xres:=0;
  yres:=0;
  for k:=1 to k1 do
  begin
  if l=1 then a:=ares/k1;
  if l=2 then a:=ares/k1*(1+alpha/2*(alpha-2*pi));
    x:=10*a*cos(k*alpha);
    x0:=xres;
    xres:=xres+x;
    y:=10*a*sin(k*alpha);
    y0:=yres;
    yres:=yres+y;
    line(round(x4+f1*x0),round(y4-f2*y0),round(x4+f1*xres),round(y4-f2*yres));
  end;
  setcolor(farbe1);
    line(round(x4),round(y4),round(x4+f1*xres),round(y4-f2*yres));
end;

procedure setz80;
begin
  setcolor(farbe);

  xres:=0;
  yres:=0;
  for k:=1 to N do
  begin
  if l=1 then a:=ares/N;
  if l=2 then a:=ares/N*(1+alpha/3);
    x:=10*a*cos(k*alpha/N);
    x0:=xres;
    xres:=xres+x;
    y:=10*a*sin(k*alpha/N);
    y0:=yres;
    yres:=yres+y;
    line(round(x4+f1*x0),round(y4-f2*y0),round(x4+f1*xres),round(y4-f2*yres));
  end;
  setcolor(farbe1);
    line(round(x4),round(y4),round(x4+f1*xres),round(y4-f2*yres));
end;

procedure setz90;
 begin
    s:=4;

    xres:=0;
    yres:=0;
  if l=1 then a:=ares/k1/N;
  if l=2 then a:=ares/k1/N*(1+alpha);

    for k2:=1 to k1 do
    begin
      setcolor(farbe);
      z1:=xres;
      z2:=yres;

      for k:=1 to N do
      begin
        x:=10*a*cos(k*alpha/N+k2*s*alpha);
        x0:=xres;
        xres:=xres+x;
        y:=10*a*sin(k*alpha/N+k2*s*alpha);
        y0:=yres;
        yres:=yres+y;
        line(round(x4+f1*x0),round(y4-f2*y0),round(x4+f1*xres),round(y4-f2*yres));
      end;
      setcolor(farbe2);
      line(round(x4+f1*z1),round(y4-f2*z2),round(x4+f1*xres),round(y4-f2*yres));
    end;

    setcolor(farbe1);
    line(round(x4),round(y4),round(x4+f1*xres),round(y4-f2*yres));
end;

procedure mitte;
begin
setbkcolor(0);
farbe:=14;
farbe1:=12;
  f1:=1;
  f2:=1;
  ares:=30;
  x4:=320;
  y4:=240;
  setz70;
  farbe:=9;
  farbe1:=11;
  f1:=1;
  f2:=-1;
  ares:=13;
  x4:=100;
  y4:=100;
  setz70;
  f1:=-1;
  x4:=540;
  setz70;
  f2:=1;
  y4:=380;
  setz70;
  f1:=1;
  x4:=100;
  y4:=380;
  setz70;
end;

procedure mitte1;
begin
setbkcolor(0);
farbe:=14;
farbe1:=12;
  f1:=1;
  f2:=1;
  ares:=30;
  x4:=320;
  y4:=240;
  setz80;
  farbe:=9;
  farbe1:=11;
  f2:=-1;
  ares:=13;
  x4:=100;
  y4:=100;
  setz80;
  f1:=-1;
  x4:=540;
  setz80;
  f2:=1;
  y4:=380;
  setz80;
  f1:=1;
  x4:=100;
  setz80;
end;

procedure mitte2;
begin
setbkcolor(0);
farbe:=14;
farbe1:=12;
farbe2:=10;
  f1:=1;
  f2:=1;
  ares:=30;
  x4:=320;
  y4:=240;
  setz90;
  farbe:=9;
  farbe1:=11;
  farbe2:=7;
  f2:=-1;
  ares:=13;
  x4:=100;
  y4:=100;
  setz90;
  f1:=-1;
  x4:=540;
  setz90;
  f2:=1;
  y4:=380;
  setz90;
  f1:=1;
  x4:=100;
  setz90;
end;

procedure loesch70;
begin
  setfillstyle(1,0);
  bar(0,0,640,480);
end;

procedure auswahl7;
begin
  mitte;
  delay(zeit);
  wahl:=' ';
  repeat
   
   repeat
    if (alpha>=2*pi) then
    begin
     alpha:=0;
     k1:=k1+1;
    end;
     mitte;
     delay(zeit);
       if keypressed then wahl1:=readkey;
       case wahl1 of
        'e':exit;
        't':begin
             zeit:=round(zeit/2);
             wahl1:=' ';
            end;
        'T':begin
             zeit:=zeit*2;
             wahl1:=' ';
            end;
        'p':wahl1:=readkey;
       end;
     alpha:=alpha+0.01;
     loesch70;
    until k1=6;

   N:=k1-1;
   repeat
    N:=N+1;
    repeat
     mitte1;
     delay(zeit);
       if keypressed then wahl1:=readkey;
       case wahl1 of
        'e':exit;
        't':begin
             zeit:=round(zeit/2);
             wahl1:=' ';
            end;
        'T':begin
             zeit:=zeit*2;
             wahl1:=' ';
            end;
        'p':wahl1:=readkey;
       end;
     alpha:=alpha+0.05;
     loesch70;
    until alpha>=6*pi;

    repeat
     mitte1;
     delay(zeit);
       if keypressed then wahl1:=readkey;
       case wahl1 of
        'e':exit;
        't':begin
             zeit:=round(zeit/2);
             wahl1:=' ';
            end;
        'T':begin
             zeit:=zeit*2;
             wahl1:=' ';
            end;
        'p':wahl1:=readkey;
       end;
     alpha:=alpha-0.05;
     loesch70;
    until alpha<=0;

   alpha:=0;
    mitte1;
    delay(zeit);
    loesch70;
    until N=8;

   N:=k1;
    repeat
     mitte2;
     delay(zeit);
       if keypressed then wahl1:=readkey;
       case wahl1 of
        'e':exit;
        't':begin
             zeit:=round(zeit/2);
             wahl1:=' ';
            end;
        'T':begin
             zeit:=zeit*2;
             wahl1:=' ';
            end;
        'p':wahl1:=readkey;
       end;
     alpha:=alpha+0.003;
     loesch70;
    until alpha>=1.5*pi;
    alpha:=1.5*pi;
    mitte2;
    delay(zeit);
    loesch70;
    repeat
     mitte2;
     delay(zeit);
       if keypressed then wahl1:=readkey;
       case wahl1 of
        'e':exit;
        't':begin
             zeit:=round(zeit/2);
             wahl1:=' ';
            end;
        'T':begin
             zeit:=zeit*2;
             wahl1:=' ';
            end;
        'p':wahl1:=readkey;
       end;
     alpha:=alpha-0.003;
     loesch70;
    until alpha<=0;
    alpha:=0;
    mitte2;
    delay(zeit);
    loesch70;

   repeat
    N:=N-1;
    repeat
     mitte1;
     delay(zeit);
       if keypressed then wahl1:=readkey;
       case wahl1 of
        'e':exit;
        't':begin
             zeit:=round(zeit/2);
             wahl1:=' ';
            end;
        'T':begin
             zeit:=zeit*2;
             wahl1:=' ';
            end;
        'p':wahl1:=readkey;
       end;
     alpha:=alpha+0.05;
     loesch70;
    until alpha>=6*pi;

    repeat
     mitte1;
     delay(zeit);
       if keypressed then wahl1:=readkey;
       case wahl1 of
        'e':exit;
        't':begin
             zeit:=round(zeit/2);
             wahl1:=' ';
            end;
        'T':begin
             zeit:=zeit*2;
             wahl1:=' ';
            end;
        'p':wahl1:=readkey;
       end;
     alpha:=alpha-0.05;
     loesch70;
    until alpha<=0;
    alpha:=0;
    mitte1;
    delay(zeit);
    loesch70;
   until N<=k1;
   k1:=N;

   repeat
    if (alpha>=2*pi) then
    begin
     alpha:=0;
     k1:=k1-1;
    end;
     mitte;
     delay(zeit);
       if keypressed then wahl1:=readkey;
       case wahl1 of
        'e':exit;
        't':begin
             zeit:=round(zeit/2);
             wahl1:=' ';
            end;
        'T':begin
             zeit:=zeit*2;
             wahl1:=' ';
            end;
        'p':wahl1:=readkey;
       end;
     alpha:=alpha+0.01;
     loesch70;
    until k1=3;

  until wahl='e';
end;

procedure bild;
begin
  cleardevice;
  l:=1;
  alpha:=0;
    N:=3;
    k1:=3;
    mitte;
    auswahl7;
  menue;
end;

procedure bild1;
begin
  cleardevice;
  l:=2;
  alpha:=0;
    N:=3;
    k1:=3;
    mitte;
    auswahl7;
  menue;
end;

{MAIN}
begin
  wahl1:=' ';
  menue;
  zeit:=2000;
  repeat
  wahl1:=' ';
  if keypressed then wahl1:=readkey;
  case wahl1 of
    '1':spalt;
    '2':doppelspalt;
    '3':gitter;
    '4':amplitude;
    '5':amplitude1;
    '6':amplitude2;
    '7':bild;
    '8':bild1;
  end;
  until wahl1='b';
end.