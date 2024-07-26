program naloga4;
var visina,sirina,stLadij,vrhX,vrhY,sidroX,sidroY,umagY,umagX,resilnaLadijaX,resilnaLadijaY,
    i,j,random :integer;
    debugMorje: array[1..1000] of array[1..1000] of string;
    vrednostiPolj: array[1..1000] of array[1..1000] of integer;
    aliJeObkoljen: array[1..1000] of array[1..1000] of boolean;
    koncano: boolean;
function VrednostiSodednjihPolj(x,y:integer):char;
var i,j:integer;
begin
koncano:=true;
for i:=1 to visina do
 begin
  for j:=1 to sirina do
   begin
    if vrednostiPolj[i,j] = 0 then koncano:= false;
   end;
 end;
 if (x<=visina) and (y<=sirina) then
 begin
 if vrednostiPolj[x+1,y] = 0 then vrednostiPolj[x+1,y]:=vrednostiPolj[x,y] + 1;
 if vrednostiPolj[x-1,y] = 0 then vrednostiPolj[x-1,y]:=vrednostiPolj[x,y] + 1;
 if vrednostiPolj[x,y+1] = 0 then vrednostiPolj[x,y+1]:=vrednostiPolj[x,y] + 1;
 if vrednostiPolj[x,y-1] = 0 then vrednostiPolj[x,y-1]:=vrednostiPolj[x,y] + 1;
 writeln(x,y);
   for i:=1 to visina do
 begin
  for j:=1 to sirina do
   begin
    write(vrednostiPolj[i,j]);
    write(' ');
   end;
  writeln;
     end;
 if koncano = false then
 begin
 if vrednostiPolj[x,y+1] > 0 then begin VrednostiSodednjihPolj(x,y+1); writeln('desno'); end else
 if vrednostiPolj[x+1,y] > 0 then begin VrednostiSodednjihPolj(x+1,y); writeln('dol'); end else
 if vrednostiPolj[x-1,y] > 0 then begin VrednostiSodednjihPolj(x-1,y); writeln('gor'); end else
 if vrednostiPolj[x,y-1] > 0 then begin VrednostiSodednjihPolj(x,y-1); writeln('levo'); end else
 begin
 aliJeObkoljen[x,y]:=true;
  for i:=1 to visina do
   begin
    for j:=1 to sirina do
     begin
      if aliJeObkoljen[i,j] = false then VrednostiSodednjihPolj(i,j);
     end;
   end;
 end;


    end;
  end;
 end;
begin
 readln(visina,sirina);
 readln(umagX,umagY,resilnaLadijaX,resilnaLadijaY);
 for i:=1 to visina do
  begin
   for j:=1 to sirina do
    begin
     debugMorje[i,j]:='.';
     if (i = umagX) and (j = umagY) then debugMorje[i,j]:='U';
     if (i = resilnaLadijaX) and (j = resilnaLadijaY) then debugMorje[i,j]:='R';
    end;
  end;
 readln(stLadij);
 for i:=1 to stLadij do
  begin
   readln(vrhX,vrhY,sidroX,sidroY);
   if vrhX = sidroX then
    //Ladija je vzhod/zahod
    begin
     if vrhY > sidroY then for j:=sidroY to vrhY  do vrednostiPolj[vrhX,j]:=-1//debugMorje[vrhX,j]:='X'
        else for j:=vrhY to sidroY do vrednostiPolj[vrhX,j]:=-1;//debugMorje[vrhX,j]:='X';
    end
     else
      //Ladija je jug/sever
       begin
        if vrhX > sidroX then for j:=sidroX to vrhX do vrednostiPolj[j,vrhY]:=-1//debugMorje[j,vrhY]:='X'
        else for j:=vrhX to sidroX do vrednostiPolj[j,vrhY]:=-1;//debugMorje[j,vrhY]:='X';
       end;
     end;
VrednostiSodednjihPolj(umagX,umagY);
writeln(vrednostiPolj[resilnaLadijaX,resilnaLadijaY]);
readln;
readln;
end.
