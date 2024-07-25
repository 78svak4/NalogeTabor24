program naloga5;
var morje: array[1..1000] of array[1..1000] of string;
    hrana: array[1..1000] of array[1..1000] of boolean;
    vrstica: string;
    koncano: boolean;
    //i in j sta for-loop only
    visina, sirina, i, j, counter, counter2, razlikaX,razlikaY, pojdiI, pojdiJ, naslednjiValue, rezultat: integer;
function KjeJeBlahajNaI():integer;
var i,j:integer;
begin
for i:=1 to visina do
   begin
    for j:=1 to sirina do
     begin
      if morje[i,j] = 'B' then KjeJeBlahajNaI:=i;
     end;
    end;
end;
function KjeJeBlahajNaJ():integer;
var i,j:integer;
begin
for i:=1 to visina do
   begin
    for j:=1 to sirina do
     begin
      if morje[i,j] = 'B' then KjeJeBlahajNaJ:=j;
     end;
    end;
end;
function NajdiHrano(x,y:integer):char;
var i,j:integer;
begin
 for i:=1 to visina do
  begin
   for j:=1 to sirina do
    begin
     if Pos('H',morje[i,j])<>0 then
      begin
       if i>x then razlikaX:=i-x
        else razlikaX:=x-i;
       if j>y then razlikaY:=j-y
        else razlikaY:=y-j;
       if(razlikaX <= razlikaY) and (j>y) then
        begin
        //Hrana je v območju dosega
        hrana[i,j]:=true;
        end else hrana[i,j]:=false;
      end;
    end;
  end;
end;
function NajdiHranoAmount(x,y:integer):integer;
var i,j:integer;
begin
NajdiHranoAmount:=0;
 for i:=1 to visina do
  begin
   for j:=1 to sirina do
    begin
     if Pos('H',morje[i,j])<>0 then
      begin
       if i>x then razlikaX:=i-x
        else razlikaX:=x-i;
       if j>y then razlikaY:=j-y
        else razlikaY:=y-j;
       if(razlikaX <= razlikaY) and (j>y) then
        begin
        //Hrana je v območju dosega
            NajdiHranoAmount:=NajdiHranoAmount+1;
        end;
      end;
    end;
  end;
end;

begin
 naslednjiValue := 0;
 readln(visina);
 readln(sirina);
 for i:=1 to visina do
  begin
   readln(vrstica);
   for j:=1 to sirina do
    begin
     morje[i,j]:=vrstica[j];
    end;
  end;
  NajdiHrano(KjeJeBlahajNaI,KjeJeBlahajNaJ);
  while koncano = false do
  begin
  for i:=1 to visina do
   begin
    for j:=1 to sirina do
     begin
      //writeln(i, ' ', j, ' ', hrana[i,j]);
      if (hrana[i,j] = true) and (NajdiHranoAmount(i,j) > naslednjiValue) then
       begin
         naslednjiValue:=NajdiHranoAmount(i,j);
         pojdiI:=i;
         pojdiJ:=j;
       end;
     end;
   end;
   NajdiHrano(pojdiI,pojdiJ);
   rezultat:=rezultat+1;
   if naslednjiValue = 0 then
    begin
     koncano:=true;
    end
    else
     naslednjiValue:= 0;
  end;
 (*for i:=1 to visina do
  begin
   for j:=1 to sirina do
    begin
     write(hrana[i,j]);
    end;
   writeln;
  end;*)
writeln((*'Rezultat: ',*) rezultat);
//writeln(pojdiI,pojdiJ);
readln;
readln;
end.
