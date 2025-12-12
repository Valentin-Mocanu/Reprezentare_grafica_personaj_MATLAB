function masa_poligoane_control()

%% Curba 1 - spline "manuala"

t = linspace(0,1,100); % Parametrul
% Polinoamele Bernstein de gradul 3
B0 = (1-t).^3;
B1 = 3.*(1-t).^2.*t;
B2 = 3.*(1-t).*t.^2;
B3 = t.^3;
B = [B0;B1;B2;B3];

% Definim primul segment, adica primele 4 puncte de control (P0 - P3)
P0 = [5;-1];
P1 = [10;-3];
P2 = [15;-1];
P3 = [20;-3];
% Alegem P4 astfel incat sa fie simetric cu P2 fata de P3 (pentru curba bezier G2)
P4 = P3+(P3-P2); % => P4 = [25;-5]

% Continuam cu restul punctelor pentru al doilea segment
P5 = [30;-5];
P6 = [35;-3];

% Alegem P7 astfel incat sa fie simetric cu P5 fata de P6 (pentru curba bezier G3)
P7 = P6+(P6-P5); % => P7 = [40;-1]
P8 = [45;-1];
P9 = [50;-3];

% Curbele Bezier
f1 = [P0 P1 P2 P3]*B;
f2 = [P3 P4 P5 P6]*B;
f3 = [P6 P7 P8 P9]*B;

% --> Desenare grafic (curba + poligoanele de control) <--
hold on 
% Deseneaza cercuri pline pentru primul si ultimul punct din poligoanele de control
plot([P0(1),P9(1)],[P0(2),P9(2)],'mo','MarkerFaceColor','m','MarkerSize',8)

% Deseneaza cercuri goale pentru punctele interioare din poligoanele de control 
plot([P1(1),P2(1),P3(1),P4(1),P5(1),P6(1),P7(1),P8(1)], ...
    [P1(2),P2(2),P3(2),P4(2),P5(2),P6(2),P7(2),P8(2)],'mo','MarkerSize',8);

% Traseaza poligoanele de control
plot([P0(1),P1(1),P2(1),P3(1),P4(1),P5(1),P6(1),P7(1),P8(1),P9(1)], ...
    [P0(2),P1(2),P2(2),P3(2),P4(2),P5(2),P6(2),P7(2),P8(2),P9(2)],'g--');

% Traseaza curbele Bezier
plot(f1(1,:),f1(2,:),'c','LineWidth',1.5);
plot(f2(1,:),f2(2,:),'c','LineWidth',1.5);
plot(f3(1,:),f3(2,:),'c','LineWidth',1.5);
hold off

%% Curba 2 – spline F-Mill

p_interpolare = [19 23 27 31 35; -3 -13 -11 -13 -3]; % Punctele de interpolare

% Puncte de control de capat
a = 9;   % x pentru primul P1
e = -13; % y pentru primul P1
c = 45;  % x pentru ultimul P2
d = -13; % y pentru ultimul P2

n = size(p_interpolare,2); % Numarul de puncte interpolate

% Acesta va fi folosit pentru a genera punctele de control care asigura o curba neteda
l = zeros(2,n-2);
for j = 1:n-2
    l(:,j) = p_interpolare(:,j+2) - p_interpolare(:,j);
end

% Numarul total de puncte de control necesare spline-ului
ultim = 3*(n-1)+1;
b = zeros(2,ultim); % Matricea cu toate punctele de control Bezier

% Primele 3 puncte de control (pentru primul segment Bezier)
b(:,1) = p_interpolare(:,1); % P0
b(:,2) = [a;e]; % P1
b(:,3) = p_interpolare(:,2)-(1/6)*l(:,1); % P2

% Construirea automata a punctelor de control pentru segmentele din interior
for k = 1:n-3
    b(:,3*k+1) = p_interpolare(:,k+1); % P0
    b(:,3*k+2) = p_interpolare(:,k+1) + (1/6)*l(:,k); % P1
    b(:,3*k+3) = p_interpolare(:,k+2) - (1/6)*l(:,k+1); % P2
end

% Ultimele puncte de control (pentru ultimul segment Bezier)
b(:,3*(n-2)+1) = p_interpolare(:,n-1); % P0
b(:,3*(n-2)+2) = p_interpolare(:,n-1) + (1/6)*l(:,n-2); % P1
b(:,3*(n-2)+3) = [c;d]; % P2
b(:,ultim) = p_interpolare(:,n); % P3

% --> Desenare grafic (curba + poligoanele de control) <--
% Traseaza curbele
i = 1;
auxiliar = 1;
nr_intervale = floor(ultim/4) + 1;
hold on
while auxiliar <= nr_intervale
    c_bezier = b(:,i:i+3)*B;
    plot(c_bezier(1,:), c_bezier(2,:), 'm', 'LineWidth', 1.5);
    i = i + 3;
    auxiliar = auxiliar + 1;
end

% Traseaza poligonul de control
plot(b(1,:),b(2,:),'g--');

% Deseneaza cercuri pline pentru primul si ultimul punct din poligoanele de control
plot(b(1,1),b(2,1),'mo','MarkerFaceColor','m','MarkerSize',8); % Primul punct
plot(b(1,ultim),b(2,ultim),'mo','MarkerFaceColor','m','MarkerSize',8); % Ultimul punct

% Deseneaza cercuri goale pentru punctele interioare din poligoanele de control 
for i = 2:3:(ultim-1)
    plot(b(1,i),b(2,i),'mo','MarkerSize',8);
end
hold off;