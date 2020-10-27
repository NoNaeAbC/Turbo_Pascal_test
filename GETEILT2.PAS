program sieben1;
uses crt, u1;
var
   a,b:longint;
begin
clrscr;
a:=0;
b:=0;
wp ('Programm, welches alle durch sieben teilbare Zahlen bis zu einer',5,2);
wp ('frei wÑhlbaren Zahl anzeigt.',5,3);
wp ('Bitte geben Sie jetzt die gewÅnschte Zahl ein.',5,4);
wp ('SIE SOLLTEN ABER NUR ZAHLEN BIS 1000 EINGEBEN !!!',5,5);
wp ('',5,6);
readln (b);
delay (10000);
while a <= b-7 do
begin
a:=a+7;
write (a);
write (' ');
end;
pause;
end.