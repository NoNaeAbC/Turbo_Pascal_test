unit u3;
interface
uses crt, graph, u1;
procedure graphfehler1; (* mit closegraph *)
procedure graphfehler2; (* ohne closegraph *)
implementation
procedure graphfehler1;
var
    treiber, modus, fehler : integer;
    pfad : string;
    ch : char;
begin
clrscr;
pfad := '';
treiber := detect;
initgraph (treiber, modus, pfad);
fehler := graphresult;
if fehler <> 0 then
begin
     write (' Initialisierungsfehler Nr. ',fehler, ^G);
ch := readkey;
halt;
end;
closegraph;
end;
procedure graphfehler2;
var
    treiber, modus, fehler : integer;
    pfad : string;
    ch : char;
begin
clrscr;
pfad := '';
treiber := detect;
initgraph (treiber, modus, pfad);
fehler := graphresult;
if fehler <> 0 then
begin
     write (' Initialisierungsfehler Nr. ',fehler, ^G);
ch := readkey;
halt;
end; (* Ende der If - Schleife *)
end; (* Ende der Procedure *)

end.