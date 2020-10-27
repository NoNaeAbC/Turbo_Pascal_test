
program komplexeZahlen;
uses crt,graph;
var
  treiber,modus,k:integer;
  m,n,hilfe,ux,uy,ix,iy,a,b:integer;
  wahl,wahl1:char;
  beta:real;
  fo,i1,i2,df,dphi,f,urx,ury,ucx,ucy,ulx,uly,ur,uc,ul,c,L,U,Uxx,Uyy,I,Ixx,Iyy,alpha,r,phi,x,y:real;
  ortx12,ortx13,ortx14,ortx7,ortx6,ortx8,ortx9,ortx10,ortx11,ortx,ortx1,ortx2,ortx3,ortx4,ortx5:string;


procedure menue;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(7);
  setcolor(1);
  outtextxy(200,100,'Graphische Darstellung der :');
  outtextxy(120,160,'komplexen Zahlen in der Gauáschen Ebene  -> 1');
  outtextxy(50,200,'Zeigerdarstellung von U und I / sowie der Leistung P(t)  -> 2');
  outtextxy(180,240,'Reihenschaltung von C und R  -> 3');
  outtextxy(180,280,'Reihenschaltung von L und R  -> 4');
  outtextxy(180,320,'Reihenschaltung von C,L und R  -> 5');
  outtextxy(170,360,'Parallelschaltung von C mit R,L  -> 6');
  outtextxy(220,410,'Programm beenden -> x');
end;

procedure g1;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
 setbkcolor(1);
 setcolor(15);
 line(10,40,630,40);
 line(10,420,630,420);
 line(10,40,10,420);
 line(630,40,630,420);
 circle(320,230,100);
 line(150,230,490,230);
 line(320,60,320,400);
 outtextxy(300,70,'iR');
 outtextxy(480,240,'R');
 outtextxy(430,240,'1');
 outtextxy(310,115,'i');
    setcolor(13);
    str((x/100):4:2,ortx1);
    outtextxy(560,370,ortx1);
    outtextxy(442,370,'Realteil  x = ');
    setcolor(12);
    str((y/100):4:2,ortx2);
    outtextxy(560,380,ortx2);
    outtextxy(410,380,'Imagin„rteil  y = ');
    setcolor(10);
    str((sqrt(x*x+y*y)/100):4:2,ortx3);
    outtextxy(560,350,ortx3);
    outtextxy(440,350,'Abstand  r = ');
    setcolor(14);
    str((arctan(y/x)*180/pi):4:0,ortx4);
    outtextxy(560,340,ortx4);
    outtextxy(440,340,'Winkel phi = ');
    setcolor(15);
 outtextxy(40,435,'x erh”hen (1) erniedrigen (2)         phi erh”hen (5) erniedrigen (6)');
 outtextxy(40,450,'y erh”hen (3) erniedrigen (4)          r  erh”hen (7) erniedrigen (8)');
 outtextxy(270,465,'beenden (b)');
 outtextxy(140,20,'Komplexe Darstellung in der Gauáschen Ebene');
end;

procedure marke;
begin
  line(a,b-5,a,b+5);
  line(a-5,b,a+5,b);
  line(320,230,a,b);
 line(320,230,a,230);
 line(320,230,320,b);
  sector(320,230,0,round(phi),10,10);
end;

procedure marke1;
begin
  a:=320+round(x);
  b:=230-round(y);
 circle(320,230,100);
 line(150,230,490,230);
 line(320,60,320,400);
 outtextxy(300,70,'iR');
 outtextxy(480,240,'R');
 outtextxy(430,240,'1');
 outtextxy(310,115,'i');

  line(a,b-5,a,b+5);
  line(a-5,b,a+5,b);
 setcolor(14);
 setfillstyle(1,1);
  sector(320,230,0,round(phi),10,10);
 setcolor(10);
 line(320,230,a,b);
 setcolor(13);
 line(320,230,a,230);
 setcolor(12);
 line(320,230,320,b);
 setcolor(15);
end;

procedure loesch1;
begin
      setcolor(1);
    outtextxy(560,370,ortx1);
    outtextxy(560,380,ortx2);
    outtextxy(560,350,ortx3);
    outtextxy(560,340,ortx4);
      marke;
      setcolor(15);
end;

procedure setz1;
begin
    setcolor(13);
    str((x/100):4:2,ortx1);
    outtextxy(560,370,ortx1);
    setcolor(12);
    str((y/100):4:2,ortx2);
    outtextxy(560,380,ortx2);
    setcolor(10);
    r:=sqrt(x*x+y*y);
    str((r/100):4:2,ortx3);
    outtextxy(560,350,ortx3);
    setcolor(14);
    if (x=0) and (y>0) then
    phi:=90;
    if (x=0) and (y=0) then
    phi:=0;
    if (x=0) and (y<0) then
    phi:=270;
    if (x>0) and (y>=0) then
    phi:=arctan(y/x)*180/pi;
    if (x<0)  then
    phi:=180+arctan(y/x)*180/pi;
    if (x>0) and (y<0) then
    phi:=360+arctan(y/x)*180/pi;
    str(phi:4:0,ortx4);
    outtextxy(560,340,ortx4);
    setcolor(15);
      marke1;
      wahl1:=' ';
end;

procedure rechnung1;
begin
  x:=r*cos(phi/180*pi);
  y:=r*sin(phi/180*pi);
end;
 
procedure komplex;
begin
cleardevice;
  x:=50;
  y:=50;
  a:=320+round(x);
  b:=230-round(y);
  g1;
  marke;
  setz1;

  wahl1:=' ';

  repeat
    if keypressed then  wahl1:=readkey;
    case wahl1 of
    '1':
    begin
      loesch1;
      x:=x+1;
      setz1;
    end;
    '2':
    begin
      loesch1;
      x:=x-1;
      setz1;
    end;
    '3':
    begin
      loesch1;
      y:=y+1;
      setz1;
    end;
    '4':
    begin
      loesch1;
      y:=y-1;
      setz1;
    end;
    '5':
    begin
      loesch1;
      phi:=phi+1;
      rechnung1;
      setz1;
    end;
    '6':
    begin
      loesch1;
      phi:=phi-1;
      rechnung1;
      setz1;
    end;
    '7':
    begin
      loesch1;
      r:=r+1;
      rechnung1;
      setz1;
    end;
    '8':
    begin
      loesch1;
      r:=r-1;
      rechnung1;
      setz1;
    end;
    'b':menue;
    end;
  until wahl1='b';
end;

procedure g2;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
 setbkcolor(1);
 setcolor(15);
 line(10,40,630,40);
 line(10,420,630,420);
 line(10,40,10,420);
 line(630,40,630,420);

 line(50,230,295,230);
 line(180,110,180,360);
 outtextxy(173,100,'iR');
 outtextxy(300,227,'R');
 outtextxy(280,240,'1');
 outtextxy(160,130,'i');
 line(175,130,185,130);
 line(280,225,280,235);
    setcolor(10);
    str((U/100):4:2,ortx2);
    outtextxy(560,380,ortx2);
    outtextxy(514,380,'U =        V ');
    setcolor(12);
    str((I/100):4:2,ortx3);
    outtextxy(560,390,ortx3);
    outtextxy(514,390,'I =        A');
    setcolor(11);
    str(alpha:4:0,ortx4);
    outtextxy(560,400,ortx4);
    outtextxy(250,400,'U ist I voraus um den Winkel alpha =        ø');
    setcolor(15);
    str(phi:4:0,ortx1);
    outtextxy(560,370,ortx1);
    outtextxy(442,370,'Winkel phi =        ø');
    str(dphi:3:0,ortx10);
    outtextxy(260,465,ortx10);
    outtextxy(20,435,'phi  vergr”áern  (1)  verkleinern (2)     U vergr”áern (5)  verkleinern (6)');
    outtextxy(20,450,'alpha vergr”áern (3)  verkleinern (4)     I vergr”áern (7)  verkleinern (8)');
    outtextxy(30,465,'dphi vergr”áern (9)   dphi =     ø                   beenden (b)');
    outtextxy(120,25,'Zeigerdarstellung von U und I / die Leistung P(t)');
end;

procedure setz2;
begin
  setfillstyle(1,1);
    setcolor(11);
    sector(180,230,round(phi+360+alpha),round(phi),15,15);
    str(alpha:4:0,ortx4);
    outtextxy(560,400,ortx4);
  setcolor(15);
  sector(180,230,0,round(phi),10,10);
 line(50,230,295,230);
 line(180,110,180,360);
 outtextxy(173,100,'iR');
 outtextxy(300,227,'R');
 outtextxy(280,240,'1');
 outtextxy(160,130,'i');
 line(175,130,185,130);
 line(280,225,280,235);
  Ixx:=I*cos(pi/180*phi);
  Iyy:=I*sin(pi/180*phi);
  Uxx:=U*cos(pi/180*(phi+alpha));
  Uyy:=U*sin(pi/180*(phi+alpha));

  ux:=180+round(Uxx);
  uy:=230-round(Uyy);
  ix:=180+round(Ixx);
  iy:=230-round(Iyy);
line(340,150,600,150);
line(340,70,340,205);
outtextxy(600,158,'phi');
line(335,100,345,100);
outtextxy(325,98,'1');
line(335,200,345,200);
outtextxy(320,198,'-1');
line(340,220,340,355);
line(340,300,600,300);
outtextxy(600,308,'phi');
line(335,250,345,250);
outtextxy(325,248,'1');
line(335,350,345,350);
outtextxy(320,348,'-1');
setcolor(14);
    outtextxy(350,220,'P');

    setcolor(10);
    str((U/100):4:2,ortx2);
    outtextxy(560,380,ortx2);
    outtextxy(325,70,'U');
  line(180,230,ux,uy);
  line(180,229,ux,229);
  putpixel(340+round(0.6*phi),150-round(Uxx/2),10);
  putpixel(340+round(0.6*phi),150-round(Ixx/2),12);
  putpixel(340+round(0.6*phi),300-round(Uxx*Ixx/200),14);

    setcolor(12);
    str((I/100):4:2,ortx3);
    outtextxy(560,390,ortx3);
    outtextxy(350,70,'I');
  line(180,230,ix,iy);
  line(180,231,ix,231);
    setcolor(15);
    str(phi:4:0,ortx1);
    outtextxy(560,370,ortx1);

   wahl1:=' ';

end;

procedure loesch2;
begin
  setcolor(1);
    sector(180,230,round(phi+360+alpha),round(phi),15,15);

  line(180,230,ux,uy);
  line(180,230,ix,iy);
  line(180,229,ux,229);
  line(280,231,ix,231);
    outtextxy(560,370,ortx1);
    outtextxy(560,380,ortx2);
    outtextxy(560,390,ortx3);
    outtextxy(560,400,ortx4);
end;


procedure leistung;
begin
cleardevice;
  I:=100;
  U:=50;
  phi:=0;
  dphi:=1;
  alpha:=-90;
  Ixx:=I*cos(pi/180*phi);
  Iyy:=I*sin(pi/180*phi);
  Uxx:=U*cos(pi/180*(phi+alpha));
  Uyy:=U*sin(pi/180*(phi+alpha));

  ux:=180+round(Uxx);
  uy:=230-round(Uyy);
  ix:=180+round(Ixx);
  iy:=230-round(Iyy);
  g2;
  setz2;

  wahl1:=' ';

  repeat
    if keypressed then  wahl1:=readkey;
    case wahl1 of
    '1':
    begin
      loesch2;
      phi:=phi+dphi;
      setz2;
    end;
    '2':
    begin
      loesch2;
      phi:=phi-dphi;
      setz2;
    end;
    '3':
    begin
      loesch2;
      alpha:=alpha+1;
      setz2;
    end;
    '4':
    begin
      loesch2;
      alpha:=alpha-1;
      setz2;
    end;
    '5':
    begin
      loesch2;
      U:=U+1;
      setz2;
    end;
    '6':
    begin
      loesch2;
      U:=U-1;
      setz2;
    end;
    '7':
    begin
      loesch2;
      I:=I+1;
      setz2;
    end;
    '8':
    begin
      loesch2;
      I:=I-1;
      setz2;
    end;
    '9':
    begin
      setcolor(1);
    outtextxy(260,465,ortx10);
      dphi:=dphi+1;
      setcolor(15);
    str(dphi:3:0,ortx10);
    outtextxy(260,465,ortx10);
      wahl1:=' ';
    end;

    'b':menue;
    end;
  until wahl1='b';
end;

procedure g0;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
 setbkcolor(1);
 setcolor(15);
 line(10,40,630,40);
 line(10,420,630,420);
 line(10,40,10,420);
 line(630,40,630,420);

 line(50,230,295,230);
 line(180,110,180,360);
 outtextxy(173,100,'iR');
 outtextxy(300,227,'R');
 outtextxy(270,240,'100');
 outtextxy(130,127,'100 i');
 line(175,130,185,130);
 line(280,225,280,235);
    setcolor(11);
    str(alpha:4:0,ortx10);
    outtextxy(500,400,ortx10);
    outtextxy(445,400,'alpha =    ø ');
    setcolor(12);
    str(R:4:0,ortx3);
    outtextxy(60,370,ortx3);
    outtextxy(14,370,'R =        Ohm ');
    setcolor(15);
    str(f:4:0,ortx5);
    outtextxy(260,405,ortx5);
    outtextxy(214,405,'f =        Hz ');
    str(df:4:0,ortx11);
    outtextxy(220,465,ortx11);
    outtextxy(25,435,'f vergr”áern (1)   U vergr”áern (U)   R vergr”áern (R)');
    outtextxy(25,450,' verkleinern (2)    verkleinern (u)    verkleinern (r)');
    outtextxy(25,465,'df vergr”áern (3)   df =      Hz      Zeiger drehen  (d)     beenden (b)');
end;

procedure g3;
begin
  g0;
    setcolor(10);
    str((U):4:0,ortx1);
    outtextxy(260,350,ortx1);
    outtextxy(214,350,'U =        V ');
    setcolor(12);
    str((I):4:2,ortx2);
    outtextxy(260,360,ortx2);
    outtextxy(214,360,'I =        A');
    str(ur:4:0,ortx6);
    outtextxy(260,370,ortx6);
    outtextxy(214,370,'U[R] =     V ');
    setcolor(13);
    str(C*1000000:4:2,ortx4);
    outtextxy(60,380,ortx4);
    outtextxy(14,380,'C =        æF');
    str(uc:4:0,ortx7);
    outtextxy(260,380,ortx7);
    outtextxy(214,380,'U[C] =     V ');
    setcolor(15);
    outtextxy(485,435,'C vergr”áern (C)');
    outtextxy(485,450,' verkleinern (c)');
    outtextxy(220,25,'Reihenschaltung von C und R');
end;

procedure setz0;
begin
setcolor(15);
 line(50,230,295,230);
 line(180,110,180,360);
 outtextxy(173,100,'iR');
 outtextxy(300,227,'R');
 outtextxy(270,240,'100');
 outtextxy(130,127,'100 i');
 line(175,130,185,130);
 line(280,225,280,235);
    str(df:4:0,ortx11);
    outtextxy(220,465,ortx11);
    setcolor(11);
    str(alpha:4:0,ortx10);
    outtextxy(500,400,ortx10);
    setcolor(12);
outtextxy(390,75,'I');
    str(R:4:0,ortx3);
    outtextxy(60,370,ortx3);
    setcolor(15);
    str(f:4:0,ortx5);
    outtextxy(260,405,ortx5);
    outtextxy(214,405,'f =        Hz ');
    putpixel(380+round(f/100),205-round(100*I),12);
    putpixel(380+round(f/100),290-round(alpha/2),11);
line(380,205,600,205);
line(380,70,380,205);
outtextxy(610,203,'f');
line(375,105,385,105);
outtextxy(360,102,'1');
line(375,155,385,155);
outtextxy(345,152,'0,5');
line(380,220,380,355);
line(380,290,600,290);
outtextxy(610,288,'f');
line(375,245,385,245);
outtextxy(345,242,'90ø');
line(375,335,385,335);
outtextxy(340,332,'-90ø');
line(480,205,480,210);
outtextxy(460,215,'10000 Hz');
line(480,295,480,285);
end;

procedure setz3;
begin
    i:=u/sqrt(r*r+1/(4*pi*pi*f*f*c*c));
    ur:=r*i;
    uc:=i/(2*pi*f*c);
    alpha:=-180/pi*arctan(1/(2*pi*f*R*C));
  setcolor(11);
 setfillstyle(1,1);
    sector(180,230,round(phi*180/pi+360+alpha),round(phi*180/pi),15,15);
  setz0;
    setcolor(10);
    str((U):4:0,ortx1);
    outtextxy(260,350,ortx1);
    outtextxy(214,350,'U =        V ');
    setcolor(12);
    str((I):4:2,ortx2);
    outtextxy(260,360,ortx2);
    str(ur:4:0,ortx6);
    outtextxy(260,370,ortx6);
    setcolor(13);
    str(C*1000000:4:2,ortx4);
    outtextxy(60,380,ortx4);
    str(uc:4:0,ortx7);
    outtextxy(260,380,ortx7);
    line(182,230,182+round(uc*sin(phi)),230+round(uc*cos(phi)));
    setcolor(10);
    line(180,230,180+round(uc*sin(phi))+round(ur*cos(phi)),230-round(ur*sin(phi))+round(uc*cos(phi)));
    setcolor(12);
    line(180,232,180+round(ur*cos(phi)),232-round(ur*sin(phi)));
    setcolor(15);
    wahl1:=' ';
end;

procedure loesch0;
begin
    setcolor(1);
    outtextxy(60,370,ortx3);
    outtextxy(260,405,ortx5);
    outtextxy(500,400,ortx10);
    outtextxy(220,465,ortx11);
    line(180,232,180+round(ur*cos(phi)),232-round(ur*sin(phi)));
{
    line(180,232,180+round(ur),232);
}
end;




procedure loesch3;
begin
    loesch0;
    sector(180,230,round(phi*180/pi+360+alpha),round(phi*180/pi),15,15);
    outtextxy(60,380,ortx4);
    outtextxy(260,380,ortx7);
    outtextxy(260,370,ortx6);
    outtextxy(260,350,ortx1);
    outtextxy(260,360,ortx2);
    line(180,230,180+round(uc*sin(phi))+round(ur*cos(phi)),230-round(ur*sin(phi))+round(uc*cos(phi)));
    line(182,230,182+round(uc*sin(phi)),230+round(uc*cos(phi)));
end;

procedure reiheCR;
begin
cleardevice;
  phi:=0;
  U:=100;
  R:=100;
  C:=0.5/1000000;
  f:=100;
  df:=100;
    i:=u/sqrt(r*r+1/(4*pi*pi*f*f*c*c));
    ur:=r*i;
    uc:=i/(2*pi*f*c);
    alpha:=-180/pi*arctan(1/(2*pi*f*R*C));
  g3;
  setz3;

  wahl1:=' ';

  repeat
    if keypressed then  wahl1:=readkey;
    case wahl1 of
    '1':
    begin
      loesch3;
      f:=f+df;
      setz3;
    end;
    '2':
    begin
      loesch3;
      if f>df then
      f:=f-df;
      setz3;
    end;
    '3':
    begin
      loesch3;
      df:=df+20;
      setz3;
    end;
    'd':
    begin
      loesch3;
      phi:=phi+pi/180;
      setz3;
    end;
    'U':
    begin
      loesch3;
      U:=U+1;
      setz3;
    end;
    'u':
    begin
      loesch3;
      if U>1 then
      U:=U-1;
      setz3;
    end;
    'R':
    begin
      loesch3;
      R:=R+1;
      setz3;
    end;
    'r':
    begin
      loesch3;
      if R>1 then
      R:=R-1;
      setz3;
    end;
    'C':
    begin
      loesch3;
      C:=C+0.1/1000000;
      setz3;
    end;
    'c':
    begin
      loesch3;
      if C>0.2/1000000 then
      C:=C-0.1/1000000;
      setz3;
    end;
    'b':menue;
    end;
  until wahl1='b';
end;

procedure g4;
begin
  g0;
    setcolor(10);
    str((U):4:0,ortx1);
    outtextxy(260,350,ortx1);
    outtextxy(214,350,'U =        V ');
    setcolor(12);
    str((I):4:2,ortx2);
    outtextxy(260,360,ortx2);
    outtextxy(214,360,'I =        A');
    str(ur:4:0,ortx6);
    outtextxy(260,370,ortx6);
    outtextxy(214,370,'U[R] =     V ');
    setcolor(14);
    str(L*1000:4:0,ortx8);
    outtextxy(60,390,ortx8);
    outtextxy(14,390,'L =        mH');
    str(ul:4:0,ortx9);
    outtextxy(260,390,ortx9);
    outtextxy(214,390,'U[L] =     V ');
    setcolor(15);
    outtextxy(485,435,'L vergr”áern (L)');
    outtextxy(485,450,' verkleinern (l)');
    outtextxy(220,25,'Reihenschaltung von L und R');
end;

procedure setz4;
begin
    i:=u/sqrt(r*r+(4*pi*pi*f*f*L*L));
    ur:=r*i;
    ul:=i*(2*pi*f*L);
    alpha:=180/pi*arctan(2*pi*f*L/R);
  setcolor(11);
 setfillstyle(1,1);
    sector(180,230,round(phi*180/pi+360+alpha),round(phi*180/pi),15,15);
  setz0;
    setcolor(10);
    str((U):4:0,ortx1);
    outtextxy(260,350,ortx1);
    outtextxy(214,350,'U =        V ');
    setcolor(12);
    str((I):4:2,ortx2);
    outtextxy(260,360,ortx2);
    str(ur:4:0,ortx6);
    outtextxy(260,370,ortx6);
    line(180,232,180+round(ur*cos(phi)),232-round(ur*sin(phi)));
    setcolor(14);
    str(L*1000:4:0,ortx8);
    outtextxy(60,390,ortx8);
    str(ul:4:0,ortx9);
    outtextxy(260,390,ortx9);
    line(182,230,182+round(ul*cos(pi/2+phi)),230-round(ul*sin(pi/2+phi)));
    setcolor(10);
    line(180,230,180+round(ul*cos(pi/2+phi))+round(ur*cos(phi)),230-round(ur*sin(phi))-round(ul*sin(pi/2+phi)));
    setcolor(15);
    wahl1:=' ';
end;

procedure loesch4;
begin
    loesch0;
    sector(180,230,round(phi*180/pi+360+alpha),round(phi*180/pi),15,15);
    outtextxy(60,390,ortx8);
    outtextxy(260,390,ortx9);
    outtextxy(260,370,ortx6);
    outtextxy(260,350,ortx1);
    outtextxy(260,360,ortx2);
    line(180,230,180+round(ul*cos(pi/2+phi))+round(ur*cos(phi)),230-round(ur*sin(phi))-round(ul*sin(pi/2+phi)));
    line(182,230,182+round(ul*cos(pi/2+phi)),230-round(ul*cos(phi)));
end;

procedure reiheLR;
begin
cleardevice;
  phi:=0;
  U:=100;
  R:=100;
  L:=12/1000;
  f:=100;
  df:=100;
    i:=u/sqrt(r*r+(4*pi*pi*f*f*L*L));
    ur:=r*i;
    ul:=i*(2*pi*f*L);
    alpha:=180/pi*arctan(2*pi*f*L/R);
  g4;
  setz4;

  wahl1:=' ';

  repeat
    if keypressed then  wahl1:=readkey;
    case wahl1 of
    '1':
    begin
      loesch4;
      f:=f+df;
      setz4;
    end;
    '2':
    begin
      loesch4;
      if f>df then
      f:=f-df;
      setz4;
    end;
    '3':
    begin
      loesch4;
      df:=df+20;
      setz4;
    end;
    'd':
    begin
      loesch4;
      phi:=phi+pi/180;
      setz4;
    end;
    'U':
    begin
      loesch4;
      U:=U+1;
      setz4;
    end;
    'u':
    begin
      loesch4;
      if U>1 then
      U:=U-1;
      setz4;
    end;
    'R':
    begin
      loesch4;
      R:=R+1;
      setz4;
    end;
    'r':
    begin
      loesch4;
      if R>1 then
      R:=R-1;
      setz4;
    end;
    'L':
    begin
      loesch4;
      L:=L+1/1000;
      setz4;
    end;
    'l':
    begin
      loesch4;
      if L>1/1000 then
      L:=L-1/1000;
      setz4;
    end;
    'b':menue;
    end;
  until wahl1='b';
end;

procedure g5;
begin
  g0;
    setcolor(10);
    str((U):4:0,ortx1);
    outtextxy(260,350,ortx1);
    outtextxy(214,350,'U =        V ');
    setcolor(12);
    str((I):4:2,ortx2);
    outtextxy(260,360,ortx2);
    outtextxy(214,360,'I =        A');
    str(ur:4:0,ortx6);
    outtextxy(260,370,ortx6);
    outtextxy(214,370,'U[R] =     V ');
    setcolor(13);
    str(C*1000000:4:2,ortx4);
    outtextxy(60,380,ortx4);
    outtextxy(14,380,'C =        æF');
    str(uc:4:0,ortx7);
    outtextxy(260,380,ortx7);
    outtextxy(214,380,'U[C] =     V ');
    setcolor(14);
    str(L*1000:4:0,ortx8);
    outtextxy(60,390,ortx8);
    outtextxy(14,390,'L =        mH');
    str(ul:4:0,ortx9);
    outtextxy(260,390,ortx9);
    outtextxy(214,390,'U[L] =     V ');
    setcolor(9);
    str(fo:4:0,ortx12);
    outtextxy(485,380,ortx12);
    outtextxy(445,380,'fo =      Hz ');
    setcolor(15);
    outtextxy(485,435,'C „ndern (c) (C)');
    outtextxy(485,450,'L „ndern (l) (L)');
    outtextxy(150,25,'Reihenschaltung von C,L und R ( Siebkette )');
end;

procedure setz5;
begin
    i:=u/sqrt(r*r+sqr(2*pi*f*L-1/(2*pi*f*C)));
    ur:=r*i;
    ul:=i*(2*pi*f*L);
    uc:=i/(2*pi*f*C);
    fo:=1/(2*pi*sqrt(L*C));
    alpha:=180/pi*arctan((2*pi*f*L-1/(2*pi*f*C))/R);
  setcolor(11);
 setfillstyle(1,1);
    sector(180,230,round(phi*180/pi+360+alpha),round(phi*180/pi),15,15);
  setz0;
    setcolor(10);
    str((U):4:0,ortx1);
    outtextxy(260,350,ortx1);
    outtextxy(214,350,'U =        V ');
    setcolor(12);
    str((I):4:2,ortx2);
    outtextxy(260,360,ortx2);
    outtextxy(214,360,'I =        A');
    str(ur:4:0,ortx6);
    outtextxy(260,370,ortx6);
    outtextxy(214,370,'U[R] =     V ');
    setcolor(13);
    str(C*1000000:4:2,ortx4);
    outtextxy(60,380,ortx4);
    str(uc:4:0,ortx7);
    outtextxy(260,380,ortx7);
    outtextxy(214,380,'U[C] =     V ');
    line(182,230,182+round(uc*sin(phi)),230+round(uc*cos(phi)));
    setcolor(9);
    n:=180+round(uc*sin(phi))+round(ul*cos(pi/2+phi));
    m:=230-round(ul*sin(pi/2+phi))+round(uc*cos(phi));
    line(180,230,180+round(uc*sin(phi))+round(ul*cos(pi/2+phi)),230-round(ul*sin(pi/2+phi))+round(uc*cos(phi)));
    setcolor(10);
    hilfe:=230-round(ur*sin(phi))-round(ul*sin(pi/2+phi))+round(uc*cos(phi));
    line(180,230,180+round(uc*sin(phi))+round(ul*cos(pi/2+phi))+round(ur*cos(phi)),hilfe);
    setcolor(14);
    str(L*1000:4:0,ortx8);
    outtextxy(60,390,ortx8);
    str(ul:4:0,ortx9);
    outtextxy(260,390,ortx9);
    outtextxy(214,390,'U[L] =     V ');
    line(182,230,182+round(ul*cos(pi/2+phi)),230-round(ul*sin(pi/2+phi)));
{
    setcolor(10);
    line(180,230,180+round(ul*cos(pi/2+phi))+round(ur*cos(phi)),230-round(ur*sin(phi))-round(ul*sin(pi/2+phi)));
}
    setcolor(12);
    line(180,232,180+round(ur*cos(phi)),232-round(ur*sin(phi)));
    setlinestyle(1,1,1);
    a:=180+round(uc*sin(phi))+round(ul*cos(pi/2+phi))+round(ur*cos(phi));
    line(180+round(ur*cos(phi)),232-round(ur*sin(phi)),a,hilfe);
    setcolor(9);
    line(380+round(fo/100),70,380+round(fo/100),355);
    line(n,m,180+round(uc*sin(phi))+round(ul*cos(pi/2+phi))+round(ur*cos(phi)),hilfe);
    setlinestyle(0,1,1);
    str(fo:4:0,ortx12);
    outtextxy(485,380,ortx12);
    setcolor(15);
    wahl1:=' ';
end;

procedure loesch5;
begin
    loesch0;
    sector(180,230,round(phi*180/pi+360+alpha),round(phi*180/pi),15,15);
    line(180+round(ur*cos(phi)),232-round(ur*sin(phi)),a,hilfe);
    line(n,m,180+round(uc*sin(phi))+round(ul*cos(pi/2+phi))+round(ur*cos(phi)),hilfe);
    line(180,230,180+round(uc*sin(phi))+round(ul*cos(pi/2+phi)),230-round(ul*sin(pi/2+phi))+round(uc*cos(phi)));
    line(380+round(fo/100),70,380+round(fo/100),355);
    outtextxy(485,380,ortx12);
    outtextxy(60,380,ortx4);
    outtextxy(260,380,ortx7);
    outtextxy(260,370,ortx6);
    outtextxy(260,350,ortx1);
    outtextxy(260,360,ortx2);
    line(180,230,180+round(uc*sin(phi))+round(ul*cos(pi/2+phi))+round(ur*cos(phi)),hilfe);
    line(182,230,182+round(uc*sin(phi)),230+round(uc*cos(phi)));
    outtextxy(60,390,ortx8);
    outtextxy(260,390,ortx9);
    line(180,230,180+round(ul*cos(pi/2+phi))+round(ur*cos(phi)),230-round(ur*sin(phi))-round(ul*sin(pi/2+phi)));
    line(182,230,182+round(ul*cos(pi/2+phi)),230-round(ul*cos(phi)));
end;

procedure reiheCLR;
begin
cleardevice;
  phi:=0;
  U:=100;
  R:=100;
  L:=12/1000;
  C:=0.5/1000000;
  f:=20;
  df:=20;
    i:=u/sqrt(r*r+sqr(2*pi*f*L-1/(2*pi*f*C)));
    ur:=r*i;
    ul:=i*(2*pi*f*L);
    uc:=i/(2*pi*f*C);
    alpha:=180/pi*arctan((2*pi*f*L-1/(2*pi*f*C))/R);
    fo:=1/(2*pi*sqrt(L*C));
  g5;
  setz5;

  wahl1:=' ';

  repeat
    if keypressed then  wahl1:=readkey;
    case wahl1 of
    '1':
    begin
      loesch5;
      f:=f+df;
      setz5;
    end;
    '2':
    begin
      loesch5;
      if f>df then
      f:=f-df;
      setz5;
    end;
    '3':
    begin
      loesch5;
      df:=df+20;
      setz5;
    end;
    'd':
    begin
      loesch5;
      phi:=phi+pi/180;
      setz5;
    end;
    'U':
    begin
      loesch5;
      U:=U+1;
      setz5;
    end;
    'u':
    begin
      loesch5;
      if U>1 then
      U:=U-1;
      setz5;
    end;
    'R':
    begin
      loesch5;
      R:=R+1;
      setz5;
    end;
    'r':
    begin
      loesch5;
      if R>1 then
      R:=R-1;
      setz5;
    end;
    'L':
    begin
      loesch5;
      L:=L+1/1000;
      setz5;
    end;
    'l':
    begin
      loesch5;
      if L>1/1000 then
      L:=L-1/1000;
      setz5;
    end;
    'C':
    begin
      loesch5;
      C:=C+0.1/1000000;
      setz5;
    end;
    'c':
    begin
      loesch5;
      if C>0.2/1000000 then
      C:=C-0.1/1000000;
      setz5;
    end;
    'b':menue;
    end;
  until wahl1='b';
end;


procedure g6;
begin
  g0;
    setcolor(10);
    str((U):4:0,ortx1);
    outtextxy(230,350,ortx1);
    outtextxy(174,350,'   U =      V ');
    setcolor(12);
    str((I):4:2,ortx2);
    setcolor(13);
    str(C*1000000:4:2,ortx4);
    outtextxy(14,390,'C =        æF');
    str(i1/100:4:2,ortx14);
    outtextxy(174,390,'I[C] =      A ');
    setcolor(14);
    str(L*1000:4:0,ortx8);
    outtextxy(14,380,'L =        mH');
    str(i2/100:4:2,ortx13);
    outtextxy(174,380,'I[L] =      A ');
    setcolor(9);
    str(ur:4:0,ortx6);
    outtextxy(324,370,'U[R] =     V ');
    str(uc:4:0,ortx7);
    outtextxy(324,390,'U[C] =     V ');
    str(ul:4:0,ortx9);
    outtextxy(324,380,'U[L] =     V ');
    str(fo:4:0,ortx12);
    outtextxy(485,380,ortx12);
    outtextxy(445,380,'fo =      Hz ');
    setcolor(15);
    outtextxy(485,435,'C „ndern (c) (C)');
    outtextxy(485,450,'L „ndern (l) (L)');
    outtextxy(130,25,'Parallelschaltung von C mit L und R ( Sperrkreis )');
end;

procedure setz6;
begin
    i:=u*sqrt(sqr(r/(r*r+sqr(2*pi*f*L)))+sqr(2*pi*f*C-2*pi*f*L/(r*r+sqr(2*pi*f*L))));
    i2:=100*u/sqrt(R*R+4*pi*pi*f*f*L*L);
    i1:=100*u*(2*pi*f*C);
    ur:=r*i2/100;
    ul:=2*pi*f*L*i2/100;
    uc:=i1/(200*pi*f*C);
    alpha:=180/pi*arctan(2*pi*f*L/R-2*pi*f*C*(R*R+4*pi*pi*f*f*L*L)/R);
    fo:=1/(2*pi*sqrt(L*C));
    beta:=arctan(2*pi*f*L/R);
  setcolor(11);
 setfillstyle(1,1);
    sector(180,230,round(phi*180/pi+360-alpha),round(phi*180/pi),15,15);
  setz0;
    setcolor(10);
    str((U):4:0,ortx1);
    outtextxy(230,350,ortx1);
    outtextxy(174,350,'   U =      V ');

    setcolor(12);
    str((I):4:2,ortx2);
    outtextxy(230,360,ortx2);
    outtextxy(174,360,'   I =      A');
    setcolor(13);
    str(C*1000000:4:2,ortx4);
    outtextxy(60,390,ortx4);
    str(i1/100:4:2,ortx14);
    outtextxy(230,390,ortx14);
    outtextxy(174,390,'I[C] =      A ');
    line(182,230,182+round(i1*cos(phi+pi/2)),230-round(i1*sin(phi+pi/2)));

setcolor(14);
    str(L*1000:4:0,ortx8);
    outtextxy(60,380,ortx8);
    str(i2/100:4:2,ortx13);
    outtextxy(230,380,ortx13);
    outtextxy(174,380,'I[L] =      A ');
    line(180,230,182+round(i2*cos(phi-beta)),230-round(i2*sin(phi-beta)));
setcolor(10);
    line(180,228,180+round(u*cos(phi)),228-round(u*sin(phi)));
setcolor(12);
    line(180,230,180+round(i2*cos(phi-beta))+round(i1*cos(phi+pi/2)),230-round(i2*sin(phi-beta))-round(i1*sin(phi+pi/2)));
    setlinestyle(1,1,1);
    setcolor(9);
    line(380+round(fo/100),70,380+round(fo/100),355);

    line(180,230,180+round(ur*cos(phi-beta)),230-round(ur*sin(phi-beta)));
    line(180,230,180+round(ul*cos(phi-beta+pi/2)),230-round(ul*sin(phi-beta+pi/2)));
    line(180+round(u*cos(phi)),230-round(u*sin(phi)),180+round(ur*cos(phi-beta)),230-round(ur*sin(phi-beta)));
    line(180+round(u*cos(phi)),228-round(u*sin(phi)),180+round(ul*cos(phi-beta+pi/2)),230-round(ul*sin(phi-beta+pi/2)));

    setcolor(12);
    a:=180+round(i2*cos(phi-beta))+round(i1*cos(phi+pi/2));
    b:=230-round(i2*sin(phi-beta))-round(i1*sin(phi+pi/2));
    line(182+round(i2*cos(phi-beta)),230-round(i2*sin(phi-beta)),a,b);
    line(182+round(i1*cos(phi+pi/2)),230-round(i1*sin(phi+pi/2)),a,b);
    setlinestyle(0,1,1);
    setcolor(9);
    str(fo:4:0,ortx12);
    outtextxy(485,380,ortx12);
    str(ur:4:0,ortx6);
    outtextxy(370,370,ortx6);
    outtextxy(324,370,'U[R] =     V ');
    str(uc:4:0,ortx7);
    outtextxy(370,390,ortx7);
    outtextxy(324,390,'U[C] =     V ');
    str(ul:4:0,ortx9);
    outtextxy(370,380,ortx9);
    outtextxy(324,380,'U[L] =     V ');

    setcolor(15);
    wahl1:=' ';
end;

procedure loesch6;
begin
    loesch0;
    sector(180,230,round(phi*180/pi+360-alpha),round(phi*180/pi),15,15);

    line(180,230,180+round(ur*cos(phi-beta)),230-round(ur*sin(phi-beta)));
    line(180,230,180+round(ul*cos(phi-beta+pi/2)),230-round(ul*sin(phi-beta+pi/2)));
    line(180+round(u*cos(phi)),230-round(u*sin(phi)),180+round(ur*cos(phi-beta)),230-round(ur*sin(phi-beta)));
    line(180+round(u*cos(phi)),228-round(u*sin(phi)),180+round(ul*cos(phi-beta+pi/2)),230-round(ul*sin(phi-beta+pi/2)));

    line(182,230,182+round(i1*cos(phi+pi/2)),230-round(i1*sin(phi+pi/2)));

    line(182+round(i2*cos(phi-beta)),230-round(i2*sin(phi-beta)),a,b);
    line(182+round(i1*cos(phi+pi/2)),230-round(i1*sin(phi+pi/2)),a,b);

    line(180,230,182+round(i2*cos(phi-beta)),230-round(i2*sin(phi-beta)));
    line(180,228,180+round(u*cos(phi)),228-round(u*sin(phi)));
    line(180,230,180+round(i2*cos(phi-beta))+round(i1*cos(phi+pi/2)),230-round(i2*sin(phi-beta))-round(i1*sin(phi+pi/2)));
    line(380+round(fo/100),70,380+round(fo/100),355);
    outtextxy(230,350,ortx1);
    outtextxy(370,370,ortx6);
    outtextxy(230,360,ortx2);
    outtextxy(230,380,ortx13);
    outtextxy(230,390,ortx14);
    outtextxy(485,380,ortx12);
    outtextxy(60,390,ortx4);
    outtextxy(370,390,ortx7);
    outtextxy(60,380,ortx8);
    outtextxy(370,380,ortx9);
end;

procedure parallelCLR;
begin
cleardevice;
  phi:=0;
  U:=100;
  R:=100;
  L:=12/1000;
  C:=0.5/1000000;
  f:=20;
  df:=20;
    i:=u*sqrt(sqr(r/(r*r+sqr(2*pi*f*L)))+sqr(2*pi*f*C-2*pi*f*L/(r*r+sqr(2*pi*f*L))));
    i2:=u/sqrt(R*R+4*pi*pi*f*f*L*L);
    i1:=u*(2*pi*f*C);
    ur:=r*i2/100;
    ul:=2*pi*f*L*i2/100;
    uc:=i1/(200*pi*f*C);
    alpha:=180/pi*arctan(2*pi*f*L/R-2*pi*f*C*(R*R+4*pi*pi*f*f*L*L)/R);
    fo:=1/(2*pi*sqrt(L*C));
    beta:=arctan(2*pi*f*L/R);
  g6;
  setz6;

  wahl1:=' ';

  repeat
    wahl1:=' ';
    if keypressed then  wahl1:=readkey;
    case wahl1 of
    '1':
    begin
      loesch6;
      f:=f+df;
      setz6;
    end;
    '2':
    begin
      loesch6;
      if f>df then
      f:=f-df;
      setz6;
    end;
    '3':
    begin
      loesch6;
      df:=df+20;
      setz6;
    end;
    'd':
    begin
      loesch6;
      phi:=phi+pi/180;
      setz6;
    end;
    'U':
    begin
      loesch6;
      U:=U+1;
      setz6;
    end;
    'u':
    begin
      loesch6;
      if U>1 then
      U:=U-1;
      setz6;
    end;
    'R':
    begin
      loesch6;
      R:=R+1;
      setz6;
    end;
    'r':
    begin
      loesch6;
      if R>1 then
      R:=R-1;
      setz6;
    end;
    'L':
    begin
      loesch6;
      L:=L+1/1000;
      setz6;
    end;
    'l':
    begin
      loesch6;
      if L>1/1000 then
      L:=L-1/1000;
      setz6;
    end;
    'C':
    begin
      loesch6;
      C:=C+0.1/1000000;
      setz6;
    end;
    'c':
    begin
      loesch6;
      if C>0.2/1000000 then
      C:=C-0.1/1000000;
      setz6;
    end;
    'b':menue;
    end;
  until wahl1='b';
end;



{MAIN}

begin
  wahl:=' ';
  menue;
  repeat
  wahl:=' ';
  if keypressed then wahl:=readkey;
  case wahl of
   '1':komplex;
   '2':leistung;
   '3':reiheCR;
   '4':reiheLR;
   '5':reiheCLR;
   '6':parallelCLR;
{   'b':
   begin
   closegraph;
   exit;
   end;
}
   end;
  until wahl='x';
end.