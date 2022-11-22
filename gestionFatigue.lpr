program gestionFatigue;

var
  EnduranceMusicien : Integer ;
  Musicien := Integer ;
begin
  EnduranceMusicien:= random(140)*5+80;
  writeln('',enduranceMusicien);
  readln
  if Musicien do faireTaches then
  begin
  if Musicien do ecrireChanson then
     EnduranceMusicien := EnduranceMusicien - 5;
  else if Musicien do faireConcert then
     EnduranceMusicien := EnduranceMusicien - 20;
  else if Musicien do enregistrerAlbum then
     EnduranceMusicien := EnduranceMusicien - 10;
  else if Musicien do fairePromotion then
     EnduranceMusicien := EnduranceMusicien - 15;
  else
     EnduranceMusicien := EnduranceMusicien + 30;
  end;

end.

