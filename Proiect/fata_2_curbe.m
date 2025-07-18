function fata_2_curbe()

t = linspace(0,1); % Parametrul
b = [16.3 27 38.3; 25 31 24.6]; % Punctele de control
% Polinoamele Bernstein de gradul 2
B0 = (1-t).^2;
B1 = 2*(1-t).*t;
B2 = t.^2;
B = [B0;B1;B2]; % Matricea care cuprinde toate polinoamele Bernstein
f = b*B; % Curba Bezier

% --> Desenare grafic (doar curba Bezier) <--
hold on
plot(f(1,:),f(2,:),'r','LineWidth',1.5)
hold off

end