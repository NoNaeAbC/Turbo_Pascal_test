program hinterg;
uses crt, u1, u2, u3, graph;
var
   a,b:integer;
   c:String;
begin
     vorschau;
     clrscr;
     a:=0;
     b:=0;
     c:='';
     writeln ('Achtung dieses Programm dauert etwas l�nger ( etwa 10 min ). M�chten');
     writeln ('Sie es ausf�hren ? J/N');
     read(c);
             if(c='j')
             or (c='J') then
             begin
             delay (5000);
             clrscr;
                    for a:=0 to 15 do
                    begin
                     for b:=0 to 16 do
                     begin
                          farbe(a,b);
                          writeln ('Dies ist die Hintergrundfarbe ',a,' und die Textfarbe ',b,'.');
                          delay (10000);
                          pause;
                     end;
                    end;
             if (c='n') or (c='N')
             then
             end
             else
end.