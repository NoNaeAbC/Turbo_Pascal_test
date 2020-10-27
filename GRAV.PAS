program gravitation;
uses crt,graph;
var
  farbe0,farbe1,farbe2,farbe3,farbe4,farbe5,farbe6,farbe7,farbe8k,treiber,modus:integer;
  fa2,fa3,fa4,fa5,k00,k0,hil0,hil1,hil2,hil3,h000,farbe:integer;
  xend,dx,flaeche,xanf,m,zx,zy,zy1,grenze,x,r,Rerde,Rmond,Mmond,Merde,dr,gamma,F1,F2,Fres:real;
  v0,v1,y0:real;
  wahl1,wahl:char;
  ortx10,ortx11,ortx1,ortx2,ortx3,ortx4,ortx5,ortx6,ortx7,ortx8,ortx9:string;

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
    end;
end;


procedure menue;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  h000:=0;
  setbkcolor(15);
  setcolor(1);
  outtextxy(150,150,'Gravitation ( Feldst„rke )  ->  1');
  outtextxy(150,200,'Gravitationskraft und Hubarbeit  -> 2');
  outtextxy(150,250,'Lageenergie und Potential  -> 3');
  outtextxy(150,300,'Gravitationspotential  -> 4');
  outtextxy(400,400,'beenden  ->  b');
  setcolor(7);
  outtextxy(20,465,'heller Hintergrund (h)                              dunkler Hintergrund (d)');
end;

procedure g00;
begin
  setcolor(farbe);
if k0=1 then
begin
  line(135,80,145,80);
  str(80/zy:4:2,ortx1);
  outtextxy(40,157,ortx1+' m/sý');
  line(135,160,145,160);
  str(160/zy:4:2,ortx2);
  outtextxy(40,77,ortx2+' m/sý');
end;
if k0=2 then
begin
  line(135,80,145,80);
  str(80/zy:4:2,ortx1);
  outtextxy(60,157,ortx1+' N');
  line(135,160,145,160);
  str(160/zy:4:2,ortx2);
  outtextxy(60,77,ortx2+' N');
end;
if k0=3 then
begin
  line(135,120,145,120);
  str(60/zy:8:0,ortx1);
  outtextxy(40,177,ortx1+' J');
  line(135,180,145,180);
  str(120/zy:8:0,ortx2);
  outtextxy(40,117,ortx2+' J');
  v0:=-gamma*m*Merde/Rerde;
  if zy*v0>=-170 then
  begin
   str(v0:8:0,ortx10);
   outtextxy(40,237-round(zy*v0),ortx10+' J');
   line(138,240-round(zy*v0),142,240-round(zy*v0));
  end;
  v1:=-1.5*gamma*m*Merde/Rerde;
  if zy*v1>=-170 then
  begin
   str(v1:8:0,ortx11);
   outtextxy(40,237-round(zy*v1),ortx11+' J');
   line(138,240-round(zy*v1),142,240-round(zy*v1));
  end;
end;
if k0=4 then
begin
  line(135,120,145,120);
  str(60/zy:8:0,ortx1);
  outtextxy(30,177,ortx1+' J/kg');
  line(135,180,145,180);
  str(120/zy:8:0,ortx2);
  outtextxy(30,117,ortx2+' J/kg');
  v0:=-gamma*Merde/Rerde;
  if zy*v0>=-170 then
  begin
   str(v0:8:0,ortx10);
   outtextxy(20,237-round(zy*v0),ortx10+' J/kg');
   line(138,240-round(zy*v0),142,240-round(zy*v0));
  end;
  v1:=-1.5*gamma*Merde/Rerde;
  if zy*v1>=-170 then
  begin
   str(v1:8:0,ortx11);
   outtextxy(20,237-round(zy*v1),ortx11+' J/kg');
   line(138,240-round(zy*v1),142,240-round(zy*v1));
  end;
end;
  circle(140,240,round(Rerde/zx));
  line(40,240,135-round(Rerde/zx),240);
  line(140,70,140,235-round(Rerde/zx));
  line(140,410,140,245+round(Rerde/zx));

  x:=0;
  repeat
    x:=x+5e7/zx;
    line(140+round(x),238,140+round(x),242);
  until x>=400;

  if r/zx<460 then
  begin
    circle(140+round(r/zx),240,round(Rmond/zx));
    line(145+round(Rerde/zx),240,135+round((r-Rmond)/zx),240);
    line(145+round((r+Rmond)/zx),240,600,240)
  end
  else
  line(145+round(Rerde/zx),240,600,240);
end;

procedure s00;
begin
  farbe:=farbe1;
  g00;
  if (k0=2) or (k0=3) then
  begin
    setcolor(7);
    str(m:3:2,ortx3);
    outtextxy(450,425,ortx3+' kg');
    setcolor(farbe1);
  end;
end;

procedure l00;
begin
  farbe:=farbe0;
  g00;
  if (k0=2) or (k0=3) then
  begin
    setcolor(farbe);
    str(m:3:2,ortx3);
    outtextxy(450,425,ortx3+' kg');
  end;
end;


procedure g3;
begin
  x:=-100*zx-dr;
  repeat
    x:=x+dr;
    if k0=1 then Fres:=zy*gamma*(-Merde/x/x-Mmond/(r-x)/(r-x));
    if k0=2 then Fres:=zy*gamma*m*(-Merde/x/x-Mmond/(r-x)/(r-x));
    if k0=3 then Fres:=-zy*gamma*m*(-Merde/x-Mmond/(r-x));
    if k0=4 then Fres:=-zy*gamma*(-Merde/x-Mmond/(r-x));
    if (240-round(Fres)>=70) and(240-round(Fres)<=410) then
      putpixel(140+round(x/zx),240-round(Fres),farbe);
  until (x>=-Rerde) or (x>=zx*460);

  x:=Rerde-dr;
  repeat
    x:=x+dr;
    if k0=1 then Fres:=zy*gamma*(Merde/x/x-Mmond/(r-x)/(r-x));
    if k0=2 then Fres:=zy*gamma*m*(Merde/x/x-Mmond/(r-x)/(r-x));
    if k0=3 then Fres:=-zy*gamma*m*(Merde/x+Mmond/(r-x));
    if k0=4 then Fres:=-zy*gamma*(Merde/x+Mmond/(r-x));
    if (240-round(Fres)>=70) and(240-round(Fres)<=410) then
      putpixel(140+round(x/zx),240-round(Fres),farbe);
  until (x>=r-Rmond) or (x>=zx*460);

  x:=r+Rmond-dr;
  repeat
    x:=x+dr;
    if k0=1 then Fres:=zy*gamma*(Merde/x/x+Mmond/(r-x)/(r-x));
    if k0=2 then Fres:=zy*gamma*m*(Merde/x/x+Mmond/(r-x)/(r-x));
    if k0=3 then Fres:=zy*gamma*m*(-Merde/x+Mmond/(r-x));
    if k0=4 then Fres:=zy*gamma*(-Merde/x+Mmond/(r-x));
    if (240-round(Fres)>=70) and(240-round(Fres)<=410) then
      putpixel(140+round(x/zx),240-round(Fres),farbe);
  until x>=zx*460;
end;

procedure s3;
begin
  farbe:=farbe4;
  g3;
  s00;
end;

procedure l3;
begin
  farbe:=farbe0;
  g3;
end;

procedure g2;
begin
  x:=-100*zx-dr;
  repeat
    x:=x+dr;
    if k0=1 then F2:=-zy*gamma*Mmond/(r-x)/(r-x);
    if k0=2 then F2:=-zy*gamma*m*Mmond/(r-x)/(r-x);
    if k0=3 then F2:=-zy*gamma*m*Mmond/(r-x);
    if k0=4 then F2:=-zy*gamma*Mmond/(r-x);
    if (240-round(F2)>=70) and(240-round(F2)<=410) then
      putpixel(140+round(x/zx),240-round(F2),farbe);
  until (x>=-Rerde) or (x>=zx*460);

  x:=Rerde-dr;
  repeat
    x:=x+dr;
    if k0=1 then F2:=-zy*gamma*Mmond/(r-x)/(r-x);
    if k0=2 then F2:=-zy*gamma*m*Mmond/(r-x)/(r-x);
    if k0=3 then F2:=-zy*gamma*m*Mmond/(r-x);
    if k0=4 then F2:=-zy*gamma*Mmond/(r-x);
    if (240-round(F2)>=70) and(240-round(F2)<=410) then
      putpixel(140+round(x/zx),240-round(F2),farbe);
  until (x>=r-Rmond) or (x>=zx*460);

  x:=r+Rmond-dr;
  repeat
    x:=x+dr;
    if k0=1 then F2:=zy*gamma*Mmond/(r-x)/(r-x);
    if k0=2 then F2:=zy*gamma*m*Mmond/(r-x)/(r-x);
    if k0=3 then F2:=zy*gamma*m*Mmond/(r-x);
    if k0=4 then F2:=zy*gamma*Mmond/(r-x);
    if (240-round(F2)>=70) and(240-round(F2)<=410) then
      putpixel(140+round(x/zx),240-round(F2),farbe);
  until x>=zx*460;
end;

procedure s2;
begin
  farbe:=farbe3;
  g2;
  s00;
end;

procedure l2;
begin
  farbe:=farbe0;
  g2;
end;

procedure g0;
begin
  x:=-100*zx-dr;
  repeat
    x:=x+dr;
    if k0=1 then F1:=-zy*gamma*Merde/x/x;
    if k0=2 then F1:=-zy*gamma*m*Merde/x/x;
    if k0=3 then F1:=zy*gamma*m*Merde/x;
    if k0=4 then F1:=zy*gamma*Merde/x;
    if (240-round(F1)>=70) and(240-round(F1)<=410) then
      putpixel(140+round(x/zx),240-round(F1),farbe);
  until (x>=-Rerde) or (x>=zx*460);

  x:=Rerde-dr;
  repeat
    x:=x+dr;
    if k0=1 then F1:=zy*gamma*Merde/x/x;
    if k0=2 then F1:=zy*gamma*m*Merde/x/x;
    if k0=3 then F1:=-zy*gamma*m*Merde/x;
    if k0=4 then F1:=-zy*gamma*Merde/x;
    if (240-round(F1)>=70) and(240-round(F1)<=410) then
      putpixel(140+round(x/zx),240-round(F1),farbe);
  until (x>=r-Rmond) or (x>=zx*460);

  x:=r+Rmond-dr;
  repeat
    x:=x+dr;
    if k0=1 then F1:=zy*gamma*Merde/x/x;
    if k0=2 then F1:=zy*gamma*m*Merde/x/x;
    if k0=3 then F1:=-zy*gamma*m*Merde/x;
    if k0=4 then F1:=-zy*gamma*Merde/x;
    if (240-round(F1)>=70) and(240-round(F1)<=410) then
      putpixel(140+round(x/zx),240-round(F1),farbe);
  until x>=zx*460;
end;

procedure s1;
begin
  farbe:=farbe2;
  g0;
  s00;
end;

procedure l1;
begin
  farbe:=farbe0;
  g0;
end;

procedure arbeit;
begin
  x:=xend;
  dx:=0.5*zx;
  if x<=-Rerde then
  begin
  if hil1=1 then
    F1:=-zy*gamma*m*Merde/(x-dx)/x;
  if hil2=1 then
    F1:=-zy*gamma*m*Mmond/(r-x-dx)/(r-x);
  if hil3=1 then
    F1:=zy*gamma*m*(-Merde/(x-dx)/x-Mmond/(r-x-dx)/(r-x));
    if k00=1 then flaeche:=flaeche+F1*dx/Rerde;
    if k00=0 then flaeche:=flaeche-F1*dx/Rerde;
  setcolor(farbe7);
    str(flaeche*Rerde/zy/1e6:4:2,ortx4);
    outtextxy(450,410,ortx4+' MJ');
  setcolor(farbe5);
    str(x/1e6:5:2,ortx5);
    outtextxy(450,395,ortx5+' tausend km');
    line(140+round(x/zx),240,140+round(x/zx),240-round(F1));
    putpixel(140+round(x/zx),240-round(flaeche/zy*16),farbe7);
  setcolor(farbe2);
    str(F1/zy:5:2,ortx6);
    outtextxy(450,380,ortx6+' N');
  end;

  if (x>=-Rerde) and (x<=Rerde) and (hil1=1) then
  begin
    F1:=zy*gamma*m*Merde/Rerde/Rerde/Rerde*x;
{    flaeche:=zy*(-1/2*gamma*m*Merde/Rerde+1/2*gamma*m*Merde/Rerde/Rerde/Rerde*x*x)/Rerde;}
    if k00=1 then flaeche:=flaeche+F1*dx/Rerde;
    if k00=0 then flaeche:=flaeche-F1*dx/Rerde;
  setcolor(farbe7);
    str(flaeche*Rerde/zy/1e6:4:2,ortx4);
    outtextxy(450,410,ortx4+' MJ');
  setcolor(farbe5);
    str(x/1e6:5:2,ortx5);
    outtextxy(450,395,ortx5+' tausend km');
    line(140+round(x/zx),240,140+round(x/zx),240-round(F1));
    putpixel(140+round(x/zx),240-round(flaeche/zy*16),farbe7);
  setcolor(farbe2);
    str(F1/zy:5:2,ortx6);
    outtextxy(450,380,ortx6+' N');
  end;

  if (x>=Rerde) and (x<=r-Rmond-dx) then
  begin
  if hil1=1 then
      F1:=zy*gamma*m*Merde/(x+dx)/x;
  if hil2=1 then
      F1:=-zy*gamma*m*Mmond/(r-x+dx)/(r-x);
  if hil3=1 then
      F1:=zy*gamma*m*(Merde/(x+dx)/x-Mmond/(r-x+dx)/(r-x));
    if k00=1 then flaeche:=flaeche+F1*dx/Rerde;
    if k00=0 then flaeche:=flaeche-F1*dx/Rerde;
  setcolor(farbe7);
    str(flaeche*Rerde/zy/1e6:4:2,ortx4);
    outtextxy(450,410,ortx4+' MJ');
  setcolor(farbe5);
    str(x/1e6:5:2,ortx5);
    outtextxy(450,395,ortx5+' tausend km');
    line(140+round(x/zx),240,140+round(x/zx),240-round(F1));
    putpixel(140+round(x/zx),240-round(flaeche/zy*16),farbe7);
  end;

  if x>=r+Rmond then
  begin
  if hil1=1 then
    F1:=zy*gamma*m*Merde/(x+dx)/x;
  if hil2=1 then
    F1:=zy*gamma*m*Mmond/(r-x+dx)/(r-x);
  if hil3=1 then
      F1:=zy*gamma*m*(Merde/(x+dx)/x+Mmond/(r-x+dx)/(r-x));
    if k00=1 then flaeche:=flaeche+F1*dx/Rerde;
    if k00=0 then flaeche:=flaeche-F1*dx/Rerde;
  setcolor(farbe7);
    str(flaeche*Rerde/zy/1e6:4:2,ortx4);
    outtextxy(450,410,ortx4+' MJ');
  setcolor(farbe5);
    str(x/1e6:5:2,ortx5);
    outtextxy(450,395,ortx5+' tausend km');
    line(140+round(x/zx),240,140+round(x/zx),240-round(F1));
    putpixel(140+round(x/zx),240-round(flaeche/zy*16),farbe7);
  end;
end;

procedure pf0;
begin
  if hil1=1 then
  begin
    setcolor(fa2);
    if xanf<-Rerde then
    begin
      F1:=zy1*gamma*m*Merde/xanf/xanf;
      line(140+round(xanf/zx),290,140+round(xanf/zx+F1),290);
      line(135+round(xanf/zx+F1),287,140+round(xanf/zx+F1),290);
      line(135+round(xanf/zx+F1),293,140+round(xanf/zx+F1),290);
    end;
    if (xanf>=-Rerde) and (xanf<=0) then
    begin
      F1:=-zy1*gamma*m*Merde/Rerde/Rerde/Rerde*xanf;
      line(140+round(xanf/zx),290,140+round(xanf/zx+F1),290);
      line(135+round(xanf/zx+F1),287,140+round(xanf/zx+F1),290);
      line(135+round(xanf/zx+F1),293,140+round(xanf/zx+F1),290);
    end;
    if (xanf<=Rerde) and (xanf>0) then
    begin
      F1:=-zy1*gamma*m*Merde/Rerde/Rerde/Rerde*xanf;
      line(140+round(xanf/zx),290,140+round(xanf/zx+F1),290);
      line(145+round(xanf/zx+F1),287,140+round(xanf/zx+F1),290);
      line(145+round(xanf/zx+F1),293,140+round(xanf/zx+F1),290);
    end;
    if (xanf>=Rerde) and (xanf<=r-Rmond) then
    begin
      F1:=-zy1*gamma*m*Merde/xanf/xanf;
      line(140+round(xanf/zx),290,140+round(xanf/zx+F1),290);
      line(145+round(xanf/zx+F1),287,140+round(xanf/zx+F1),290);
      line(145+round(xanf/zx+F1),293,140+round(xanf/zx+F1),290);
    end;
    if xanf>r+Rmond then
    begin
      F1:=-zy1*gamma*m*Merde/xanf/xanf;
      line(140+round(xanf/zx),290,140+round(xanf/zx+F1),290);
      line(145+round(xanf/zx+F1),287,140+round(xanf/zx+F1),290);
      line(145+round(xanf/zx+F1),293,140+round(xanf/zx+F1),290);
    end;
  str(-F1/zy1:6:5,ortx6);
  if k0=1 then outtextxy(300,360,ortx6+' m/sý');
  if k0=2 then outtextxy(300,360,ortx6+' N');
  end;

  if hil2=1 then
  begin
    setcolor(fa3);
    if xanf<-Rerde then
    begin
      F2:=zy1*gamma*m*Mmond/(r-xanf)/(r-xanf);
      line(140+round(xanf/zx),285,140+round(xanf/zx+F2),285);
      line(135+round(xanf/zx+F2),282,140+round(xanf/zx+F2),285);
      line(135+round(xanf/zx+F2),288,140+round(xanf/zx+F2),285);
    end;
    if (xanf>=Rerde) and (xanf<r-Rmond) then
    begin
      F2:=zy1*gamma*m*Mmond/(r-xanf)/(r-xanf);
      line(140+round(xanf/zx),285,140+round(xanf/zx+F2),285);
      line(135+round(xanf/zx+F2),282,140+round(xanf/zx+F2),285);
      line(135+round(xanf/zx+F2),288,140+round(xanf/zx+F2),285);
    end;
    if xanf>=r+Rmond then
    begin
      F2:=-zy1*gamma*m*Mmond/(r-xanf)/(r-xanf);
      line(140+round(xanf/zx),285,140+round(xanf/zx+F2),285);
      line(145+round(xanf/zx+F2),282,140+round(xanf/zx+F2),285);
      line(145+round(xanf/zx+F2),288,140+round(xanf/zx+F2),285);
    end;
  str(-F2/zy1:6:5,ortx7);
  if k0=1 then outtextxy(300,375,ortx7+' m/sý');
  if k0=2 then outtextxy(300,375,ortx7+' N');
  end;

  if hil3=1 then
  begin
    setcolor(fa4);
    if xanf<-Rerde then
    begin
      Fres:=-zy1*gamma*m*(-Merde/xanf/xanf-Mmond/(r-xanf)/(r-xanf));
      line(140+round(xanf/zx),295,140+round(xanf/zx+Fres),295);
      line(135+round(xanf/zx+Fres),292,140+round(xanf/zx+F1),295);
      line(135+round(xanf/zx+Fres),298,140+round(xanf/zx+F1),295);
    end;
    if (xanf>=Rerde) and (xanf<r-Rmond) then
    begin
      Fres:=-zy1*gamma*m*(Merde/xanf/xanf-Mmond/(r-xanf)/(r-xanf));
      if Fres<0 then
      begin
       line(140+round(xanf/zx),295,140+round(xanf/zx+Fres),295);
       line(145+round(xanf/zx+Fres),292,140+round(xanf/zx+Fres),295);
       line(145+round(xanf/zx+Fres),298,140+round(xanf/zx+Fres),295);
      end;
      if Fres>0 then
      begin
      line(140+round(xanf/zx),295,140+round(xanf/zx+Fres),295);
      line(135+round(xanf/zx+Fres),292,140+round(xanf/zx+Fres),295);
      line(135+round(xanf/zx+Fres),298,140+round(xanf/zx+Fres),295);
      end;
    end;
    if xanf>r+Rmond then
    begin
      Fres:=-zy1*gamma*m*(Merde/xanf/xanf+Mmond/(r-xanf)/(r-xanf));
      line(140+round(xanf/zx),295,140+round(xanf/zx+Fres),295);
      line(145+round(xanf/zx+Fres),292,140+round(xanf/zx+Fres),295);
      line(145+round(xanf/zx+Fres),298,140+round(xanf/zx+Fres),295);
    end;
    str(-Fres/zy1:6:5,ortx8);
    if k0=1 then outtextxy(300,390,ortx8+' m/sý');
    if k0=2 then outtextxy(300,390,ortx8+' N');
  end;
    setcolor(fa5);
    str(xanf/1e6:5:2,ortx9);
    outtextxy(300,405,ortx9+' tausend km');
    circle(140+round(xanf/zx),243,2);
    setlinestyle(1,0,1);
    line(140+round(xanf/zx),244,140+round(xanf/zx),295);
    setlinestyle(0,0,1);
end;

procedure pfeilhin;
begin
  fa2:=farbe2;
  fa3:=farbe3;
  fa4:=farbe4;
  fa5:=farbe5;
  pf0;
end;

procedure pfeilweg;
begin
  fa2:=farbe0;
  fa3:=farbe0;
  fa4:=farbe0;
  fa5:=farbe0;
  pf0;
end;


procedure innen;
begin
  if k0=1 then
  begin
    setcolor(farbe);
    x:=Rerde;
    F1:=-zy*gamma*Merde/x/x;
    x:=Rerde;
    F2:=zy*gamma*Merde/x/x;
    line(140-round(Rerde/zx),240-round(F1),140+round(Rerde/zx),240-round(F2));
  end;
  if k0=2 then
  begin
    setcolor(farbe);
    x:=Rerde;
    F1:=-zy*gamma*m*Merde/x/x;
    x:=Rerde;
    F2:=zy*gamma*m*Merde/x/x;
    line(140-round(Rerde/zx),240-round(F1),140+round(Rerde/zx),240-round(F2));
  end;
  if k0=3 then
  begin
    x:=-Rerde-dr;
    repeat
      x:=x+dr;
      y0:=-zy*gamma*3/2*m*Merde/Rerde+zy*gamma/2*m*Merde/Rerde/Rerde/Rerde*x*x;
      putpixel(140+round(x/zx),240-round(y0),farbe);
    until x>=Rerde;
  end;
  if k0=4 then
  begin
    x:=-Rerde-dr;
    repeat
      x:=x+dr;
      y0:=-zy*gamma*3/2*Merde/Rerde+zy*gamma/2*Merde/Rerde/Rerde/Rerde*x*x;
      putpixel(140+round(x/zx),240-round(y0),farbe);
    until x>=Rerde;
  end;
end;

procedure setzinnen;
begin
  farbe:=farbe2;
  innen;
end;

procedure loeschinnen;
begin
  farbe:=farbe0;
  innen;
end;


procedure graphik;
begin
  setbkcolor(farbe0);
  setcolor(farbe1);
  s00;
  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  outtextxy(200,15,'Gravitation - Feldst„rkenverlauf ');
  outtextxy(30,470,'Zoomen (x/X/y/Y)   Aufl”sung verbessern/verringern (V/v)   beenden (b)');
  outtextxy(3,457,'Feldst„rke der Erde//des Mondes//res. Feldst„rke setzen/l”schen (E/e//M/m//G/g)  ');
  setcolor(7);
  outtextxy(5,55,'Feldst„rke-Pfeile setzen//nach rechts/links verschieben//zoomen (4/5//6/7//z/Z)');
  outtextxy(50,40,'Die Markierungen in  x - Richtung  werden alle  50.000 km  gesetzt');
  outtextxy(130,440,'Feldverlauf im Erdinnern anzeigen/l”schen (1/0)');
end;

procedure graphik2;
begin
  setbkcolor(farbe0);
  setcolor(farbe1);
  s00;
  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  outtextxy(200,15,'Gravitationskraft und Hubarbeit ');
  outtextxy(30,470,'Zoomen (x/X/y/Y)   Aufl”sung verbessern/verringern (V/v)   beenden (b)');
  outtextxy(3,457,'Grav-kraft der Erde//des Mondes//res. Grav-kraft setzen/l”schen (E/e//M/m//G/g)  ');
  setcolor(7);
  outtextxy(50,40,'Die Markierungen in  x - Richtung  werden alle  50.000 km  gesetzt');
  outtextxy(30,55,'Kraft-Pfeile  setzen//nach rechts/links verschieben//zoomen (5//6/7//z/Z)');
  outtextxy(53,425,'Masse vergr”áern/verkleinern (2/3)');
  outtextxy(23,440,'Hubarbeit : Anfangspunkt setzen//l”schen//verschieben (s/t/T/u//S//R/L/r/l)');
end;

procedure graphik3;
begin
  setbkcolor(farbe0);
  setcolor(farbe1);
  s00;
  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  outtextxy(200,15,'Lageenergie im Gravitationsfeld ');
  outtextxy(30,470,'Zoomen (x/X/y/Y)   Aufl”sung verbessern/verringern (V/v)   beenden (b)');
  outtextxy(13,457,'Lageenergie der Erde//des Mondes//res.Energie setzen/l”schen (E/e//M/m//G/g)  ');
  setcolor(7);
  outtextxy(53,425,'Masse vergr”áern/verkleinern (2/3)');
  outtextxy(50,40,'Die Markierungen in  x - Richtung  werden alle  50.000 km  gesetzt');
  outtextxy(75,440,'Lageenergieverlauf im Erdinnern anzeigen/l”schen (1/0)');
end;

procedure graphik4;
begin
  setbkcolor(farbe0);
  setcolor(farbe1);
  s00;
  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  outtextxy(250,15,'Gravitationspotential ');
  outtextxy(30,470,'Zoomen (x/X/y/Y)   Aufl”sung verbessern/verringern (V/v)   beenden (b)');
  outtextxy(13,457,'Potential der Erde//des Mondes//Gesamtpotential setzen/l”schen (E/e//M/m//G/g)  ');
  setcolor(7);
  outtextxy(50,40,'Die Markierungen in  x - Richtung  werden alle  50.000 km  gesetzt');
  outtextxy(75,440,'Potentialverlauf im Erdinnern anzeigen/l”schen (1/0)');
end;


procedure auswahl;
begin
  flaeche:=0;
  m:=1;
  dx:=0.5*zx;
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    '5':
    begin
    if k0=1 then
    begin
      zy1:=10000;
      xanf:=3e8;
      pfeilhin;
      wahl:=' ';
    end;
    if k0=2 then
    begin
      zy1:=10;
      xanf:=Rerde;
      pfeilhin;
      wahl:=' ';
    end;
    end;
    '4':
    begin
    if k0=1 then
    begin
      zy1:=100;
      xanf:=2e7;
      pfeilhin;
      wahl:=' ';
    end;
    if k0=2 then
    begin
      zy1:=200;
      xanf:=5e7;
      pfeilhin;
      wahl:=' ';
    end;
    end;
    '7':
    begin
    if (k0=1) or (k0=2) then
    begin
      pfeilweg;
      xanf:=xanf-dx;
      pfeilhin;
      wahl:=' ';
    end;
    end;
    '6':
    begin
    if (k0=1) or (k0=2) then
    begin
      pfeilweg;
      xanf:=xanf+dx;
      pfeilhin;
      wahl:=' ';
    end;
    end;
    'Z':
    begin
    if (k0=1) or (k0=2) then
    begin
      pfeilweg;
      zy1:=zy1*1.1;
      pfeilhin;
      wahl:=' ';
    end;
    end;
    'z':
    begin
    if (k0=1) or (k0=2) then
    begin
      pfeilweg;
      zy1:=zy1*0.9;
      pfeilhin;
      wahl:=' ';
    end;
    end;
    'S':
    begin
      cleardevice;
      if k0=1 then graphik;
      if k0=2 then graphik2;
      if k0=3 then graphik3;
     s00;
     if hil0=1 then setzinnen;
     if hil1=1 then s1;
     if hil2=1 then s2;
     if hil3=1 then s3;
     wahl:=' ';
    end;
    's':
    begin
    if k0=2 then
    begin
    setcolor(farbe0);
    str(flaeche*Rerde/zy/1e6:4:2,ortx4);
    outtextxy(450,410,ortx4+' MJ');
    str(x/1e6:5:2,ortx5);
    outtextxy(450,395,ortx5+' tausend km');

    str(F1/zy:5:2,ortx6);
    outtextxy(450,380,ortx6+' N');
      xanf:=Rerde;
      xend:=xanf;
      flaeche:=0;
      x:=xend;
      F1:=zy*gamma*m*Merde/x/x;
      setcolor(farbe7);
      str(flaeche*Rerde/zy/1e6:4:2,ortx4);
      outtextxy(450,410,ortx4+' MJ');
      setcolor(farbe5);
      str(x/1e6:5:2,ortx5);
      outtextxy(450,395,ortx5+' tausend km');
      line(140+round(x/zx),240,140+round(x/zx),240-round(F1));
    setcolor(farbe2);
    str(F1/zy:5:2,ortx6);
    outtextxy(450,380,ortx6+' N');
      wahl:=' ';
    end;
    end;
    'u':
    begin
    if k0=2 then
    begin
    setcolor(farbe0);
    str(flaeche*Rerde/zy/1e6:4:2,ortx4);
    outtextxy(450,410,ortx4+' MJ');
    str(x/1e6:5:2,ortx5);
    outtextxy(450,395,ortx5+' tausend km');

    str(F1/zy:5:2,ortx6);
    outtextxy(450,380,ortx6+' N');
      xanf:=5e7;
      xend:=xanf;
      flaeche:=0;
      x:=xend;
      F1:=zy*gamma*m*Merde/x/x;
      setcolor(farbe7);
      str(flaeche*Rerde/zy/1e6:4:2,ortx4);
      outtextxy(450,410,ortx4+' MJ');
      setcolor(farbe5);
      str(x/1e6:5:2,ortx5);
      outtextxy(450,395,ortx5+' tausend km');
      line(140+round(x/zx),240,140+round(x/zx),240-round(F1));
    setcolor(farbe2);
    str(F1/zy:5:2,ortx6);
    outtextxy(450,380,ortx6+' N');
      wahl:=' ';
    end;
    end;
    't':
    begin
    if k0=2 then
    begin
    setcolor(farbe0);
    str(flaeche*Rerde/zy/1e6:4:2,ortx4);
    outtextxy(450,410,ortx4+' MJ');
    str(x/1e6:5:2,ortx5);
    outtextxy(450,395,ortx5+' tausend km');

    str(F1/zy:5:2,ortx6);
    outtextxy(450,380,ortx6+' N');
      xanf:=-Rerde;
      xend:=xanf;
      flaeche:=0;
      x:=xend;
      F1:=zy*gamma*m*Merde/x/x;
      setcolor(farbe7);
      str(flaeche*Rerde/zy/1e6:4:2,ortx4);
      outtextxy(450,410,ortx4+' MJ');
      setcolor(farbe5);
      str(x/1e6:5:2,ortx5);
      outtextxy(450,395,ortx5+' tausend km');
      line(140+round(x/zx),240,140+round(x/zx),240+round(F1));
    setcolor(farbe2);
    str(F1/zy:5:2,ortx6);
    outtextxy(450,380,ortx6+' N');
      wahl:=' ';
    end;
    end;
    'T':
    begin
    if k0=2 then
    begin
    setcolor(farbe0);
    str(flaeche*Rerde/zy/1e6:4:2,ortx4);
    outtextxy(450,410,ortx4+' MJ');
    str(x/1e6:5:2,ortx5);
    outtextxy(450,395,ortx5+' tausend km');

    str(F1/zy:5:2,ortx6);
    outtextxy(450,380,ortx6+' N');
      xanf:=0;
      xend:=xanf;
      flaeche:=0;
      x:=xend;
      F1:=0;
      setcolor(farbe7);
      str(flaeche*Rerde/zy/1e6:4:2,ortx4);
      outtextxy(450,410,ortx4+' MJ');
      setcolor(farbe5);
      str(x/1e6:5:2,ortx5);
      outtextxy(450,395,ortx5+' tausend km');
      line(140+round(x/zx),240,140+round(x/zx),240+round(F1));
    setcolor(farbe2);
    str(F1/zy:5:2,ortx6);
    outtextxy(450,380,ortx6+' N');
      wahl:=' ';
    end;
    end;
    'r':
    begin
    if k0=2 then
    begin
    setcolor(farbe0);
    str(flaeche*Rerde/zy/1e6:4:2,ortx4);
    outtextxy(450,410,ortx4+' MJ');
    str(x/1e6:5:2,ortx5);
    outtextxy(450,395,ortx5+' tausend km');

    str(F1/zy:5:2,ortx6);
    outtextxy(450,380,ortx6+' N');
      k00:=1;
      xend:=xend+dx;
      arbeit;
  setcolor(farbe2);
    str(F1/zy:5:2,ortx6);
    outtextxy(450,380,ortx6+' N');
      wahl:=' ';
    end;
    end;
    'l':
    begin
    if k0=2 then
    begin
      setcolor(farbe0);
      str(flaeche*Rerde/zy/1e6:4:2,ortx4);
      outtextxy(450,410,ortx4+' MJ');
      str(x/1e6:5:2,ortx5);
      outtextxy(450,395,ortx5+' tausend km');

      str(F1/zy:5:2,ortx6);
      outtextxy(450,380,ortx6+' N');
      k00:=0;
      xend:=xend-dx;
      arbeit;
      setcolor(farbe2);
      str(F1/zy:5:2,ortx6);
      outtextxy(450,380,ortx6+' N');
      wahl:=' ';
    end;
    end;
    'R':
    begin
    if k0=2 then
    begin
      setcolor(farbe0);
      line(140+round(x/zx),240,140+round(x/zx),240-round(F1));
      str(flaeche*Rerde/zy/1e6:4:2,ortx4);
      outtextxy(450,410,ortx4+' MJ');
      str(x/1e6:5:2,ortx5);
      outtextxy(450,395,ortx5+' tausend km');

      str(F1/zy:5:2,ortx6);
      outtextxy(450,380,ortx6+' N');
      xanf:=xanf+dx;
      xend:=xanf;
      x:=xanf;
      if (x>=-Rerde) or (x<=Rerde) then F1:=zy*gamma*m*Merde/x/x;
      if (x<Rerde) and (x>-Rerde) then F1:=zy*gamma*m*Merde/Rerde/Rerde/Rerde*x;
      setcolor(farbe5);
      line(140+round(x/zx),240,140+round(x/zx),240-round(F1));
      str(x/1e6:5:2,ortx5);
      outtextxy(450,395,ortx5+' tausend km');
      setcolor(farbe7);
      str(flaeche*Rerde/zy/1e6:4:2,ortx4);
      outtextxy(450,410,ortx4+' MJ');
      setcolor(farbe2);
      str(F1/zy:5:2,ortx6);
      outtextxy(450,380,ortx6+' N');
      wahl:=' ';
    end;
    end;
    'L':
    begin
    if k0=2 then
    begin
      setcolor(farbe0);
    if x>-Rerde then line(140+round(x/zx),240,140+round(x/zx),240-round(F1));
    if x<=-Rerde then line(140+round(x/zx),240,140+round(x/zx),240+round(F1));
    str(flaeche*Rerde/zy/1e6:4:2,ortx4);
    outtextxy(450,410,ortx4+' MJ');
    str(x/1e6:5:2,ortx5);
    outtextxy(450,395,ortx5+' tausend km');
    str(F1/zy:5:2,ortx6);
    outtextxy(450,380,ortx6+' N');
      xanf:=xanf-dx;
      xend:=xanf;
      x:=xanf;
      if (x>=-Rerde) or (x<=Rerde) then F1:=zy*gamma*m*Merde/x/x;
      if (x<Rerde) and (x>-Rerde) then F1:=zy*gamma*m*Merde/Rerde/Rerde/Rerde*x;
      setcolor(farbe5);
    if x>-Rerde then line(140+round(x/zx),240,140+round(x/zx),240-round(F1));
    if x<=-Rerde then line(140+round(x/zx),240,140+round(x/zx),240+round(F1));
    str(x/1e6:5:2,ortx5);
    outtextxy(450,395,ortx5+' tausend km');
    setcolor(farbe7);
    str(flaeche*Rerde/zy/1e6:4:2,ortx4);
    outtextxy(450,410,ortx4+' MJ');
  setcolor(farbe2);
    str(F1/zy:5:2,ortx6);
    outtextxy(450,380,ortx6+' N');
      wahl:=' ';
    end;
    end;
    '1':
    begin
      setzinnen;
      hil0:=1;
      wahl:=' ';
    end;
    '0':
    begin
      loeschinnen;
      hil0:=0;
      wahl:=' ';
    end;
    'e':
    begin
      l1;
      hil1:=0;
      wahl:=' ';
    end;
    'E':
    begin
      s1;
      hil1:=1;
      wahl:=' ';
    end;
    'm':
    begin
      l2;
      hil2:=0;
      wahl:=' ';
    end;
    'M':
    begin
      s2;
      hil2:=1;
      wahl:=' ';
    end;
    'g':
    begin
      l3;
      hil3:=0;
      wahl:=' ';
    end;
    'G':
    begin
      s3;
      hil3:=1;
      wahl:=' ';
    end;
    '3':
    begin
    if (k0=2) or (k0=3) then
    begin
     if hil0=1 then loeschinnen;
     if hil1=1 then l1;
     if hil2=1 then l2;
     if hil3=1 then l3;
     l00;
     m:=m*0.9;
     s00;
     if hil0=1 then setzinnen;
     if hil1=1 then s1;
     if hil2=1 then s2;
     if hil3=1 then s3;
     wahl:=' ';
    end;
    end;
    '2':
    begin
    if (k0=2) or (k0=3) then
    begin
     if hil0=1 then loeschinnen;
     if hil1=1 then l1;
     if hil2=1 then l2;
     if hil3=1 then l3;
     l00;
     m:=m*1.1;
     s00;
     if hil0=1 then setzinnen;
     if hil1=1 then s1;
     if hil2=1 then s2;
     if hil3=1 then s3;
     wahl:=' ';
    end;
    end;
    'X':
    begin
     if hil0=1 then loeschinnen;
     if hil1=1 then l1;
     if hil2=1 then l2;
     if hil3=1 then l3;
     l00;
     zx:=zx*0.9;
     dx:=2*zx;
     s00;
     if hil0=1 then setzinnen;
     if hil1=1 then s1;
     if hil2=1 then s2;
     if hil3=1 then s3;
     wahl:=' ';
    end;
    'x':
    begin
     if hil0=1 then loeschinnen;
     if hil1=1 then l1;
     if hil2=1 then l2;
     if hil3=1 then l3;
     l00;
     zx:=zx*1.1;
     dx:=2*zx;
     s00;
     if hil0=1 then setzinnen;
     if hil1=1 then s1;
     if hil2=1 then s2;
     if hil3=1 then s3;
     wahl:=' ';
    end;
    'y':
    begin
     if hil0=1 then loeschinnen;
     if hil1=1 then l1;
     if hil2=1 then l2;
     if hil3=1 then l3;
     l00;
     zy:=zy*0.5;
     s00;
     if hil0=1 then setzinnen;
     if hil1=1 then s1;
     if hil2=1 then s2;
     if hil3=1 then s3;
     wahl:=' ';
    end;
    'Y':
    begin
     if hil0=1 then loeschinnen;
     if hil1=1 then l1;
     if hil2=1 then l2;
     if hil3=1 then l3;
     l00;
     zy:=zy*2;
     s00;
     if hil0=1 then setzinnen;
     if hil1=1 then s1;
     if hil2=1 then s2;
     if hil3=1 then s3;
     wahl:=' ';
    end;
    'v':
    begin
     if hil1=1 then l1;
     if hil2=1 then l2;
     if hil3=1 then l3;
      dr:=dr*2;
     if hil1=1 then s1;
     if hil2=1 then s2;
     if hil3=1 then s3;
      wahl:=' ';
    end;
    'V':
    begin
     if hil1=1 then l1;
     if hil2=1 then l2;
     if hil3=1 then l3;
      dr:=dr/2;
     if hil1=1 then s1;
     if hil2=1 then s2;
     if hil3=1 then s3;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure p1;
begin
  en;
  cleardevice;
  k0:=1;
    hil1:=1;
    hil2:=0;
    hil3:=0;
    gamma:=6.67e-11;
    Merde:=5.9764e24;
    Mmond:=7.35e22;
    Rerde:=6.37e6;
    Rmond:=1.74e6;
    r:=3.844e8;
    dr:=0.04e6;
    zx:=1e6;
    zy:=16;
    zy1:=200;
    xanf:=3e8;
    x:=0;
    graphik;
    s1;
    auswahl;
  menue;
end;

procedure p2;
begin
  en;
  cleardevice;
  k0:=2;
  m:=1;
    hil1:=1;
    hil2:=0;
    hil3:=0;
    gamma:=6.67e-11;
    Merde:=5.9764e24;
    Mmond:=7.35e22;
    Rerde:=6.37e6;
    Rmond:=1.74e6;
    r:=3.844e8;
    dr:=0.04e6;
    zx:=0.15e6;
    zy:=16;
    zy1:=10;
    x:=0;
    graphik2;
    s1;
    auswahl;
  menue;
end;

procedure p3;
begin
  en;
  cleardevice;
  k0:=3;
  m:=1;
    hil1:=1;
    hil2:=0;
    hil3:=0;
    gamma:=6.67e-11;
    Merde:=5.9764e24;
    Mmond:=7.35e22;
    Rerde:=6.37e6;
    Rmond:=1.74e6;
    r:=3.844e8;
    dr:=0.04e6;
    zx:=1e6;
    zy:=12/Rerde;
    x:=0;
    graphik3;
    s1;
    auswahl;
  menue;
end;

procedure p4;
begin
  en;
  cleardevice;
  k0:=4;
  m:=1;
    hil1:=1;
    hil2:=0;
    hil3:=0;
    gamma:=6.67e-11;
    Merde:=5.9764e24;
    Mmond:=7.35e22;
    Rerde:=6.37e6;
    Rmond:=1.74e6;
    r:=3.844e8;
    dr:=0.04e6;
    zx:=1e6;
    zy:=12/Rerde;
    x:=0;
    graphik4;
    s1;
    auswahl;
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
    '1':p1;
    '2':p2;
    '3':p3;
    '4':p4;
    'h':h000:=0;
    'd':h000:=1;
  end;
  until wahl1='b';
end.