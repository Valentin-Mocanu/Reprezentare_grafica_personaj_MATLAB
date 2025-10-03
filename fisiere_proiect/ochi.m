function ochi()

theta = linspace(0, 2*pi, 100); % Puncte necesare reprezentarii grafice a cercurilor
r1 = 3; r2 = 1; % Razele folosite la cercuri
x1 = 17;
x2 = 17.75;
x3 = 37;
x4 = 36.25;
y1 = 15;
y2 = 16;

% Ochiul stang
a1 = x1+r1*cos(theta);
b1 = y1+r1*sin(theta);
a2 = x2+r2*cos(theta);
b2 = y2+r2*sin(theta);

% Ochiul drept
a3 = x3+r1*cos(theta);
b3 = y1+r1*sin(theta);
a4 = x4+r2*cos(theta);
b4 = y2+r2*sin(theta);

% Reprezentarea grafica
hold on
plot(a1,b1,'m','LineWidth',1.5)
plot(a2,b2,'m','LineWidth',1.5)
plot(a3,b3,'m','LineWidth',1.5)
plot(a4,b4,'m','LineWidth',1.5)
hold off

end