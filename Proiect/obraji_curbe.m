function obraji_curbe()

t = linspace(0,1); % Parametrul
% Punctele de control
b1 = [11.75 15 19.5 19 16.2; 7.9 10 6 -0.5 -0.85];
b2 = [42.25 39.25 34 35 37.8; 7.9 10 6 -0.5 -0.8];
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
plot(f1(1,:),f1(2,:),'y','LineWidth',1.5)
plot(f2(1,:),f2(2,:),'y','LineWidth',1.5)
hold off

end