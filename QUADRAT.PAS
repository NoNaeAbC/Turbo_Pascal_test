program quadratur;
uses crt, u1;
var
    a: real;
    r: real;
    aq: real;
    rq: real;
begin
clrscr;
writeln ('Program - Quadratur des Kreises');
writeln;
writeln ('Bitte geben Sie die gewnschte Kanteml„nge (a) Ihres Quadrates');
writeln ('ein ! ');
readln (a);
aq:=a*a;
rq:=aq/pi;
r:=sqrt(rq);
writeln ('Der gesuchte Kreis hat den Radius von: ');
write (r:9:15);
write (' cm');
delay(5000);
writeln;
writeln;
writeln ('Damit ist die Quadratur des Kreises erstmalig in der Geschichte der ');
writeln ('Menschheit gelungen!');
delay (2000);

pause;
end.