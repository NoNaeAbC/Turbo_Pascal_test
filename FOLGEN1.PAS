program folgen1;

uses crt,graph;
var
  zyfest,yk,x,a,nanf,nend,zx,zy:longint;
  f11,a1,a2,a3,a4,a5,a6,a7,a8,h0,m,n,hi,hilf,hilfe:integer;
  h000,farbe0,farbe1,farbe2,farbe3,farbe4,farbe5,farbe6,farbe7,farbe8,l,farbe,z,k,treiber,modus:integer;
  zaehler,nenner,faktor,gfest,g,epsilon,y,y0:real;
  wahl,wahl1:char;
  ortx8,ortx9,ortx10,ortx11,ortx7,ortx6,ortx1,ortx2,ortx3,ortx4,ortx5:string;
  z1,z2,z3,z4,z5,z6,z7,z8:string;

procedure en;
begin
  if h000=0 then
    begin
     farbe0:=15;
     farbe1:=8;
     farbe2:=12;
     farbe3:=9;
     farbe4:=2;
     farbe5:=3;
     farbe6:=13;
     farbe7:=5;
     farbe8:=10;
    end;
  if h000=1 then
    begin
     farbe0:=1;
     farbe1:=15;
     farbe2:=10;
     farbe3:=14;
     farbe4:=10;
     farbe5:=11;
     farbe6:=13;
     farbe7:=9;
     farbe8:=2;
    end;
end;

procedure menue;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(15);
  setcolor(1);
         outtextxy(100,120,'a[n] =                  =                       -> 1 ');
         outtextxy(100,114,'             1                    a ');
         outtextxy(100,126,'             n                  b*n+c');
         line(201,123,213,123);
         line(353,123,398,123);

         outtextxy(100,170,'a[n] =                  =                       -> 2 ');
         outtextxy(100,176,'       (2n-13)(3n-52)       (c*n+d)(e*n+f)');
         outtextxy(100,164,'            n-63                a*n+b');
         line(155,173,265,173);
         line(323,173,436,173);

         outtextxy(100,220,'a[n] =                  =                       -> 3 ');
         outtextxy(100,214,'        (n-3)(5n-45)        (a*n+b)(c*n+d)');
         outtextxy(100,226,'       (3n-14)(2n-15)       (e*n+f)(g*n+h)');
         line(155,223,265,223);
         line(323,223,436,223);

         outtextxy(100,270,'a[n] =                  =                       -> 4 ');
         outtextxy(100,264,'       n * sin(100/n)       a*n * sin(b/n)');
         outtextxy(100,276,'            100                   c');
         line(155,273,265,273);
         line(323,273,436,273);

         outtextxy(100,320,'a[n] =                  =                       -> 5 ');
         outtextxy(100,314,'         n^3+ný-2n-5         a*n^3+b*ný+c*n+d');
         outtextxy(100,326,'         2n^3-ný+n+3         e*n^3+f*ný+g*n+h');
         line(167,323,262,323);
         line(323,323,464,323);
 
  outtextxy(405,400,'beenden   -> b');
  setcolor(7);
  outtextxy(20,465,'heller Hintergrund (h)                              dunkler Hintergrund (d)');
end;

procedure g00;
begin
     if l=0 then
       begin
           setcolor(farbe);
           if a=0 then outtextxy(280,20,'a[n] = ');
           if a=0 then outtextxy(280,14,'       '+z1);
           if (a=0) and (a2=1) and (a3=0) then outtextxy(280,26,'       n');
           if (a=0) and (a2<>1) and (a3=0) then outtextxy(330,26,z2+' n  ');
           if (a=0) and (a3<>0) then outtextxy(330,26,z2+' n + '+z3);
           if a=0 then line(333,23,343,23);
           if a=1 then outtextxy(250,20,'a[n] = (-1)^n * ');
           if a=1 then outtextxy(250,14,'                '+z1);
           if (a=1) and (a2=1) and (a3=0) then outtextxy(282,26,'            n');
           if (a=1) and (a2<>1) and (a3=0) then outtextxy(372,26,z2+' n  ');
           if (a=1) and (a3<>0) then outtextxy(372,26,z2+' n + '+z3);
           if a=1 then line(375,23,385,23);

         if hi=1 then
         begin
           setcolor(farbe0);
           outtextxy(100,50,'                     („)');
           setcolor(f11);
           outtextxy(100,50,'                     durch  a/A b/B c/C');
         end;
       end;

     if l=1 then
       begin
       if (a1=1) and (a2=-63) and (a3=2) and (a4=-13) and (a5=3) and (a6=-52) then
        begin
         setcolor(farbe);
         if a=0 then outtextxy(240,20,'a[n] = ');
         if a=0 then outtextxy(240,26,'       (2n-13)(3n-52)');
         if a=0 then outtextxy(240,14,'            n-63');
         if a=0 then line(295,23,405,23);
         if a=1 then outtextxy(200,20,'a[n] = (-1)^n * ');
         if a=1 then outtextxy(200,26,'                (2n-13)(3n-52)');
         if a=1 then outtextxy(200,14,'                     n-63');
         if a=1 then line(327,23,437,23);
        end;
       if (a1<>1) or (a2<>-63) or (a3<>2) or (a4<>-13) or (a5<>3) or (a6<>-52) then
        begin
           setcolor(farbe);
           if a=0 then outtextxy(240,20,'a[n] = ');
           if a=0 then outtextxy(240,26,'       ('+z3+'n+'+z4+')('+z5+'n+'+z6+')');
           if a=0 then outtextxy(240,14,'            '+z1+'n+'+z2);
           if a=0 then line(295,23,425,23);
           if a=1 then outtextxy(200,20,'a[n] = (-1)^n * ');
           if a=1 then outtextxy(200,26,'                ('+z3+'n+'+z4+')('+z5+'n+'+z6+')');
           if a=1 then outtextxy(200,14,'                    '+z1+'n+'+z2);
           if a=1 then line(327,23,455,23);
       end;
       if hi=1 then
       begin
           setcolor(farbe0);
           outtextxy(100,50,'                     („)');
           setcolor(f11);
           outtextxy(100,50,'                     durch  a/A b/B c/C d/D e/E f/F');
        end;
     end;

     if l=2 then
       begin
       if hi=0 then
        begin
         setcolor(farbe);
         if a=0 then outtextxy(250,20,'a[n] =  ');
         if a=0 then outtextxy(250,14,'        (n-3)(5n-45)');
         if a=0 then outtextxy(250,26,'       (3n-14)(2n-15)');
         if a=0 then line(305,23,415,23);
         if a=1 then outtextxy(200,20,'a[n] = (-1)^n *  ');
         if a=1 then outtextxy(200,14,'                 (n-3)(5n-45)');
         if a=1 then outtextxy(200,26,'                (3n-14)(2n-15)');
         if a=1 then line(327,23,437,23);
        end;
        if hi=1 then
         begin
           setcolor(farbe);
           if a=0 then outtextxy(240,20,'a[n] = ');
           if a=0 then outtextxy(240,26,'       ('+z5+'n+'+z6+')('+z7+'n+'+z8+')');
           if a=0 then outtextxy(240,14,'       ('+z1+'n+'+z2+')('+z3+'n+'+z4+')');
           if a=0 then line(295,23,425,23);
           if a=1 then outtextxy(200,20,'a[n] = (-1)^n * ');
           if a=1 then outtextxy(200,26,'                ('+z5+'n+'+z6+')('+z7+'n+'+z8+')');
           if a=1 then outtextxy(200,14,'                ('+z1+'n+'+z2+')('+z3+'n+'+z4+')');
           if a=1 then line(327,23,455,23);
           setcolor(farbe0);
           outtextxy(100,50,'                     („)');
           setcolor(f11);
           outtextxy(100,50,'                     durch  a/A b/B c/C d/D e/E f/F g/G h/H');
         end;
       end;

     if l=3 then
       begin
        if hi=0 then
        begin
        setcolor(farbe);
         if a=0 then outtextxy(250,20,'a[n] = ');
         if a=0 then outtextxy(250,14,'       n * sin(100/n)');
         if a=0 then outtextxy(250,26,'            100');
         if a=0 then line(305,23,415,23);
         if a=1 then outtextxy(200,20,'a[n] = (-1)^n *');
         if a=1 then outtextxy(200,14,'                 n * sin(100/n)');
         if a=1 then outtextxy(200,26,'                      100');
         if a=1 then line(335,23,445,23);
        end;
         if hi=1 then
         begin
           setcolor(farbe);
           if a=0 then outtextxy(250,20,'a[n] = ');
           if a=0 then outtextxy(250,14,'       '+z1+'n * sin('+z2+'/n)');
           if a=0 then outtextxy(250,26,'             '+z3);
           if a=0 then line(305,23,425,23);
           if a=1 then outtextxy(200,20,'a[n] = (-1)^n *');
           if a=1 then outtextxy(200,14,'                '+z1+'n * sin('+z2+'/n)');
           if a=1 then outtextxy(200,26,'                     '+z3);
           if a=1 then line(330,23,450,23);
           setcolor(farbe0);
           outtextxy(100,50,'                     („)');
           setcolor(f11);
           outtextxy(100,50,'                     durch  a/A b/B c/C ');
         end;
       end;

     if l=4 then
       begin
       if hi=0 then
        begin
         setcolor(farbe);
         if a=0 then outtextxy(250,20,'a[n] =  ');
         if a=0 then outtextxy(250,14,'        n^3+ný-2n-5');
         if a=0 then outtextxy(250,26,'        2n^3-ný+n+3');
         if a=0 then line(305,23,415,23);
         if a=1 then outtextxy(200,20,'a[n] = (-1)^n *  ');
         if a=1 then outtextxy(200,14,'                 n^3+ný-2n-5');
         if a=1 then outtextxy(200,26,'                 2n^3-ný+n+3');
         if a=1 then line(327,23,437,23);
        end;
        if hi=1 then
         begin
           setcolor(farbe);
           if a=0 then outtextxy(240,20,'a[n] = ');
           if a=0 then outtextxy(240,26,'       '+z5+'n^3+'+z6+'ný+'+z7+'n+'+z8);
           if a=0 then outtextxy(240,14,'       '+z1+'n^3+'+z2+'ný+'+z3+'n+'+z4);
           if a=0 then line(295,23,425,23);
           if a=1 then outtextxy(200,20,'a[n] = (-1)^n * ');
           if a=1 then outtextxy(200,26,'                '+z5+'n^3+'+z6+'ný+'+z7+'n+'+z8);
           if a=1 then outtextxy(200,14,'                '+z1+'n^3+'+z2+'ný+'+z3+'n+'+z4);
           if a=1 then line(327,23,455,23);
           setcolor(farbe0);
           outtextxy(100,50,'                     („)');
           setcolor(f11);
           outtextxy(100,50,'                     durch  a/A b/B c/C d/D e/E f/F g/G h/H');
         end;
       end;
end;

procedure g01;
begin
  farbe:=farbe2;
  f11:=7;
  g00;
end;

procedure g01weg;
begin
  farbe:=farbe0;
  f11:=farbe0;
  g00;
end;

procedure versuch;
begin
    if l=0 then
     begin
       zaehler:=a1*cos(a*(x+1)*pi);
       nenner:=(a2*x+a3);
     end;
    if l=1 then
     begin
       zaehler:=cos(a*(x+1)*pi)*(a1*x+a2);
       nenner:=((a3*x+a4)*(a5*x+a6));
     end;
    if l=2 then
     begin
       zaehler:=cos(a*(x+1)*pi)*(a1*x+a2)*(a3*x+a4);
       nenner:=((a5*x+a6)*(a7*x+a8));
     end;
    if l=3 then
     begin
       zaehler:=cos(a*(x+1)*pi)*a1*x*sin(a2/x);
       nenner:=a3;
     end;
    if l=4 then
     begin
       zaehler:=cos(a*(x+1)*pi)*(a1*x*x*x+a2*x*x+a3*x+a4);
       nenner:=(a5*x*x*x+a6*x*x+a7*x+a8);
     end;
end;


procedure f1;
begin
  for n:=1 to round(510/zx) do
  begin
    x:=nanf+n;
    versuch;
    if nenner<>0 then
     begin
      y0:=zy*zaehler/nenner;
      if (gfest+faktor*(y0/zy*zyfest-gfest)>-170-yk) and (gfest+faktor*(y0/zy*zyfest-gfest)<170-yk) then
      begin
        setcolor(farbe2);
        circle(60+round(zx*n),240-yk-round(gfest+faktor*(y0/zy*zyfest-gfest)),2);
      end;
    end;
  end;
end;


procedure loeschf1;
begin
  for n:=1 to round(510/zx) do
  begin
    x:=nanf+n;
    versuch;
    if nenner<>0 then
     begin
      y0:=zy*zaehler/nenner;
      if (gfest+faktor*(y0/zy*zyfest-gfest)>-170-yk) and (gfest+faktor*(y0/zy*zyfest-gfest)<170-yk) then
      begin
        setcolor(farbe0);
        circle(60+round(zx*n),240-yk-round(gfest+faktor*(y0/zy*zyfest-gfest)),2);
      end;
    end;
  end;
end;

procedure s0000;
begin
  if (240-yk-round(gfest-zy*g)<410) and (240-yk-round(gfest-zy*g)>70) then
  begin
    outtextxy(32+zx,245-yk-round(gfest-zy*g),ortx1);
    outtextxy(32+5*zx,245-yk-round(gfest-zy*g),ortx2);
  end;
  if (240-yk-round(gfest-zy*g)>=410) then
  begin
    outtextxy(32+zx,245+170,ortx1);
    outtextxy(32+5*zx,245+170,ortx2);
  end;
  if (240-yk-round(gfest-zy*g)<=70) then
  begin
    outtextxy(32+zx,245-170,ortx1);
    outtextxy(32+5*zx,245-170,ortx2);
  end;
end;


procedure setz1;
begin
  setcolor(farbe1);
    str((nanf+1):4,ortx1);
    str((nanf+5):4,ortx2);
    s0000;
end;


procedure loesch1;
begin
  setcolor(farbe0);
  s0000;
end;


procedure setz0;
begin
  if (240-round(gfest+faktor*(-zyfest/2-gfest))<410) and (yk=0) then
  begin
    outtextxy(20,237-round(gfest+faktor*(-zyfest/2-gfest)),'-0,5');
    line(60,240-round(gfest+faktor*(-zyfest/2-gfest)),55,240-round(gfest+faktor*(-zyfest/2-gfest)));
  end;
  if (gfest+faktor*(zyfest/2-gfest)<170) and (yk=0) then
  begin
    outtextxy(30,237-round(gfest+faktor*(zyfest/2-gfest)),'0,5');
    line(60,240-round(gfest+faktor*(zyfest/2-gfest)),55,240-round(gfest+faktor*(zyfest/2-gfest)));
  end;
  if (240-round(gfest+faktor*(-zyfest-gfest))<410) and (yk=0) then
  begin
    outtextxy(30,237-round(gfest+faktor*(-zyfest-gfest)),'-1');
    line(60,240-round(gfest+faktor*(-zyfest-gfest)),55,240-round(gfest+faktor*(-zyfest-gfest)));
  end;
  if (gfest+faktor*(zyfest-gfest)<170) and (yk=0) then
  begin
    outtextxy(40,237-round(gfest+faktor*(zyfest-gfest)),'1');
    line(60,240-round(gfest+faktor*(zyfest-gfest)),55,240-round(gfest+faktor*(zyfest-gfest)));
  end;

  if ((yk+gfest+faktor*(zyfest-gfest))>=170) or (yk<>0) then
  begin
    str(((180-yk-gfest)/zy+g):5:4,ortx4);
    outtextxy(20,47,ortx4);
    line(60,60,55,60);
  end;
  if  ((yk+gfest+faktor*(-zyfest-gfest))>=170) or (yk<>0) then
  begin
    str((g-(180+yk+gfest)/zy):5:4,ortx5);
    outtextxy(20,427,ortx5);
    line(60,420,55,420);
  end;


  if (240-yk-round(gfest-zy*g)<410) and (240-yk-round(gfest-zy*g)>70) then
  begin
    line(60,240-yk-round(gfest-zy*g),580,240-yk-round(gfest-zy*g));
    line(60+zx,242-yk-round(gfest-zy*g),60+zx,238-yk-round(gfest-zy*g));
    for k:=1 to 25 do
    begin
      if 5*k*zx<510 then
      line(60+5*k*zx,238-yk-round(gfest-zy*g),60+5*k*zx,242-yk-round(gfest-zy*g));
      str((nanf+50):4,ortx8);
      outtextxy(32+51*zx,245-yk-round(gfest-zy*g),ortx8);
    end;
  end;
  if (240-yk-round(gfest-zy*g)>=410) then
  begin
    line(60,240+170,580,240+170);
    line(60+zx,238+170,60+zx,242+170);
    for k:=1 to 25 do
    begin
      if 5*k*zx<510 then
      line(60+5*k*zx,238+170,60+5*k*zx,242+170);
      str((nanf+50):4,ortx8);
      outtextxy(32+51*zx,245+170,ortx8);
    end;
  end;
  if (240-yk-round(gfest-zy*g)<=70)  then
  begin
    line(60,240-170,580,240-170);
    line(60+zx,238-170,60+zx,242-170);
    for k:=1 to 25 do
    begin
      if 5*k*zx<510 then
      line(60+5*k*zx,238-170,60+5*k*zx,242-170);
      str((nanf+50):4,ortx8);
      outtextxy(32+51*zx,245-170,ortx8);
    end;
end;
end;

procedure setz;
begin
  setcolor(farbe1);
  setz1;
  setz0;
  line(60,60,60,420);
end;

procedure loesch;
begin
  setcolor(farbe0);
  farbe:=farbe0;
  loesch1;
  setz0;
end;

procedure epsa;
begin
  setcolor(farbe);
  setfillstyle(9,farbe);
  if (240-yk-round(gfest-zy*epsilon)<410) and (240-yk-round(gfest+zy*epsilon)>70) then
  begin
    bar(63,240-yk-round(gfest+zy*epsilon),580,240-yk-round(gfest-zy*epsilon));
    line(61,240-yk-round(gfest),582,240-yk-round(gfest));
    str(epsilon:5:5,ortx7);
    outtextxy(80,440,'epsilon = '+ortx7);
    str(g:5:5,ortx9);
    outtextxy(128,430,'g = '+ortx9);
    str(g:3:2,ortx6);
    outtextxy(20,237-yk-round(gfest),ortx6);
  end;
end;

procedure epsb;
begin
  for n:=1 to round(510/zx) do
  begin
    x:=nanf+n;
    versuch;
    if nenner<>0 then
     begin
      y0:=zy*zaehler/nenner;
      if (zy*(g+epsilon)>y0) and (zy*(g-epsilon)<y0) then
      begin
        setcolor(farbe);
        circle(60+round(zx*n),240-yk-round(gfest+faktor*(y0/zy*zyfest-gfest)),2);
      end;
    end;
  end;
end;

procedure epshin;
begin
  farbe:=farbe5;
  epsa;
  f1;
  farbe:=farbe5;
  epsb;
  setz;
end;

procedure epsweg;
begin
  farbe:=farbe0;
  epsa;
  loesch;
  loeschf1;
  epsb;
end;


procedure graphik1;
begin
  setbkcolor(farbe0);
  g01;
  setcolor(farbe1);
  line(10,40,630,40);
  line(10,450,630,450);
  line(10,40,10,450);
  line(630,40,630,450);
  outtextxy(5,471,'                                                                  beenden (z)');
  outtextxy(5,462,'epsilon ver„ndern (j/J//v)  Grenzwert angeben (V)  auf n = 1  zurcksetzen (w) ');
  outtextxy(5,453,'alternierend (2)  Original (1)  zoomen (x/X//y/Y)  Ausschnitt verschieben (r/l)');
  setcolor(7);
  outtextxy(100,50,'Koeffizienten „ndern („)');
  outtextxy(300,420,'Epsilonumgebung setzen / l”schen (s/S)');
  outtextxy(300,440,'Koordinatensystem nach oben / unten (O/U)');
  outtextxy(300,430,'Epsilonumgebung nach oben / unten (o/u)');
end;

procedure ausgabe1;
begin
  zyfest:=zy;
  faktor:=1;
  h0:=0;
  yk:=0;
  g:=0;
  gfest:=0;
  epsilon:=0.1;
  a:=0;
  nanf:=0;
  graphik1;
  setz;
  f1;
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    '„':
    begin
      g01weg;
      hi:=1;
      g01;
      wahl:=' ';
    end;
    'a':
    begin
      loeschf1;
      loesch1;
      g01weg;
      a1:=a1-1;
      str(a1:1,z1);
      g01;
      setz;
      f1;
      wahl:=' ';
    end;
    'A':
    begin
      loeschf1;
      loesch1;
      g01weg;
      a1:=a1+1;
      str(a1:1,z1);
      g01;
      setz;
      f1;
      wahl:=' ';
    end;
    'b':
    begin
      loeschf1;
      loesch1;
      g01weg;
      a2:=a2-1;
      str(a2:1,z2);
      g01;
      setz;
      f1;
      wahl:=' ';
    end;
    'B':
    begin
      loeschf1;
      loesch1;
      g01weg;
      a2:=a2+1;
      str(a2:1,z2);
      g01;
      setz;
      f1;
      wahl:=' ';
    end;
    'c':
    begin
      loeschf1;
      loesch1;
      g01weg;
      a3:=a3-1;
      str(a3:1,z3);
      g01;
      setz;
      f1;
      wahl:=' ';
    end;
    'C':
    begin
      loeschf1;
      loesch1;
      g01weg;
      a3:=a3+1;
      str(a3:1,z3);
      g01;
      setz;
      f1;
      wahl:=' ';
    end;
    'd':
    begin
      loeschf1;
      loesch1;
      g01weg;
      a4:=a4-1;
      str(a4:1,z4);
      g01;
      setz;
      f1;
      wahl:=' ';
    end;
    'D':
    begin
      loeschf1;
      loesch1;
      g01weg;
      a4:=a4+1;
      str(a4:1,z4);
      g01;
      setz;
      f1;
      wahl:=' ';
    end;
    'e':
    begin
      loeschf1;
      loesch1;
      g01weg;
      a5:=a5-1;
      str(a5:1,z5);
      g01;
      setz;
      f1;
      wahl:=' ';
    end;
    'E':
    begin
      loeschf1;
      loesch1;
      g01weg;
      a5:=a5+1;
      str(a5:1,z5);
      g01;
      setz;
      f1;
      wahl:=' ';
    end;
    'f':
    begin
      loeschf1;
      loesch1;
      g01weg;
      a6:=a6-1;
      str(a6:1,z6);
      g01;
      setz;
      f1;
      wahl:=' ';
    end;
    'F':
    begin
      loeschf1;
      loesch1;
      g01weg;
      a6:=a6+1;
      str(a6:1,z6);
      g01;
      setz;
      f1;
      wahl:=' ';
    end;
    'g':
    begin
      loeschf1;
      loesch1;
      g01weg;
      a7:=a7-1;
      str(a7:1,z7);
      g01;
      setz;
      f1;
      wahl:=' ';
    end;
    'G':
    begin
      loeschf1;
      loesch1;
      g01weg;
      a7:=a7+1;
      str(a7:1,z7);
      g01;
      setz;
      f1;
      wahl:=' ';
    end;
    'h':
    begin
      loeschf1;
      loesch1;
      g01weg;
      a8:=a8-1;
      str(a8:1,z8);
      g01;
      setz;
      f1;
      wahl:=' ';
    end;
    'H':
    begin
      loeschf1;
      loesch1;
      g01weg;
      a8:=a8+1;
      str(a8:1,z8);
      g01;
      setz;
      f1;
      wahl:=' ';
    end;

    '2':
    begin
      loeschf1;
      loesch1;
      g01weg;
      a:=1;
      g01;
      setz;
      f1;
      wahl:=' ';
    end;
    '1':
    begin
      loeschf1;
      loesch1;
      g01weg;
      a:=0;
      g01;
      setz;
      f1;
      wahl:=' ';
    end;
    's':
    begin
      epshin;
      h0:=1;
      wahl:=' ';
    end;
    'S':
    begin
      epsweg;
      h0:=0;
      f1;
      setz;
      wahl:=' ';
    end;
    'j':
    begin
      epsweg;
      epsilon:=0.9*epsilon;
      epshin;
      wahl:=' ';
    end;
    'J':
    begin
      epsweg;
      epsilon:=1.1*epsilon;
      epshin;
      wahl:=' ';
    end;
    'o':
    begin
      loesch;
      loeschf1;
      epsweg;
      g:=g+1/zy;
      gfest:=zyfest*g;
      epshin;
      wahl:=' ';
    end;
    'u':
    begin
      loesch;
      loeschf1;
      epsweg;
      g:=g-1/zy;
      gfest:=zyfest*g;
      epshin;
      wahl:=' ';
    end;
    'V':
    begin
      epsweg;
      f1;
      setz;
      setcolor(farbe5);
      outtextxy(30,440,'(Grenzwert eingeben)');
      read(g);
      cleardevice;
      gfest:=zyfest*g;
      graphik1;
      f1;
      setz;
      epshin;
      wahl:=' ';
    end;
    'v':
    begin
      epsweg;
      f1;
      setz;
      setcolor(farbe5);
      outtextxy(30,440,'(Epsilon - Wert eingeben)');
      read(epsilon);
      cleardevice;
      graphik1;
      f1;
      setz;
      epshin;
      wahl:=' ';
    end;
    'O':
    begin
      loeschf1;
      loesch;
      if h0=1 then epsweg;
      yk:=yk+5;
      setz;
      f1;
      if h0=1 then epshin;
      wahl:=' ';
    end;
    'U':
    begin
      loeschf1;
      loesch;
      if h0=1 then epsweg;
      yk:=yk-5;
      setz;
      f1;
      if h0=1 then epshin;
      wahl:=' ';
    end;
    'r':
    begin
      loeschf1;
      loesch1;
      loesch;
      if h0=1 then epsweg;
      nanf:=nanf+5;
      setz;
      f1;
      if h0=1 then epshin;
      wahl:=' ';
    end;
    'l':
    begin
      if nanf>=5 then
      begin
       loeschf1;
       loesch1;
       loesch;
      if h0=1 then epsweg;
       nanf:=nanf-5;
       setz;
       f1;
      if h0=1 then epshin;
       wahl:=' ';
      end;
    end;

    'x':
    begin
      loeschf1;
      loesch;
      if h0=1 then epsweg;
      zx:=round(zx*0.9);
      setz;
      f1;
      if h0=1 then epshin;
      wahl:=' ';
    end;
    'X':
    begin
      loeschf1;
      loesch;
      if h0=1 then epsweg;
      zx:=round(zx*1.1);
      setz;
      f1;
      if h0=1 then epshin;
      wahl:=' ';
    end;
    'y':
    begin
      loeschf1;
      loesch;
      if h0=1 then epsweg;
      zy:=round(zy*0.9);
      faktor:=faktor*0.9;
      setz;
      f1;
      if h0=1 then epshin;
      wahl:=' ';
    end;
    'Y':
    begin
      loeschf1;
      loesch;
      if h0=1 then epsweg;
      zy:=round(zy*1.1);
      faktor:=faktor*1.1;
      setz;
      f1;
      if h0=1 then epshin;
      wahl:=' ';
    end;
    'w':
    begin
      cleardevice;
      graphik1;
  h0:=0;
  yk:=0;
  g:=0;
  epsilon:=0.1;
  a:=0;
  nanf:=0;
      if l=0 then
      begin
        zy:=155;
        zx:=20;
      end;
      setz;
      f1;
      setz1;
      wahl:=' ';
    end;
  end;
  until wahl='z';
end;

procedure p1;
begin
  cleardevice;
  en;
  hi:=0;
  a1:=1; str(a1:1,z1);
  a2:=1;  str(a2:1,z2);
  a3:=0; str(a3:1,z3);
  l:=0;
  a:=0;
  zy:=155;
  zx:=20;
  graphik1;
  ausgabe1;
  menue;
end;

procedure p2;
begin
  cleardevice;
  en;
  hi:=0;
  a1:=1; str(a1:1,z1);
  a2:=-63; str(a2:2,z2);
  a3:=2; str(a3:1,z3);
  a4:=-13; str(a4:2,z4);
  a5:=3; str(a5:1,z5);
  a6:=-52; str(a6:2,z6);
  l:=1;
  a:=0;
  zx:=20;
  zy:=70;
  graphik1;
  ausgabe1;
  menue;
end;

procedure p3;
begin
  cleardevice;
  en;
  hi:=0;
  a1:=1; str(a1:1,z1);
  a2:=-3; str(a2:1,z2);
  a3:=5;  str(a3:1,z3);
  a4:=-45; str(a4:1,z4);
  a5:=3;   str(a5:1,z5);
  a6:=-14; str(a6:1,z6);
  a7:=2;   str(a7:1,z7);
  a8:=-15; str(a8:1,z8);
  l:=2;
  a:=0;
  zx:=20;
  zy:=20;
  graphik1;
  ausgabe1;
  menue;
end;

procedure p4;
begin
  cleardevice;
  en;
  hi:=0;
  a1:=1;   str(a1:1,z1);
  a2:=100; str(a2:1,z2);
  a3:=100; str(a3:1,z3);
  l:=3;
  a:=0;
  zx:=10;
  zy:=155;
  graphik1;
  ausgabe1;
  menue;
end;

procedure p5;
begin
  cleardevice;
  en;
  hi:=0;
  a1:=1;   str(a1:1,z1);
  a2:=1;   str(a2:1,z2);
  a3:=-2;  str(a3:1,z3);
  a4:=-5;  str(a4:1,z4);
  a5:=2;   str(a5:1,z5);
  a6:=-2;  str(a6:1,z6);
  a7:=1;   str(a7:1,z7);
  a8:=3;   str(a8:1,z8);
  l:=4;
  a:=0;
  zx:=10;
  zy:=155;
  graphik1;
  ausgabe1;
  menue;
end;

{MAIN}
begin
  h000:=0;
  menue;
  repeat
  wahl1:=' ';
if keypressed then wahl1:=readkey;
  case wahl1 of
    '1':p1;
    '2':p2;
    '3':p3;
    '4':p4;
    '5':p5;
    'h':h000:=0;
    'd':h000:=1;
  end;
  until wahl1='b';
end.