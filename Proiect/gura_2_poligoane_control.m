function gura_2_poligoane_control()

% --> Codul acesta reprezinta limba si partea de jos a gurii, adica "U"-ul (buza de jos) <--

t = linspace(0,1,100); % Parametrul
% Punctele de control
b1 = [21.3 27 32.7; 9 -12 9]; 
b2 = [22.45 27 31.55; 5.2 8.5 5.2];
% Polinoamele Bernstein de gradul 2
B0 = (1-t).^2;
B1 = 2*(1-t).*t;
B2 = t.^2;
B = [B0;B1;B2]; % Matricea care cuprinde toate polinoamele Bernstein
% Curbele Bezier
f1 = b1*B;
f2 = b2*B;

% --> Desenare grafic (curba + poligoanele de control) <--
hold on 
% Deseneaza cercuri pline pentru primul si ultimul punct din poligoanele de control
plot([b1(1,1),b1(1,end)],[b1(2,1),b1(2,end)],'mo','MarkerFaceColor','m','MarkerSize',8)
plot([b2(1,1),b2(1,end)],[b2(2,1),b2(2,end)],'mo','MarkerFaceColor','m','MarkerSize',8)

% Deseneaza cercuri goale pentru punctele interioare din poligoanele de control 
plot(b1(1,2:end-1),b1(2,2:end-1),'mo','MarkerSize',8)
plot(b2(1,2:end-1),b2(2,2:end-1),'mo','MarkerSize',8)

% Traseaza poligoanele de control
plot(b1(1,:),b1(2,:),'--g')
plot(b2(1,:),b2(2,:),'--g')

% Traseaza curbele Bezier generate din punctele de control
plot(f1(1,:),f1(2,:),'b','LineWidth',2.5)
plot(f2(1,:),f2(2,:),'b','LineWidth',2.5)
hold off

end