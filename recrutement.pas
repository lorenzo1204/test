unit recrutement;

interface

uses creerperso, ihm, gestionecran;

// renvoie le musicien choisi
function recrutementMusicien(): perso;

var
  choix0,
  choix1,
  choix2,
  choix3,
  choix4,
  choix5 : perso;
  input : integer;

implementation

function recrutementMusicien(): perso;
  begin
    Randomize;

    choix0.prenomMusicien := 'retour';
    choix1 := creerMusicien;
    choix2 := creerMusicien;
    choix3 := creerMusicien;
    choix4 := creerMusicien;
    choix5 := creerMusicien;

    ecranDetail();

    deplacerCurseurXY(182,20);
    write('Votre choix : ');
    readln(input);

    if input = 1 then
      recrutementMusicien := choix1

    else if input = 2 then
      recrutementMusicien := choix2

    else if input = 3 then
      recrutementMusicien := choix3

    else if input = 4 then
      recrutementMusicien := choix4

    else if input = 5 then
      recrutementMusicien := choix5
    else
      recrutementMusicien := choix0
  end;
end.

