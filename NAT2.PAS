program nat2;
uses crt,graph;
var
  l,l1,l2,hilfe,f0,f2,f3,f1,r,k,treiber,modus:integer;
  xhilfe1,xhilfe2,a1,a2,a3,a4,f,c,dx,x,u,ud,x0,x1,y0,y1,alpha:real;
  wahl1,wahl,wahl2:char;
  ortx1,ortx2,ortx3,ortx4,ortx5:string;

procedure birne(a,b:integer);
begin
  circle(a,b,r);
  line(a-round(r*cos(Pi/4)),b-round(r*sin(Pi/4)),a+round(r*cos(pi/4)),b+round(r*sin(pi/4)));
  line(a-round(r*cos(Pi/4)),b+round(r*sin(Pi/4)),a+round(r*cos(pi/4)),b-round(r*sin(pi/4)));
end;

procedure diode(a,b:integer);
begin
  x0:=r*sqrt(1.5)*cos(alpha+arctan(0.5));
  y0:=r*sqrt(1.5)*sin(alpha+arctan(0.5));
  x1:=r*sqrt(1.5)*cos(alpha-arctan(0.5));
  y1:=r*sqrt(1.5)*sin(alpha-arctan(0.5));
  line(a,b,a+round(x0),b+round(y0));
  line(a+round(x0),b+round(y0),a+round(x1),b+round(y1));
  line(a+round(x1),b+round(y1),a,b);
  x0:=alpha-pi/2;
  y0:=alpha+pi/2;
  line(a+round(0.7*r*cos(x0)),b+round(0.7*r*sin(x0)),a+round(0.7*r*cos(y0)),b+round(0.7*r*sin(y0)));
end;

procedure led(a,b:integer);
var
  x0,x1,x2,x3,y0,y1,y2,y3:real;
begin
  x0:=r*sqrt(1.5)*cos(alpha+arctan(0.5));
  y0:=r*sqrt(1.5)*sin(alpha+arctan(0.5));
  x1:=r*sqrt(1.5)*cos(alpha-arctan(0.5));
  y1:=r*sqrt(1.5)*sin(alpha-arctan(0.5));
  line(a,b,a+round(x0),b-round(y0));
  line(a+round(x0),b-round(y0),a+round(x1),b-round(y1));
  line(a+round(x1),b-round(y1),a,b);
  x0:=alpha-pi/2;
  y0:=alpha+pi/2;
  line(a+round(0.7*r*cos(x0)),b-round(0.7*r*sin(x0)),a+round(0.7*r*cos(y0)),b-round(0.7*r*sin(y0)));
  x0:=r*sqrt(2)*cos(alpha-pi/4);
  y0:=r*sqrt(2)*sin(alpha-pi/4);
  x1:=r*sqrt(2.98)*cos(alpha+arctan(-17/3));
  y1:=r*sqrt(2.98)*sin(alpha+arctan(-17/3));
  x2:=r*sqrt(3.14)*cos(alpha+arctan(-3.4));
  y2:=r*sqrt(3.14)*sin(alpha+arctan(-3.4));
  x3:=r*sqrt(2.34)*cos(alpha+arctan(-5));
  y3:=r*sqrt(2.34)*sin(alpha+arctan(-5));
  line(a+round(x0),b-round(y0),a+round(x1),b-round(y1));
  line(a+round(x1),b-round(y1),a+round(x2),b-round(y2));
  line(a+round(x3),b-round(y3),a+round(x1),b-round(y1));
  x0:=x0-r*0.5*cos(alpha);
  y0:=y0-r*0.5*sin(alpha);
  x1:=x1-r*0.5*cos(alpha);
  y1:=y1-r*0.5*sin(alpha);
  x2:=x2-r*0.5*cos(alpha);
  y2:=y2-r*0.5*sin(alpha);
  x3:=x3-r*0.5*cos(alpha);
  y3:=y3-r*0.5*sin(alpha);
  line(a+round(x0),b-round(y0),a+round(x1),b-round(y1));
  line(a+round(x1),b-round(y1),a+round(x2),b-round(y2));
  line(a+round(x3),b-round(y3),a+round(x1),b-round(y1));
end;

procedure transistor(a,b:integer);
begin
  a:=a-round(0.5*r);
  circle(a,b,r);
  line(a-round(0.5*r),b-round(0.5*r),a-round(0.5*r),b+round(0.5*r));
  line(a-round(0.5*r),b+round(0.25*r),a+round(0.5*r),b+round(0.87*r));
  line(a+round(0.5*r),b+round(0.87*r),a+round(0.325*r),b+round(0.55*r));
  line(a+round(0.5*r),b+round(0.87*r),a+round(0.15*r),b+round(0.8*r));
  line(a-round(0.5*r),b-round(0.25*r),a+round(0.5*r),b-round(0.8*r));
  line(a-50,b,a-round(0.5*r),b);
  line(a+round(0.5*r),b+round(0.87*r),a+round(0.5*r),b+50);
  line(a+round(0.5*r),b-round(0.87*r),a+round(0.5*r),b-50);
end;

procedure widw(a,b:integer);
begin
  line(a,b-round(0.5*r),a,b+round(0.5*r));
  line(a,b-round(0.5*r),a+3*r,b-round(0.5*r));
  line(a,b+round(0.5*r),a+3*r,b+round(0.5*r));
  line(a+3*r,b-round(0.5*r),a+3*r,b+round(0.5*r));
end;

procedure wids(a,b:integer);
begin
  line(a-round(0.5*r),b,a+round(0.5*r),b);
  line(a-round(0.5*r),b,a-round(0.5*r),b+3*r);
  line(a-round(0.5*r),b+3*r,a+round(0.5*r),b+3*r);
  line(a+round(0.5*r),b,a+round(0.5*r),b+3*r);
end;

procedure quelle(a,b:integer);
begin
    circle(a,b-r,5);
    circle(a,b+r,5);
    x0:=-0.1;
    repeat
      x0:=x0+0.1;
      y0:=3*sin(x0);
      putpixel(a-10+round(3*x0),b-round(y0),f0);
    until x0>=2*pi;
end;


procedure menue;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  f1:=1;            {Hintergrundfarbe}
  f2:=12;           {LED-Farbe}
  f3:=10;           {Glhbirnenfaebe}
  f0:=15;           {Schriftfarbe}
  setlinestyle(0,1,1);

  setbkcolor(7);
  setcolor(1);
  outtextxy(150,100,'Ventilwirkung einer Diode  ->  0');
  outtextxy(150,125,'Beispiel zu 0  ->  1');
  outtextxy(150,150,'Brckengleichrichterschaltung  ->  2');
  outtextxy(150,175,'Erg„nzung zu 2   ->  3');
  outtextxy(150,200,'Gl„ttung der Gleichspannung  ->  4');
  outtextxy(150,225,'Gitter  ->  5');
  outtextxy(150,250,'Atommodell  ->  6');
  outtextxy(150,275,'Germaniumgitter / Dotierung  ->  7');
  outtextxy(150,300,'Leitungsmechanismus bei Halbleitern  ->  8');
  outtextxy(150,325,'Valenz -  und  Leitungsband / Diode  ->  9');
  outtextxy(400,400,'beenden  ->  b');
end;

procedure graphik1;
begin
  setbkcolor(f1);
  setcolor(f0);
  outtextxy(400,380,'U  =');
  outtextxy(400,400,'Ud =');
  outtextxy(400,420,'f  =');
  outtextxy(520,420,'dt =');
  outtextxy(250,20,'Ventilwirkung einer Diode ');
  outtextxy(85,445,'Batteriespannung „ndern (u/U)   Durchlassspannung „ndern (d/D)');
  outtextxy(50,460,'starten (s)       Frequenz „ndern (f/F)');
  outtextxy(420,460,'pause (p)    beenden (b)');
    r:=20;
    alpha:=pi;
    led(220,200);
    widw(100,200);
    quelle(50,275);
    line(50,200,100,200);
    line(50,200,50,250);
    line(50,300,50,350);
    line(50,350,270,350);
    line(270,350,270,200);
    line(270,200,100+3*r,200);
end;

procedure setz2;
begin
  setcolor(f0);
  str(ud:4:2,ortx2);
  outtextxy(445,400,ortx2+' V');
end;

procedure loesch2;
begin
  setcolor(f1);
  outtextxy(445,400,ortx2+' V');
end;

procedure setz1;
begin
  setcolor(f0);
  str(u:4:2,ortx1);
  outtextxy(445,380,ortx1+' V');
end;

procedure loesch1;
begin
  setcolor(f1);
  outtextxy(445,380,ortx1+' V');
end;

procedure setz3;
begin
  setcolor(f0);
  str(f:4:2,ortx3);
  outtextxy(445,420,ortx3+' Hz');
end;

procedure loesch3;
begin
  setcolor(f1);
  outtextxy(445,420,ortx3+' Hz');
end;

procedure setz5;
begin
  setcolor(f0);
  str(dx:5:3,ortx5);
  outtextxy(565,420,ortx5);
end;

procedure loesch5;
begin
  setcolor(f1);
  outtextxy(565,420,ortx5);
end;

procedure s1;
begin
      setfillstyle(f1,1);
      bar(300,100,640,350);
      line(350,150,350,350);
      line(350,250,620,250);
      outtextxy(330,150,'U');
      outtextxy(610,260,'t');
      outtextxy(60,60,'Die rote Kurve zeigt die Spannung  Uo - Ud  an, die an  R  anliegt.');
      outtextxy(30,75,'Wegen  U = R * I  ist sie damit ein Maá fr den im Kreis flieáenden Strom.');
      x:=0;
      wahl2:=' ';
      repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
    'f':
    begin
      if f>=0.2 then
      begin
        loesch3;
        f:=f-0.1;
        setz3;
      end;
      wahl2:=' ';
    end;
    'F':
    begin
      loesch3;
      f:=f+0.1;
      setz3;
      wahl2:=' ';
    end;
          end;
        x:=x+dx;
        if x<=6*pi then
        begin
          putpixel(350+round(15*x),250-round(10*u*sin(f*x)),f3);
        end;
        if u*sin(f*x)>=ud then
        begin
          setcolor(f2);
          led(220,200);
          setcolor(f0);
        end;
        if u*sin(f*x)<ud then
        begin
          led(220,200);
        end;
        if (x<=6*pi) and (u*sin(f*x)>=ud) then
        begin
          putpixel(350+round(15*x),250-round(10*(u*sin(f*x)-ud)),f2);
        end;
        if (x<=6*pi) and (u*sin(f*x)<ud) then
        begin
          putpixel(350+round(15*x),250,f2);
        end;
        if u*sin(f*x)>0 then
        begin
          setcolor(f1);
          outtextxy(30,252,'-');
          outtextxy(30,292,'+');
          setcolor(f0);
          outtextxy(30,252,'+');
          outtextxy(30,292,'-');
         end
         else
         begin
          setcolor(f1);
          outtextxy(30,252,'+');
          outtextxy(30,292,'-');
          setcolor(f0);
          outtextxy(30,252,'-');
          outtextxy(30,292,'+');
        end;
      until wahl2='b';
end;

procedure s2;
begin
      x:=0;
      wahl2:=' ';
      repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
    'f':
    begin
      if f>=0.2 then
      begin
        loesch3;
        f:=f-0.1;
        setz3;
      end;
      wahl2:=' ';
    end;
    'F':
    begin
      loesch3;
      f:=f+0.1;
      setz3;
      wahl2:=' ';
    end;
          end;
        x:=x+dx;
        if u*sin(f*x)>=ud then
        begin
          setcolor(f2);
          led(300,150);
          setcolor(f0);
        end;
        if u*sin(f*x)<ud then
        begin
          led(300,150);
        end;
        if u*sin(f*x)-ud>=1 then
        begin
          setcolor(f3);
          birne(400,150);
          setcolor(f0);
        end
        else
        begin
          birne(400,150);
        end;
        if (u*sin(f*x)<=-4.5) or (u*sin(f*x)>=4.5) then
        begin
          setcolor(f3);
          birne(400,220);
          setcolor(f0);
        end
        else
        begin
         birne(400,220);
        end;
        if u*sin(f*x)>0 then
        begin
          setcolor(f1);
          outtextxy(130,227,'-');
          outtextxy(130,267,'+');
          setcolor(f0);
          outtextxy(130,227,'+');
          outtextxy(130,267,'-');
         end
         else
         begin
          setcolor(f1);
          outtextxy(130,227,'+');
          outtextxy(130,267,'-');
          setcolor(f0);
          outtextxy(130,227,'-');
          outtextxy(130,267,'+');
        end;
      until wahl2='b';
end;


procedure s3;
begin
      x:=0;
      wahl2:=' ';
      repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
    'f':
    begin
      if f>=0.2 then
      begin
        loesch3;
        f:=f-0.1;
        setz3;
      end;
      wahl2:=' ';
    end;
    'F':
    begin
      loesch3;
      f:=f+0.1;
      setz3;
      wahl2:=' ';
    end;
          end;
        x:=x+dx;
        if u*sin(f*x)>=2*ud then
        begin
          setcolor(f2);
          alpha:=5*pi/4;
          led(160,140);
          led(260,240);
          setcolor(f0);
        end;
        if u*sin(f*x)<2*ud then
        begin
          alpha:=5*pi/4;
          led(160,140);
          led(260,240);
        end;
        if u*sin(f*x)<=-2*ud then
        begin
          setcolor(f2);
          alpha:=7*pi/4;
          led(140,240);
          led(240,140);
          setcolor(f0);
        end;
        if u*sin(f*x)>-2*ud then
        begin
          alpha:=7*pi/4;
          led(140,240);
          led(240,140);
        end;
        if u*sin(f*x)>=3*ud then
        begin
          setcolor(f2);
          alpha:=5*pi/4;
          led(460,140);
          led(560,240);
          setcolor(f0);
        end;
        if u*sin(f*x)<3*ud then
        begin
          alpha:=5*pi/4;
          led(460,140);
          led(560,240);
        end;
        if u*sin(f*x)<=-3*ud then
        begin
          setcolor(f2);
          alpha:=7*pi/4;
          led(440,240);
          led(540,140);
          setcolor(f0);
        end;
        if u*sin(f*x)>-3*ud then
        begin
          alpha:=7*pi/4;
          led(440,240);
          led(540,140);
        end;
        if (u*sin(f*x)<=-3*ud) or (u*sin(f*x)>=3*ud) then
        begin
          setcolor(f2);
          alpha:=pi/2;
          led(500,210);
          setcolor(f0);
        end
        else
        begin
          alpha:=pi/2;
          led(500,210);
        end;
        if u*sin(f*x)>0 then
        begin
          setcolor(f1);
          outtextxy(30,252,'-');
          outtextxy(30,292,'+');
          outtextxy(330,252,'-');
          outtextxy(330,292,'+');
          setcolor(f0);
          outtextxy(30,252,'+');
          outtextxy(30,292,'-');
          outtextxy(330,252,'+');
          outtextxy(330,292,'-');
         end
         else
         begin
          setcolor(f1);
          outtextxy(30,252,'+');
          outtextxy(30,292,'-');
          outtextxy(330,252,'+');
          outtextxy(330,292,'-');
          setcolor(f0);
          outtextxy(30,252,'-');
          outtextxy(30,292,'+');
          outtextxy(330,252,'-');
          outtextxy(330,292,'+');
        end;
      until wahl2='b';
end;

procedure pfeil;
begin
  line(200,180,200,220);
  line(200,220,205,215);
  line(195,215,200,220);
end;

procedure s4;
begin
      setfillstyle(f1,1);
      bar(320,100,640,350);
      line(350,150,350,350);
      line(350,250,620,250);
      outtextxy(330,150,'U');
      outtextxy(610,260,'t');
      outtextxy(50,60,'Die rote Kurve zeigt die Spannung  Uo - 2*Ud  an, die an  R  anliegt.');
      outtextxy(30,75,'Wegen  U = R * I  ist sie damit ein Maá fr den im Kreis flieáenden Strom.');
      x:=0;
      wahl2:=' ';
      repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
    'f':
    begin
      if f>=0.2 then
      begin
        loesch3;
        f:=f-0.1;
        setz3;
      end;
      wahl2:=' ';
    end;
    'F':
    begin
      loesch3;
      f:=f+0.1;
      setz3;
      wahl2:=' ';
    end;
          end;
        x:=x+dx;
        if x<=6*pi then
        begin
          putpixel(350+round(15*x),250-round(10*u*sin(f*x)),f3);
        end;
        if (x<=6*pi) and (u*sin(f*x)>=2*ud) then
        begin
          putpixel(350+round(15*x),250-round(10*(u*sin(f*x)-2*ud)),f2);
        end;
        if (x<=6*pi) and (u*sin(f*x)<=2*ud) and (u*sin(f*x)>=-2*ud) then
        begin
          putpixel(350+round(15*x),250,f2);
        end;
        if (x<=6*pi) and (u*sin(f*x)<=-2*ud) then
        begin
          putpixel(350+round(15*x),250+round(10*(u*sin(f*x)+2*ud)),f2);
        end;

        if u*sin(f*x)>=2*ud then
        begin
          setcolor(f2);
          alpha:=5*pi/4;
          led(160,140);
          led(260,240);
          pfeil;
          setcolor(f0);
        end;
        if u*sin(f*x)<2*ud then
        begin
          alpha:=5*pi/4;
          led(160,140);
          led(260,240);
        end;
        if (u*sin(f*x)<2*ud) and (u*sin(f*x)>-2*ud) then
        begin
          setcolor(f1);
          pfeil;
          setcolor(f0);
        end;
        if u*sin(f*x)<=-2*ud then
        begin
          setcolor(f2);
          alpha:=7*pi/4;
          led(140,240);
          led(240,140);
          pfeil;
          setcolor(f0);
        end;
        if u*sin(f*x)>-2*ud then
        begin
          alpha:=7*pi/4;
          led(140,240);
          led(240,140);
        end;
        if u*sin(f*x)>0 then
        begin
          setcolor(f1);
          outtextxy(30,252,'-');
          outtextxy(30,292,'+');
          setcolor(f0);
          outtextxy(30,252,'+');
          outtextxy(30,292,'-');
         end
         else
         begin
          setcolor(f1);
          outtextxy(30,252,'+');
          outtextxy(30,292,'-');
          setcolor(f0);
          outtextxy(30,252,'-');
          outtextxy(30,292,'+');
        end;
      until wahl2='b';
end;

procedure setz4;
begin
  setcolor(f0);
  str(c:4:2,ortx4);
  outtextxy(300,420,ortx4);
end;

procedure loesch4;
begin
  setcolor(f1);
  outtextxy(300,420,ortx4);
end;


procedure s5;
begin
      setfillstyle(f1,1);
      bar(320,100,640,350);
      line(350,150,350,350);
      line(350,250,620,250);
      outtextxy(330,150,'U');
      outtextxy(610,260,'t');

        x:=pi/2/f;
        repeat
          x:=x+dx;
        until (u*sin(f*x)-u*sin(f*(x+dx))>=(u*sin(f*x)-2*ud)*(1-exp(-dx/c)));
        xhilfe1:=x;

        x:=pi/f-dx;
        repeat
          x:=x+dx;
        until ((-u*sin(f*(x))-2*ud)>=(u-2*ud)*sin(f*xhilfe1)*exp(-1/c*(x-xhilfe1)));
        xhilfe2:=x;

      x:=0;
      x1:=0;
      wahl2:=' ';
          setcolor(f1);
          outtextxy(30,122,'+');
          outtextxy(30,137,'-');
          setcolor(f0);
      repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
    'f':
    begin
      if f>=0.2 then
      begin
        loesch3;
        f:=f-0.1;
        setz3;
      end;
      wahl2:=' ';
    end;
    'F':
    begin
      loesch3;
      f:=f+0.1;
      setz3;
      wahl2:=' ';
    end;
          end;

          if x>=xhilfe2 then x:=xhilfe2-pi/f;

          x:=x+dx;
          x1:=x1+dx;
       if x1<=6*pi then
       begin
          putpixel(350+round(15*x1),250-round(10*u*sin(f*x1)),f3);

          if (f*x<=pi/2) and (u*sin(f*x)<=2*ud) then
          begin
            putpixel(350+round(15*x1),250,f2);
          end;
          if ((f*x<=pi/2) and (u*sin(f*x)>2*ud)) or ((f*x>pi/2) and (x<=xhilfe1)) then
          begin
            putpixel(350+round(15*x1),250-round(10*(u*sin(f*x)-2*ud)),f2);
          end;
          if (x>xhilfe1) and (x<=xhilfe2) then
          begin
            putpixel(350+round(15*x1),250-round(10*(u*sin(f*xhilfe1)-2*ud)*exp(-1/c*(x-xhilfe1))),f2);
          end;
        end;
            delay(30);

        if (u*sin(f*x1)>2*ud)  then
        begin
          setcolor(f2);
          alpha:=5*pi/4;
          led(160,140);
          led(260,240);
          pfeil;
          setcolor(f0);

          outtextxy(30,122,'+');
          outtextxy(30,137,'-');

          alpha:=7*pi/4;
          led(140,240);
          led(240,140);
        end;

        if (u*sin(f*x1)<2*ud) and (u*sin(f*x1)>-2*ud) then
        begin
          setcolor(f1);
          setcolor(f0);
          alpha:=7*pi/4;
          led(140,240);
          led(240,140);

          alpha:=5*pi/4;
          led(160,140);
          led(260,240);
        end;

        if (u*sin(f*x1)<=-2*ud) then
        begin
          setcolor(f2);
          alpha:=7*pi/4;
          led(140,240);
          led(240,140);
          setcolor(f0);
          alpha:=5*pi/4;
          led(160,140);
          led(260,240);
        end;

        if u*sin(f*x1)>0 then
        begin
          setcolor(f1);
          outtextxy(30,252,'-');
          outtextxy(30,292,'+');
          setcolor(f0);
          outtextxy(30,252,'+');
          outtextxy(30,292,'-');
         end
         else
         begin
          setcolor(f1);
          outtextxy(30,252,'+');
          outtextxy(30,292,'-');
          setcolor(f0);
          outtextxy(30,252,'-');
          outtextxy(30,292,'+');
        end;
      until wahl2='b';

end;



procedure graphik2;
begin
  setbkcolor(f1);
  setcolor(f0);
  outtextxy(400,380,'U  =');
  outtextxy(400,400,'Ud =');
  outtextxy(400,420,'f  =');
  outtextxy(520,420,'dt =');
  outtextxy(190,20,'Ventilwirkung einer Diode (Beispiel) ');
  outtextxy(50,460,'starten (s)       Frequenz „ndern (f/F)');
  outtextxy(420,460,'pause (p)    beenden (b)');
    r:=20;
    alpha:=pi;
    led(300,150);
    birne(400,150);
    widw(260,220);
    birne(400,220);
    quelle(160,250);
    line(260,220,210,220);
    line(210,220,210,150);
    line(210,150,380,150);
    line(320,220,380,220);
    line(420,220,470,220);
    line(470,220,470,150);
    line(470,150,420,150);
    line(210,185,160,185);
    line(160,185,160,225);
    line(160,275,160,315);
    line(160,315,520,315);
    line(520,315,520,185);
    line(520,185,470,185);
end;


procedure graphik3;
begin
  setbkcolor(f1);
  setcolor(f0);
  outtextxy(400,380,'U  =');
  outtextxy(400,400,'Ud =');
  outtextxy(400,420,'f  =');
  outtextxy(520,420,'dt =');
  outtextxy(220,20,'Brckengleichrichterschaltung');
  outtextxy(60,60,'Der Strom durchflieát den Verbraucher stets von oben nach unten.');
  outtextxy(30,75,'In der rechten Schaltung wird dies verdeutlicht durch die fnfte LED');
  outtextxy(85,445,'Batteriespannung „ndern (u/U)   Durchlassspannung „ndern (d/D)');
  outtextxy(50,460,'starten (s)       Frequenz „ndern (f/F)');
  outtextxy(420,460,'pause (p)    beenden (b)');
    r:=20;
    alpha:=5*pi/4;
    led(160,140);
    led(260,240);
    alpha:=7*pi/4;
    led(140,240);
    led(240,140);
    line(100,200,200,100);
    line(100,200,200,300);
    line(300,200,200,100);
    line(300,200,200,300);
    line(50,250,50,200);
    line(50,200,100,200);
    line(300,200,310,200);
    line(310,200,310,350);
    line(310,350,50,350);
    line(50,350,50,300);
    line(200,100,200,170);
    line(200,230,200,300);
    wids(200,170);
    quelle(50,275);
    alpha:=5*pi/4;
    led(460,140);
    led(560,240);
    alpha:=7*pi/4;
    led(440,240);
    led(540,140);
    line(400,200,500,100);
    line(400,200,500,300);
    line(600,200,500,100);
    line(600,200,500,300);
    line(350,250,350,200);
    line(350,200,400,200);
    line(600,200,610,200);
    line(610,200,610,350);
    line(610,350,350,350);
    line(350,350,350,300);
    line(500,100,500,300);
    alpha:=pi/2;
    led(500,210);
    quelle(350,275);
end;

procedure graphik4;
begin
  setbkcolor(f1);
  setcolor(f0);
  outtextxy(400,380,'U  =');
  outtextxy(400,400,'Ud =');
  outtextxy(400,420,'f  =');
  outtextxy(520,420,'dt =');
  outtextxy(220,20,'Brckengleichrichterschaltung');
  outtextxy(60,45,'Der Strom durchflieát den Verbraucher stets von oben nach unten.');
  outtextxy(30,75,'');
  outtextxy(85,445,'Batteriespannung „ndern (u/U)   Durchlassspannung „ndern (d/D)');
  outtextxy(50,460,'starten (s)       Frequenz „ndern (f/F)');
  outtextxy(420,460,'pause (p)    beenden (b)');
    r:=20;
    alpha:=5*pi/4;
    led(160,140);
    led(260,240);
    alpha:=7*pi/4;
    led(140,240);
    led(240,140);
    line(100,200,200,100);
    line(100,200,200,300);
    line(300,200,200,100);
    line(300,200,200,300);
    line(50,250,50,200);
    line(50,200,100,200);
    line(300,200,310,200);
    line(310,200,310,350);
    line(310,350,50,350);
    line(50,350,50,300);
    line(200,100,200,170);
    line(200,230,200,300);
    wids(200,170);
    quelle(50,275);
end;

procedure graphik5;
begin
  setbkcolor(f1);
  setcolor(f0);
  outtextxy(400,380,'U  =');
  outtextxy(400,400,'Ud =');
  outtextxy(400,420,'f  =');
  outtextxy(520,420,'dt =');
  outtextxy(250,420,'R*C =');
  outtextxy(220,20,'Gl„ttung der Gleichspannung');
  outtextxy(60,45,'Der Strom durchflieát den Verbraucher permanent von oben nach unten.');
  outtextxy(80,75,'Žnderungen von  R  und  C  beeinflussen den Grad der Gl„ttung');
  outtextxy(55,60,'Die rote Kurve zeigt die Spannung  Uo - 2*Ud  an, die an  R  anliegt.');
  outtextxy(30,75,'');
  outtextxy(50,420,'R*C ver„ndern (c/C)');
  outtextxy(85,445,'Batteriespannung „ndern (u/U)   Durchlassspannung „ndern (d/D)');
  outtextxy(50,460,'starten (s)       Frequenz „ndern (f/F)');
  outtextxy(420,460,'pause (p)    beenden (b)');
    r:=20;
    alpha:=5*pi/4;
    led(160,140);
    led(260,240);
    alpha:=7*pi/4;
    led(140,240);
    led(240,140);
    line(100,200,200,100);
    line(100,200,200,300);
    line(300,200,200,100);
    line(300,200,200,300);
    line(50,250,50,200);
    line(50,200,100,200);
    line(300,200,310,200);
    line(310,200,310,350);
    line(310,350,50,350);
    line(50,350,50,300);
    line(200,100,200,170);
    line(200,230,200,300);
    wids(200,170);
    quelle(50,275);
    line(75,100,200,100);
    line(75,100,75,125);
    line(50,125,100,125);
    line(50,140,100,140);
    line(75,140,75,195);
    line(75,205,75,300);
    line(75,300,200,300);
    arc(75,200,90,270,5);
end;

procedure g6;
begin
  setbkcolor(f1);
  setcolor(f0);
  outtextxy(300,30,'Gitter');
  outtextxy(25,460,'NaCl - Gitter (n)     Metall - Gitter (m)     Original (o)     beenden (b)');
    for k:=1 to 5 do
    begin
      for l:=1 to 3 do
      begin
        circle(k*100,50+l*100,6);
        circle(50+k*100,25+l*100,5);
      end;
    end;
    for k:=1 to 4 do
    begin
      for l:=1 to 2 do
      begin
        line(10+k*100,50+l*100,90+k*100,50+l*100);
        line(k*100,60+l*100,k*100,140+l*100);
        line((k+1)*100,60+l*100,(k+1)*100,140+l*100);
          setlinestyle(1,0,1);
          setcolor(7);
        line(60+k*100,25+l*100,140+k*100,25+l*100);
        line(50+k*100,35+l*100,50+k*100,115+l*100);
        line(50+(k+1)*100,35+l*100,50+(k+1)*100,115+l*100);
        line(10+k*100,45+l*100,46+k*100,27+l*100);
        line(10+(k+1)*100,45+l*100,46+(k+1)*100,27+l*100);
        setlinestyle(0,0,1);
        setcolor(f0);
      end;
      line(10+k*100,50+(l+1)*100,90+k*100,50+(l+1)*100);

       setlinestyle(1,0,1);
       setcolor(7);
      line(60+k*100,25+(l+1)*100,140+k*100,25+(l+1)*100);
        line(10+k*100,45+(l+1)*100,46+k*100,27+(l+1)*100);
        line(10+(k+1)*100,45+(l+1)*100,46+(k+1)*100,27+(l+1)*100);
       setlinestyle(0,0,1);
       setcolor(f0);
     end;

       for k:=1 to 5 do
    begin
      for l:=1 to 3 do
      begin
        circle(k*100,50+l*100,6);
        circle(50+k*100,25+l*100,5);
      end;
    end;
end;

procedure graphik6;
begin
  g6;
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    'n':
    begin;
    setcolor(f2);
    for k:=1 to 3 do
    begin
      for l:=1 to 2 do
      begin
        circle(k*200-100,50+l*200-100,6);
        outtextxy(k*200-102,50+l*200-102,'-');
      end;
    end;
    for k:=1 to 3 do
    begin
      circle(50+k*200-100,25+200,5);
      outtextxy(50+k*200-102,25+200-2,'-');
    end;
    for k:=1 to 2 do
    begin
      circle(k*200,50+200,6);
      outtextxy(k*200-2,50+200-2,'-');
    end;
    for k:=1 to 2 do
    begin
      for l:=1 to 2 do
      begin
        circle(50+k*200,25+l*200-100,5);
        outtextxy(50+k*200-2,25+l*200-102,'-');
      end;
    end;
    outtextxy(360,400,'Cl');
    setcolor(f3);
    outtextxy(280,400,'Na');
    for k:=1 to 2 do
    begin
      for l:=1 to 2 do
      begin
        circle(k*200,-50+l*200,6);
        outtextxy(k*200-2,-50+l*200-2,'+');
      end;
    end;
    for k:=1 to 3 do
    begin
      circle(k*200-100,250,6);
      outtextxy(k*200-102,250-2,'+');
    end;
    for k:=1 to 2 do
    begin
      circle(50+k*200,25+200,5);
      outtextxy(50+k*200-2,25+200-2,'+');
    end;
    for k:=1 to 3 do
    begin
      for l:=1 to 2 do
      begin
        circle(-50+k*200,25+l*200-100,5);
        outtextxy(-50+k*200-2,25+l*200-102,'+');
      end;
    end;
    wahl:=' ';
    end;
    'm':
    begin
    setcolor(f2);
    setfillstyle(1,f2);
    for k:=1 to 5 do
    begin
      for l:=1 to 2 do
      begin
        sector(30+k*100,90+l*100,0,360,2,2);
      end;
    end;
    for k:=1 to 4 do
    begin
      for l:=1 to 3 do
      begin
        sector(60+k*100,40+l*100,0,360,2,2);
      end;
    end;
    sector(190,400,0,360,2,2);
    outtextxy(220,400,'frei bewegliche Elektronen');
    setcolor(f0);
    wahl:=' ';
    end;
    'o':
    begin;
    cleardevice;
    g6;
    setcolor(f0);
    wahl:=' ';
    end;
   end;
   until wahl='b';
end;

procedure graphik8;
begin
  setbkcolor(f1);
  setcolor(f0);
  outtextxy(200,30,'Germanium und das zugeh”rige Gitter');
  outtextxy(540,450,'beenden (b)');
  outtextxy(50,440,'p - Dotierung (p)   n - Dotierung (n)   Original (o)');
  circle(90,240,2);
  circle(150,240,2);
  circle(120,210,2);
  circle(120,270,2);
  setcolor(f2);
  setfillstyle(1,f2);
  sector(120,240,0,360,6,6);
  for k:=0 to 4 do
  begin
    for l:=0 to 4 do
    begin
  setcolor(f2);
       sector(300+k*70,100+l*70,0,360,6,6);
  setcolor(f0);
       circle(270+k*70,100+l*70,2);
       circle(330+k*70,100+l*70,2);
       circle(300+k*70,70+l*70,2);
       circle(300+k*70,130+l*70,2);
    end;
  end;
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    'p':
    begin;
  setcolor(f3);
       setfillstyle(1,f3);
       k:=2;
       l:=2;
       sector(300+k*70,100+l*70,0,360,6,6);
  setcolor(f0);
       circle(270+k*70,100+l*70,2);
       circle(330+k*70,100+l*70,2);
       circle(300+k*70,70+l*70,2);
       setcolor(f1);
       circle(300+k*70,130+l*70,2);
       setcolor(f3);
  outtextxy(50,440,'p - Dotierung (p) ');
       setcolor(f0);
    wahl:=' ';
    end;
    'o':
    begin;
  setcolor(f2);
       setfillstyle(1,f2);
       k:=2;
       l:=2;
       sector(300+k*70,100+l*70,0,360,6,6);
  setcolor(f0);
       circle(300+k*70,130+l*70,2);
       k:=1;
       l:=1;
  setcolor(f2);
       sector(300+k*70,100+l*70,0,360,6,6);
       setcolor(f1);
       circle(280+k*70,120+l*70,2);
       setcolor(f0);
  outtextxy(50,440,'p - Dotierung (p)   n - Dotierung (n)   Original (o)');
    wahl:=' ';
   end;
    'n':
    begin;
  setcolor(f3);
       setfillstyle(1,f3);
       k:=1;
       l:=1;
       sector(300+k*70,100+l*70,0,360,6,6);
  setcolor(f0);
       circle(270+k*70,100+l*70,2);
       circle(330+k*70,100+l*70,2);
       circle(300+k*70,70+l*70,2);
       circle(300+k*70,130+l*70,2);
       circle(280+k*70,120+l*70,2);
       setcolor(f3);
  outtextxy(50,440,'                    n - Dotierung (n)  ');
       setcolor(f0);
    wahl:=' ';
   end;
   end;
   until wahl='b';
end;

procedure g7;
begin
  setbkcolor(f1);
  setcolor(f0);
  outtextxy(250,25,'Atomaufbau (Planetenmodell) ');
  outtextxy(540,450,'beenden (b)');
  outtextxy(240,165,'K');
  outtextxy(285,165,'L');
  outtextxy(327,165,'M');
  outtextxy(360,280,'K - Schale: maximal   2 Elektronen');
  outtextxy(360,300,'L - Schale: maximal   8 Elektronen');
  outtextxy(360,320,'M - Schale: maximal  18 Elektronen');
  outtextxy(360,340,'N - Schale: maximal  32 Elektronen');
  outtextxy(470,360,'usw.');
  outtextxy(50,440,'Natrium (n)    Chlor (c)    Kupfer (k)    Germanium (g)');
end;

procedure g7n;
begin
  g7;
  outtextxy(130,360,'Atomaufbau von Na');
  outtextxy(160,380,'2 + 8 + 1');
  setcolor(f2);
  setfillstyle(1,f2);
  sector(200,200,0,360,6,6);
  setcolor(f0);
  for k:=1 to 3 do
  begin
    circle(200,200,5+k*40);
  end;
  setcolor(f2);
  for k:=1 to 2 do
  begin
    sector(200+45*round(cos(k*pi)),200+45*round(sin(k*pi)),0,360,4,4);
  end;
  for k:=1 to 8 do
  begin
    sector(200+round(85*cos(k*pi/4)),200-round(85*sin(k*pi/4)),0,360,4,4);
  end;
  for k:=0 to 0 do
  begin
    sector(200+round(125*cos(k*pi/9)),200-round(125*sin(k*pi/9)),0,360,4,4);
  end;
  setcolor(f0);
end;

procedure g7k;
begin
  g7;
  outtextxy(367,165,'N');
  outtextxy(130,380,'Atomaufbau von Cu');
  outtextxy(145,400,'2 + 8 + 18 + 1');
  setcolor(f2);
  setfillstyle(1,f2);
  sector(200,200,0,360,6,6);
  setcolor(f0);
  for k:=1 to 4 do
  begin
    circle(200,200,5+k*40);
  end;
  setcolor(f2);
  for k:=1 to 2 do
  begin
    sector(200+45*round(cos(k*pi)),200+45*round(sin(k*pi)),0,360,4,4);
  end;
  for k:=1 to 8 do
  begin
    sector(200+round(85*cos(k*pi/4)),200-round(85*sin(k*pi/4)),0,360,4,4);
  end;
  for k:=0 to 17 do
  begin
    sector(200+round(125*cos(k*pi/9)),200-round(125*sin(k*pi/9)),0,360,4,4);
  end;
  for k:=0 to 0 do
  begin
    sector(200+round(165*cos(k*pi/4)),200-round(165*sin(k*pi/4)),0,360,4,4);
  end;
  setcolor(f0);
end;

procedure g7g;
begin
  g7;
  outtextxy(367,165,'N');
  outtextxy(130,380,'Atomaufbau von Ge');
  outtextxy(145,400,'2 + 8 + 18 + 4');
  setcolor(f2);
  setfillstyle(1,f2);
  sector(200,200,0,360,6,6);
  setcolor(f0);
  for k:=1 to 4 do
  begin
    circle(200,200,5+k*40);
  end;
  setcolor(f2);
  for k:=1 to 2 do
  begin
    sector(200+45*round(cos(k*pi)),200+45*round(sin(k*pi)),0,360,4,4);
  end;
  for k:=1 to 8 do
  begin
    sector(200+round(85*cos(k*pi/4)),200-round(85*sin(k*pi/4)),0,360,4,4);
  end;
  for k:=0 to 17 do
  begin
    sector(200+round(125*cos(k*pi/9)),200-round(125*sin(k*pi/9)),0,360,4,4);
  end;
  for k:=0 to 3 do
  begin
    sector(200+round(165*cos(k*pi/2)),200-round(165*sin(k*pi/2)),0,360,4,4);
  end;
  setcolor(f0);
end;

procedure g7c;
begin
  g7;
  outtextxy(130,360,'Atomaufbau von Cl');
  outtextxy(160,380,'2 + 8 + 7');
  setfillstyle(1,f2);
  setcolor(f2);
  sector(200,200,0,360,6,6);
  setcolor(f0);
  for k:=1 to 3 do
  begin
    circle(200,200,5+k*40);
  end;
  setcolor(f2);
  for k:=1 to 2 do
  begin
    sector(200+45*round(cos(k*pi)),200+45*round(sin(k*pi)),0,360,4,4);
  end;
  for k:=1 to 8 do
  begin
    sector(200+round(85*cos(k*pi/4)),200-round(85*sin(k*pi/4)),0,360,4,4);
  end;
  for k:=0 to 6 do
  begin
    sector(200+round(125*cos(k*pi/4)),200-round(125*sin(k*pi/4)),0,360,4,4);
  end;
  setcolor(f0);
end;


procedure graphik7;
begin
  g7n;
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    'n':
    begin;
      cleardevice;
      g7n;
    wahl:=' ';
    end;
    'c':
    begin;
      cleardevice;
      g7c;
    wahl:=' ';
   end;
    'k':
    begin;
      cleardevice;
      g7k;
    wahl:=' ';
   end;
    'g':
    begin;
      cleardevice;
      g7g;
    wahl:=' ';
   end;
   end;
   until wahl='b';
end;

procedure g10;
begin
  setbkcolor(f1);
  setcolor(f0);
  outtextxy(100,30,'Gegenberstellung Leiter, Nichtleiter und Halbleiter');
  outtextxy(50,440,'E vergr”áern / verkleinern (E/e)   Diode (d)   Original (o)');
  outtextxy(540,450,'beenden (b)');

  line(100,350,400,350);
  line(100,150,100,350);
  outtextxy(55,150,'W');
  outtextxy(30,170,'Energie');
  outtextxy(20,70,'Je nach Gr”áe der Energie, die man den Elektronen zufgen muss,um sie ins');
  outtextxy(5,90,'Leitungsband zu heben, nennt man den Stoff Leiter, Halbleiter oder Nichtleiter.');
k:=25;
      outtextxy(450,300-k,' Halbleiter  :  E > 0');
        line(400,290,400,310-k);
      outtextxy(410,295-round(k/2),'E');
  setfillstyle(3,f3);
  bar(102,320,398,290);
  setfillstyle(5,f2);
  bar(112,310-k,388,290-k);
      outtextxy(200,300,  ' Valenzband');
      outtextxy(200,295-k,'Leitungsband');
end;

procedure s10;
begin
          for r:=0 to 5 do
          begin
            setcolor(f2);
            circle(50+l1*14+k*320,80+l2*10+r*14+l*140,5);
            outtextxy(48+l1*14+k*320,77+l2*10+r*14+l*140,'-');
            setcolor(f3);
            circle(250-l1*14+k*320,80+l2*10+r*14+l*140,5);
            outtextxy(248-l1*14+k*320,77+l2*10+r*14+l*140,'+');
            setcolor(f0);
          end;
end;

procedure graphik10;
begin
  g10;
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    'E':
    begin;
      setcolor(f1);
      outtextxy(450,300-k,'     Leiter  :  E < 0');
      outtextxy(450,300-k,' Halbleiter  :  E > 0');
      outtextxy(450,300-k,'Nichtleiter  :  E >> 0');

      outtextxy(410,295-round(k/2),'E');
      setfillstyle(3,f3);
      bar(102,320,398,290);
      setfillstyle(5,f1);
      bar(112,310-k,388,290-k);
      outtextxy(200,300,  ' Valenzband');
      outtextxy(200,295-k,'Leitungsband');

      k:=k+1;
      setcolor(f0);
      if k<22 then
      outtextxy(450,300-k,'     Leiter  :  E < 0');
      if (k>=22) and (k<=50) then
      begin
        line(400,290,400,310-k);
      outtextxy(410,295-round(k/2),'E');
        outtextxy(450,300-k,' Halbleiter  :  E > 0');
      end;
      if k>50 then
        begin
        line(400,290,400,310-k);
      outtextxy(410,295-round(k/2),'E');
        outtextxy(450,300-k,'Nichtleiter  :  E >> 0');
      end;
      setfillstyle(5,f2);
      bar(112,310-k,388,290-k);
      outtextxy(200,300,  ' Valenzband');
      outtextxy(200,295-k,'Leitungsband');
    wahl:=' ';
    end;
    'e':
    begin;
      setcolor(f1);
      outtextxy(450,300-k,'     Leiter  :  E < 0');
      outtextxy(450,300-k,' Halbleiter  :  E > 0');
      outtextxy(450,300-k,'Nichtleiter  :  E >> 0');
      outtextxy(410,295-round(k/2),'E');
        line(400,290,400,310-k);
      setfillstyle(3,f3);
      bar(102,320,398,290);
      setfillstyle(5,f1);
      bar(112,310-k,388,290-k);
      outtextxy(200,300,  ' Valenzband');
      outtextxy(200,295-k,'Leitungsband');
      k:=k-1;
      setcolor(f0);
      if k<22 then
      outtextxy(450,300-k,'     Leiter  :  E < 0');
      if (k>=22) and (k<=50) then
      begin
        line(400,290,400,310-k);
      outtextxy(410,295-round(k/2),'E');
        outtextxy(450,300-k,' Halbleiter  :  E > 0');
      end;
      if k>50 then
        begin
        line(400,290,400,310-k);
      outtextxy(410,295-round(k/2),'E');
        outtextxy(450,300-k,'Nichtleiter  :  E >> 0');
      end;
      setfillstyle(5,f2);
      bar(112,310-k,388,290-k);
      outtextxy(200,300,  ' Valenzband');
      outtextxy(200,295-k,'Leitungsband');
    wahl:=' ';
    end;
    'o':
    begin;
      cleardevice;
      g10;
    wahl:=' ';
   end;
    'd':
    begin;
      cleardevice;
      outtextxy(80,30,'Die Diode als Kombination von  n - Schicht  und  p - Schicht');
      outtextxy(540,450,'beenden (b)');
      outtextxy(50,440,'                                               Original (o)');
      for k:=0 to 1 do
      begin
        for l:=0 to 1 do
        begin
          line(50+k*320,80+l*140,250+k*320,80+l*140);
          line(50+k*320,170+l*140,250+k*320,170+l*140);
          line(50+k*320,80+l*140,50+k*320,170+l*140);
          line(250+k*320,80+l*140,250+k*320,170+l*140);
          line(150+k*320,80+l*140,150+k*320,170+l*140);
        l1:=1;
        l2:=1;
        s10;
        end;
      end;

      k:=0;
      l:=0;
      for l1:=2 to 6 do
      s10;

      k:=1;
      l:=1;
      for l1:=2 to 6 do
      s10;

      k:=1;
      l:=0;
      for l1:=2 to 4 do
      s10;

      outtextxy(100,180,'n');
      outtextxy(200,180,'p');
      outtextxy(275,150,'Diffusion');
      line(270,125,350,125);
      line(350,125,345,120);
      line(350,125,345,130);
      outtextxy(425,180,'Sperrschicht');
      outtextxy(450,125,'+');
      outtextxy(485,125,'-');
      outtextxy(100,330,'Sperrschicht');
      outtextxy(110,265,'+');
      outtextxy(190,265,'-');
      outtextxy(125,350,'w„chst');
      outtextxy(425,330,'Sperrschicht');
      outtextxy(440,350,'schrumpft');
      for k:=0 to 1 do
      begin
        line(50+320*k,265,30+320*k,265);
        line(30+320*k,265,30+320*k,380);
        line(30+320*k,380,145+320*k,380);
        line(155+320*k,380,270+320*k,380);
        line(270+320*k,380,270+320*k,265);
        line(270+320*k,265,250+320*k,265);
      end;
        line(145,370,145,390);
        line(155,375,155,385);
      line(145+320,375,145+320,385);
      line(155+320,370,155+320,390);
      outtextxy(142,400,'+');
      outtextxy(153,400,'-');
      outtextxy(142+320,400,'-');
      outtextxy(153+320,400,'+');
    wahl:=' ';
   end;
   end;
   until wahl='b';
end;

procedure g9;
begin
  outtextxy(300,460,'starten (s)   pause (p)   beenden (b)');
  setfillstyle(1,f2);
  for k:=0 to 5 do
  begin
    for l:=1 to 2 do
    begin
  setcolor(f2);
       sector(160+k*70,380,0,360,6,6);
       sector(160+k*70,100+l*70,0,360,6,6);
  setcolor(f0);
       circle(190+k*70,380,2);
       circle(130+k*70,380,2);
       circle(130+k*70,100+l*70,2);
       circle(190+k*70,100+l*70,2);
       circle(160+k*70,70+l*70,2);
       circle(160+k*70,130+l*70,2);
    end;
  end;
end;

procedure graphik9;
begin
  setbkcolor(f1);
  setcolor(f0);
        outtextxy(5,349,'Leitungsband');
        outtextxy(5,380,' Valenzband');
  outtextxy(160,30,'Leitungsmechanismus bei Halbleitern');
  outtextxy(40,70,'Durch Energiezufuhr herausgel”ste Elektronen stehen als frei bewegliche');
  outtextxy(130,90,'Elektronen fr den Stromfluss zur Verfgung');
  outtextxy(50,440,'p - Dotierung (p)   n - Dotierung (n)   Original (o)');
  g9;
  wahl:=' ';
  repeat
    x:=0;
    x1:=0;
    if keypressed then wahl:=readkey;
    case wahl of
    's':
    begin
      if hilfe=0 then
      begin
        setfillstyle(1,f1);
        setcolor(f1);
        bar(10,357,630,365);
        bar(10,75+l*70,630,85+l*70);
        setcolor(f0);
        circle(160+k*70,70+l*70,2);
        circle(130+k*70,380,2);
      end;
      if hilfe=2 then
      begin
        setfillstyle(1,f1);
        setcolor(f1);
        bar(215,357,630,365);
        bar(215,75+l*70,630,85+l*70);
        setcolor(f0);
         circle(141+k*70,360,2);
         circle(141+k*70,80+l*70,2);
      end;
      setcolor(f2);
      outtextxy(20,320,'Minuspol');
      outtextxy(560,320,'Pluspol');
      delay(5000);

      if hilfe=0 then
      begin
        setfillstyle(1,f1);
        setcolor(f1);
        k:=2;
        sector(130+k*70,380,0,360,2,2);
        sector(160+k*70,70+l*70,0,360,2,2);

        x:=0;
        dx:=0.1;
        wahl2:=' ';
        repeat
          if keypressed then wahl2:=readkey;
            case wahl2 of
            'p':wahl2:=readkey;
            end;
          setcolor(f1);
          k:=2;
          sector(130+k*70+round(x),360,0,360,2,2);
          sector(160+k*70+round(x),80+l*70,0,360,2,2);
          sector(130-70+round(x),360,0,360,2,2);
          sector(160-70+round(x),80+l*70,0,360,2,2);
          x:=x+dx;
          setcolor(f2);
        setfillstyle(1,f2);
          k:=2;
          sector(130+k*70+round(x),360,0,360,2,2);
          sector(160+k*70+round(x),80+l*70,0,360,2,2);
          sector(130-70+round(x),360,0,360,2,2);
          sector(160-70+round(x),80+l*70,0,360,2,2);
          x1:=x;
          delay(50);
        until (wahl2='b') or (x>=210);
        if x>=210 then
        begin
          setcolor(f2);
          k:=2;
          sector(130+k*70,380,0,360,2,2);
          sector(160+k*70,70+l*70,0,360,2,2);
        setcolor(f1);
        setfillstyle(1,f1);
          sector(130-70+round(x),360,0,360,2,2);
          sector(160-70+round(x),80+l*70,0,360,2,2);
        setcolor(f0);
        end;
        end;

        if hilfe=1 then
        begin
           setcolor(f1);
           arc(95+(k+1)*70,360,0,180,35);
           line(130+(k+1)*70,360,125+(k+1)*70,355);
           line(130+(k+1)*70,360,135+(k+1)*70,355);
        k:=5;
        wahl2:=' ';
        repeat
          if keypressed then wahl2:=readkey;
            case wahl2 of
            'p':wahl2:=readkey;
            end;
         setcolor(f1);
         circle(160+(k-1)*70,70+l*70,2);
         circle(130+(k-1)*70,380,2);
         arc(95+(k+1)*70,360,0,180,35);
         line(130+(k+1)*70,360,135+(k+1)*70,355);
         line(130+(k+1)*70,360,125+(k+1)*70,355);
         k:=k-1;
         setcolor(f0);
         circle(160+(k+1)*70,70+l*70,2);
         circle(130+(k+1)*70,380,2);
         if k<=3 then
        begin
           arc(95+(k+1)*70,360,0,180,35);
           line(130+(k+1)*70,360,125+(k+1)*70,355);
           line(130+(k+1)*70,360,135+(k+1)*70,355);
         end;
         delay(20000);
        until k<=-1;
        end;

        if hilfe=2 then
        begin
        k:=1;
        wahl2:=' ';
        x:=0;
        dx:=0.1;
        repeat
          if keypressed then wahl2:=readkey;
            case wahl2 of
            'p':wahl2:=readkey;
            end;
         setcolor(f1);
         circle(141+k*70+round(x),360,2);
         circle(141+k*70+round(x),80+l*70,2);

         x:=x+dx;
         setcolor(f0);
         circle(141+k*70+round(x),360,2);
         circle(141+k*70+round(x),80+l*70,2);
         delay(50);
        until (x>=400) or (wahl2='b');
        end;
    wahl:=' ';
    end;
    'p':
    begin;
      cleardevice;
      g9;
      outtextxy(100,30,'Leitungsmechanismus beim p - dotierten  Halbleitern');
      outtextxy(40,70,'Elektronen wandern nach rechts und fllen dabei die alten L”cher.');
      outtextxy(30,90,'Entsprechend wandern die L”cher nach links.Hier extrem dargestellt !');
      outtextxy(50,440,'p - Dotierung (p)   n - Dotierung (n)   Original (o)');
      setcolor(f0);
       setfillstyle(1,f3);
       hilfe:=1;
       k:=4;
       l:=2;
  setcolor(f3);
       sector(160+k*70,380,0,360,6,6);
       sector(160+k*70,100+l*70,0,360,6,6);
  setcolor(f0);
       circle(190+k*70,380,2);
       circle(130+k*70,100+l*70,2);
       circle(190+k*70,100+l*70,2);
       circle(160+k*70,70+l*70,2);
       setcolor(f1);
       circle(160+k*70,70+l*70,2);
       circle(130+k*70,380,2);
       setcolor(f3);
       outtextxy(50,440,'p - Dotierung (p) ');
       setcolor(f0);
    wahl:=' ';
    end;
    'o':
    begin;
      hilfe:=0;
      cleardevice;
      g9;
        outtextxy(5,349,'Leitungsband');
        outtextxy(5,380,' Valenzband');
      outtextxy(160,30,'Leitungsmechanismus bei Halbleitern');
      outtextxy(40,70,'Durch Energiezufuhr herausgel”ste Elektronen stehen als frei bewegliche');
      outtextxy(130,90,'Elektronen fr den Stromfluss zur Verfgung');
      outtextxy(50,440,'p - Dotierung (p)   n - Dotierung (n)   Original (o)');
       setfillstyle(1,f2);
       setcolor(f0);
      outtextxy(50,440,'p - Dotierung (p)   n - Dotierung (n)   Original (o)');
    wahl:=' ';
   end;
    'n':
    begin;
    cleardevice;
    g9;
        outtextxy(5,349,'Leitungsband');
        outtextxy(5,380,' Valenzband');
  outtextxy(100,30,'Leitungsmechanismus bei n - dotierten Halbleitern');
  outtextxy(20,70,'Die fr die Bindung nicht ben”tigten Elektronen stehen als frei bewegliche');
  outtextxy(130,90,'Elektronen fr den Stromfluss zur Verfgung');
  outtextxy(50,440,'p - Dotierung (p)   n - Dotierung (n)   Original (o)');

       setfillstyle(1,f3);
       hilfe:=2;
       k:=1;
       l:=2;
       setcolor(f3);
       sector(160+k*70,380,0,360,6,6);
       sector(160+k*70,100+l*70,0,360,6,6);
       setcolor(f0);
       circle(141+k*70,360,2);
       circle(130+k*70,100+l*70,2);
       circle(190+k*70,100+l*70,2);
       circle(160+k*70,70+l*70,2);
       circle(160+k*70,130+l*70,2);
       circle(141+k*70,80+l*70,2);
       setcolor(f3);
  outtextxy(50,440,'                    n - Dotierung (n)  ');
       setcolor(f0);
    wahl:=' ';
   end;
  end;
  until wahl='b';
end;

procedure auswahl;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    's':
    begin;
      if hilfe=1 then s1;
      if hilfe=2 then s2;
      if hilfe=3 then s3;
      if hilfe=4 then s4;
      if hilfe=5 then s5;
    wahl:=' ';
    end;
    'u':
    begin
      if u>=0.2 then
      begin
        loesch1;
        u:=u-0.1;
        setz1;
      end;
      wahl:=' ';
    end;
    'U':
    begin
      loesch1;
      u:=u+0.1;
      setz1;
      wahl:=' ';
    end;
   't':
    begin
      if dx>=0.002 then
      begin
        loesch5;
        dx:=dx-0.001;
        setz5;
      end;
      wahl:=' ';
    end;
    'T':
    begin
      loesch5;
      dx:=dx+0.001;
      setz5;
      wahl:=' ';
    end;
    'c':
    begin
      if c>=0.2 then
      begin
        loesch4;
        c:=c-0.1;
        setz4;
      end;
      wahl:=' ';
    end;
    'C':
    begin
      loesch4;
      c:=c+0.1;
      setz4;
      wahl:=' ';
    end;
    'd':
    begin
      if ud>=0.2 then
      begin
        loesch2;
        ud:=ud-0.1;
        setz2;
      end;
      wahl:=' ';
    end;
    'D':
    begin
      loesch2;
      ud:=ud+0.1;
      setz2;
      wahl:=' ';
    end;
    'f':
    begin
      if f>=0.2 then
      begin
        loesch3;
        f:=f-0.1;
        setz3;
      end;
      wahl:=' ';
    end;
    'F':
    begin
      loesch3;
      f:=f+0.1;
      setz3;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;



procedure schalt10;
begin
  cleardevice;
    hilfe:=1;
    u:=4.5;
    ud:=2;
    dx:=0.005;
    f:=1;
    setz1;
    setz2;
    setz3;
    setz5;
    graphik1;
    auswahl;
  menue;
end;

procedure schalt1;
begin
  cleardevice;
    hilfe:=2;
    u:=6;
    ud:=2;
    f:=0.5;
    dx:=0.005;
    setz1;
    setz2;
    setz3;
    setz5;
    graphik2;
    auswahl;
  menue;
end;

procedure schalt2;
begin
  cleardevice;
    hilfe:=3;
    u:=8;
    ud:=2;
    f:=0.5;
    dx:=0.02;
    setz5;
    setz1;
    setz2;
    setz3;
    graphik3;
    auswahl;
  menue;
end;

procedure schalt3;
begin
  cleardevice;
    hilfe:=4;
    u:=8;
    ud:=2;
    dx:=0.01;
    f:=1;
    setz1;
    setz2;
    setz3;
    setz5;
    graphik4;
    auswahl;
  menue;
end;

procedure schalt4;
begin
  cleardevice;
    hilfe:=5;
    u:=8;
    ud:=2;
    dx:=0.01;
    f:=1;
    c:=2;
    setz1;
    setz2;
    setz3;
    setz4;
    setz5;
    graphik5;
    auswahl;
  menue;
end;

procedure schalt5;
begin
  cleardevice;
  graphik6;
  menue;
end;

procedure schalt6;
begin
  cleardevice;
  graphik7;
  menue;
end;

procedure schalt7;
begin
  cleardevice;
  graphik8;
  menue;
end;

procedure schalt8;
begin
  cleardevice;
  hilfe:=0;
  graphik9;
  menue;
end;


procedure schalt9;
begin
  cleardevice;
  graphik10;
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
    '0':schalt10;
    '1':schalt1;
    '2':schalt2;
    '3':schalt3;
    '4':schalt4;
    '5':schalt5;
    '6':schalt6;
    '7':schalt7;
    '8':schalt8;
    '9':schalt9;
  end;
  until wahl1='b';
end.