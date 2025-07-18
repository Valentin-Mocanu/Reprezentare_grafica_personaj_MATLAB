function urechi_poligoane_control()

t = linspace(0,1,100); % Parametrul
% Punctele de control
b1 = [14 7 4; 22.25 27.5 35];
b2 = [4 12.5 17; 35 31 24];
b3 = [40.25 46.5 49; 22.5 27.5 35];
b4 = [49 41 38; 35 31 24];
b5 = [7.75 7 7.25; 33 31.5 29];
b6 = [45.5 46.5 46.5; 33 31.75 29.5];
% Polinoamele Bernstein de gradul 2
B0 = (1-t).^2;
B1 = 2*(1-t).*t;
B2 = t.^2;
B = [B0;B1;B2]; % Matricea care cuprinde toate polinoamele Bernstein
% Curbele Bezier
f1 = b1*B;
f2 = b2*B;
f3 = b3*B;
f4 = b4*B;
f5 = b5*B;
f6 = b6*B;
% Liste cu toate poligoanele si curbele
b_lista = {b1,b2,b3,b4,b5,b6};
f_lista = {f1,f2,f3,f4,f5,f6};

% --> Desenare grafic (curba + poligoanele de control) <--
hold on
for i = 1:6
    b = b_lista{i};
    f = f_lista{i};

    % Deseneaza cercuri pline pentru primul si ultimul punct din poligoanele de control
    plot([b(1,1),b(1,end)],[b(2,1),b(2,end)],'mo','MarkerFaceColor','m','MarkerSize',8)

    % Deseneaza cercuri goale pentru punctele interioare din poligoanele de control 
    plot(b(1,2:end-1),b(2,2:end-1),'mo','MarkerSize',8)

    % Traseaza poligoanele de control
    plot(b(1,:),b(2,:),'--g')

    % Traseaza curbele Bezier
    plot(f(1,:),f(2,:),'k','LineWidth',2.5)
end
hold off

end