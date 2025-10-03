function nas_casteljau()

t = linspace(0,1,100); % Parametrul
% Punctele de control
b = [26.50 26.75 27.25 27.50; 12.5 12 12 12.5];
% Polinoamele Bernstein de gradul 3
B0 = (1-t).^3;
B1 = 3.*(1-t).^2.*t;
B2 = 3.*(1-t).*t.^2;
B3 = t.^3;
B = [B0;B1;B2;B3]; % Matricea care cuprinde toate polinoamele Bernstein
% Curba Bezier
f = b*B;


% Reprezentare grafica
hold on;
title('Algoritmul Casteljau - pentru nas (curba de jos)');
plot(b(1,:),b(2,:),'r-o','LineWidth',1.5); % Poligonul de control
plot(f(1,:),f(2,:),'m','LineWidth',2);     % Curba Bezier

% Alegem un t pentru Casteljau (de exemplu, mijlocul)
t_mijloc = 0.3;

% Pasul 1: Interpolarea intre punctele de control
b1 = zeros(2,3);
for i = 1:3
    b1(:,i) = (1-t_mijloc)*b(:,i)+t_mijloc*b(:,i+1);
end
plot(b1(1,:),b1(2,:),'g-o','LineWidth',1.5); % Linia verde

% Pasul 2: Interpolarea intre punctele din b1
b2 = zeros(2,2);
for i = 1:2
    b2(:,i)=(1-t_mijloc)*b1(:,i)+t_mijloc*b1(:,i+1);
end
plot(b2(1,:),b2(2,:),'k-o','LineWidth', 1.5); % Linia neagra

% Pasul 3: Interpolarea finala – punctul de pe curba
b3 = (1-t_mijloc)*b2(:,1)+t_mijloc*b2(:,2);
plot(b3(1), b3(2),'mo','MarkerSize',10,'MarkerFaceColor','m'); % Punctul final

legend('Poligonul de control','Curba Bezier','Pasul 1 (b1)','Pasul 2 (b2)','Punct Casteljau','Location','northeast');
axis equal;
grid on;
hold off;

end
