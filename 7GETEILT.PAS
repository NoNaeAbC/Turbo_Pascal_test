program sieben;
uses crt, u1;
var
   a,b:longint;
begin
clrscr;
a:=0;
b:=0;
wp ('Programm, welches alle durch sieben teilbare Zahlen bis zu einer',5,2);
wp ('frei w„hlbaren Zahl anzeigt.',5,3);
wp ('Btte geben Sie jetzt die gewnschte Zahl ein.',5,4);
wp ('',5,5);
readln (b);
delay (10000);
while a <= b-7 do
begin
a:=a+7;
writeln (a);
delay (100);
end;
pause;
end.