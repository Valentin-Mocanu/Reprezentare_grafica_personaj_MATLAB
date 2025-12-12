function fata2_poligoane_control()

t = linspace(0,1); % Parametrul
b = [16.3 27 38.3; 25 31 24.6]; % Punctele de control
% Polinoamele Bernstein de gradul 2
B0 = (1-t).^2;
B1 = 2*(1-t).*t;
B2 = t.^2;
B = [B0;B1;B2]; % Matricea care cuprinde toate polinoamele Bernstein
f = b*B; % Curba Bezier

% --> Desenare grafic (curba + poligonul de control) <--
hold on 
% Deseneaza cercuri pline pentru primul si ultimul punct din poligonul de control
plot([b(1,1),b(1,end)],[b(2,1),b(2,end)],'mo','MarkerFaceColor','m','MarkerSize',8)

% Deseneaza cercuri goale pentru punctele interioare din poligonul de control 
plot(b(1,2:end-1),b(2,2:end-1),'mo','MarkerSize',8)

% Traseaza poligonul de control
plot(b(1,:),b(2,:),'--g')

% Traseaza curba Bezier generata din punctele de control
plot(f(1,:),f(2,:),'r','LineWidth',2.5)
hold off

end