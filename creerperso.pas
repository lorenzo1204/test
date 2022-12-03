unit creerperso;

interface

type
  niveau = 1..5;  // désigne les niveaux
  perso = record   // utilisé pour stocker les statistiques d'un musicien
    prenomMusicien:string;
    nomMusicien:string;
    instrumentMusicien:string;
    styleMusicien:string;
    niveauInstrumentMusicien:niveau;
    niveauStudioMusicien:niveau;
    niveauConcertMusicien:niveau;
    salaireMusicien:integer;
    activiteMusicien:string;
    enduranceMusicien:integer;
  end;

// créé un musicien aux stats aléatoires
function creerMusicien(): perso;

implementation

function creerMusicien(): perso;
// définition du return // définition des valeurs aléatoires possibles
var
  musicien:perso;
  noms:array[1..10] of string = ('Guidet', 'Coulon', 'Simonet', 'Serier', 'Doussot', 'Mauny', 'Pasero', 'Gritti', 'Paris', 'Beugnot');
  prenoms:array[1..10] of string = ('Alexandre', 'Thomas', 'Matthieu', 'Karine', 'Patrice', 'Pascal', 'Lorenzo', 'Aaron', 'Alexis', 'Evan');
  instruments:array[1..5] of string = ('Vocal', 'Batterie', 'Basse', 'Guitare', 'Synthe');
  styles:array[1..4] of string = ('Symphonique', 'Power Metal', 'Death Metal', 'Heavy Metal');
  endurances:array[1..9] of integer = (80,85,90,95,100,105,110,115,120);
begin
  with musicien do
  begin
    prenomMusicien := prenoms[random(10)+1];
    nomMusicien := noms[random(10)+1];
    instrumentMusicien := instruments[random(5)+1];
    styleMusicien := styles[random(4)+1];
    niveauInstrumentMusicien := random(5)+1;
    niveauStudioMusicien := random(5)+1;
    niveauConcertMusicien := random(5)+1;
    enduranceMusicien :=  endurances[random(9)+1]; // l'endurance est complètement indépendante des niveaux
    salaireMusicien := ((niveauInstrumentMusicien+niveauStudioMusicien+niveauConcertMusicien)*400)+(enduranceMusicien*10)+(random(100)*10); // le salaire est calculé en grande partie grâce au niveaux du musicien, mais aussi en petite partie de façon totalement aléatoire pour éviter des répétitions
    activiteMusicien := 'Se repose';  // Tout musicien se repose par défaut (cela évite de devoir le changer ultérieurement)
  end;
  creerMusicien := musicien
end;
end.
