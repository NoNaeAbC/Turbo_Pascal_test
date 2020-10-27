program ggtkgv2;
uses crt,u1;
var hilfe,ha,hb,hc,hd,a,b,c,d,n,k,z,l,m: longint;
    wahl,wahl1:char;

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

procedure faktor2;
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
procedure ZWEI;
begin
  clrscr;
  farbe;
  faktor2;
  repeat
   gotoxy(10,24);
   write('Beenden: "0"     Wiederholen: "1"  ' );
   read(wahl);
   case wahl of
   '1':faktor2;
   else
   end;
  until wahl='0';
end;


procedure faktor3;
begin
  farbe;
  gotoxy(12,4);
  write('Bestimmung des ggT und des kgV dreier Zahlen:  ');
  gotoxy(20,6);
  write('a =');
  read(a);
  gotoxy(30,6);
  write('b =');
  read(b);
  gotoxy(40,6);
  write('c =');
  read(c);
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
    gotoxy(10,14);
  write('c = ',c,' = ');
  gotoxy(21,14);
  write('1');
  ha:=c;
  for n:=2 to a do
   begin
     while (trunc(ha/n))*n=ha  do
     begin
       ha:=trunc(ha/n);
       write('*',n);
     end;
   end;

  ha:=a;
  hb:=b;
  hc:=c;
  gotoxy(10,17);
  write('ggT(a,b) = 1');
  k:=1;
  for n:=2 to a do
   begin
     while ((trunc(hb/n))*n=hb) and ((trunc(ha/n))*n=ha) and ((trunc(hc/n))*n=hc) do
     begin
       ha:=trunc(ha/n);
       hb:=trunc(hb/n);
       hc:=trunc(hc/n);
       write('*',n);
       k:=k*n;
     end;
   end;
   write(' = ',k);
  ha:=a;
  hb:=b;
  hc:=c;
  gotoxy(10,19);
  write('kgV(a,b) = 1');
  hilfe:=0;
  repeat
    hilfe:=hilfe+a;
  until ((trunc(hilfe/b)*b=hilfe) and (trunc(hilfe/c)*c=hilfe));
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
procedure DREI;
begin
  clrscr;
  farbe;
  faktor3;
  repeat
   gotoxy(10,24);
   write('Beenden: "0"     Wiederholen: "1"  ' );
   read(wahl);
   case wahl of
   '1':faktor3;
   else
   end;
  until wahl='0';
end;

procedure faktor4;
begin
  farbe;
  gotoxy(16,4);
  write('Bestimmung des ggT und des kgV vierer Zahlen:  ');
  gotoxy(20,6);
  write('a =');
  read(a);
  gotoxy(30,6);
  write('b =');
  read(b);
  gotoxy(40,6);
  write('c =');
  read(c);
  gotoxy(50,6);
  write('d =');
  read(d);
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
    gotoxy(10,14);
  write('c = ',c,' = ');
  gotoxy(21,14);
  write('1');
  ha:=c;
  for n:=2 to a do
   begin
     while (trunc(ha/n))*n=ha  do
     begin
       ha:=trunc(ha/n);
       write('*',n);
     end;
   end;
  gotoxy(10,16);
  write('d = ',d,' = ');
  gotoxy(21,16);
  write('1');
  ha:=d;
  for n:=2 to a do
   begin
     while (trunc(ha/n))*n=ha  do
     begin
       ha:=trunc(ha/n);
       write('*',n);
     end;
   end;

  ha:=a;
  hb:=b;
  hc:=c;
  hd:=d;
  gotoxy(10,19);
  write('ggT(a,b) = 1');
  k:=1;
  for n:=2 to a do
   begin
     while ((trunc(hb/n))*n=hb) and ((trunc(ha/n))*n=ha) and ((trunc(hc/n))*n=hc) and ((trunc(hd/n))*n=hd) do
     begin
       ha:=trunc(ha/n);
       hb:=trunc(hb/n);
       hc:=trunc(hc/n);
       hd:=trunc(hd/n);
       write('*',n);
       k:=k*n;
     end;
   end;
   write(' = ',k);
  ha:=a;
  hb:=b;
  hc:=c;
  gotoxy(10,21);
  write('kgV(a,b) = 1');
  hilfe:=0;
  repeat
    hilfe:=hilfe+a;
  until ((trunc(hilfe/b)*b=hilfe) and (trunc(hilfe/c)*c=hilfe) and (trunc(hilfe/d)*d=hilfe));
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
procedure VIER;
begin
  clrscr;
  farbe;
  faktor4;
  repeat
   gotoxy(10,24);
   write('Beenden: "0"     Wiederholen: "1"  ' );
   read(wahl);
   case wahl of
   '1':faktor4;
   else
   end;
  until wahl='0';
end;

procedure menue;
begin
  clrscr;
  farbe;
  gotoxy(10,6);
  write('Bestimmung des GGT und des KGV mit Hilfe der Primfaktorzerlegung');
  gotoxy(14,9);
  write('W„hle aus:');
  gotoxy(14,12);
  write('2 -> zwei Zahlen');
  gotoxy(14,14);
  write('3 -> drei Zahlen');
  gotoxy(14,16);
  write('4 -> vier Zahlen');
  gotoxy(20,20);
  write('0 -> Programmende  ');
  read(wahl1);
end;

{MAIN}
begin
  repeat
    menue;
    case wahl1 of
    '2':ZWEI;
    '3':DREI;
    '4':VIER;
    '0':;
    else
    end;

  until wahl1='0';
end.


begin
  clrscr;
  farbe;
  faktor4;
  repeat
   gotoxy(10,24);
   write('Beenden: "0"     Wiederholen: "1"  ' );
   read(wahl);
   case wahl of
   '1':faktor3;
   else
   end;
  until wahl='0';
end.