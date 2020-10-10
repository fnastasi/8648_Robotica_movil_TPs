clear all
clc

x_0 = 1.5;
y_0 = 2;
theta_0 = pi/3;

l = 0.5;

[x_1,y_1,theta_1] = diffdrive(x_0, y_0, theta_0, 0.3, 0.3, 2, l );
[x_2,y_2,theta_2] = diffdrive(x_1, y_1, theta_1, 0.2, -0.2, 2, l );
[x_3,y_3,theta_3] = diffdrive(x_2, y_2, theta_2, 0.1, 0.6, 5, l );



% Se grafica la posición del robot en las 3 posiciones.
figure(1)
scatter( [x_0,x_1,x_2,x_3],[y_0, y_1, y_2, y_3],'filled');
axis('equal')
grid on;
title('Posición del robot luego de cada una de las acciones realizadas ')
xlabel('Eje x [m]')
ylabel('Eje y [m]')
saveas(gcf,'pos_robot.png')


% Se calculan la posición y el valor de ICC en cada momento

[pose1, ICC1] = diffdrive_mod(x_0, y_0, theta_0, 0.3, 0.3, 2, l );
[pose2, ICC2] = diffdrive_mod(pose1(end,1), pose1(end,2), pose1(end,3), 0.2, -0.2, 2, l );
[pose3, ICC3] = diffdrive_mod(pose2(end,1), pose2(end,2), pose2(end,3), 0.1, 0.6, 5, l );



% Se grafica la trayectoria del robot.
figure(2)
plot( [pose1(:,1);pose2(:,1);pose3(:,1)],[pose1(:,2);pose2(:,2);pose3(:,2)] );
axis('equal')
grid on;
title('Trayectoria del robot')
xlabel('Eje x [m]')
ylabel('Eje y [m]')

hold on

% Se grafica la coordenada del ICC
scatter( [ICC1(:,1);ICC2(:,1);ICC3(:,1)],[ICC1(:,2);ICC2(:,2);ICC3(:,2)] )
saveas(gcf,'trayectoria_robot.png')