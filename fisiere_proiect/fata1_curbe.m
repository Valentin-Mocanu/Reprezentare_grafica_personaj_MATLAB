function fata1_curbe()

t = linspace(0,1); % Parametrul
% Punctele de control
b1 = [13 5 25 -5 27; 23 15 10 0.5 -3];
b2 = [41 49 29 59 27; 23 15 10 0.5 -3];
% Polinoamele Bernstein de gradul 4
B0 = (1-t).^4;
B1 = 4.*(1-t).^3.*t;
B2 = 6.*(1-t).^2.*t.^2;
B3 = 4.*(1-t).*t.^3;
B4 = t.^4;
B = [B0;B1;B2;B3;B4]; % Matricea care cuprinde toate polinoamele Bernstein
% Curbele Bezier
f1 = b1*B;
f2 = b2*B;

% --> Desenare grafic (doar curbele Bezier) <--
hold on 
plot(f1(1,:),f1(2,:),'r','LineWidth',1.5)
plot(f2(1,:),f2(2,:),'-r','LineWidth',1.5)
hold off

end