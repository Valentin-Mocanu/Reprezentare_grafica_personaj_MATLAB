function masa_curbe()

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

% --> Desenare grafic (doar curbele) <--
hold on
plot(f1(1,:),f1(2,:),'c','LineWidth',1.5);
plot(f2(1,:),f2(2,:),'c','LineWidth',1.5);
plot(f3(1,:),f3(2,:),'c','LineWidth',1.5);
hold off

%% Curba 2 – spline F-Mill

p_interpolare = [19 23 27 31 35; -3 -13 -11 -13 -3]; % Punctele de interpolare
% Puncte de control de capat
a = 9;
e = -13;
c = 45;
d = -13;

n = size(p_interpolare,2); % Numarul de puncte
l = zeros(2,n-2);
for j = 1:n-2
    l(:,j) = p_interpolare(:,j+2) - p_interpolare(:,j);
end

ultim = 3*(n-1)+1;
b = zeros(2,ultim);
b(:,1) = p_interpolare(:,1);
b(:,2) = [a;e];
b(:,3) = p_interpolare(:,2)-(1/6)*l(:,1);

for k = 1:n-3
    b(:,3*k+1) = p_interpolare(:,k+1);
    b(:,3*k+2) = p_interpolare(:,k+1) + (1/6)*l(:,k);
    b(:,3*k+3) = p_interpolare(:,k+2) - (1/6)*l(:,k+1);
end

b(:,3*(n-2)+1) = p_interpolare(:,n-1);
b(:,3*(n-2)+2) = p_interpolare(:,n-1) + (1/6)*l(:,n-2);
b(:,3*(n-2)+3) = [c;d];
b(:,ultim) = p_interpolare(:,n);

% --> Desenare grafic (doar curbele Bezier) <--
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
hold off