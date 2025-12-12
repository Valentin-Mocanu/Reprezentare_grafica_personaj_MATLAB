function desenare_grafic()

figure(1)
title("Curbele + Poligoanele de control")
axis equal
gura1_poligoane_control();
gura2_poligoane_control();
nas_poligoane_control();
ochi();
fata1_poligoane_control();
fata2_poligoane_control();
obraji_poligoane_control();
urechi_poligoane_control();
masa_poligoane_control();

figure(2)
nas_casteljau();

figure(3)
modificare_locala_CB();

figure(4)
title("Pikachu - doar curbele")
axis equal
gura1_curbe();
gura2_curbe();
nas_curbe();
ochi();
obraji_curbe();
fata1_curbe();
fata2_curbe();
urechi_curbe();
masa_curbe();
