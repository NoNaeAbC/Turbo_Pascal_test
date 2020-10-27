program summe;
uses crt, u1;
var
   a,b,s:longint;
begin
     clrscr;
     a:=0;
     b:=0;
     writeln ('Geben Sie eine Zahl ein,bis zu welcher alle natrlichen ');
     writeln ('Zahlen addiert werden sollen.');
     read (b);
     s:=a;
     repeat
           s:=s+a+1;
           a:=a+1;
     until a=b;
     write ('Die Summe aller natrlichen Zahlen bis ');
     writeln (b);
     write ('betr„gt ');
     writeln (s);
     delay (30000);
     pause;
end.