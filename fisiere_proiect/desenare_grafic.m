function desenare_grafic()

figure(1)
title("Curbele + Poligoanele de control")
axis equal
gura_1_poligoane_control();
gura_2_poligoane_control();
nas_poligoane_control();
ochi();
fata_1_poligoane_control();
fata_2_poligoane_control();
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
gura_1_curbe();
gura_2_curbe();
nas_curbe();
ochi();
obraji_curbe();
fata_1_curbe();
fata_2_curbe();
urechi_curbe();
masa_curbe();
