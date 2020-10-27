program franckhertz;
uses crt,graph;

var
hilfe,treiber,modus,k,m:integer;
dt1,dt,t,umax,du,u,uhilfe,umoment,s,smax,shilfe,v,ds:real;
wahl:char;
ortx,orty,ortz,ortx2,orty2,ortz2:string;
graphh: array[0..70] of real;

procedure grafik;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  graphh[0]:=0;
  graphh[1]:=0;
  graphh[2]:=0;
  graphh[3]:=0;
  graphh[4]:=1;
  graphh[5]:=1;
  graphh[6]:=1;
  graphh[7]:=2;
  graphh[8]:=2;
  graphh[9]:=3;
  graphh[10]:=3;
  graphh[11]:=4;
  graphh[12]:=4;
  graphh[13]:=5;
  graphh[14]:=5.5;
  graphh[15]:=6;
  graphh[16]:=7;
  graphh[17]:=8;
  graphh[18]:=9;
  graphh[19]:=10;
  graphh[20]:=10;
  graphh[21]:=9;
  graphh[22]:=6;
  graphh[23]:=4;
  graphh[24]:=4;
  graphh[25]:=5;
  graphh[26]:=6;
  graphh[27]:=7;
  graphh[28]:=8;
  graphh[29]:=10;
  graphh[30]:=12;
  graphh[31]:=14;
  graphh[32]:=16;
  graphh[33]:=18;
  graphh[34]:=20;
  graphh[35]:=22;
  graphh[36]:=24;
  graphh[37]:=26;
  graphh[38]:=27;
  graphh[39]:=27;
  graphh[40]:=27;
  graphh[41]:=26;
  graphh[42]:=22;
  graphh[43]:=20;
  graphh[44]:=21;
  graphh[45]:=24;
  graphh[46]:=27;
  graphh[47]:=30;
  graphh[48]:=33;
  graphh[49]:=36;
  graphh[50]:=39;
  graphh[51]:=43;
  graphh[52]:=47;
  graphh[53]:=51;
  graphh[54]:=56;
  graphh[55]:=61;
  graphh[56]:=66;
  graphh[57]:=70;
  graphh[58]:=72;
  graphh[59]:=73;
  graphh[60]:=73;
  graphh[61]:=70;
  graphh[62]:=63;
  graphh[63]:=62;
  graphh[64]:=63;
  graphh[65]:=66;
  graphh[66]:=70;
  graphh[67]:=75;
  graphh[68]:=80;
  graphh[69]:=86;
  graphh[70]:=92;

  setbkcolor(1);
  setcolor(15);
  for k:=1 to 70 do
  begin
    outtextxy(200+2*k,414-trunc(graphh[k]),'.');
  end;
  line(200,420,340,420);
  line(200,420,200,330);
  outtextxy(350,420,'U');
  outtextxy(210,330,'I');
  outtextxy(50,80,'U = ');
  outtextxy(120,80,'V');
  setlinestyle(1,1,1);
  line(501,120,501,280);
  setlinestyle(0,1,1);
  outtextxy(480,300,'Gitter');
  line(600,120,600,280);
  outtextxy(580,300,'Anode');
  arc(70,200,270,90,30);
  outtextxy(50,300,'Kathode');
  line(10,40,630,40);
  line(10,450,630,450);
  line(10,40,10,450);
  line(630,40,630,450);
  outtextxy(250,20,'Franck-Hertz-Versuch');
  outtextxy(130,460,'Bewegung starten (s)  Pause (p)  Beenden (b)');
  outtextxy(80,470,'Geschwindigkeit der Darstellung verdoppeln (d)  halbieren (h)');
delay(20000);
end;

procedure farbe;
var
  m,n:integer;
  begin
    textbackground(1);
    for m:=1 to 80 do
    begin
      for n:=1 to 25 do
      begin
        gotoxy(m,n);write(' ');
      end;
    end;
  end;

{MAIN}
begin
repeat
closegraph;
farbe;
textcolor(14);
gotoxy(30,2);write('Franck-Hertz-Versuch');
gotoxy(2,4);writeln('Elektronen werden aus der Kathode emittiert und durch die Beschleunigungs-');
gotoxy(2,5);writeln('spannung   U   in Richtung Gitter beschleunigt. Zwischen Gitter und Anode');
gotoxy(2,6);writeln('liegt eine Bremsspannung von etwa    3 V   . ');
gotoxy(2,7);writeln('Nun wird die Spannung von einem  Anfangswert    U [anf]   aus in Schritten');
gotoxy(2,8);writeln('der Gr”áe   dU   erh”ht. Erreichen die Elektronen dadurch eine Bewegungs-');
gotoxy(2,9);writeln('energie von   20 eV  , so k”nnen sie die in der R”hre vorhandenen Neonatome');
gotoxy(2,10);writeln('zum Leuchten anregen (roter Streifen). Dazu mssen sie jedoch ihre gesamte');
gotoxy(2,11);writeln('Bewegungsenergie an die Neonatome abgeben. Anschlieáend werden sie gegebenen-');
gotoxy(2,12);writeln('falls bis zum Gitter hin erneut beschleunigt. Betr„gt die dabei aufgenommene');
gotoxy(2,13);writeln('Bewegungsenergie weniger als   3 eV  , so k”nnen die Elektronen nicht mehr');
gotoxy(2,14);writeln('die Gegenspannung berwinden und erreichen nicht mehr die Anode: die Strom-');
gotoxy(2,15);writeln('st„rke sinkt.');
gotoxy(2,16);writeln('Dieser Prozess kann bis zu einer Maximalspannung von etwa   70 V   fort-');
gotoxy(2,17);writeln('gefhrt werden. Bei h”heren Spannungen tritt eine Gasentladung ein.');
gotoxy(3,20);writeln('( Brauchbare Werte sind z.B.:  U [anf] = 10.5 V   und   dU = 3 V  )');
gotoxy(10,22);write('Gib den Anfangswert in  V  ein.  U [anf] = ');
readln(u);
gotoxy(10,23);write('Gib die Schrittweite in  V  ein.      dU = ');
readln(du);
repeat until keypressed;

grafik;
wahl:=' ';
dt:=0.01;
umax:=70;
m:=1;

repeat
  u:=u+du;
   setcolor(0);
    outtextxy(80,80,ortx);

    setcolor(15);
    str(u:4:1,ortx);
    outtextxy(80,80,ortx);
   
  hilfe:=trunc(u/20);
  setcolor(12);
  for k:=1 to hilfe do
  begin           
    line(100+trunc(400/u*20*k),150,100+trunc(400/u*20*k),250);
  end;
  for k:=0 to trunc(u) do
  begin
    outtextxy(200+2*k,414-trunc(graphh[k]),'.');
  end;

  s:=100;
  shilfe:=s-100;
  smax:=400*20/u;
  repeat
    setcolor(0);
    sector(trunc(s),200,0,360,2,2);
    setcolor(15);
    if keypressed then  wahl:=readkey;
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
    'p':wahl:=readkey;
    'b':exit;
   end;

    umoment:=shilfe/smax*20;
    v:=sqrt(2*umoment/m)+0.0000001;
    ds:=v*dt;
    s:=s+ds;
    shilfe:=shilfe+ds;
    if (shilfe >= smax) then
    begin
      shilfe:=shilfe-smax;
    end;
    
    sector(trunc(s),200,0,360,2,2);
     
  until s>500;

  uhilfe:=umoment;

  repeat
    setcolor(0);
    sector(trunc(s),200,0,360,2,2);
    setcolor(15); 
    if keypressed then  wahl:=readkey;
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
    'p':wahl:=readkey;
    'b':exit;
   end;

    dt1:=0.72*dt;
    v:=sqrt(2*uhilfe/m);
    ds:=v*dt1;
    s:=s+ds;
    if (s<1000)then
    begin
     uhilfe:=umoment-(s-500)*3/100;
    end;
    if (s<1000)then
    begin
     sector(trunc(s),200,0,360,2,2);
    end;
  until (s>600) or (uhilfe <= 0);
{
repeat until keypressed;
}
 setcolor(0); 
 for k:=1 to hilfe do
  begin           
    line(100+trunc(400/u*20*k),150,100+trunc(400/u*20*k),250);
  end;
until u>=umax;
setcolor(14);
outtextxy(130,50,'Zum Wiederholen  <w>  eingeben, zum Beenden  <b>');
repeat until keypressed;
    if keypressed then  wahl:=readkey;
until wahl='b';

end.
