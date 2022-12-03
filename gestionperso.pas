unit GestionPerso;


interface

uses
  IHM, gestionEcran, creerperso, recrutement;

procedure virer();

var
  perso1,
  perso2,
  perso3,
  perso4,
  perso5 : perso;


implementation

procedure virer();

begin
  ecranDetail();
  deplacerCurseurXY(182,20);
  write('Votre choix : ');

  readln(input);
  while input <> 0 do
    begin
    ecranDetail();
  deplacerCurseurXY(182,20);
  write('Votre choix : ');

  readln(input);
  if input = 1 then
    begin
      perso1.prenomMusicien := '';
      perso1.nomMusicien := '';
      perso1.instrumentMusicien := '';
      perso1.styleMusicien := '';
      perso1.niveauInstrumentMusicien := 1;
      perso1.niveauStudioMusicien := 1;
      perso1.niveauConcertMusicien:=1;
      perso1.salaireMusicien:= 0;
      perso1.activiteMusicien := '';
      perso1.enduranceMusicien := 0;
    end
    else if input = 2 then
    begin
      perso2.prenomMusicien := '';
      perso2.nomMusicien := '';
      perso2.instrumentMusicien := '';
      perso2.styleMusicien := '';
      perso2.niveauInstrumentMusicien := 1;
      perso2.niveauStudioMusicien := 1;
      perso2.niveauConcertMusicien:=1;
      perso2.salaireMusicien:= 0;
      perso2.activiteMusicien := '';
      perso2.enduranceMusicien := 0;
    end
    else if input = 3 then
    begin
      perso3.prenomMusicien := '';
      perso3.nomMusicien := '';
      perso3.instrumentMusicien := '';
      perso3.styleMusicien := '';
      perso3.niveauInstrumentMusicien := 1;
      perso3.niveauStudioMusicien := 1;
      perso3.niveauConcertMusicien:=1;
      perso3.salaireMusicien:= 0;
      perso3.activiteMusicien := '';
      perso3.enduranceMusicien := 0;
    end
    else if input = 4 then
    begin
      perso4.prenomMusicien := '';
      perso4.nomMusicien := '';
      perso4.instrumentMusicien := '';
      perso4.styleMusicien := '';
      perso4.niveauInstrumentMusicien := 1;
      perso4.niveauStudioMusicien := 1;
      perso4.niveauConcertMusicien:=1;
      perso4.salaireMusicien:= 0;
      perso4.activiteMusicien := '';
      perso4.enduranceMusicien := 0;
    end
    else if input = 5 then
    begin
      perso5.prenomMusicien := '';
      perso5.nomMusicien := '';
      perso5.instrumentMusicien := '';
      perso5.styleMusicien := '';
      perso5.niveauInstrumentMusicien := 1;
      perso5.niveauStudioMusicien := 1;
      perso5.niveauConcertMusicien:=1;
      perso5.salaireMusicien:= 0;
      perso5.activiteMusicien := '';
      perso5.enduranceMusicien := 0;
    end
    else

    end;

end;
end.

