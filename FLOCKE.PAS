program schneeflocke;
uses crt,graph;
var
  hilfe,farb2,farb3,farbe,farbe1,farbe0,farbe2,farbe3,i,n,k,treiber,modus,laenge,anzahl:integer;
  phi,alpha,alpha0,alpha00,xanf,xa,xe,ya,ye,l,L0:real;

  wahl1,wahl:char;
  ortx1,ortx2,ortx3:string;
  flocke:array[1..3*16*16*16] of integer;
  el:array[1..16*16*4] of real;
  al:array[1..16*16*4] of real;
  xan:array[1..16*16*4] of real;
  yan:array[1..16*16*4] of real;

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
  outtextxy(150,200,'Schneeflocke (eigene)  ->  1');
  outtextxy(150,250,'Schneeflocke (rein rekursiv)  -> 2');
  outtextxy(150,300,'Pythagoras  -> 3');
  outtextxy(400,400,'beenden  ->  b');
end;

procedure graphik;
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
  outtextxy(275,15,'Schneeflocke ');
  outtextxy(50,460,'n vergr”áern (N)   n verkleinern (n)                     beenden (b)');
end;

procedure flo;
begin
  setcolor(farbe);
  alpha:=0;
  for i:=1 to 3*round(exp(ln(4)*n)) do
  flocke[i]:=0;

    for k:=0 to n-1 do
    begin
      for i:=1 to 3*round(exp(ln(4)*k)) do
        begin
         flocke[4*i]:=flocke[i];
         flocke[4*i-3]:=1;
         flocke[4*i-2]:=0;
         flocke[4*i-1]:=1;
        end;
    end;
    if n=2 then flocke[16]:=0;
    if n=3 then flocke[4*16]:=0;
    if n=4 then flocke[16*16]:=0;
    if n=5 then flocke[4*16*16]:=0;
    if n=6 then flocke[16*16*16]:=0;
    L:=L/(exp(ln(3)*n));
    xe:=xa+L;
    line(round(xa),round(ya),round(xe),round(ye));
    for k:=1 to 3*round(exp(ln(4)*n))-1 do
    begin
      if flocke[k]=0 then
      begin
        alpha:=alpha+120/180*pi;
      end;
      if flocke[k]=1 then
      begin
        alpha:=alpha-60/180*pi;
      end;
      xa:=xe;
      ya:=ye;
      xe:=xa+L*cos(alpha);
      ye:=ya-L*sin(alpha);
      line(round(xa),round(ya),round(xe),round(ye));
    end;
end;

procedure fuell;
begin
  farbe:=farbe1;
  flo;
end;

procedure loesch;
begin
  farbe:=farbe0;
  flo;
end;

procedure setz1;
begin
  setcolor(farbe1);
  str(n:2,ortx1);
  outtextxy(545,420,ortx1);
end;

procedure loesch1;
begin
  setcolor(farbe0);
  outtextxy(545,420,ortx1);
end;


procedure auswahl;
begin
  wahl:=' ';
  fuell;
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    'n':
    begin
        L:=350;
        xa:=150;
        xe:=xa+L;
        ya:=340;
        ye:=340;
      loesch;
        L:=350;
        xa:=150;
        xe:=xa+L;
        ya:=340;
        ye:=340;
      if n>=1 then
      begin
        loesch1;
        n:=n-1;
        setz1;
        fuell;
      end;
      wahl:=' ';
    end;
    'N':
    begin
       L:=350;
       xa:=150;
       xe:=xa+L;
       ya:=340;
       ye:=340;
      if n<=5 then
      begin
       loesch1;
       loesch;
        L:=350;
        xa:=150;
        xe:=xa+L;
        ya:=340;
        ye:=340;
       n:=n+1;
       setz1;
       fuell;
      end;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure bewegung;
begin
  cleardevice;
    n:=1;
    L:=350;
    xa:=150;
    xe:=xa+L;
    ya:=340;
    ye:=340;
    graphik;
    setz1;
    auswahl;
  menue;
end;

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


{MAIN}
begin
  wahl1:=' ';
  menue;
  repeat
  wahl1:=' ';
  if keypressed then wahl1:=readkey;
  case wahl1 of
    '1':bewegung;
    '2':bewegung2;
    '3':bewegung3;
  end;
  until wahl1='b';
end.