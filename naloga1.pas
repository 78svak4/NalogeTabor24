program naloga1;
var kolikoPojesti, dolzinaRastlin, kolikoPojedenih, rezultat, counter, travaCounter: integer;
    pasnik, rastlina: string;
    lock: boolean;
begin
 readln(kolikoPojesti);
 readln(dolzinaRastlin);
 readln(pasnik);
   for counter:=1 to dolzinaRastlin do
    begin
    if(kolikoPojedenih < kolikoPojesti)   then
      begin
       rastlina:=pasnik[counter];
       if((rastlina = '|') and (travaCounter < 3)) then
        begin
         travaCounter := travaCounter + 1;
         kolikoPojedenih := kolikoPojedenih + 1;
        // writeln('trava');
        end
       else
       travaCounter:=0;
       if((rastlina = 'M') and (lock = false))then
        begin
          kolikoPojedenih := kolikoPojedenih + 1;
      //    writeln('Marjetica');
        end
       else
       if(rastlina = 'R') then
        begin
         kolikoPojedenih := kolikoPojedenih + 1;
         lock:=true;
      //   writeln('Regrat');
        end;
     rezultat := counter;
    end;
  end;
//writeln('ven');
writeln(rezultat);
readln;
end.
