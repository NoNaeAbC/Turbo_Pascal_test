program schneeflocke;
uses crt,graph;
var
  hilfe,farb1,farb2,farb3,farbe,farbe1,farbe0,farbe2,farbe3,i,n,k,treiber,modus,laenge,anzahl:integer;
  x1,y1,alpha1,phi,alpha,alpha0,alpha00,xanf,xa,xe,ya,ye,l,L0,L1,L2:real;
   anz,a1,a,b,c,grenze:real;

  wahl1,wahl:char;
  ortx1,ortx2,ortx3:string;

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
  outtextxy(150,200,'Schneeflocke   ->  1');
  outtextxy(150,300,'Pythagor„isches B„umchen  -> 2');
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
  str((alpha0/pi*180):4:0,ortx2);
  outtextxy(145,420,ortx2+'ø');
  outtextxy(100,420,'alpha =');
  str(N:2,ortx1);
  outtextxy(545,420,ortx1);
  outtextxy(520,420,'N =        ');
  outtextxy(205,15,'Pythagor„isches B„umchen ');
  outtextxy(30,460,'N ver„ndern (n/N)   Winkel ver„ndern (a/A)   Figur drehen (d)  beenden (b)');
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
  linie(c,alpha);
  right(90);
  linie(c,alpha);
  right(90);
  linie(c,alpha);
  right(90);
  linie(c,alpha);
  right(90);
end;

procedure quadrat;
begin
  setcolor(farbe1);
  linie(c,alpha);
  right(90);
  linie(c,alpha);
  right(90);
  linie(c,alpha);
  right(90);
  linie(c,alpha);
  right(90);
end;

procedure dreieck(c,anz:real);
  var
    a,b:real;
begin
  a:=c*sin(alpha0);
  b:=c*cos(alpha0);

  setcolor(farb1);
  linie(c,alpha);

  setcolor(farb2);
  left(90+alpha0/pi*180);
  linie(a,alpha);
  right(90);
  linie(a,alpha);
  right(90);
  if anz<n then dreieck(a,anz+1);
  setcolor(farb2);
  linie(a,alpha);
  right(90);
  linie(a,alpha);
  right(90);
  linie(a,alpha);

  setcolor(farb3);
  left(90);
  linie(b,alpha);
  right(90);
  linie(b,alpha);
  right(90);
  if anz<n then dreieck(b,anz+1);
  setcolor(farb3);
  linie(b,alpha);
  right(90);
  linie(b,alpha);
  right(90);
  linie(b,alpha);
  left(180-alpha0/pi*180);

end;



procedure setz3;
begin
  setcolor(farbe1);
  str(N:2,ortx1);
  outtextxy(545,420,ortx1);
  str((alpha0/pi*180):4:0,ortx2);
  outtextxy(145,420,ortx2+'ø');
end;

procedure loesch3;
begin
  setcolor(farbe0);
  outtextxy(545,420,ortx1);
  outtextxy(145,420,ortx2+'ø');
end;


procedure figur;
begin
  quadrat;
  farb1:=farbe1;
  farb2:=farbe2;
  farb3:=farbe3;
  dreieck(c,1);
end;

procedure figurweg;
begin
  quadratweg;
  farb1:=farbe0;
  farb2:=farbe0;
  farb3:=farbe0;
  dreieck(c,1);
end;

procedure null;
begin
      alpha:=alpha00;
      L1:=80;
      xe:=300;
      ye:=300;
    c:=L1*cos(alpha);
end;

procedure auswahl3;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    'N':
    begin
    if N<78 then
    begin
      null;
      loesch3;
      figurweg;
      n:=n+1;
      setz3;
      null;
      figur;
    end;
    wahl:=' ';
    end;
    'n':
    begin
    if n>1 then
    begin
      null;
      loesch3;
      figurweg;
      n:=n-1;
      null;
      setz3;
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
    'D':
    begin
      null;
      figurweg;
      alpha00:=alpha00+10/180*pi;
      null;
      figur;
      graphik3;
      wahl:=' ';
    end;
    'a':
    begin
      null;
      figurweg;
      loesch3;
      alpha0:=alpha0-1/180*pi;
      null;
      figur;
      graphik3;
      wahl:=' ';
    end;
    'A':
    begin
      null;
      figurweg;
      loesch3;
      alpha0:=alpha0+1/180*pi;
      null;
      figur;
      graphik3;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure bewegung3;
begin
  cleardevice;
    n:=5;

    alpha00:=0/180*pi;
    alpha0:=40/180*pi;
    null;
    L0:=l1;
    c:=L0*cos(alpha00);
    graphik3;
    figur;
    setz3;
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
    '1':bewegung2;
    '2':bewegung3;
  end;
  until wahl1='b';
end.