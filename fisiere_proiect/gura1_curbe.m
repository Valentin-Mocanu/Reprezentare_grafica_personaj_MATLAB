function gura1_curbe()

% --> Codul acesta reprezinta partea de sus a gurii, adica "W"-ul (buza de sus) <--

t = linspace(0,1,100); % Parametrul
% Punctele de control
b1 = [20 22 24 27; 10 8 8 10]; 
b2 = [27 30 32 34; 10 8 8 10];
% Polinoamele Bernstein de gradul 3
B0 = (1-t).^3;
B1 = 3.*(1-t).^2.*t;
B2 = 3.*(1-t).*t.^2;
B3 = t.^3;
B = [B0;B1;B2;B3]; % Matricea care cuprinde toate polinoamele Bernstein
% Curbele Bezier
f1 = b1*B;
f2 = b2*B;

% --> Desenare grafic (doar curbele Bezier) <--
hold on
plot(f1(1,:),f1(2,:),'b','LineWidth',1.5)
plot(f2(1,:),f2(2,:),'b','LineWidth',1.5)
hold off

end