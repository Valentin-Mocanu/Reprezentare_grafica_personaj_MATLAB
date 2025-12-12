function modificare_locala_CB()

% --> Am luat curba din stanga de la functia fata_1_curbe.m <--

t = linspace(0,1); % Parametrul
% Punctele de control 
P0 = [13;23];
P1 = [5;15];
P2_original = [25;10];
P2_nord = [25;20];
P2_sud = [25;0];
P2_vest = [15;10];
P2_est = [35;10];
P3 = [-5;0.5];
P4 = [27;-3];
% Polinoamele Bernstein de gradul 4
B0 = (1-t).^4;
B1 = 4.*(1-t).^3.*t;
B2 = 6.*(1-t).^2.*t.^2;
B3 = 4.*(1-t).*t.^3;
B4 = t.^4;
B = [B0;B1;B2;B3;B4]; % Matricea care cuprinde toate polinoamele Bernstein
% Curba Bezier
f1 = [P0 P1 P2_original P3 P4]*B;
f2 = [P0 P1 P2_nord P3 P4]*B;
f3 = [P0 P1 P2_sud P3 P4]*B;
f4 = [P0 P1 P2_vest P3 P4]*B;
f5 = [P0 P1 P2_est P3 P4]*B;

% --> Desenare grafic <--
subplot(3,2,[1,2])
hold on 
plot(f1(1,:),f1(2,:),'r-','LineWidth',1.5)
plot([P0(1,:),P1(1,:),P2_original(1,:),P3(1,:),P4(1,:)],[P0(2,:),P1(2,:),P2_original(2,:),P3(2,:),P4(2,:)],'g--')
plot(P2_original(1,:),P2_original(2,:),'mo','MarkerSize',8)
title("Curba originala")
grid on
hold off

subplot(3,2,3)
hold on 
plot(f2(1,:),f2(2,:),'r','LineWidth',1.5)
plot([P0(1,:),P1(1,:),P2_nord(1,:),P3(1,:),P4(1,:)],[P0(2,:),P1(2,:),P2_nord(2,:),P3(2,:),P4(2,:)],'g--')
plot(P2_nord(1,:),P2_nord(2,:),'mo','MarkerSize',8)
title("Deplasare spre nord")
grid on
hold off

subplot(3,2,4)
hold on 
plot(f3(1,:),f3(2,:),'r','LineWidth',1.5)
plot([P0(1,:),P1(1,:),P2_sud(1,:),P3(1,:),P4(1,:)],[P0(2,:),P1(2,:),P2_sud(2,:),P3(2,:),P4(2,:)],'g--')
plot(P2_sud(1,:),P2_sud(2,:),'mo','MarkerSize',8)
title("Deplasare spre sud")
grid on
hold off

subplot(3,2,5)
hold on 
plot(f4(1,:),f4(2,:),'r','LineWidth',1.5)
plot([P0(1,:),P1(1,:),P2_vest(1,:),P3(1,:),P4(1,:)],[P0(2,:),P1(2,:),P2_vest(2,:),P3(2,:),P4(2,:)],'g--')
plot(P2_vest(1,:),P2_vest(2,:),'mo','MarkerSize',8)
title("Deplasare spre vest")
grid on
hold off

subplot(3,2,6)
hold on 
plot(f5(1,:),f5(2,:),'r','LineWidth',1.5)
plot([P0(1,:),P1(1,:),P2_est(1,:),P3(1,:),P4(1,:)],[P0(2,:),P1(2,:),P2_est(2,:),P3(2,:),P4(2,:)],'g--')
plot(P2_est(1,:),P2_est(2,:),'mo','MarkerSize',8)
title("Deplasare spre est")
grid on
hold off

end