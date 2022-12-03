unit navDesPages;


interface

uses
  IHM,jeu,GestionPerso;

procedure menu();
procedure choix();
procedure Principal();

implementation

procedure menu();
var
   input : integer;
begin
  intro();
  menuPrincipal();
  readln(input);
  if input = 1 then
     principal()
  else
  quitterJeu();
  readln;
end;
procedure Principal();
begin
 menuJeu();
 choix();
end;

procedure choix();
var
   input : integer;
begin
  readln(input);
  while input <> 4 do
   begin
        if input = 1 then
           begin
            while input <> 0 do
             begin
               jeuMetalManager();
               readln(input);
             end;
             principal();
            end

        else if input = 2 then
        begin
             while input <> 0 do
             begin
                 virer();
                 readln(input);
             end;
             principal();
        end

        else if input = 3 then
        begin
             while input <> 0 do
             begin
                    ecranPlanning();
                    readln(input);
             end;
        principal();
        end;
   end;



end;

end.

