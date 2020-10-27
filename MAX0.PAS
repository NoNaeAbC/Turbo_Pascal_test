program max0;
uses crt,graph;
var
  k,treiber,modus:integer;
  wahl2,wahl1,wahl:char;
  ortx1,ortx2,ortx3:string;

  h,dh,E,dE:array[0..600] of real;
  farbe1,farbe2,i,l:integer;

procedure menue;
begin
  treiber:=detect;
  initgraph(treiber,modus,'');
  setbkcolor(7);
  setcolor(1);
  outtextxy(150,150,'Rechenbeispiel  ->  1');
  outtextxy(150,250,'Simulation von E- und B- Feld  ->  2');
  outtextxy(400,400,'beenden  ->  b');
end;

procedure rechenbeispiel;
begin
closegraph;
clrscr;
  for i:= 0 to 20 do
  begin
    E[i]:=0;
    dE[i]:=0;
    h[i]:=0;
    dh[i]:=0;
  end;
  E[4]:=1;
  E[5]:=1;
  E[6]:=1;
  for l:=1 to 5 do
  begin
   for i:=0 to 10 do
   begin
    dh[i]:=E[i-1]-E[i+1];
   end;
   for i:=0 to 10 do
   begin
    h[i]:=h[i]+dh[i];
    write('h(',i,')=',round(h[i]),' ');
   end;
   writeln;
   for i:=1 to 10 do
   begin
    dE[i]:=h[i-1]-h[i+1];
   end;
   for i:=0 to 10 do
   begin
    E[i]:=E[i]+dE[i];
    write('E(',i,')=',round(E[i]),' ');
   end;
  writeln;
  writeln;
  end;
repeat until keypressed;
menue;
end;


procedure graphik1;
begin
  setbkcolor(1);
  setcolor(15);
  line(10,30,630,30);
  line(10,450,630,450);
  line(10,30,10,450);
  line(630,30,630,450);
  outtextxy(200,15,'Ausbreitung von Wellen (nach Maxwell) ');
      outtextxy(50,460,'       starten (s)   beenden (b)');
end;

procedure rechnung;
begin
   for i:=0 to 300 do
   begin
    dh[i]:=E[i-1]-E[i+1];
   end;
   setcolor(farbe1);
   for i:=0 to 299 do
   begin
    h[i]:=h[i]+dh[i];
    line(20+2*i,360,20+2*i,360-round(h[i]));
   end;

   for i:=0 to 300 do
   begin
    dE[i]:=h[i-1]-h[i+1];
   end;
   setcolor(farbe2);
   for i:=1 to 300 do
   begin
    E[i]:=E[i]+dE[i];
    line(20+2*i,120,20+2*i,120-round(E[i]));
   end;
end;

procedure setz;
begin
  farbe1:=10;
  farbe2:=12;
  rechnung;
end;

procedure loesch;
begin
  farbe1:=1;
  farbe2:=1;
  setfillstyle(0,1);
  bar(20,40,620,440);
  rechnung;
end;

procedure auswahl;
begin
  wahl:=' ';
  repeat
    if keypressed then wahl:=readkey;
    case wahl of
    's':
    begin
      loesch;
      setz;
      wahl2:=' ';
      repeat
        if keypressed then wahl2:=readkey;
          case wahl2 of
          'p':wahl2:=readkey;
          end;
        loesch;
        setz;
      delay(150);
      until wahl2='b';
    wahl:=' ';
    end;
    '1':
    begin
      loesch;
      for i:= 100 to 150 do
      begin
        E[i]:=10;
      end;
      setz;
      wahl:=' ';
    end;
  end;
  until wahl='b';
end;

procedure max;
begin
  cleardevice;
    graphik1;
  for i:= 0 to 600 do
  begin
    E[i]:=0;
    dE[i]:=0;
    h[i]:=0;
    dh[i]:=0;
  end;
  E[100]:=1;
  E[101]:=3;
  E[102]:=5;
  E[103]:=7;
  E[104]:=8;
  E[104]:=8;
  E[105]:=8;
  E[106]:=8;
  E[107]:=7;
  E[108]:=5;
  E[109]:=3;
  E[110]:=1;
    setz;
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
    '1':rechenbeispiel;
    '2':max;
  end;
  until wahl1='b';
end.