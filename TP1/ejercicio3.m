% Ejercicio 3. Se realizaron 2 funciones: diffdrive integra num�ricamente
% la cinem�tica del accionamiento diferencia y solo devuelve el �ltimo punto
% de la integraci�n. Entiendo que esto ped�a el ejercicio pero como con
% esta funci�n no se aprecia la trayectoria, hay otra funci�n diffdrive_mod que devuelve
% cada punto de la integraci�n num�rica junto con el ICC

clear all
close all
clc

% pose inicial
x_0 = 1.5;
y_0 = 2;
theta_0 = pi/3;

l = 0.5; % largo del robot

% Se integra las ecuaciones din�micas del accinamiento diferencia utilzando
% como condici�n inicial ultimo valor  al que lleg� la integraci�n.
[x_1,y_1,theta_1] = diffdrive(x_0, y_0, theta_0, 0.3, 0.3, 2, l );
[x_2,y_2,theta_2] = diffdrive(x_1, y_1, theta_1, 0.2, -0.2, 2, l );
[x_3,y_3,theta_3] = diffdrive(x_2, y_2, theta_2, 0.1, 0.6, 5, l );



% Se grafica la posici�n del robot luego de ls  3 accionamiento. Este gr�fico indica
% donde se encuentra el robot luego de los 3 accionamientos pero no se
% aprecia la trayecotira.
figure(1)
scatter( [x_0,x_1,x_2,x_3],[y_0, y_1, y_2, y_3],'filled');
axis('equal')
grid on;
title('Posici�n del robot luego de cada una de las acciones realizadas ')
xlabel('Eje x [m]')
ylabel('Eje y [m]')
saveas(gcf,'pos_robot.png')


% Se calculan la posici�n y el valor de ICC en cada momento de forma
% similar a lo realizado antes pero ahora se obtienen los puntos
% intermedios de la integraci�in num�rica.

[pose1, ICC1, tode1] = diffdrive_mod(x_0, y_0, theta_0, 0.3, 0.3, 2, l );
[pose2, ICC2, tode2] = diffdrive_mod(pose1(end,1), pose1(end,2), pose1(end,3), 0.2, -0.2, 2, l );
[pose3, ICC3, tode3] = diffdrive_mod(pose2(end,1), pose2(end,2), pose2(end,3), 0.1, 0.6, 5, l );



% Se grafica la trayectoria del robot 
figure(2)
pos_x = [pose1(:,1);pose2(:,1);pose3(:,1)]; % Concatenaci�n de los vectores de posici�n en x durante los 3 accionamientos
pos_y = [pose1(:,2);pose2(:,2);pose3(:,2)]; % Concatenaci�n de los vectores de posici�n en x durante los 3 accionamientos
plot( pos_x,pos_y,'DisplayName','Trayectoria' );
axis('equal')
grid on;
title('Trayectoria del robot')
xlabel('Eje x [m]')
ylabel('Eje y [m]')

hold on

% Se grafica la coordenada del ICC
ICC_x = [ICC1(:,1);ICC2(:,1);ICC3(:,1)]; % Coordenada x del ICC en cada paso de la integraci�n
ICC_y = [ICC1(:,2);ICC2(:,2);ICC3(:,2)]; % Coordenada y del ICC en cada paso de la integraci�n
scatter( ICC_x,ICC_y,'DisplayName','ICC' )
legend()
saveas(gcf,'trayectoria_robot.png')




% Se grafica la pose del robot (x,y, tita) en todo momento
figure(3)

time = [tode1; tode2+ tode1(end); tode3 + tode1(end) + tode2(end)]; % Se arma un solo vector para el tiempo
tita = [pose1(:,3);pose2(:,3);pose3(:,3)]; % un solo vector para la orientaci�n
tiledlayout(3,1)
nexttile
plot( time , pos_x)
title('Posici�n x')
xlabel('Tiempo [s]')
ylabel('Posici�n x [m]')
grid()


nexttile
plot( time , pos_y)
title('Posici�n y')
xlabel('Tiempo [s]')
ylabel('Posici�n y [m]')
grid()


nexttile
plot( time , tita)
title('Orientaci�n')
xlabel('Tiempo [s]')
ylabel('Orientaci�n [rad]')
grid()

saveas(gcf,'pose.png')




