unit IHM;
{$codepage utf8}
{$mode objfpc}{$H+}

interface
uses
  creerperso;

// dessine une base commune à la plupart des 'pages' du jeu // Fonction Utilitaire
procedure base(titre:StrinG);

// affiche l'intro (qui disparaît après 2 secondes)
procedure intro;

// affiche la page d'accueil du jeu
procedure menuPrincipal;

// affiche une page unique indiquant que vous avez quitté le jeu
procedure quitterJeu;

// affiche la page principale du jeu 
procedure menuJeu;

// affiche la page depuis laquelle on peut recruter des musiciens
procedure ecranRecrutement;

// affiche le tableau contenant les musiciens du groupe
procedure ecranDetail;

// affiche la première ligne du tableau de recrutement // Fonction Utilitaire
procedure hautTableau();

// affiche le reste du tableau recrutement // Fonction Utilitaire
procedure leTableau();

// complète les lignes du tableau partiellement effacées a cause du fait que les cases se chevauchent // Fonction Utilitaire
procedure completeTableau();

// affiche la page depuis laquelle on peut sélectionner les actions des musiciens
procedure ecranPlanning;

// affiche la page récapitulant le mois passé
procedure ecranBilan;

// affiche une erreur en cas de non validité du groupe ( erreurs différentes selon la raison )
procedure indispo;

// affiche une erreur liée au recrutement ( erreurs différentes selon la raison )
procedure messageErreurRecrutement;


var // variables contenant des informations sur les statistiques des musiciens
   prenom1,prenom2,prenom3,prenom4,prenom5:string; 
   nom1,nom2,nom3,nom4,nom5:string;
   instru1,instru2,instru3,instru4,instru5:string; // instrument
   sty1,sty2,sty3,sty4,sty5:string; // style
   nivIn1,nivIn2,nivIn3,nivIn4,nivIn5:niveau; // niveau instrument
   stu1,stu2,stu3,stu4,stu5:niveau; // niveau studio
   con1,con2,con3,con4,con5:niveau; // niveau concert
   endu1,endu2,endu3,endu4,endu5:integer; // endurance
   sal1,sal2,sal3,sal4,sal5:integer; // salaire


implementation

uses
  Classes, SysUtils, GestionEcran, recrutement, jeu;


procedure base(titre:String);
var
  msg:string;
begin
  msg:='-- '+titre+' --';
  effacerEtColorierEcran (Black);
  dessinerCadreXY(1,1,198,34,double,white,black);
  dessinerCadreXY(1,36,39,49, simple, white,black);
  dessinerCadreXY(40,36,79,49, simple, white,black);
  dessinerCadreXY(80,36,119,49, simple, white,black);
  dessinerCadreXY(120,36,159,49, simple, white,black);
  dessinerCadreXY(160,36,198,49, simple, white,black);

  deplacerCurseurXY(3,38);
  write('Nom : ', perso1.nomMusicien);
  deplacerCurseurXY(3,40);
  write('Prenom : ', perso1.prenomMusicien);
  deplacerCurseurXY(3,42);
  write('Instrument : ', perso1.instrumentMusicien);
  deplacerCurseurXY(3,44);
  write('Endurance : ', perso1.enduranceMusicien);
  deplacerCurseurXY(3,47);
  Write('Activite : ', perso1.activiteMusicien);

  deplacerCurseurXY(43,38);
  write('Nom : ', perso2.nomMusicien);
  deplacerCurseurXY(43,40);
  write('Prenom : ', perso2.prenomMusicien);
  deplacerCurseurXY(43,42);
  write('Instrument : ', perso2.instrumentMusicien);
  deplacerCurseurXY(43,44);
  write('Endurance : ', perso2.enduranceMusicien);
  deplacerCurseurXY(43,47);
  Write('Activite : ', perso2.activiteMusicien);

  deplacerCurseurXY(83,38);
  write('Nom : ', perso3.nomMusicien);
  deplacerCurseurXY(83,40);
  write('Prenom : ', perso3.prenomMusicien);
  deplacerCurseurXY(83,42);
  write('Instrument : ', perso3.instrumentMusicien);
  deplacerCurseurXY(83,44);
  write('Endurance : ', perso3.enduranceMusicien);
  deplacerCurseurXY(83,47);
  Write('Activite : ', perso3.activiteMusicien);

  deplacerCurseurXY(123,38);
  write('Nom : ', perso4.nomMusicien);
  deplacerCurseurXY(123,40);
  write('Prenom : ', perso4.prenomMusicien);
  deplacerCurseurXY(123,42);
  write('Instrument : ', perso4.instrumentMusicien);
  deplacerCurseurXY(123,44);
  write('Endurance : ', perso4.enduranceMusicien);
  deplacerCurseurXY(123,47);
  Write('Activite : ', perso4.activiteMusicien);

  deplacerCurseurXY(163,38);
  write('Nom : ', perso5.nomMusicien);
  deplacerCurseurXY(163,40);
  write('Prenom : ', perso5.prenomMusicien);
  deplacerCurseurXY(163,42);
  write('Instrument : ', perso5.instrumentMusicien);
  deplacerCurseurXY(163,44);
  write('Endurance : ', perso5.enduranceMusicien);
  deplacerCurseurXY(163,47);
  Write('Activite : ', perso5.activiteMusicien);

  dessinerCadreXY(81,33,118,35,simple, white,black);
  deplacerCurseurXY(99-(Length('-- Vos Musiciens --')div 2),34);
  write('-- Vos Musiciens --');
  deplacerCurseurXY(99-(Length(msg)div 2),3);
  couleurTexte(red);
  write(msg);
  dessinerCadreXY(135,1,198,5,double,white,black);
  deplacerCurseurXY(135,1);
  write(chr(203));
  deplacerCurseurXY(198,5);
  write(chr(185));
  deplacerCurseurXY (137,3);
  Write('Janvier 2022');
  deplacerCurseurXY (160,3);
  Write('Argent : ');
  deplacerCurseurXY (180,3);
  Write('Renomée : ');
end;


procedure intro;
begin
  changerTailleConsole(200,50);
  effacerEtColorierEcran(Red);
  attendre(2000);
end;


procedure menuPrincipal;
var
  msg, msg2, msg3,msg4 : string;
begin
  msg:='Welcome to METAL MANAGER';
  msg2:='Start the game : press 1';
  msg3:='Left the game : press 0';
  msg4:='Votre choix : ';
  effacerEtColorierEcran(black);
  deplacerCurseurXY(100-(Length(msg)div 2),20);
  couleurTexte(Red);
  write(msg);
  deplacerCurseurXY(100-(Length(msg2)div 2),23);
  couleurTexte(white);
  write(msg2);
  deplacerCurseurXY(100-(Length(msg3)div 2),25);
  write(msg3);
  deplacerCurseurXY(100-(Length(msg4)div 2),30);
  write(msg4);
end;


procedure quitterJeu;
var
  msg:string;
begin
  msg:='Adieu...';
  effacerEtColorierEcran(black);
  deplacerCurseurXY(100-(Length(msg)div 2),20);
  couleurTexte(Red);
  write(msg);
  attendre(2000);
  effacerEtColorierEcran(Red);
  readln();
end;


procedure menuJeu;
begin
  base('ECRAN DE JEU');
  dessinerCadreXY(145,10,185,30,simple,white,black);
  deplacerCurseurXY(165-(length('Nombre de chanson non publiées : ')div 2),16);
  write('Nombre de chanson non publiées : ');
  deplacerCurseurXY(165-(length('Nombre d''albums sortis : ')div 2),20);
  write('Nombre d''albums sortis : ');
  deplacerCurseurXY(165-(length('Nombre de concerts donnés : ')div 2),24);
  write('Nombre de concerts donnés : ');
  deplacerCurseurXY(99-(length('Recruter un nouveau musicien : 1')div 2),13);
  write('Recruter un nouveau musicien : 1');
  deplacerCurseurXY(99-(length('Info détaillés sur vos musiciens : 2')div 2),16);
  write('Info détaillés sur vos musiciens : 2');
  deplacerCurseurXY(99-(length('Définir le planning des musiciens pour le mois : 3')div 2),19);
  write('Définir le planning des musiciens pour le mois : 3');
  deplacerCurseurXY(99-(length('Finir le mois : 4')div 2),22);
  write('Finir le mois : 4');
  indispo();
  deplacerCurseurXY(99-(length('choix : ')div 2), 25);
  couleurTexte(White);
  write('choix : ');
end;


procedure indispo;
begin
  dessinerCadreXY(5,16,60,22,simple,red,black);
  deplacerCurseurXY(32-(length('-- Groupe non-valide --')div 2),17);
  write ('-- Groupe non-valide --');
  deplacerCurseurXY(32-(length('Le groupe doit comporter 5 membres')div 2),19);
  write ('Le groupe doit comporter 5 membres');
  deplacerCurseurXY(32-(length('Le groupe doit comporter exactement un chanteur')div 2),20);
  write ('Le groupe doit comporter exactement un chanteur');
  deplacerCurseurXY(32-(length('Le groupe doit comporter au moins un batteur')div 2),21);
  write ('Le groupe doit comporter au moins un batteur');
end;


procedure ecranDetail;
Begin
  prenom1:= (perso1.prenomMusicien);
  prenom2:= (perso2.prenomMusicien);
  prenom3:= (perso3.prenomMusicien);
  prenom4:= (perso4.prenomMusicien);
  prenom5:= (perso5.prenomMusicien);
  nom1:= (perso1.nomMusicien);
  nom2:= (perso2.nomMusicien);
  nom3:= (perso3.nomMusicien);
  nom4:= (perso4.nomMusicien);
  nom5:= (perso5.nomMusicien);
  instru1:=(perso1.instrumentMusicien);
  instru2:=(perso2.instrumentMusicien);
  instru3:=(perso3.instrumentMusicien);
  instru4:=(perso4.instrumentMusicien);
  instru5:=(perso5.instrumentMusicien);
  sty1 := (perso1.styleMusicien);
  sty2 := (perso2.styleMusicien);
  sty3 := (perso3.styleMusicien);
  sty4 := (perso4.styleMusicien);
  sty5 := (perso5.styleMusicien);
  nivIn1:=(perso1.niveauInstrumentMusicien);
  nivIn2:=(perso2.niveauInstrumentMusicien);
  nivIn3:=(perso3.niveauInstrumentMusicien);
  nivIn4:=(perso4.niveauInstrumentMusicien);
  nivIn5:=(perso5.niveauInstrumentMusicien);
  stu1:=(perso1.niveauStudioMusicien);
  stu2:=(perso2.niveauStudioMusicien);
  stu3:=(perso3.niveauStudioMusicien);
  stu4:=(perso4.niveauStudioMusicien);
  stu5:=(perso5.niveauStudioMusicien);
  con1:=(perso1.niveauConcertMusicien);
  con2:=(perso2.niveauConcertMusicien);
  con3:=(perso3.niveauConcertMusicien);
  con4:=(perso4.niveauConcertMusicien);
  con5:=(perso5.niveauConcertMusicien);
  endu1:=(perso1.enduranceMusicien);
  endu2:=(perso2.enduranceMusicien);
  endu3:=(perso3.enduranceMusicien);
  endu4:=(perso4.enduranceMusicien);
  endu5:=(perso5.enduranceMusicien);
  sal1:=(perso1.salaireMusicien);
  sal2:=(perso2.salaireMusicien);
  sal3:=(perso3.salaireMusicien);
  sal4:=(perso4.salaireMusicien);
  sal5:=(perso5.salaireMusicien);

  base('DETAILS DE VOS MUSICIENS');
  hautTableau();
  leTableau();
  completeTableau();
  deplacerCurseurXY(8,12);
  write('1');
  deplacerCurseurXY(20-(length(prenom1)div 2),12);
  write(prenom1);
  deplacerCurseurXY(40-(length(nom1)div 2),12);
  write(nom1);
  deplacerCurseurXY(60-(length(instru1)div 2),12);
  write(instru1);
  deplacerCurseurXY(80-(length(sty1)div 2),12);
  write(sty1);
  deplacerCurseurXY(99,12);
  write(nivIn1);
  deplacerCurseurXY(119,12);
  write(stu1);
  deplacerCurseurXY(139,12);
  write(con1);
  deplacerCurseurXY(155,12);
  write(endu1);
  deplacerCurseurXY(170,12);
  write(sal1);

  deplacerCurseurXY(8,16);
  write('2');
  deplacerCurseurXY(20-(length(prenom2)div 2),16);
  write(prenom2);
  deplacerCurseurXY(40-(length(nom2)div 2),16);
  write(nom2);
  deplacerCurseurXY(60-(length(instru2)div 2),16);
  write(instru2);
  deplacerCurseurXY(80-(length(sty2)div 2),16);
  write(sty2);
  deplacerCurseurXY(99,16);
  write(nivIn2);
  deplacerCurseurXY(119,16);
  write(stu2);
  deplacerCurseurXY(139,16);
  write(con2);
  deplacerCurseurXY(155,16);
  write(endu2);
  deplacerCurseurXY(170,16);
  write(sal2);

  deplacerCurseurXY(8,20);
  write('3');
  deplacerCurseurXY(20-(length(prenom3)div 2),20);
  write(prenom3);
  deplacerCurseurXY(40-(length(nom3)div 2),20);
  write(nom3);
  deplacerCurseurXY(60-(length(instru3)div 2),20);
  write(instru3);
  deplacerCurseurXY(80-(length(sty3)div 2),20);
  write(sty3);
  deplacerCurseurXY(99,20);
  write(nivIn3);
  deplacerCurseurXY(119,20);
  write(stu3);
  deplacerCurseurXY(139,20);
  write(con3);
  deplacerCurseurXY(155,20);
  write(endu3);
  deplacerCurseurXY(170,20);
  write(sal3);

  deplacerCurseurXY(8,24);
  write('4');
  deplacerCurseurXY(20-(length(prenom4)div 2),24);
  write(prenom4);
  deplacerCurseurXY(40-(length(nom4)div 2),24);
  write(nom4);
  deplacerCurseurXY(60-(length(instru4)div 2),24);
  write(instru4);
  deplacerCurseurXY(80-(length(sty4)div 2),24);
  write(sty4);
  deplacerCurseurXY(99,24);
  write(nivIn4);
  deplacerCurseurXY(119,24);
  write(stu4);
  deplacerCurseurXY(139,24);
  write(con4);
  deplacerCurseurXY(155,24);
  write(endu4);
  deplacerCurseurXY(170,24);
  write(sal4);

  deplacerCurseurXY(8,28);
  write('5');
  deplacerCurseurXY(20-(length(prenom5)div 2),28);
  write(prenom5);
  deplacerCurseurXY(40-(length(nom5)div 2),28);
  write(nom5);
  deplacerCurseurXY(60-(length(instru5)div 2),28);
  write(instru5);
  deplacerCurseurXY(80-(length(sty5)div 2),28);
  write(sty5);
  deplacerCurseurXY(99,28);
  write(nivIn5);
  deplacerCurseurXY(119,28);
  write(stu5);
  deplacerCurseurXY(139,28);
  write(con5);
  deplacerCurseurXY(155,28);
  write(endu5);
  deplacerCurseurXY(170,28);
  write(sal5);

  completeTableau();

  deplacerCurseurXY(182,12);
  Write('X - Virer le');
  deplacerCurseurXY(185,13);
  Write('personnage');
  deplacerCurseurXY(182,15);
  Write('0 - Quitter');
  deplacerCurseurXY(182,20);
  write('Votre choix : ');
end;


procedure ecranRecrutement;
Begin
  prenom1:= (choix1.prenomMusicien);
  prenom2:= (choix2.prenomMusicien);
  prenom3:= (choix3.prenomMusicien);
  prenom4:= (choix4.prenomMusicien);
  prenom5:= (choix5.prenomMusicien);
  nom1:= (choix1.nomMusicien);
  nom2:= (choix2.nomMusicien);
  nom3:= (choix3.nomMusicien);
  nom4:= (choix4.nomMusicien);
  nom5:= (choix5.nomMusicien);
  instru1:=(choix1.instrumentMusicien);
  instru2:=(choix2.instrumentMusicien);
  instru3:=(choix3.instrumentMusicien);
  instru4:=(choix4.instrumentMusicien);
  instru5:=(choix5.instrumentMusicien);
  sty1 := (choix1.styleMusicien);
  sty2 := (choix2.styleMusicien);
  sty3 := (choix3.styleMusicien);
  sty4 := (choix4.styleMusicien);
  sty5 := (choix5.styleMusicien);
  nivIn1:=(choix1.niveauInstrumentMusicien);
  nivIn2:=(choix2.niveauInstrumentMusicien);
  nivIn3:=(choix3.niveauInstrumentMusicien);
  nivIn4:=(choix4.niveauInstrumentMusicien);
  nivIn5:=(choix5.niveauInstrumentMusicien);
  stu1:=(choix1.niveauStudioMusicien);
  stu2:=(choix2.niveauStudioMusicien);
  stu3:=(choix3.niveauStudioMusicien);
  stu4:=(choix4.niveauStudioMusicien);
  stu5:=(choix5.niveauStudioMusicien);
  con1:=(choix1.niveauConcertMusicien);
  con2:=(choix2.niveauConcertMusicien);
  con3:=(choix3.niveauConcertMusicien);
  con4:=(choix4.niveauConcertMusicien);
  con5:=(choix5.niveauConcertMusicien);
  endu1:=(choix1.enduranceMusicien);
  endu2:=(choix2.enduranceMusicien);
  endu3:=(choix3.enduranceMusicien);
  endu4:=(choix4.enduranceMusicien);
  endu5:=(choix5.enduranceMusicien);
  sal1:=(choix1.salaireMusicien);
  sal2:=(choix2.salaireMusicien);
  sal3:=(choix3.salaireMusicien);
  sal4:=(choix4.salaireMusicien);
  sal5:=(choix5.salaireMusicien);

  base('RECRUTEMENT DES MUSICIENS');
  hautTableau();
  leTableau();

  deplacerCurseurXY(8,12);
  write('1');
  deplacerCurseurXY(20-(length(prenom1)div 2),12);
  write(prenom1);
  deplacerCurseurXY(40-(length(nom1)div 2),12);
  write(nom1);
  deplacerCurseurXY(60-(length(instru1)div 2),12);
  write(instru1);
  deplacerCurseurXY(80-(length(sty1)div 2),12);
  write(sty1);
  deplacerCurseurXY(99,12);
  write(nivIn1);
  deplacerCurseurXY(119,12);
  write(stu1);
  deplacerCurseurXY(139,12);
  write(con1);
  deplacerCurseurXY(155,12);
  write(endu1);
  deplacerCurseurXY(170,12);
  write(sal1);

  deplacerCurseurXY(8,16);
  write('2');
  deplacerCurseurXY(20-(length(prenom2)div 2),16);
  write(prenom2);
  deplacerCurseurXY(40-(length(nom2)div 2),16);
  write(nom2);
  deplacerCurseurXY(60-(length(instru2)div 2),16);
  write(instru2);
  deplacerCurseurXY(80-(length(sty2)div 2),16);
  write(sty2);
  deplacerCurseurXY(99,16);
  write(nivIn2);
  deplacerCurseurXY(119,16);
  write(stu2);
  deplacerCurseurXY(139,16);
  write(con2);
  deplacerCurseurXY(155,16);
  write(endu2);
  deplacerCurseurXY(170,16);
  write(sal2);

  deplacerCurseurXY(8,20);
  write('3');
  deplacerCurseurXY(20-(length(prenom3)div 2),20);
  write(prenom3);
  deplacerCurseurXY(40-(length(nom3)div 2),20);
  write(nom3);
  deplacerCurseurXY(60-(length(instru3)div 2),20);
  write(instru3);
  deplacerCurseurXY(80-(length(sty3)div 2),20);
  write(sty3);
  deplacerCurseurXY(99,20);
  write(nivIn3);
  deplacerCurseurXY(119,20);
  write(stu3);
  deplacerCurseurXY(139,20);
  write(con3);
  deplacerCurseurXY(155,20);
  write(endu3);
  deplacerCurseurXY(170,20);
  write(sal3);

  deplacerCurseurXY(8,24);
  write('4');
  deplacerCurseurXY(20-(length(prenom4)div 2),24);
  write(prenom4);
  deplacerCurseurXY(40-(length(nom4)div 2),24);
  write(nom4);
  deplacerCurseurXY(60-(length(instru4)div 2),24);
  write(instru4);
  deplacerCurseurXY(80-(length(sty4)div 2),24);
  write(sty4);
  deplacerCurseurXY(99,24);
  write(nivIn4);
  deplacerCurseurXY(119,24);
  write(stu4);
  deplacerCurseurXY(139,24);
  write(con4);
  deplacerCurseurXY(155,24);
  write(endu4);
  deplacerCurseurXY(170,24);
  write(sal4);

  deplacerCurseurXY(8,28);
  write('5');
  deplacerCurseurXY(20-(length(prenom5)div 2),28);
  write(prenom5);
  deplacerCurseurXY(40-(length(nom5)div 2),28);
  write(nom5);
  deplacerCurseurXY(60-(length(instru5)div 2),28);
  write(instru5);
  deplacerCurseurXY(80-(length(sty5)div 2),28);
  write(sty5);
  deplacerCurseurXY(99,28);
  write(nivIn5);
  deplacerCurseurXY(119,28);
  write(stu5);
  deplacerCurseurXY(139,28);
  write(con5);
  deplacerCurseurXY(155,28);
  write(endu5);
  deplacerCurseurXY(170,28);
  write(sal5);

  completeTableau();

  deplacerCurseurXY(182,12);
  Write('X - Choix du');
  deplacerCurseurXY(185,13);
  Write('personnage');
  deplacerCurseurXY(182,15);
  Write('0 - Quitter');
end;


procedure hautTableau;
begin
  dessinerCadreXY(10,6,30,10,simple,white,black);
  deplacerCurseurXY(20-(Length('PRENOM')div 2),8);
  write('PRENOM');
  dessinerCadreXY(30,6,50,10,simple,white,black);
  deplacerCurseurXY(40-(Length('NOM')div 2),8);
  write('NOM');
  dessinerCadreXY(50,6,70,10,simple,white,black);
  deplacerCurseurXY(60-(Length('INSTRUMENT')div 2),8);
  write('INSTRUMENT');
  dessinerCadreXY(70,6,90,10,simple,white,black);
  deplacerCurseurXY(80-(Length('STYLE')div 2),8);
  write('STYLE');
  dessinerCadreXY(90,6,110,10,simple,white,black);
  deplacerCurseurXY(100-(Length('NIV INSTRU')div 2),8);
  write('NIV INSTRU');
  dessinerCadreXY(110,6,130,10,simple,white,black);
  deplacerCurseurXY(120-(Length('NIV STUDIO')div 2),8);
  write('NIV STUDIO');
  dessinerCadreXY(130,6,150,10,simple,white,black);
  deplacerCurseurXY(140-(Length('NIV CONCERT')div 2),8);
  write('NIV CONCERT');
  dessinerCadreXY(150,6,165,10,simple,white,black);
  deplacerCurseurXY(158-(Length('ENDURANCE')div 2),8);
  write('ENDURANCE');
  dessinerCadreXY(165,6,180,10,simple,white,black);
  deplacerCurseurXY(173-(Length('SALAIRE')div 2),8);
  write('SALAIRE');
end;


procedure leTableau();
begin
  dessinerCadreXY(6,10,10,14,simple,white,black);
  dessinerCadreXY(10,10,30,14,simple,white,black);
  dessinerCadreXY(30,10,50,14,simple,white,black);
  dessinerCadreXY(50,10,70,14,simple,white,black);
  dessinerCadreXY(70,10,90,14,simple,white,black);
  dessinerCadreXY(90,10,110,14,simple,white,black);
  dessinerCadreXY(110,10,130,14,simple,white,black);
  dessinerCadreXY(130,10,150,14,simple,white,black);
  dessinerCadreXY(150,10,165,14,simple,white,black);
  dessinerCadreXY(165,10,180,14,simple,white,black);

  dessinerCadreXY(6,14,10,18,simple,white,black);
  dessinerCadreXY(10,14,30,18,simple,white,black);
  dessinerCadreXY(30,14,50,18,simple,white,black);
  dessinerCadreXY(50,14,70,18,simple,white,black);
  dessinerCadreXY(70,14,90,18,simple,white,black);
  dessinerCadreXY(90,14,110,18,simple,white,black);
  dessinerCadreXY(110,14,130,18,simple,white,black);
  dessinerCadreXY(130,14,150,18,simple,white,black);
  dessinerCadreXY(150,14,165,18,simple,white,black);
  dessinerCadreXY(165,14,180,18,simple,white,black);

  dessinerCadreXY(6,18,10,22,simple,white,black);
  dessinerCadreXY(10,18,30,22,simple,white,black);
  dessinerCadreXY(30,18,50,22,simple,white,black);
  dessinerCadreXY(50,18,70,22,simple,white,black);
  dessinerCadreXY(70,18,90,22,simple,white,black);
  dessinerCadreXY(90,18,110,22,simple,white,black);
  dessinerCadreXY(110,18,130,22,simple,white,black);
  dessinerCadreXY(130,18,150,22,simple,white,black);
  dessinerCadreXY(150,18,165,22,simple,white,black);
  dessinerCadreXY(165,18,180,22,simple,white,black);

  dessinerCadreXY(6,22,10,26,simple,white,black);
  dessinerCadreXY(10,22,30,26,simple,white,black);
  dessinerCadreXY(30,22,50,26,simple,white,black);
  dessinerCadreXY(50,22,70,26,simple,white,black);
  dessinerCadreXY(70,22,90,26,simple,white,black);
  dessinerCadreXY(90,22,110,26,simple,white,black);
  dessinerCadreXY(110,22,130,26,simple,white,black);
  dessinerCadreXY(130,22,150,26,simple,white,black);
  dessinerCadreXY(150,22,165,26,simple,white,black);
  dessinerCadreXY(165,22,180,26,simple,white,black);

  dessinerCadreXY(6,26,10,30,simple,white,black);
  dessinerCadreXY(10,26,30,30,simple,white,black);
  dessinerCadreXY(30,26,50,30,simple,white,black);
  dessinerCadreXY(50,26,70,30,simple,white,black);
  dessinerCadreXY(70,26,90,30,simple,white,black);
  dessinerCadreXY(90,26,110,30,simple,white,black);
  dessinerCadreXY(110,26,130,30,simple,white,black);
  dessinerCadreXY(130,26,150,30,simple,white,black);
  dessinerCadreXY(150,26,165,30,simple,white,black);
  dessinerCadreXY(165,26,180,30,simple,white,black);
end;


procedure completeTableau();
begin
    deplacerCurseurXY(30,6);
  Write(chr(194));
  deplacerCurseurXY(50,6);
  Write(chr(194));
  deplacerCurseurXY(70,6);
  Write(chr(194));
  deplacerCurseurXY(90,6);
  Write(chr(194));
  deplacerCurseurXY(110,6);
  Write(chr(194));
  deplacerCurseurXY(130,6);
  Write(chr(194));
  deplacerCurseurXY(150,6);
  Write(chr(194));
  deplacerCurseurXY(165,6);
  Write(chr(194));

  deplacerCurseurXY(10,10);
  write(chr(197));
  deplacerCurseurXY(30,10);
  Write(chr(197));
  deplacerCurseurXY(50,10);
  Write(chr(197));
  deplacerCurseurXY(70,10);
  Write(chr(197));
  deplacerCurseurXY(90,10);
  Write(chr(197));
  deplacerCurseurXY(110,10);
  Write(chr(197));
  deplacerCurseurXY(130,10);
  Write(chr(197));
  deplacerCurseurXY(150,10);
  Write(chr(197));
  deplacerCurseurXY(165,10);
  Write(chr(197));
  deplacerCurseurXY(180,10);
  write(chr(180));

  deplacerCurseurXY(6,14);
  write(chr(195));
  deplacerCurseurXY(10,14);
  write(chr(197));
  deplacerCurseurXY(30,14);
  Write(chr(197));
  deplacerCurseurXY(50,14);
  Write(chr(197));
  deplacerCurseurXY(70,14);
  Write(chr(197));
  deplacerCurseurXY(90,14);
  Write(chr(197));
  deplacerCurseurXY(110,14);
  Write(chr(197));
  deplacerCurseurXY(130,14);
  Write(chr(197));
  deplacerCurseurXY(150,14);
  Write(chr(197));
  deplacerCurseurXY(165,14);
  Write(chr(197));
  deplacerCurseurXY(180,14);
  write(chr(180));

  deplacerCurseurXY(6,18);
  write(chr(195));
  deplacerCurseurXY(10,18);
  write(chr(197));
  deplacerCurseurXY(30,18);
  Write(chr(197));
  deplacerCurseurXY(50,18);
  Write(chr(197));
  deplacerCurseurXY(70,18);
  Write(chr(197));
  deplacerCurseurXY(90,18);
  Write(chr(197));
  deplacerCurseurXY(110,18);
  Write(chr(197));
  deplacerCurseurXY(130,18);
  Write(chr(197));
  deplacerCurseurXY(150,18);
  Write(chr(197));
  deplacerCurseurXY(165,18);
  Write(chr(197));
  deplacerCurseurXY(180,18);
  write(chr(180));

  deplacerCurseurXY(6,22);
  write(chr(195));
  deplacerCurseurXY(10,22);
  write(chr(197));
  deplacerCurseurXY(30,22);
  Write(chr(197));
  deplacerCurseurXY(50,22);
  Write(chr(197));
  deplacerCurseurXY(70,22);
  Write(chr(197));
  deplacerCurseurXY(90,22);
  Write(chr(197));
  deplacerCurseurXY(110,22);
  Write(chr(197));
  deplacerCurseurXY(130,22);
  Write(chr(197));
  deplacerCurseurXY(150,22);
  Write(chr(197));
  deplacerCurseurXY(165,22);
  Write(chr(197));
  deplacerCurseurXY(180,22);
  write(chr(180));

  deplacerCurseurXY(6,26);
  write(chr(195));
  deplacerCurseurXY(10,26);
  write(chr(197));
  deplacerCurseurXY(30,26);
  Write(chr(197));
  deplacerCurseurXY(50,26);
  Write(chr(197));
  deplacerCurseurXY(70,26);
  Write(chr(197));
  deplacerCurseurXY(90,26);
  Write(chr(197));
  deplacerCurseurXY(110,26);
  Write(chr(197));
  deplacerCurseurXY(130,26);
  Write(chr(197));
  deplacerCurseurXY(150,26);
  Write(chr(197));
  deplacerCurseurXY(165,26);
  Write(chr(197));
  deplacerCurseurXY(180,26);
  write(chr(180));

  deplacerCurseurXY(10,30);
  write(chr(193));
  deplacerCurseurXY(30,30);
  Write(chr(193));
  deplacerCurseurXY(50,30);
  Write(chr(193));
  deplacerCurseurXY(70,30);
  Write(chr(193));
  deplacerCurseurXY(90,30);
  Write(chr(193));
  deplacerCurseurXY(110,30);
  Write(chr(193));
  deplacerCurseurXY(130,30);
  Write(chr(193));
  deplacerCurseurXY(150,30);
  Write(chr(193));
  deplacerCurseurXY(165,30);
  Write(chr(193));
end;


procedure ecranPlanning;
begin
  base('PLANNING DE VOS MUSICIENS');
  deplacerCurseurXY (137,3);
  Write('Janvier 2022');
  deplacerCurseurXY (160,3);
  Write('Argent : ');
  deplacerCurseurXY (180,3);
  Write('Renomée : ');
  deplacerCurseurXY(99-(Length('PLANNIFIER ACTION POUR LE GROUPE')div 2),7);
  write('PLANNIFIER ACTION POUR LE GROUPE');
  deplacerCurseurXY(99-(Length('1 : Ecrire une nouvelle chanson')div 2),9);
  write('1 : Ecrire une nouvelle chanson');
  deplacerCurseurXY(99-(Length('2 : Enregistrer un album')div 2),10);
  write('2 : Enregistrer un album');
  deplacerCurseurXY(99-(Length('3 : Partir en concert')div 2),11);
  write('3 : Partir en concert');

  deplacerCurseurXY(20-(Length('PLANNIFIER ACTION POUR MUSICIEN 1')div 2),24);
  write('PLANNIFIER ACTION POUR MUSICIEN 1');
  deplacerCurseurXY(20-(Length('1 : Se reposer')div 2),26);
  write('1 : Se reposer');
  deplacerCurseurXY(20-(Length('2 : S''entrainer')div 2),27);
  write('2 : S''entrainer');
  deplacerCurseurXY(20-(Length('3 : Faire la promo du groupe')div 2),28);
  write('3 : Faire la promo du groupe');

  deplacerCurseurXY(60-(Length('PLANNIFIER ACTION POUR MUSICIEN 2')div 2),24);
  write('PLANNIFIER ACTION POUR MUSICIEN 2');
  deplacerCurseurXY(60-(Length('1 : Se reposer')div 2),26);
  write('1 : Se reposer');
  deplacerCurseurXY(60-(Length('2 : S''entrainer')div 2),27);
  write('2 : S''entrainer');
  deplacerCurseurXY(60-(Length('3 : Faire la promo du groupe')div 2),28);
  write('3 : Faire la promo du groupe');

  deplacerCurseurXY(100-(Length('PLANNIFIER ACTION POUR MUSICIEN 3')div 2),24);
  write('PLANNIFIER ACTION POUR MUSICIEN 3');
  deplacerCurseurXY(100-(Length('1 : Se reposer')div 2),26);
  write('1 : Se reposer');
  deplacerCurseurXY(100-(Length('2 : S''entrainer')div 2),27);
  write('2 : S''entrainer');
  deplacerCurseurXY(100-(Length('3 : Faire la promo du groupe')div 2),28);
  write('3 : Faire la promo du groupe');

  deplacerCurseurXY(140-(Length('PLANNIFIER ACTION POUR MUSICIEN 4')div 2),24);
  write('PLANNIFIER ACTION POUR MUSICIEN 4');
  deplacerCurseurXY(140-(Length('1 : Se reposer')div 2),26);
  write('1 : Se reposer');
  deplacerCurseurXY(140-(Length('2 : S''entrainer')div 2),27);
  write('2 : S''entrainer');
  deplacerCurseurXY(140-(Length('3 : Faire la promo du groupe')div 2),28);
  write('3 : Faire la promo du groupe');

  deplacerCurseurXY(180-(Length('PLANNIFIER ACTION POUR MUSICIEN 5')div 2),24);
  write('PLANNIFIER ACTION POUR MUSICIEN 5');
  deplacerCurseurXY(180-(Length('1 : Se reposer')div 2),26);
  write('1 : Se reposer');
  deplacerCurseurXY(180-(Length('2 : S''entrainer')div 2),27);
  write('2 : S''entrainer');
  deplacerCurseurXY(180-(Length('3 : Faire la promo du groupe')div 2),28);
  write('3 : Faire la promo du groupe');
end;


procedure ecranBilan;
begin
  base('BILAN DU MOIS');
  deplacerCurseurXY (137,3);
  Write('Janvier 2022');
  deplacerCurseurXY (160,3);
  Write('Argent : ');
  deplacerCurseurXY (180,3);
  Write('Renomée : ');
  dessinerCadreXY(5,8,100,30,simple,white,black);
  dessinerCadreXY(42,6,65,10,simple,black,black);
  deplacerCurseurXY(53-(length('BILAN DES MUSICIENS') div 2),8);
  couleurTexte(white);
  write('BILAN DES MUSICIENS :');
  deplacerCurseurXY(53-(length('Musicien 1 (action realise et consequence)') div 2),12);
  write('Musicien 1 (action realise et consequence)');
  deplacerCurseurXY(53-(length('Musicien 2 (action realise et consequence)') div 2),15);
  write('Musicien 2 (action realise et consequence)');
  deplacerCurseurXY(53-(length('Musicien 3 (action realise et consequence)') div 2),18);
  write('Musicien 3 (action realise et consequence)');
  deplacerCurseurXY(53-(length('Musicien 4 (action realise et consequence)') div 2),21);
  write('Musicien 4 (action realise et consequence)');
  deplacerCurseurXY(53-(length('Musicien 5 (action realise et consequence)') div 2),24);
  write('Musicien 5 (action realise et consequence)');

  dessinerCadreXY(110,8,190,20,simple,white,black);
  dessinerCadreXY(142,6,160,10,simple,black,black);
  deplacerCurseurXY(150-(length('BILAN FINANCIER') div 2),8);
  couleurTexte(white);
  write('BILAN FINANCIER :');
  deplacerCurseurXY(150-(length('La vente des albums a rapporté 0 ce mois-ci')div 2),12);
  write('La vente des albums a rapporté 0 ce mois-ci');
  deplacerCurseurXY(150-(length('La renomé total a augmenter de : ')div 2),16);
  write('La renomé total a augmenter de : ');

  deplacerCurseurXY(150-(length('<< Appuyez sur ENTREE pour passer au mois suivant >>')div 2),28);
  couleurTexte(red);
  write('<< Appuyez sur ENTREE pour passer au mois suivant >>');
end;


procedure messageErreurRecrutement();
begin
  dessinerCadreXY(50,10,150,20,simple,red,black);
  couleurTexte(red);
  deplacerCurseurXY(100-(length('Erreur : Vous avez deja 5 musiciens, virez-en un pour en recruter un nouveau')div 2),15);
  write('Erreur : Vous avez deja 5 musiciens, virez-en un pour en recruter un nouveau');
  couleurTexte(white);
end;
end.
