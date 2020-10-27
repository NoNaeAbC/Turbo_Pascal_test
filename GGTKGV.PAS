program ggtkgv;
uses crt,u1;
var hilfe,ha,hb,a,b,n,k,z,l,m: longint;
    wahl:char;

procedure farbe;
begin
  textbackground(7);
  textcolor(1);
  for z:=1 to 80 do
  begin                       (*wp('Text',10,5);*)
    for m:=1 to 25 do
    begin
      gotoxy(z,m);
      write(' ');
    end;
  end;
end;

procedure faktor;
begin
  farbe;
  gotoxy(12,4);
  write('Bestimmung des ggT und des kgV zweier Zahlen:  ');
  gotoxy(20,6);
  write('a =');
  read(a);
  gotoxy(40,6);
  write('b =');
  read(b);
  gotoxy(10,10);
  write('a = ',a,' = ');
  gotoxy(21,10);
  write('1');
  ha:=a;
  hb:=b;
  for n:=2 to a do
   begin
     while (trunc(ha/n))*n=ha  do
     begin
       ha:=trunc(ha/n);
       write('*',n);
     end;
   end;
  gotoxy(10,12);
  write('b = ',b,' = ');
  gotoxy(21,12);
  write('1');
  for n:=2 to b do
   begin
     while (trunc(hb/n))*n=hb  do
     begin
       hb:=trunc(hb/n);
       write('*',n);
     end;
   end;
  ha:=a;
  hb:=b;
  gotoxy(10,15);
  write('ggT(a,b) = 1');
  k:=1;
  for n:=2 to a do
   begin
     while ((trunc(hb/n))*n=hb) and ((trunc(ha/n))*n=ha) do
     begin
       ha:=trunc(ha/n);
       hb:=trunc(hb/n);
       write('*',n);
       k:=k*n;
     end;
   end;
   write(' = ',k);
  ha:=a;
  hb:=b;
  gotoxy(10,17);
  write('kgV(a,b) = 1');
  hilfe:=0;
  repeat
    hilfe:=hilfe+a;
  until trunc(hilfe/b)*b=hilfe;
  hb:=hilfe;
  for n:=2 to hilfe do
   begin
     while (trunc(hb/n))*n=hb do
     begin
       hb:=trunc(hb/n);
       write('*',n);
       k:=k*n;
     end;
   end;
   write(' = ',hilfe);
end;

begin
  clrscr;
  farbe;
  faktor;
  repeat
   gotoxy(10,24);
   write('Beenden: "0"     Wiederholen: "1"  ' );
   read(wahl);
   case wahl of
   '1':faktor;
   else
   end;
  until wahl='0';
end.