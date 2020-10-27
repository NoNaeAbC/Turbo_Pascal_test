program schneeflocke;
uses crt,graph;
var
  t,a,b,hilfe,farb2,farb3,farbe,farbe1,farbe0,farbe2,farbe3,i,n,k,treiber,modus,anzahl:integer;
  laenge,xd,yd,phi,alpha,alpha0,xhilfe,yhilfe:real;

  wahl1,wahl:char;
  ortx1,ortx2,ortx3:string;

  x:array[0..16*16*16] of real;
  y:array[0..16*16*16] of real;

procedure menue;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(15);
  setcolor(1);
  farbe0:=15;
  farbe1:=8;
  farbe2:=12;
  farbe3:=10;
  outtextxy(150,150,'Intro  ->  0');
  outtextxy(150,250,'Dino  ->  1');
  outtextxy(150,350,'Entstehung  -> 2');
  outtextxy(400,400,'beenden  ->  b');
end;

procedure graphik;
begin
  setbkcolor(farbe0);
  setcolor(7);
  outtextxy(30,437,'Abbildungsgleichung anzeigen/l”schen (A/a)  delay ver„ndern (t/T) ');
  str(t:3,ortx3);
  outtextxy(560,437,ortx3);
  setcolor(farbe1);
  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  str(n:2,ortx1);
  outtextxy(545,420,ortx1);
  outtextxy(520,420,'n =        ');
  str(phi*180/pi:4:0,ortx2);
  outtextxy(100,420,ortx2+' ø');
  outtextxy(60,420,'phi =        ');
  outtextxy(205,15,'"Dino - Park" ( Drachenkurve )');
  outtextxy(30,455,'n vergr”áern/verkleinern (N/n)                                beenden (b)');
  outtextxy(60,465,'verschieben (o/u/l/r)   Gr”áe ver„ndern (g/k)   Phi ver„nden (p/P)');
end;

procedure drehung;
begin
    xhilfe:=x[1];
    yhilfe:=y[1];
    x[1]:=xhilfe*cos(alpha)-yhilfe*sin(alpha);
    y[1]:=xhilfe*sin(alpha)+yhilfe*cos(alpha);
end;



procedure neu;
begin
  setcolor(farbe);
  x[0]:=0;
  y[0]:=0;
  x[1]:=laenge;
  y[1]:=0;
  drehung;
  for k:=1 to n do
  begin
    xd:=x[round(exp(ln(2)*(k-1)))];
    yd:=y[round(exp(ln(2)*(k-1)))];
    for i:=1 to round(exp(ln(2)*(k-1))) do
    begin
      xhilfe:=x[round(exp(ln(2)*(k-1)))-i];
      yhilfe:=y[round(exp(ln(2)*(k-1)))-i];
      x[round(exp(ln(2)*(k-1)))+i]:=(xhilfe-xd)*cos(phi)-(yhilfe-yd)*sin(phi)+xd;
      y[round(exp(ln(2)*(k-1)))+i]:=(xhilfe-xd)*sin(phi)+(yhilfe-yd)*cos(phi)+yd;
      line(a+round(x[i+1]),b-round(y[i+1]),a+round(x[i]),b-round(y[i]));
    delay(t);
    end;
  end;
end;

procedure zeichne;
begin
  farbe:=farbe1;
  neu;
end;

procedure loesch;
begin
  farbe:=farbe0;
  neu;
end;

procedure setz1;
begin
  setcolor(farbe1);
  str(n:2,ortx1);
  outtextxy(545,420,ortx1);
  str(phi*180/pi:4:0,ortx2);
  outtextxy(100,420,ortx2+' ø');
  setcolor(7);
  str(t:3,ortx3);
  outtextxy(560,437,ortx3);
end;

procedure loesch1;
begin
  setcolor(farbe0);
  outtextxy(545,420,ortx1);
  outtextxy(100,420,ortx2+' ø');
  outtextxy(560,437,ortx3);
end;


procedure auswahl;
begin
  wahl:=' ';
  zeichne;
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    'A':
    begin
      setcolor(7);
      outtextxy(60,60,'x[neu]=(x[alt]-x[dreh])*cos(phi)-(y[alt]-y[dreh])*sin(phi)+x[dreh]');
      outtextxy(60,70,'y[neu]=(x[alt]-x[dreh])*sin(phi)-(y[alt]-y[dreh])*cos(phi)+y[dreh]');
      wahl:=' ';
    end;
    'a':
    begin
      setcolor(farbe0);
      outtextxy(60,60,'x[neu]=(x[alt]-x[dreh])*cos(phi)-(y[alt]-y[dreh])*sin(phi)+x[dreh]');
      outtextxy(60,70,'y[neu]=(x[alt]-x[dreh])*sin(phi)-(y[alt]-y[dreh])*cos(phi)+y[dreh]');
      wahl:=' ';
    end;
    'D':
    begin
        loesch;
        alpha:=alpha+pi/18;
        zeichne;
      wahl:=' ';
    end;
    'd':
    begin
        loesch;
        alpha:=alpha-pi/18;
        zeichne;
      wahl:=' ';
    end;
    'g':
    begin
      if laenge<200 then
      begin
        loesch;
        loesch1;
        laenge:=laenge+1;
        setz1;
        zeichne;
      end;
      wahl:=' ';
    end;
    'k':
    begin
      if laenge>1 then
      begin
        loesch;
        loesch1;
        laenge:=laenge-1;
        setz1;
        zeichne;
      end;
      wahl:=' ';
    end;
    'r':
    begin
      if a<500 then
      begin
        loesch;
        loesch1;
        a:=a+5;
        setz1;
        zeichne;
      end;
      wahl:=' ';
    end;
    'l':
    begin
      if a>100 then
      begin
        loesch;
        loesch1;
        a:=a-5;
        setz1;
        zeichne;
      end;
      wahl:=' ';
    end;
    'o':
    begin
      if b>100 then
      begin
        loesch;
        loesch1;
        b:=b-5;
        setz1;
        zeichne;
      end;
      wahl:=' ';
    end;
    'u':
    begin
      if b<400 then
      begin
        loesch;
        loesch1;
        b:=b+5;
        setz1;
        zeichne;
      end;
      wahl:=' ';
    end;
    'p':
    begin
        loesch;
        loesch1;
        phi:=phi-pi/180;
        setz1;
        zeichne;
      wahl:=' ';
    end;
    'P':
    begin
        loesch;
        loesch1;
        phi:=phi+pi/180;
        setz1;
        zeichne;
      wahl:=' ';
    end;
    't':
    begin
      if t>=5 then
      begin
        loesch1;
        t:=t-5;
        setz1;
      end;
      wahl:=' ';
    end;
    'T':
    begin
      if t<=200 then
      begin
        loesch1;
        t:=t+5;
        setz1;
      end;
      wahl:=' ';
    end;
    'w':
    begin
      cleardevice;
      a:=350;
      b:=330;
      laenge:=5;
      phi:=3/2*pi;
      t:=0;
      graphik;
      setz1;
      zeichne;
      wahl:=' ';
    end;
    'n':
    begin
      if n>=1 then
      begin
        loesch;
        loesch1;
        n:=n-1;
        setz1;
        zeichne;
      end;
      wahl:=' ';
    end;
    'N':
    begin
     if n<=11 then
     begin
      loesch1;
      n:=n+1;
      setz1;
      zeichne;
     end;
    wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure bewegung;
begin
  cleardevice;
    n:=4;
    a:=350;
    b:=330;
    laenge:=5;
    phi:=3/2*pi;
    alpha:=0;
    t:=0;
    graphik;
    setz1;
    auswahl;
  menue;
end;

procedure bewegung0;
begin
  cleardevice;
    n:=12;
    a:=350;
    b:=330;
    laenge:=5;
    phi:=3/2*pi;
    alpha:=0;
    t:=10;
    zeichne;
    delay(10000);
    t:=10;
    loesch;
    a:=150;
    b:=315;
    laenge:=20;
    alpha:=pi/4;
    n:=9;
    t:=300;
    zeichne;
    delay(5000);
    loesch;
    a:=350;
    b:=330;
    laenge:=15;
    alpha:=pi/2;
    n:=10;
    t:=100;
    zeichne;
    t:=50;
    loesch;
    t:=5;
    laenge:=8;
    n:=9;
    hilfe:=0;
    repeat
      hilfe:=hilfe+1;
      loesch;
      alpha:=alpha+pi/10;
      zeichne;
    until hilfe>=15;
    delay(2000);
    loesch;
    a:=380;
    b:=380;
    n:=12;
    zeichne;
    repeat until keypressed;
  menue;
end;


procedure bewegung2;
begin
  cleardevice;
    n:=1;
    a:=350;
    b:=330;
    laenge:=5;
    phi:=3/2*pi;
    alpha:=0;
    t:=0;
    zeichne;
    delay(10000);
    farbe1:=12;
    alpha:=alpha+pi/30;
    zeichne;
    hilfe:=1;
    repeat
      hilfe:=hilfe+1;
      loesch;
      alpha:=alpha+pi/30;
      zeichne;
      delay(5000);
    until hilfe>=15;
    delay(2000);
    loesch;
    farbe1:=8;
    n:=2;
    a:=350;
    b:=330;
    laenge:=5;
    phi:=3/2*pi;
    alpha:=0;
    t:=10;
    zeichne;
    delay(10000);
    repeat until keypressed;
  menue;
end;


{
procedure forwd;
begin
  xa:=xe;
  ya:=ye;
  xe:=xa+L*cos(alpha);
  ye:=ya-L*sin(alpha);
  line(round(xa),round(ya),round(xe),round(ye));
end;

procedure turnleft;
begin
  alpha:=alpha+120/180*pi;
end;

procedure turnright;
begin
  alpha:=alpha-60/180*pi;
end;

procedure nochmal(laenge,anzahl:integer);
begin
  if  anzahl<n then
    nochmal(laenge,anzahl+1);
  forwd;
  turnright;
  if  anzahl<n then
    nochmal(laenge,anzahl+1);
  forwd;
  turnleft;
  if  anzahl<n then
    nochmal(laenge,anzahl+1);
  forwd;
  turnright;
  if  anzahl<n then
    nochmal(laenge,anzahl+1);
end;


procedure flo2;
begin
  setcolor(farbe);
  alpha:=0;
  L:=L/(exp(ln(3)*n));
  for i:=1 to 3 do
  begin
    nochmal(laenge,1);
    forwd;
    turnleft;
  end;
end;

procedure fuell2;
begin
  farbe:=farbe1;
  flo2;
end;

procedure loesch2;
begin
  farbe:=farbe0;
  flo2;
end;

procedure anf;
begin
  L:=L0;
  xa:=xanf;
  xe:=xa+L;
  ya:=340;
  ye:=340;
end;

procedure auswahl2;
begin
  wahl:=' ';
  fuell2;
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    'n':
    begin
      loesch2;
      anf;
      if n>=2 then
      begin
        loesch1;
        loesch2;
        anf;
        n:=n-1;
        setz1;
        fuell2;
      end;
      wahl:=' ';
    end;
    'N':
    begin
      anf;
       loesch1;
       loesch2;
       anf;
       n:=n+1;
       setz1;
       fuell2;
      wahl:=' ';
    end;
    'v':
    begin
      loesch2;
      anf;
      if L0>=20 then
      begin
        anf;
        loesch1;
        loesch2;
        L0:=round(L0/2);
        xanf:=xanf+L0;
        anf;
    graphik;
  outtextxy(50,460,'                                        Maástab (v/V) ');
        setz1;
        fuell2;
      end;
      wahl:=' ';
    end;
    'V':
    begin
      loesch2;
      anf;
       loesch1;
       loesch2;
       L0:=2*L0;
       xanf:=xanf-L0/2;
       anf;
    graphik;
  outtextxy(50,460,'                                        Maástab (v/V) ');
       setz1;
       fuell2;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure bewegung2;
begin
  cleardevice;
    n:=3;
    xanf:=-200;
    L0:=350;
    anf;
    graphik;
  outtextxy(50,460,'                                        Maástab (v/V) ');
    setz1;
    auswahl2;
  menue;
end;

procedure graphik3;
begin
  setbkcolor(farbe0);
  setcolor(farbe1);
  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  str(n:2,ortx1);
  outtextxy(545,420,ortx1);
  outtextxy(520,420,'n =        ');
  outtextxy(205,15,'Pythagor„isches B„umchen ');
  outtextxy(30,460,'n ver„ndern (n/N)   Winkel ver„ndern (a/A)   Figur drehen (d)  beenden (b)');
end;


procedure linie(L,alpha:real);
begin
  xa:=xe;
  ya:=ye;
  xe:=xa+L*cos(alpha);
  ye:=ya-L*sin(alpha);
  line(round(xa),round(ya),round(xe),round(ye));
end;

procedure left(phi:real);
begin
  alpha:=alpha+phi/180*pi;
end;

procedure right(phi:real);
begin
  alpha:=alpha-phi/180*pi;
end;

procedure quadratweg;
begin
  setcolor(farbe0);
  linie(L0,alpha);
  right(90);
  linie(L0,alpha);
  right(90);
  linie(L0,alpha);
  right(90);
  linie(L0,alpha);
  right(90);
end;

procedure quadrat;
begin
  setcolor(farbe1);
  linie(L0,alpha);
  right(90);
  linie(L0,alpha);
  right(90);
  linie(L0,alpha);
  right(90);
  linie(L0,alpha);
  right(90);
end;

procedure dreieck;
begin
  linie(L0,alpha);
  setcolor(farb3);
  left(90+alpha0/pi*180);
  linie(L0*sin(alpha0),alpha);
  setcolor(farb2);
  left(90);
  linie(L0*cos(alpha0),alpha);
  right(90);
  linie(L0*cos(alpha0),alpha);
  right(90);
  linie(L0*cos(alpha0),alpha);
  anzahl:=anzahl+1;
  el[anzahl]:=L0*cos(alpha0);
  al[anzahl]:=alpha;
  xan[anzahl]:=xa;
  yan[anzahl]:=ya;
  right(90);
  linie(L0*cos(alpha0),alpha);
  left(90);
  setcolor(farb3);
  linie(L0*sin(alpha0),alpha);
  right(90);
  linie(L0*sin(alpha0),alpha);
  anzahl:=anzahl+1;
  el[anzahl]:=L0*sin(alpha0);
  al[anzahl]:=alpha;
  xan[anzahl]:=xa;
  yan[anzahl]:=ya;
  right(90);
  linie(L0*sin(alpha0),alpha);
end;

procedure setz3;
begin
  setcolor(farbe1);
  farb2:=farbe2;
  farb3:=farbe3;
  dreieck;
end;

procedure loesch3;
begin
  setcolor(farbe0);
  farb2:=farbe0;
  farb3:=farbe0;
  dreieck;
end;


procedure delta;
begin
  xe:=xan[k+hilfe];
  ye:=yan[k+hilfe];
  alpha:=al[k+hilfe];
  l0:=el[k+hilfe];
  setz3;
end;

procedure deltaweg;
begin
  xe:=xan[k+hilfe];
  ye:=yan[k+hilfe];
  alpha:=al[k+hilfe];
  l0:=el[k+hilfe];
  loesch3;
end;

procedure figur;
begin
  quadrat;
  anzahl:=0;
  setz3;
  k:=0;
  hilfe:=0;
  for i:=1 to n do
    begin
      hilfe:=hilfe+k;
      for k:=1 to round(exp(ln(2)*i)) do
      delta;
    end;
end;

procedure figurweg;
begin
  quadratweg;
  anzahl:=0;
  loesch3;
  k:=0;
  hilfe:=0;
  for i:=1 to n do
    begin
      hilfe:=hilfe+k;
      for k:=1 to round(exp(ln(2)*i)) do
      deltaweg;
    end;
end;

procedure null;
begin
      alpha:=alpha00;
      L0:=80;
      xe:=300;
      ye:=300;
end;

procedure auswahl3;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    'N':
    begin
    if n<8 then
    begin
      null;
      loesch1;
      figur;
      n:=n+1;
      setz1;
      null;
      figur;
    end;
    wahl:=' ';
    end;
    'n':
    begin
    if n>=1 then
    begin
      null;
      loesch1;
      figurweg;
      n:=n-1;
      null;
      setz1;
      figur;
      end;
      wahl:=' ';
    end;
    'd':
    begin
      null;
      figurweg;
      alpha00:=alpha00-10/180*pi;
      null;
      figur;
      graphik3;
      wahl:=' ';
    end;
    'a':
    begin
      null;
      figurweg;
      alpha0:=alpha0-1/180*pi;
      null;
      figur;
      wahl:=' ';
    end;
    'A':
    begin
      null;
      figurweg;
      alpha0:=alpha0+1/180*pi;
      null;
      figur;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure bewegung3;
begin
  cleardevice;
    n:=6;
    alpha00:=0/180*pi;
    alpha0:=40/180*pi;
    null;
    graphik3;
    figur;
    setz1;
    auswahl3;
  menue;
end;
}

{MAIN}
begin
  wahl1:=' ';
  menue;
  repeat
  wahl1:=' ';
  if keypressed then wahl1:=readkey;
  case wahl1 of
    '0':bewegung0;
    '1':bewegung;
    '2':bewegung2;
  end;
  until wahl1='b';
end.