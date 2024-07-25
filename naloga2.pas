program naloga2;
//x je kuhar 1(5/porcijo), y je kuhar 2(9/porcijo)
var rezultat, x, y: integer;
begin
 for y:=1 to 2000 do
  begin
   for x:=1 to 10000 do
    begin
     if((y * 9 + x * 5) = 10000) then rezultat:= rezultat + 1;
    end;
  end;
writeln(rezultat);
readln;
end.
