function nas_curbe()

t = linspace(0,1,100); % Parametrul
% Punctele de control
b1 = [26.50 26.75 27.25 27.50; 12.5 12 12 12.5];
b2 = [26.50 26.75 27.25 27.50; 12.5 12.75 12.75 12.5];
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
plot(f1(1,:),f1(2,:),'r','LineWidth',1.5)
plot(f2(1,:),f2(2,:),'r','LineWidth',1.5)
hold off

end