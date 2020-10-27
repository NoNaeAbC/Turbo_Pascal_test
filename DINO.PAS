program schneeflocke;
uses crt,graph;
var
  m,t,a,b,hilfe,farb2,farb3,farbe,farbe1,farbe0,farbe2,farbe3,i,n,k,treiber,modus,anzahl:integer;
  xhilfe1,xhilfe2,yhilfe1,yhilfe2,laenge,xd,yd,phi,alpha,alpha0,xhilfe,yhilfe:real;
  helpx1,helpx2,helpy1,helpy2,xdreh,ydreh:real;

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
  outtextxy(180,150,'Intro  ->  1');
  outtextxy(180,220,'Konstruktion  ->  2');
  outtextxy(180,290,'Dino  ->  3');
  outtextxy(400,400,'beenden  ->  b');
end;

procedure graphik;
begin
  setbkcolor(farbe0);
  setcolor(7);
  outtextxy(30,437,'Abbildungsgleichung anzeigen/l”schen (A/a)  delay ver„ndern (t/T) ');
  outtextxy(170,425,'andere Beispiele (1 bis 6)  Original (w)');
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
  outtextxy(30,455,'n vergr”áern/verkleinern (N/n)       Figur drehen (d/D)       beenden (b)');
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
  line(a+round(x[0]),b-round(y[0]),a+round(x[1]),b-round(y[1]));
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
      xhilfe1:=x[round(exp(ln(2)*(k-1)))+i-1];
      yhilfe1:=y[round(exp(ln(2)*(k-1)))+i-1];
      xhilfe2:=x[round(exp(ln(2)*(k-1)))+i];
      yhilfe2:=y[round(exp(ln(2)*(k-1)))+i];
      line(a+round(xhilfe1),b-round(yhilfe1),a+round(xhilfe2),b-round(yhilfe2));
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

procedure l2;
begin
    circle(a+round(xdreh),b-round(ydreh),2);
    for i:=0 to round(exp(ln(2)*n)) do
    begin
      x[round(exp(ln(2)*n))+i+1]:=(x[i]-xdreh)*cos(alpha)-(y[i]-ydreh)*sin(alpha)+xdreh;
      y[round(exp(ln(2)*n))+i+1]:=(x[i]-xdreh)*sin(alpha)+(y[i]-ydreh)*cos(alpha)+ydreh;
      xhilfe1:=x[round(exp(ln(2)*n))+i+1];
      yhilfe1:=y[round(exp(ln(2)*n))+i+1];
      xhilfe2:=x[round(exp(ln(2)*n))+i];
      yhilfe2:=y[round(exp(ln(2)*n))+i];
      if i>=1 then
      line(a+round(xhilfe1),b-round(yhilfe1),a+round(xhilfe2),b-round(yhilfe2));
  end;
end;

procedure zeichne2;
begin
  setcolor(farbe1);
  x[0]:=0;
  y[0]:=0;
  x[1]:=laenge;
  y[1]:=0;

  line(a+round(x[0]),b-round(y[0]),a+round(x[1]),b-round(y[1]));
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
      xhilfe1:=x[round(exp(ln(2)*(k-1)))+i-1];
      yhilfe1:=y[round(exp(ln(2)*(k-1)))+i-1];
      xhilfe2:=x[round(exp(ln(2)*(k-1)))+i];
      yhilfe2:=y[round(exp(ln(2)*(k-1)))+i];
      line(a+round(xhilfe1),b-round(yhilfe1),a+round(xhilfe2),b-round(yhilfe2));
    end;
  end;
  xdreh:=x[round(exp(ln(2)*n))];
  ydreh:=y[round(exp(ln(2)*n))];
  setcolor(farbe2);
  l2;
end;


procedure loesch2;
begin
  setcolor(farbe0);
  l2;
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
      outtextxy(60,70,'y[neu]=(x[alt]-x[dreh])*sin(phi)+(y[alt]-y[dreh])*cos(phi)+y[dreh]');
      wahl:=' ';
    end;
    'a':
    begin
      setcolor(farbe0);
      outtextxy(60,60,'x[neu]=(x[alt]-x[dreh])*cos(phi)-(y[alt]-y[dreh])*sin(phi)+x[dreh]');
      outtextxy(60,70,'y[neu]=(x[alt]-x[dreh])*sin(phi)+(y[alt]-y[dreh])*cos(phi)+y[dreh]');
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
    '1':
    begin
      cleardevice;
      a:=450;
      b:=170;
      alpha:=0;
      laenge:=5;
      phi:=pi/2;
      t:=0;
      graphik;
      setz1;
      zeichne;
      wahl:=' ';
    end;
    '2':
    begin
      cleardevice;
      a:=70;
      b:=280;
      alpha:=0;
      laenge:=2;
      phi:=25/36*2*pi;
      t:=0;
      graphik;
      setz1;
      zeichne;
      wahl:=' ';
    end;
    '3':
    begin
      cleardevice;
      a:=300;
      b:=360;
      alpha:=0;
      laenge:=2;
      phi:=26/36*2*pi;
      t:=0;
      graphik;
      setz1;
      zeichne;
      wahl:=' ';
    end;
    '4':
    begin
      cleardevice;
      a:=340;
      b:=240;
      alpha:=0;
      laenge:=50;
      phi:=30/36*2*pi;
      t:=0;
      graphik;
      setz1;
      zeichne;
      wahl:=' ';
    end;
    '5':
    begin
      cleardevice;
      a:=280;
      b:=120;
      alpha:=0;
      laenge:=300;
      phi:=35/36*2*pi;
      t:=0;
      graphik;
      setz1;
      zeichne;
      wahl:=' ';
    end;
    '6':
    begin
      cleardevice;
      a:=150;
      b:=120;
      alpha:=0;
      laenge:=400;
      phi:=355/360*2*pi;
      t:=0;
      graphik;
      setz1;
      zeichne;
      wahl:=' ';
    end;
    'w':
    begin
      cleardevice;
      a:=450;
      b:=270;
      alpha:=0;
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
    a:=450;
    b:=270;
    laenge:=5;
    phi:=3/2*pi;
    alpha:=0;
    t:=0;
    graphik;
    setz1;
    auswahl;
  menue;
end;

procedure b1;
begin
  cleardevice;

  n:=12;
    a:=430;
    b:=270;
    laenge:=4;
    phi:=3/2*pi;
    alpha:=0;
    t:=10;
    zeichne;
    delay(10000);
    t:=10;
    loesch;

    a:=300;
    b:=250;
  n:=0;
    laenge:=50;
    zeichne;
    m:=35;
    setcolor(7);
    outtextxy(m,m,'D');
    delay(7000);
    loesch;

  n:=1;
    alpha:=pi/4;
    laenge:=40;
    setcolor(7);
    outtextxy(m,2*m,'r');
    zeichne;
    delay(7000);
    loesch;

  n:=2;
    alpha:=pi/2;
    laenge:=35;
    zeichne;
    setcolor(7);
    outtextxy(m,3*m,'a');
    delay(7000);
    loesch;

  n:=3;
    alpha:=3*pi/4;
    laenge:=30;
    zeichne;
    setcolor(7);
    outtextxy(m,4*m,'c');
    delay(7000);
    loesch;

  n:=4;
    laenge:=25;
    alpha:=pi;
    zeichne;
    setcolor(7);
    outtextxy(m,5*m,'h');
    delay(7000);
    loesch;

  n:=5;
    laenge:=20;
    alpha:=5*pi/4;
    zeichne;
    setcolor(7);
    outtextxy(m,6*m,'e');
    delay(7000);
    loesch;

  n:=6;
    alpha:=6*pi/4;
    laenge:=18;
    setcolor(7);
    outtextxy(m,7*m,'n');
    zeichne;
    delay(7000);
    loesch;

  n:=7;
    alpha:=7*pi/4;
    laenge:=15;
    setcolor(7);
    outtextxy(m,8*m,'k');
    outtextxy(m,9*m,'u');
    outtextxy(m,10*m,'r');
    zeichne;
    delay(7000);
    loesch;

    a:=170;
    b:=315;
    laenge:=18;
    alpha:=pi/4;
  n:=8;
    setcolor(7);
    outtextxy(m,11*m,'v');
    outtextxy(m,12*m,'e');
    zeichne;
    delay(5000);
    loesch;

    a:=400;
    b:=360;
    laenge:=16;
    alpha:=pi/2;
  n:=9;
    t:=100;
    zeichne;
    delay(7000);
    t:=50;
    loesch;

    t:=5;
    laenge:=8;
    a:=350;
    b:=260;
  n:=9;
    hilfe:=0;
    repeat
      hilfe:=hilfe+1;
      loesch;
        setcolor(farbe0);
        outtextxy(a-15+round(240*cos(alpha)),b+round(240*sin(alpha)),'Dino');
        outtextxy(a-12+round(240*cos(alpha)),b+10+round(240*sin(alpha)),'- Park');
      alpha:=alpha+pi/10;
        setcolor(7);
        outtextxy(a-15+round(240*cos(alpha)),b+round(240*sin(alpha)),'Dino');
        outtextxy(a-12+round(240*cos(alpha)),b+10+round(240*sin(alpha)),'- Park');
      zeichne;
{
      if hilfe mod 2=0 then
      begin
        setcolor(12);
        outtextxy(a+round(250*cos(alpha)),b+round(250*sin(alpha)),'Dino');
        setcolor(farbe0);
        outtextxy(a+round(250*cos(alpha)),b+round(250*sin(alpha)),'Dino');
        outtextxy(500,m,'Dino');
      end
      else
      begin
        setcolor(farbe0);
        outtextxy(500,12*m,'Dino');
        setcolor(12);
        outtextxy(500,m,'Dino');
      end;
}
    until hilfe>=15;
    delay(6000);
    loesch;
        outtextxy(a-15+round(240*cos(alpha)),b+round(240*sin(alpha)),'Dino');
        outtextxy(a-12+round(240*cos(alpha)),b+10+round(240*sin(alpha)),'- Park');
    outtextxy(m,7*m,'n');
    outtextxy(m,8*m,'k');
    outtextxy(m,9*m,'u');
    outtextxy(m,10*m,'r');
    outtextxy(m,11*m,'v');
    outtextxy(m,12*m,'e');

    a:=470;
    b:=290;
    n:=12;
    laenge:=6;
    zeichne;
  setcolor(7);
  outtextxy(350,460,'Wiederholen (w)    Beenden (b)');
end;

procedure auswahl1;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    'w':
    begin
      b1;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure bewegung0;
begin
   b1;
   auswahl1;
   menue;
end;

procedure b2;
begin
  setcolor(7);
  outtextxy(500,450,'Pause (p)');
   for n:=0 to 7 do
   begin
    t:=0;
    alpha:=0;
    zeichne;
    delay(10000);
    alpha:=alpha-(2*pi-phi)/15;
    zeichne2;
    hilfe:=1;
  wahl1:=' ';
    repeat
      if keypressed then wahl1:=readkey;
      case wahl1 of
        'p':wahl1:=readkey;
      end;
        hilfe:=hilfe+1;
        loesch2;
        alpha:=alpha-(2*pi-phi)/15;
        zeichne2;
        delay(1000);
      until (hilfe>=15) or (wahl1='z');
      delay(10000);
      loesch2;
   end;
  setcolor(farbe0);
  outtextxy(500,450,'Pause (p)');
   n:=8;
   alpha:=0;
   zeichne;
  setcolor(7);
  outtextxy(500,450,'Leertaste');
  repeat until keypressed;
  setcolor(farbe0);
  outtextxy(500,450,'Leertaste');
  setcolor(7);
  str(phi*180/pi:4:0,ortx1);
  outtextxy(100,450,ortx1+' ø');
  outtextxy(60,450,'phi =        ');
  str(360-phi*180/pi:4:0,ortx2);
  outtextxy(390,450,ortx2+' ø ');
  outtextxy(210,450,'entspricht Drehung um        ');
  outtextxy(50,30,'starten (s)  andere Beispiele (1 bis 6)   Original (w)   beenden (b)');
  outtextxy(60,20,'verschieben (o/u/l/r)   Gr”áe ver„ndern (g/k)   Phi ver„nden (p/P)');
end;

procedure setz11;
begin
  setcolor(7);
  str(phi*180/pi:4:0,ortx1);
  outtextxy(100,450,ortx1+' ø');
  outtextxy(60,450,'phi =        ');
  str(360-phi*180/pi:4:0,ortx2);
  outtextxy(390,450,ortx2+' ø ');
  outtextxy(210,450,'entspricht Drehung um        ');
end;

procedure loesch11;
begin
  setcolor(farbe0);
  outtextxy(390,450,ortx2+' ø');
  outtextxy(100,450,ortx1+' ø');
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
      setz11;
      b2;
      wahl:=' ';
    end;
    'w':
    begin
      a:=200;
      b:=160;
      laenge:=20;
      phi:=3/2*pi;
      cleardevice;
      b2;
      wahl:=' ';
    end;
    'g':
    begin
      if laenge<200 then
      begin
        loesch;
        laenge:=laenge+1;
        zeichne;
      end;
      wahl:=' ';
    end;
    'k':
    begin
      if laenge>1 then
      begin
        loesch;
        laenge:=laenge-1;
        zeichne;
      end;
      wahl:=' ';
    end;
    'r':
    begin
      if a<500 then
      begin
        loesch;
        a:=a+5;
        zeichne;
      end;
      wahl:=' ';
    end;
    'l':
    begin
      if a>100 then
      begin
        loesch;
        a:=a-5;
        zeichne;
      end;
      wahl:=' ';
    end;
    'o':
    begin
      if b>100 then
      begin
        loesch;
        b:=b-5;
        zeichne;
      end;
      wahl:=' ';
    end;
    'u':
    begin
      if b<400 then
      begin
        loesch;
        b:=b+5;
        zeichne;
      end;
      wahl:=' ';
    end;
    'p':
    begin
        loesch;
        loesch11;
        phi:=phi-pi/180;
        setz11;
        zeichne;
      wahl:=' ';
    end;
    'P':
    begin
        loesch;
        loesch11;
        phi:=phi+pi/180;
        setz11;
        zeichne;
      wahl:=' ';
    end;
    '1':
    begin
      cleardevice;
      a:=180;
      b:=300;
      alpha:=0;
      laenge:=20;
      phi:=pi/2;
      setz11;
      b2;
      wahl:=' ';
    end;
    '2':
    begin
      cleardevice;
      a:=340;
      b:=50;
      alpha:=0;
      laenge:=7;
      phi:=25/36*2*pi;
      setz11;
      b2;
      wahl:=' ';
    end;
    '3':
    begin
      cleardevice;
      a:=180;
      b:=70;
      alpha:=0;
      laenge:=15;
      phi:=26/36*2*pi;
      setz11;
      b2;
      wahl:=' ';
    end;
    '4':
    begin
      cleardevice;
      a:=340;
      b:=240;
      alpha:=0;
      laenge:=50;
      phi:=30/36*2*pi;
      setz11;
      b2;
      wahl:=' ';
    end;
    '5':
    begin
      cleardevice;
      a:=280;
      b:=120;
      alpha:=0;
      laenge:=300;
      phi:=35/36*2*pi;
      setz11;
      b2;
      wahl:=' ';
    end;
    '6':
    begin
      cleardevice;
      a:=150;
      b:=120;
      alpha:=0;
      laenge:=400;
      phi:=355/360*2*pi;
      setz11;
      b2;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure bewegung2;
begin
   a:=200;
   b:=160;
   laenge:=20;
   phi:=3/2*pi;
   cleardevice;
   b2;
   auswahl2;
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
    '1':bewegung0;
    '3':bewegung;
    '2':bewegung2;
  end;
  until wahl1='b';
end.