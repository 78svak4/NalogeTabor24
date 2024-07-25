program naloga3;
var celotnaDolzina, omejitev, dolzina, prejsnaOmejitev, rezultat, prejsnaDolzina, novRezultat: single;
    steviloZnakov, counter, stMest: integer;
begin
stMest:=1;
 readln(celotnaDolzina, omejitev, steviloZnakov);
 for counter:=1 to steviloZnakov do
  begin
   if(dolzina < celotnaDolzina) then
    begin
     prejsnaOmejitev:= omejitev;
     prejsnaDolzina:= dolzina;
     readln(dolzina, omejitev);
     rezultat := ((dolzina - prejsnaDolzina) / prejsnaOmejitev) + rezultat;
    end;
  end;
  rezultat := rezultat - ((dolzina-celotnaDolzina) / prejsnaOmejitev);
//Rezultat se pretvori na 2 decimalki

//X00
(*while rezultat > 10 do
 begin
  rezultat:= rezultat / 10;
  stMest:= stMest + 1;
 end;

 writeln(stMest);  *)
 writeln(rezultat);
 readln;
end.
