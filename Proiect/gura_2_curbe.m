function gura_2_curbe()

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

% --> Desenare grafic (doar curbele Bezier) <--
hold on
plot(f1(1,:),f1(2,:),'b','LineWidth',1.5)
plot(f2(1,:),f2(2,:),'b','LineWidth',1.5)
hold off

end