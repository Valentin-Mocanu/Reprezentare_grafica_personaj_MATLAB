function urechi_curbe()

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
% Urechea stanga
f1 = b1*B;
f2 = b2*B;
% Urechea dreapta
f3 = b3*B;
f4 = b4*B;
% Curba de la mijlocul urechilor
f5 = b5*B;
f6 = b6*B;

% --> Desenare grafic (doar curbele Bezier) <--
hold on 
plot(f1(1,:),f1(2,:),'k','LineWidth',1.5)
plot(f2(1,:),f2(2,:),'k','LineWidth',1.5)
plot(f3(1,:),f3(2,:),'k','LineWidth',1.5)
plot(f4(1,:),f4(2,:),'k','LineWidth',1.5)
plot(f5(1,:),f5(2,:),'k','LineWidth',1.5)
plot(f6(1,:),f6(2,:),'k','LineWidth',1.5)
hold off

end